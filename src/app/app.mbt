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
priv enum ThemeMsg {
  ToggleTheme
  SystemSchemeChanged(Bool)
}

///|
priv enum Route {
  Home
  Docs(@util.UnsolvedMooncakePath, fragment~ : String)
  User(String)
  BuildQueue
  SkillsList
  SkillsDetail(String)
  NotFound
  Redirect
} derive(Eq)

///|
priv enum RouteMsg {
  LinkClicked(@url.UrlRequest)
  UrlChanged(@url.Url)
}

///|
impl @rabbita.Enumerate for Route with fn tag(self) {
  match self {
    Home => "home"
    Docs(_, ..) => "docs"
    User(name) => "user:\{name}"
    BuildQueue => "build-queue"
    SkillsList => "skills"
    SkillsDetail(entry) => "skill:\{entry}"
    NotFound => "not-found"
    Redirect => "redirect"
  }
}

///|
fn route(url : @url.Url, model : Route) -> (Route, Cmd) {
  match @util.MooncakesioPath::resolve(url) {
    Home => (Home, @nav.scroll_to_top())
    BuildQueue => (BuildQueue, @nav.scroll_to_top())
    SkillsList => (SkillsList, @nav.scroll_to_top())
    SkillsDetail(entry) => (SkillsDetail(entry), @nav.scroll_to_top())
    User(name) => (User(name.to_owned()), @nav.scroll_to_top())
    Assets(url) => (Redirect, @nav.load(url.to_string()))
    Docs(mooncakes_path, fragment~) =>
      if model is Docs(current, ..) && current == mooncakes_path {
        let next = Docs(mooncakes_path, fragment=fragment.unwrap_or(""))
        match fragment {
          Some(fragment) =>
            (next, @nav.scroll_to(fragment, behavior=@nav.Smooth))
          None => (next, none)
        }
      } else {
        (
          Docs(mooncakes_path, fragment=fragment.unwrap_or("")),
          @nav.scroll_to_top(),
        )
      }
    NotFound(_) => (NotFound, @nav.scroll_to_top())
  }
}

///|
fn theme() -> (Val[Html], Val[Theme]) {
  let initial = Theme::{
    preference: theme_preference_from_string(initial_theme_preference()),
    system_dark: system_prefers_dark(),
  }
  apply_theme_now(initial)
  let (theme, emit) = @rabbita.create_state(
    initial,
    update=(model, msg, _emit) => {
      match msg {
        ToggleTheme => {
          let theme = model.next_preference()
          (
            theme,
            batch([
              persist_theme_preference(theme.preference),
              apply_theme(theme),
            ]),
          )
        }
        SystemSchemeChanged(system_dark) => {
          let theme = { ..model, system_dark, }
          let cmd = if model.preference is System {
            apply_theme(theme)
          } else {
            none
          }
          (theme, cmd)
        }
      }
    },
    subscriptions=(_model, emit) => {
      on_system_scheme_changed(is_dark => emit(SystemSchemeChanged(is_dark)))
    },
  )
  let toggle = theme.view(model => {
    let (icon, label) = match model.preference {
      System =>
        (@config.computer_icon, "Using system theme. Switch to light mode.")
      Light => (@config.sun_icon, "Using light mode. Switch to dark mode.")
      Dark => (@config.moon_icon, "Using dark mode. Switch to system theme.")
    }
    @view.button(
      on_click=emit(ToggleTheme),
      class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm font-medium transition-colors",
    ) <| [
      img(class="theme-toggle-icon", src=icon),
      span(class="sr-only", label),
    ]
  })
  (toggle, theme)
}

///|
#warnings("-alert_xss_vulnerable")
pub fn app() -> Val[Html] {
  let (app_actions, theme) = theme()
  let (route, _) = @rabbita.create_state(
    Redirect,
    update=(model, msg, _emit) => {
      match msg {
        LinkClicked(Internal(url)) => (model, @nav.push_url(url.to_string()))
        LinkClicked(External(url)) => (model, @nav.load(url))
        UrlChanged(url) => route(url, model)
      }
    },
    subscriptions=(_, emit) => {
      @sub.batch([
        @sub.on_url_changed(url => emit(UrlChanged(url))),
        @sub.on_url_request(request => emit(LinkClicked(request))),
      ])
    },
  )
  let page = route.switch(current => {
    match current {
      Home => @home.home_page(app_actions~)
      User(name) => @user.user_page(name, app_actions~)
      BuildQueue => @build_queue.build_queue_page(app_actions~)
      SkillsList => @skills.skills_list_page(app_actions~)
      SkillsDetail(entry) => @skills.skill_detail_page(entry, app_actions~)
      NotFound => Val::constant(@view.not_found())
      Redirect => Val::constant(@view.loading())
      Docs(fallback_path, ..) => {
        let path = route.map(route => {
          match route {
            Docs(path, ..) => path
            _ => fallback_path
          }
        })
        let fragment = route.map(route => {
          match route {
            Docs(_, fragment~) => fragment
            _ => ""
          }
        })
        @docs.docs_page(path, fragment, app_actions~)
      }
    }
  })

  theme.view2(page, fn(theme, page) {
    let attrs = Attrs::build()
      .data_set("theme", theme.resolved())
      .data_set("theme-preference", theme.preference.to_string())
    let bootstrap_attrs = Attrs::build().inner_html(theme_bootstrap)
    html(lang="en", attrs~) <| [
      head <| [
        meta(charset="UTF-8"),
        meta(name="viewport", content="width=device-width, initial-scale=1.0"),
        title("mooncakes.io"),
        link(rel="icon", type_="image/svg+xml", href=@config.favicon),
        script(attrs=bootstrap_attrs, nothing),
      ],
      body <| [
        div(class="theme-root min-h-screen w-full", page),
      ],
    ]
  })
}
