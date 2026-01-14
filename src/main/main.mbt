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
extern "js" fn set_timeout(f : () -> Unit, ms : Int) =
  "(f,ms) => setTimeout(f, ms)"

///|
fn delay(msg : Msg, ms : Int) -> Cmd[Msg] {
  @cmd.Cmd(fn(events) { set_timeout(fn() { events.trigger_update(msg) }, ms) })
}

///|
fn start_theme_switch(model : Model) -> (Cmd[Msg], Model) {
  let theme = toggle_theme(model.theme)
  (
    delay(ThemeSwitchDone, 120),
    { ..model, theme, theme_switching: true },
  )
}

///|
fn[SubModel, SubMsg] update_with(
  pair : (Cmd[SubMsg], SubModel),
  to_page : (SubModel) -> Page,
  to_msg : (SubMsg) -> Msg,
  theme : Theme,
  theme_switching : Bool,
) -> (Cmd[Msg], Model) {
  let (cmd, model) = pair
  (cmd.map(to_msg), { theme, page: to_page(model), theme_switching })
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match (msg, model.page) {
    (ThemeSwitchDone, _) => (none(), { ..model, theme_switching: false })
    (GotHomeMsg(msg), _) if @home.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotDocsMsg(msg), _) if @docs.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotUserMsg(msg), _) if @user.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotHomeMsg(msg), Home(page_model)) =>
      @home.update(msg, page_model)
      |> update_with(Home(_), GotHomeMsg(_), model.theme, model.theme_switching)
    (GotDocsMsg(msg), Docs(page_model)) =>
      @docs.update(msg, page_model)
      |> update_with(Docs(_), GotDocsMsg(_), model.theme, model.theme_switching)
    (GotUserMsg(msg), User(page_model)) =>
      @user.update(msg, page_model)
      |> update_with(User(_), GotUserMsg(_), model.theme, model.theme_switching)
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@nav.push_url(url.to_string()), model)
        External(url) => (@nav.load(url), model)
      }
    (UrlChanged(url), _) => route_with_theme(url, model.theme)
    _ => (none(), model)
  }
}

///|
fn route_with_theme(url : @url.Url, theme : Theme) -> (Cmd[Msg], Model) {
  let paths = url.path.split("/").collect()
  match paths {
    ["/"] | [""] | [] =>
      @home.load() |> update_with(Home(_), GotHomeMsg(_), theme, false)
    ["user", name] =>
      @user.load(name.to_string())
      |> update_with(User(_), GotUserMsg(_), theme, false)
    ["assets", ..] =>
      (@nav.load(url.to_string()), { theme, page: Redirect, theme_switching: false })
    ["docs", .. module_path] =>
      module_path.iter().map(StringView::to_string).join("/")
      |> @docs.load(url.fragment)
      |> update_with(Docs(_), GotDocsMsg(_), theme, false)
    _ => (none(), { theme, page: NotFound, theme_switching: false })
  }
}

///|
fn route(url : @url.Url) -> (Cmd[Msg], Model) {
  route_with_theme(url, Light)
}

///|
fn view(model : Model) -> Html[Msg] {
  let page_view = match model.page {
    Home(page_model) => @home.view(page_model).map(GotHomeMsg(_))
    Docs(page_model) => @docs.view(page_model, x => GotDocsMsg(x))
    User(page_model) => @user.view(page_model).map(GotUserMsg(_))
    NotFound => @view.not_found()
    Redirect => @view.loading()
  }
  let theme_class = match model.theme {
    Light => "theme-light"
    Dark => "theme-dark"
  }
  let switching_class = if model.theme_switching { "theme-switching" } else {
    ""
  }
  @html.div(
    class="theme-root min-h-screen w-full \{theme_class} \{switching_class}",
    [page_view],
  )
}

///|
fn main {
  @tea.application(
    initialize=route,
    update~,
    view~,
    url_changed=UrlChanged(_),
    url_request=LinkClicked(_),
  )
}
