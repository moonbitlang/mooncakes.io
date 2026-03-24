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
  GotBuildQueueMsg(@build_queue.Msg)
  LinkClicked(@url.UrlRequest)
  UrlChanged(@url.Url)
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
  BuildQueue(@build_queue.Model)
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
fn start_theme_switch(model : Model) -> (Cmd, Model) {
  let theme = toggle_theme(model.theme)
  (none, { ..model, theme, theme_switching: false })
}

///|
fn update(dispatch : (Msg) -> Cmd, msg : Msg, model : Model) -> (Cmd, Model) {
  match (msg, model.page) {
    (GotHomeMsg(msg), _) if @home.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotDocsMsg(msg), _) if @docs.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotUserMsg(msg), _) if @user.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotBuildQueueMsg(msg), _) if @build_queue.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotHomeMsg(msg), Home(page_model)) => {
      let (cmd, page) = @home.update(msg, page_model)
      (cmd, { ..model, page: Home(page) })
    }
    (GotDocsMsg(msg), Docs(page_model)) => {
      let (cmd, page) = @docs.update(msg, page_model, dispatch=x => {
        dispatch(GotDocsMsg(x))
      })
      (cmd, { ..model, page: Docs(page) })
    }
    (GotUserMsg(msg), User(page_model)) => {
      let (cmd, page) = @user.update(msg, page_model)
      (cmd, { ..model, page: User(page) })
    }
    (GotBuildQueueMsg(msg), BuildQueue(page_model)) => {
      let (cmd, page) = @build_queue.update(msg, page_model)
      (cmd, { ..model, page: BuildQueue(page) })
    }
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@nav.push_url(url.to_string()), model)
        External(url) => (@nav.load(url), model)
      }
    (UrlChanged(url), _) => route_with_theme(url, model.theme, dispatch)
    _ => (none, model)
  }
}

///|
fn route_with_theme(
  url : @url.Url,
  theme : Theme,
  dispatch : (Msg) -> Cmd,
) -> (Cmd, Model) {
  let paths = url.path.split("/").collect()
  let scroll_top = @nav.scroll_to_top()
  match paths {
    ["/"] | [""] | [] => {
      let (cmd, page) = @home.load(dispatch=x => dispatch(GotHomeMsg(x)))
      (
        batch([cmd, scroll_top]),
        { theme, page: Home(page), theme_switching: false },
      )
    }
    ["build-queue"] => {
      let (cmd, page) = @build_queue.load(dispatch=x => {
        dispatch(GotBuildQueueMsg(x))
      })
      (
        batch([cmd, scroll_top]),
        { theme, page: BuildQueue(page), theme_switching: false },
      )
    }
    ["user", name] => {
      let (cmd, page) = @user.load(name.to_string(), dispatch=x => {
        dispatch(GotUserMsg(x))
      })
      (
        batch([cmd, scroll_top]),
        { theme, page: User(page), theme_switching: false },
      )
    }
    ["assets", ..] =>
      (
        @nav.load(url.to_string()),
        { theme, page: Redirect, theme_switching: false },
      )
    ["docs", .. module_path] => {
      let path = module_path.iter().map(StringView::to_string).join("/")
      let (cmd, page) = @docs.load(path, url.fragment, dispatch=x => {
        dispatch(GotDocsMsg(x))
      })
      (
        batch([cmd, scroll_top]),
        { theme, page: Docs(page), theme_switching: false },
      )
    }
    _ => (scroll_top, { theme, page: NotFound, theme_switching: false })
  }
}

///|
fn view(dispatch : (Msg) -> Cmd, model : Model) -> Html {
  let page_view = match model.page {
    Home(page_model) =>
      @home.view(page_model, dispatch=x => dispatch(GotHomeMsg(x)))
    Docs(page_model) =>
      @docs.view(page_model, dispatch=x => dispatch(GotDocsMsg(x)))
    User(page_model) =>
      @user.view(page_model, dispatch=x => dispatch(GotUserMsg(x)))
    BuildQueue(page_model) =>
      @build_queue.view(page_model, dispatch=x => dispatch(GotBuildQueueMsg(x)))
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
  let model = { theme: Light, page: Redirect, theme_switching: false }
  let (dispatch, cell) = @rabbita.cell_with_dispatch(model~, update~, view~)
  let app = @rabbita.new(cell)
  app.with_route(url_changed=url => dispatch(UrlChanged(url)), url_request=request => {
    dispatch(LinkClicked(request))
  })
  app.mount("app")
}
