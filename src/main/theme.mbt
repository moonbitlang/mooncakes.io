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
priv enum ThemePreference {
  System
  Light
  Dark
}

///|
priv struct Theme {
  preference : ThemePreference
  system_dark : Bool
}

///|
fn theme_preference_from_string(value : String) -> ThemePreference {
  match value {
    "light" => Light
    "dark" => Dark
    _ => System
  }
}

///|
fn ThemePreference::to_string(self : ThemePreference) -> String {
  match self {
    System => "system"
    Light => "light"
    Dark => "dark"
  }
}

///|
fn Theme::resolved(self : Theme) -> String {
  match self.preference {
    Dark => "dark"
    Light => "light"
    System => if self.system_dark { "dark" } else { "light" }
  }
}

///|
fn Theme::next_preference(self : Theme) -> Theme {
  let preference : ThemePreference = match self.preference {
    System => Light
    Light => Dark
    Dark => System
  }
  { ..self, preference, }
}
