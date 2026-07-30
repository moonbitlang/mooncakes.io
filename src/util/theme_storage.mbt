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
/// Read raw preference from localStorage. Empty string means default System.
/// Keep key/value protocol aligned with `index.html` FOUC script.
extern "js" fn load_theme_preference_raw() -> String =
  #| () => {
  #|   try {
  #|     const value = window.localStorage.getItem('mooncakes-theme');
  #|     return value == null ? '' : String(value);
  #|   } catch (_) {
  #|     return '';
  #|   }
  #| }

///|
extern "js" fn save_theme_preference_raw(value : String) -> Unit =
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
/// Sync `<html>` classes so FOUC script and SPA agree on document-level theme.
extern "js" fn apply_document_theme(resolved_class : String, pref_class : String) -> Unit =
  #| (resolvedClass, prefClass) => {
  #|   const root = document.documentElement;
  #|   root.classList.remove('theme-light', 'theme-dark', 'theme-pref-system', 'theme-pref-light', 'theme-pref-dark');
  #|   root.classList.add(resolvedClass, prefClass);
  #|   root.style.colorScheme = resolvedClass === 'theme-dark' ? 'dark' : 'light';
  #| }

///|
/// Register a listener for OS color-scheme changes. Returns an unload function.
pub extern "js" fn watch_system_color_scheme(
  on_change : (Bool) -> Unit,
) -> (() -> Unit) =
  #| (onChange) => {
  #|   try {
  #|     const mq = window.matchMedia('(prefers-color-scheme: dark)');
  #|     const handler = (event) => {
  #|       onChange(!!event.matches);
  #|     };
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
pub fn load_theme_preference() -> ThemePreference {
  ThemePreference::parse(load_theme_preference_raw())
}

///|
pub fn save_theme_preference(preference : ThemePreference) -> Unit {
  save_theme_preference_raw(preference.to_storage())
}

///|
pub fn read_system_prefers_dark() -> Bool {
  system_prefers_dark()
}

///|
pub fn sync_document_theme(
  preference : ThemePreference,
  system_dark : Bool,
) -> Unit {
  let resolved = preference.resolve(system_dark)
  apply_document_theme(resolved.class_name(), preference.pref_class())
}
