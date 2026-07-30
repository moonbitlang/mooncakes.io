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
enum Theme {
  System
  Light
  Dark
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
  /// Latest `prefers-color-scheme: dark`. Used when `theme` is System.
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
/// localStorage key/values must match the FOUC script in `index.html`.
extern "js" fn load_stored_theme() -> String =
  #| () => {
  #|   try {
  #|     const value = window.localStorage.getItem('mooncakes-theme');
  #|     return value == null ? '' : String(value);
  #|   } catch (_) {
  #|     return '';
  #|   }
  #| }

///|
extern "js" fn save_stored_theme(value : String) -> Unit =
  #| (value) => {
  #|   try {
  #|     window.localStorage.setItem('mooncakes-theme', value);
  #|   } catch (_) {}
  #| }

///|
extern "js" fn system_prefers_dark() -> Bool =
  #| () => {
  #|   try {
  #|     return window.matchMedia('(prefers-color-scheme: dark)').matches;
  #|   } catch (_) {
  #|     return false;
  #|   }
  #| }

///|
/// Keep class / color-scheme / backgroundColor in sync with the FOUC script.
extern "js" fn apply_document_theme(resolved_class : String, pref_class : String) -> Unit =
  #| (resolvedClass, prefClass) => {
  #|   const root = document.documentElement;
  #|   const dark = resolvedClass === 'theme-dark';
  #|   root.classList.remove('theme-light', 'theme-dark', 'theme-pref-system', 'theme-pref-light', 'theme-pref-dark');
  #|   root.classList.add(resolvedClass, prefClass);
  #|   root.style.colorScheme = dark ? 'dark' : 'light';
  #|   root.style.backgroundColor = dark ? '#0b0b0c' : '#fafafa';
  #| }

///|
extern "js" fn watch_system_color_scheme(on_change : (Bool) -> Unit) -> (() -> Unit) =
  #| (onChange) => {
  #|   try {
  #|     const mq = window.matchMedia('(prefers-color-scheme: dark)');
  #|     const handler = (event) => onChange(!!event.matches);
  #|     if (typeof mq.addEventListener === 'function') {
  #|       mq.addEventListener('change', handler);
  #|       return () => mq.removeEventListener('change', handler);
  #|     }
  #|     if (typeof mq.addListener === 'function') {
  #|       mq.addListener(handler);
  #|       return () => mq.removeListener(handler);
  #|     }
  #|   } catch (_) {}
  #|   return () => {};
  #| }

///|
fn theme_from_storage(value : String) -> Theme {
  match value {
    "light" => Light
    "dark" => Dark
    _ => System
  }
}

///|
fn theme_to_storage(theme : Theme) -> String {
  match theme {
    System => "system"
    Light => "light"
    Dark => "dark"
  }
}

///|
/// System → Light → Dark → System.
fn toggle_theme(theme : Theme) -> Theme {
  match theme {
    System => Light
    Light => Dark
    Dark => System
  }
}

///|
fn theme_is_dark(theme : Theme, system_dark : Bool) -> Bool {
  match theme {
    Dark => true
    Light => false
    System => system_dark
  }
}

///|
fn resolved_theme_class(theme : Theme, system_dark : Bool) -> String {
  if theme_is_dark(theme, system_dark) {
    "theme-dark"
  } else {
    "theme-light"
  }
}

///|
fn preference_theme_class(theme : Theme) -> String {
  match theme {
    System => "theme-pref-system"
    Light => "theme-pref-light"
    Dark => "theme-pref-dark"
  }
}

///|
fn apply_theme(theme : Theme, system_dark : Bool) -> Unit {
  apply_document_theme(
    resolved_theme_class(theme, system_dark),
    preference_theme_class(theme),
  )
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
      let unwatch = watch_system_color_scheme(is_dark => {
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
fn start_theme_switch(model : Model) -> (Cmd, Model) {
  let theme = toggle_theme(model.theme)
  let system_dark = system_prefers_dark()
  save_stored_theme(theme_to_storage(theme))
  apply_theme(theme, system_dark)
  (none, { ..model, theme, system_dark, theme_switching: false })
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
      apply_theme(model.theme, system_dark)
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
  let theme_class = resolved_theme_class(model.theme, model.system_dark)
  let pref_class = preference_theme_class(model.theme)
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
  let theme = theme_from_storage(load_stored_theme())
  let system_dark = system_prefers_dark()
  let model = { theme, system_dark, page: Redirect, theme_switching: false }
  apply_theme(theme, system_dark)
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
