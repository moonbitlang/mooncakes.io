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
/// Read the preference normalized by the inline bootstrap before mount.
extern "js" fn initial_theme_preference() -> String =
  #| () => {
  #|   try {
  #|     return String(document.documentElement.dataset.themePreference || '');
  #|   } catch (_) {
  #|     return '';
  #|   }
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
extern "js" fn save_stored_theme(value : String) -> Unit =
  #| (value) => {
  #|   try {
  #|     window.localStorage.setItem('mooncakes-theme', value);
  #|   } catch (_) {}
  #| }

///|
extern "js" fn apply_document_theme(
  resolved_theme : String,
  preference : String,
) -> Unit =
  #| (resolvedTheme, preference) => {
  #|   const root = document.documentElement;
  #|   root.dataset.theme = resolvedTheme;
  #|   root.dataset.themePreference = preference;
  #| }

///|
fn persist_theme_preference(preference : ThemePreference) -> Cmd {
  @cmd.custom_cmd(_ => save_stored_theme(preference.to_string()))
}

///|
fn apply_theme(theme : Theme) -> Cmd {
  @cmd.custom_cmd(_ => {
    apply_document_theme(theme.resolved(), theme.preference.to_string())
  })
}

///|
/// The only pre-mount write. Updates after mount must use `apply_theme`.
fn apply_theme_now(theme : Theme) -> Unit {
  apply_document_theme(theme.resolved(), theme.preference.to_string())
}

///|
extern "js" fn watch_system_color_scheme(
  on_change : (Bool) -> Unit,
) -> () -> Unit =
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
    SubLoader(theme_sub_loader),
  )
}
