// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
enum Msg {
  GotHomeMsg(@home.Msg)
  GotDocsMsg(@docs.Msg)
  GotUserMsg(@user.Msg)
  LinkClicked(@url.UrlRequest)
  UrlChanged(@url.Url)
  ThemeSwitchDone
}

///|
enum Theme {
  Light
  Dark
}

///|
enum Page {
  Home(@home.Model)
  Docs(@docs.Model)
  User(@user.Model)
  NotFound
  Redirect
}

///|
struct Model {
  theme : Theme
  page : Page
  theme_switching : Bool
}

///|
fn toggle_theme(theme : Theme) -> Theme {
  match theme {
    Light => Dark
    Dark => Light
  }
}

///|
fn start_theme_switch(
  dispatcher : @tea.Dispatcher[Msg],
  model : Model,
) -> (Cmd, Model) {
  let theme = toggle_theme(model.theme)
  (
    dispatcher.message(ThemeSwitchDone),
    { ..model, theme, theme_switching: true },
  )
}

///|
fn[SubModel] update_with(
  pair : (Cmd, SubModel),
  to_page : (SubModel) -> Page,
  theme : Theme,
  theme_switching : Bool,
) -> (Cmd, Model) {
  let (cmd, model) = pair
  (cmd, { theme, page: to_page(model), theme_switching })
}

///|
fn update(
  dispatcher : @tea.Dispatcher[Msg],
  msg : Msg,
  model : Model,
) -> (Cmd, Model) {
  let to_home_cmd = dispatcher.message1(GotHomeMsg(_))
  let to_docs_cmd = dispatcher.message1(GotDocsMsg(_))
  let to_user_cmd = dispatcher.message1(GotUserMsg(_))
  match (msg, model.page) {
    (ThemeSwitchDone, _) => (none(), { ..model, theme_switching: false })
    (GotHomeMsg(msg), _) if @home.is_theme_toggle(msg) =>
      start_theme_switch(dispatcher, model)
    (GotDocsMsg(msg), _) if @docs.is_theme_toggle(msg) =>
      start_theme_switch(dispatcher, model)
    (GotUserMsg(msg), _) if @user.is_theme_toggle(msg) =>
      start_theme_switch(dispatcher, model)
    (GotHomeMsg(msg), Home(page_model)) =>
      @home.update(msg, page_model, to_home_cmd)
      |> update_with(Home(_), model.theme, model.theme_switching)
    (GotDocsMsg(msg), Docs(page_model)) =>
      @docs.update(msg, page_model, to_docs_cmd)
      |> update_with(Docs(_), model.theme, model.theme_switching)
    (GotUserMsg(msg), User(page_model)) =>
      @user.update(msg, page_model, to_user_cmd)
      |> update_with(User(_), model.theme, model.theme_switching)
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@nav.push_url(url.to_string()), model)
        External(url) => (@nav.load(url), model)
      }
    (UrlChanged(url), _) =>
      route_with_theme(url, model.theme, to_home_cmd, to_docs_cmd, to_user_cmd)
    _ => (none(), model)
  }
}

///|
fn route_with_theme(
  url : @url.Url,
  theme : Theme,
  to_home_cmd : (@home.Msg) -> Cmd,
  to_docs_cmd : (@docs.Msg) -> Cmd,
  to_user_cmd : (@user.Msg) -> Cmd,
) -> (Cmd, Model) {
  let paths = url.path.split("/").collect()
  match paths {
    ["/"] | [""] | [] =>
      @home.load(to_home_cmd) |> update_with(Home(_), theme, false)
    ["user", name] =>
      @user.load(name.to_string(), to_user_cmd)
      |> update_with(User(_), theme, false)
    ["assets", ..] =>
      (
        @nav.load(url.to_string()),
        { theme, page: Redirect, theme_switching: false },
      )
    ["docs", .. module_path] =>
      module_path.iter().map(StringView::to_string).join("/")
      |> @docs.load(url.fragment, to_docs_cmd)
      |> update_with(Docs(_), theme, false)
    _ => (none(), { theme, page: NotFound, theme_switching: false })
  }
}

///|
fn view(dispatcher : @tea.Dispatcher[Msg], model : Model) -> Html {
  let to_home_cmd = dispatcher.message1(GotHomeMsg(_))
  let to_docs_cmd = dispatcher.message1(GotDocsMsg(_))
  let to_user_cmd = dispatcher.message1(GotUserMsg(_))
  let page_view = match model.page {
    Home(page_model) => @home.view(page_model, to_home_cmd)
    Docs(page_model) => @docs.view(page_model, to_docs_cmd)
    User(page_model) => @user.view(page_model, to_user_cmd)
    NotFound => @view.not_found()
    Redirect => @view.loading()
  }
  let theme_class = match model.theme {
    Light => "theme-light"
    Dark => "theme-dark"
  }
  let switching_class = if model.theme_switching {
    "theme-switching"
  } else {
    ""
  }
  @html.div(
    class="theme-root min-h-screen w-full \{theme_class} \{switching_class}",
    [page_view],
  )
}


///|
fn main {
  let initial_model = { theme: Light, page: Redirect, theme_switching: false }
  let tea = @tea.TEA::new(model=initial_model, update=update, view=view)
  let dispatcher = tea.dispatcher()
  let app = @tea.new(tea)
  app.with_route(
    url_changed=dispatcher.message1(UrlChanged(_)),
    url_request=dispatcher.message1(LinkClicked(_)),
  )
  app.mount("app")
}
