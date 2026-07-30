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
/// Stored preference. Must stay aligned with the FOUC script in `index.html`
/// and the localStorage key/values used by `theme_storage.mbt`.
pub const THEME_STORAGE_KEY : String = "mooncakes-theme"

///|
/// User-facing theme preference (persisted).
pub enum ThemePreference {
  System
  Light
  Dark
} derive(Eq, Debug)

///|
/// Concrete appearance after resolving System against the OS.
pub enum ResolvedTheme {
  Light
  Dark
} derive(Eq, Debug)

///|
/// Parse a storage value. Missing/invalid values become System (default).
pub fn ThemePreference::parse(value : String) -> ThemePreference {
  match value {
    "light" => Light
    "dark" => Dark
    "system" => System
    _ => System
  }
}

///|
pub fn ThemePreference::to_storage(self : ThemePreference) -> String {
  match self {
    System => "system"
    Light => "light"
    Dark => "dark"
  }
}

///|
/// Cycle: System → Light → Dark → System.
pub fn ThemePreference::next(self : ThemePreference) -> ThemePreference {
  match self {
    System => Light
    Light => Dark
    Dark => System
  }
}

///|
pub fn ThemePreference::resolve(
  self : ThemePreference,
  system_dark : Bool,
) -> ResolvedTheme {
  match self {
    System => if system_dark { Dark } else { Light }
    Light => Light
    Dark => Dark
  }
}

///|
/// Class on `.theme-root` that selects the toggle icon (status semantics).
pub fn ThemePreference::pref_class(self : ThemePreference) -> String {
  match self {
    System => "theme-pref-system"
    Light => "theme-pref-light"
    Dark => "theme-pref-dark"
  }
}

///|
/// Class on `.theme-root` that drives color styles.
pub fn ResolvedTheme::class_name(self : ResolvedTheme) -> String {
  match self {
    Light => "theme-light"
    Dark => "theme-dark"
  }
}
