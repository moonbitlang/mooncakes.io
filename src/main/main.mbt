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
  GotSkillsMsg(@skills.Msg)
  ToggleTheme
  LinkClicked(@url.UrlRequest)
  UrlChanged(@url.Url)
  SystemSchemeChanged(Bool)
}

///|
enum Page {
  Home(@home.Model)
  Docs(@docs.Model)
  User(@user.Model)
  BuildQueue(@build_queue.Model)
  Skills(@skills.Model)
  NotFound
  Redirect
}

///|
struct Model {
  theme : Theme
  page : Page
}

///|
/// Treat every root state transition as changed, matching the legacy cell.
priv struct ReactiveModel(Model)

///|
impl Eq for ReactiveModel with fn equal(_, _) {
  false
}

///|
fn update(emit : Emit[Msg], msg : Msg, model : Model) -> (Cmd, Model) {
  match (msg, model.page) {
    (ToggleTheme, _) => {
      let theme = model.theme.next_preference()
      (
        batch([persist_theme_preference(theme.preference), apply_theme(theme)]),
        { ..model, theme, },
      )
    }
    (SystemSchemeChanged(system_dark), _) => {
      let theme = { ..model.theme, system_dark, }
      let cmd = if model.theme.preference is System {
        apply_theme(theme)
      } else {
        none
      }
      (cmd, { ..model, theme, })
    }
    (GotHomeMsg(msg), Home(page_model)) => {
      let (cmd, page) = @home.update(msg, page_model, emit=x => {
        emit(GotHomeMsg(x))
      })
      (cmd, { ..model, page: Home(page) })
    }
    (GotDocsMsg(msg), Docs(page_model)) => {
      let (cmd, page) = @docs.update(msg, page_model, emit=x => {
        emit(GotDocsMsg(x))
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
    (GotSkillsMsg(msg), Skills(page_model)) => {
      let (cmd, page) = @skills.update(msg, page_model, emit=x => {
        emit(GotSkillsMsg(x))
      })
      (cmd, { ..model, page: Skills(page) })
    }
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@nav.push_url(url.to_string()), model)
        External(url) => (@nav.load(url), model)
      }
    (UrlChanged(url), _) => route(url, model, emit)
    _ => (none, model)
  }
}

///|
fn route(url : @url.Url, model : Model, emit : Emit[Msg]) -> (Cmd, Model) {
  match @util.MooncakesioPath::resolve(url) {
    Home => {
      let (cmd, page) = @home.load(emit=x => emit(GotHomeMsg(x)))
      (batch([cmd, @nav.scroll_to_top()]), { ..model, page: Home(page) })
    }
    BuildQueue => {
      let (cmd, page) = @build_queue.load(emit=x => emit(GotBuildQueueMsg(x)))
      (batch([cmd, @nav.scroll_to_top()]), { ..model, page: BuildQueue(page) })
    }
    SkillsList => {
      let (cmd, page) = @skills.load(emit=x => emit(GotSkillsMsg(x)))
      (batch([cmd, @nav.scroll_to_top()]), { ..model, page: Skills(page) })
    }
    SkillsDetail(entry) => {
      let (cmd, page) = @skills.load_detail(entry, emit=x => {
        emit(GotSkillsMsg(x))
      })
      (batch([cmd, @nav.scroll_to_top()]), { ..model, page: Skills(page) })
    }
    User(name) => {
      let (cmd, page) = @user.load(name.to_owned(), emit=x => {
        emit(GotUserMsg(x))
      })
      (batch([cmd, @nav.scroll_to_top()]), { ..model, page: User(page) })
    }
    Assets(url) => (@nav.load(url.to_string()), { ..model, page: Redirect })
    Docs(mooncakes_path, fragment~) => {
      // If already on this docs page and path unchanged, just scroll
      if model.page is Docs(page_model) &&
        @docs.is_same_path(page_model, mooncakes_path) {
        return match fragment {
          Some(fragment) => (@docs.scroll_to_smooth(fragment), model)
          None => (none, model)
        }
      }
      // Same module: only reload package content, preserve sidebar/meta
      if model.page is Docs(page_model) &&
        @docs.is_same_module(page_model, mooncakes_path) {
        let (cmd, page) = @docs.navigate_package(
          page_model,
          mooncakes_path,
          fragment,
          emit=x => emit(GotDocsMsg(x)),
        )
        return (
          batch([cmd, @nav.scroll_to_top()]),
          { ..model, page: Docs(page) },
        )
      }
      // Full load
      let (cmd, page) = @docs.load(mooncakes_path, fragment, emit=x => {
        emit(GotDocsMsg(x))
      })
      (batch([cmd, @nav.scroll_to_top()]), { ..model, page: Docs(page) })
    }
    NotFound(_) => (@nav.scroll_to_top(), { ..model, page: NotFound })
  }
}

///|
fn view(emit : Emit[Msg], model : Model) -> Html {
  let app_actions = @view.theme_toggle(on_click=emit(ToggleTheme))
  let page_view = match model.page {
    Home(page_model) =>
      @home.view(page_model, app_actions~, emit=x => emit(GotHomeMsg(x)))
    Docs(page_model) =>
      @docs.view(page_model, app_actions~, emit=x => emit(GotDocsMsg(x)))
    User(page_model) =>
      @user.view(page_model, app_actions~, emit=x => emit(GotUserMsg(x)))
    BuildQueue(page_model) =>
      @build_queue.view(page_model, app_actions~, emit=x => {
        emit(GotBuildQueueMsg(x))
      })
    Skills(page_model) =>
      @skills.view(page_model, app_actions~, emit=x => emit(GotSkillsMsg(x)))
    NotFound => @view.not_found()
    Redirect => @view.loading()
  }
  @html.div(class="theme-root min-h-screen w-full", [page_view])
}

///|
fn subscriptions(emit : Emit[Msg], model : Model) -> @sub.Sub {
  let page_sub = match model.page {
    Skills(page_model) =>
      @skills.subscriptions(page_model, emit=x => emit(GotSkillsMsg(x)))
    _ => @sub.none
  }
  @sub.batch([
    @sub.on_url_changed(u => emit(UrlChanged(u))),
    @sub.on_url_request(r => emit(LinkClicked(r))),
    on_system_scheme_changed(is_dark => emit(SystemSchemeChanged(is_dark))),
    page_sub,
  ])
}

///|
fn main {
  let theme : Theme = {
    preference: theme_preference_from_string(initial_theme_preference()),
    system_dark: system_prefers_dark(),
  }
  let model = { theme, page: Redirect }
  apply_theme_now(theme)
  let app = @rabbita.elmish(
    model=ReactiveModel(model),
    update=(emit, msg, model) => {
      let (cmd, model) = update(emit, msg, model.0)
      (ReactiveModel(model), cmd)
    },
    view=(emit, model) => view(emit, model.0),
    subscriptions=(emit, model) => subscriptions(emit, model.0),
  )
  app.mount("app")
}
