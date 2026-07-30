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
  theme : @util.ThemePreference
  system_dark : Bool
  page : Page
  theme_switching : Bool
}

///|
/// Treat every root state transition as changed, matching the legacy cell.
priv struct ReactiveModel(Model)

///|
impl Eq for ReactiveModel with fn equal(_, _) {
  false
}

///|
priv suberror ThemeSubscription {
  SystemScheme(@cmd.Emit[Bool])
}

///|
fn theme_sub_loader(
  payload : Error,
  scheduler : &@cmd.Scheduler,
) -> @sub.RunningSub? {
  match payload {
    SystemScheme(emit) => {
      let mut tagger = emit
      let unwatch = @util.watch_system_color_scheme(is_dark => {
        scheduler.add(tagger(is_dark))
      })
      Some({
        unload: fn(_) { unwatch() },
        update_tagger: fn(next) {
          guard next is SystemScheme(new_emit) else { return }
          tagger = new_emit
        },
      })
    }
    _ => None
  }
}

///|
fn on_system_scheme_changed(emit : @cmd.Emit[Bool]) -> @sub.Sub {
  @sub.custom_sub(
    "on_system_scheme_changed",
    Local,
    SystemScheme(emit),
    @sub.SubLoader(theme_sub_loader),
  )
}

///|
fn apply_theme(model : Model) -> Unit {
  @util.sync_document_theme(model.theme, model.system_dark)
}

///|
fn start_theme_switch(model : Model) -> (Cmd, Model) {
  let theme = model.theme.next()
  @util.save_theme_preference(theme)
  let system_dark = @util.read_system_prefers_dark()
  let model = { ..model, theme, system_dark, theme_switching: false }
  apply_theme(model)
  (none, model)
}

///|
fn update(emit : Emit[Msg], msg : Msg, model : Model) -> (Cmd, Model) {
  match (msg, model.page) {
    (GotHomeMsg(msg), _) if @home.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotDocsMsg(msg), _) if @docs.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotUserMsg(msg), _) if @user.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotBuildQueueMsg(msg), _) if @build_queue.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (GotSkillsMsg(msg), _) if @skills.is_theme_toggle(msg) =>
      start_theme_switch(model)
    (SystemSchemeChanged(system_dark), _) => {
      let model = { ..model, system_dark }
      // Only System preference paints from OS; still keep system_dark fresh.
      if model.theme is System {
        apply_theme(model)
      }
      (none, model)
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
    (UrlChanged(url), _) => route_with_theme(url, model, emit)
    _ => (none, model)
  }
}

///|
fn route_with_theme(
  url : @url.Url,
  model : Model,
  emit : Emit[Msg],
) -> (Cmd, Model) {
  let theme = model.theme
  let system_dark = model.system_dark
  let scroll_top = @nav.scroll_to_top()
  match @util.MooncakesioPath::resolve(url) {
    Home => {
      let (cmd, page) = @home.load(emit=x => emit(GotHomeMsg(x)))
      (
        batch([cmd, scroll_top]),
        { theme, system_dark, page: Home(page), theme_switching: false },
      )
    }
    BuildQueue => {
      let (cmd, page) = @build_queue.load(emit=x => emit(GotBuildQueueMsg(x)))
      (
        batch([cmd, scroll_top]),
        {
          theme,
          system_dark,
          page: BuildQueue(page),
          theme_switching: false,
        },
      )
    }
    SkillsList => {
      let (cmd, page) = @skills.load(emit=x => emit(GotSkillsMsg(x)))
      (
        batch([cmd, scroll_top]),
        { theme, system_dark, page: Skills(page), theme_switching: false },
      )
    }
    SkillsDetail(entry) => {
      let (cmd, page) = @skills.load_detail(entry, emit=x => {
        emit(GotSkillsMsg(x))
      })
      (
        batch([cmd, scroll_top]),
        { theme, system_dark, page: Skills(page), theme_switching: false },
      )
    }
    User(name) => {
      let (cmd, page) = @user.load(name.to_owned(), emit=x => {
        emit(GotUserMsg(x))
      })
      (
        batch([cmd, scroll_top]),
        { theme, system_dark, page: User(page), theme_switching: false },
      )
    }
    Assets(url) =>
      (
        @nav.load(url.to_string()),
        { theme, system_dark, page: Redirect, theme_switching: false },
      )
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
        return (batch([cmd, scroll_top]), { ..model, page: Docs(page) })
      }
      // Full load
      let (cmd, page) = @docs.load(mooncakes_path, fragment, emit=x => {
        emit(GotDocsMsg(x))
      })
      (
        batch([cmd, scroll_top]),
        { theme, system_dark, page: Docs(page), theme_switching: false },
      )
    }
    NotFound(_) =>
      (
        scroll_top,
        { theme, system_dark, page: NotFound, theme_switching: false },
      )
  }
}

///|
fn view(emit : Emit[Msg], model : Model) -> Html {
  let page_view = match model.page {
    Home(page_model) => @home.view(page_model, emit=x => emit(GotHomeMsg(x)))
    Docs(page_model) => @docs.view(page_model, emit=x => emit(GotDocsMsg(x)))
    User(page_model) => @user.view(page_model, emit=x => emit(GotUserMsg(x)))
    BuildQueue(page_model) =>
      @build_queue.view(page_model, emit=x => emit(GotBuildQueueMsg(x)))
    Skills(page_model) =>
      @skills.view(page_model, emit=x => emit(GotSkillsMsg(x)))
    NotFound => @view.not_found()
    Redirect => @view.loading()
  }
  let resolved = model.theme.resolve(model.system_dark)
  let theme_class = resolved.class_name()
  let pref_class = model.theme.pref_class()
  let switching_class = if model.theme_switching {
    "theme-switching"
  } else {
    ""
  }
  @html.div(
    class="theme-root min-h-screen w-full \{theme_class} \{pref_class} \{switching_class}",
    [page_view],
  )
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
  let theme = @util.load_theme_preference()
  let system_dark = @util.read_system_prefers_dark()
  let model = {
    theme,
    system_dark,
    page: Redirect,
    theme_switching: false,
  }
  apply_theme(model)
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
