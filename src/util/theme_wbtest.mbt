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
test "theme preference parse defaults to system" {
  debug_inspect(ThemePreference::parse(""), content="System")
  debug_inspect(ThemePreference::parse("nope"), content="System")
  debug_inspect(ThemePreference::parse("system"), content="System")
  debug_inspect(ThemePreference::parse("light"), content="Light")
  debug_inspect(ThemePreference::parse("dark"), content="Dark")
}

///|
test "theme preference storage roundtrip" {
  inspect(ThemePreference::System.to_storage(), content="system")
  inspect(ThemePreference::Light.to_storage(), content="light")
  inspect(ThemePreference::Dark.to_storage(), content="dark")
  debug_inspect(
    ThemePreference::parse(ThemePreference::System.to_storage()),
    content="System",
  )
  debug_inspect(
    ThemePreference::parse(ThemePreference::Light.to_storage()),
    content="Light",
  )
  debug_inspect(
    ThemePreference::parse(ThemePreference::Dark.to_storage()),
    content="Dark",
  )
}

///|
test "theme preference cycles system light dark" {
  debug_inspect(ThemePreference::System.next(), content="Light")
  debug_inspect(ThemePreference::Light.next(), content="Dark")
  debug_inspect(ThemePreference::Dark.next(), content="System")
  debug_inspect(ThemePreference::System.next().next().next(), content="System")
}

///|
test "theme resolve system follows os" {
  debug_inspect(ThemePreference::System.resolve(false), content="Light")
  debug_inspect(ThemePreference::System.resolve(true), content="Dark")
  debug_inspect(ThemePreference::Light.resolve(true), content="Light")
  debug_inspect(ThemePreference::Light.resolve(false), content="Light")
  debug_inspect(ThemePreference::Dark.resolve(false), content="Dark")
  debug_inspect(ThemePreference::Dark.resolve(true), content="Dark")
}

///|
test "theme css class names" {
  inspect(ThemePreference::System.pref_class(), content="theme-pref-system")
  inspect(ThemePreference::Light.pref_class(), content="theme-pref-light")
  inspect(ThemePreference::Dark.pref_class(), content="theme-pref-dark")
  inspect(ResolvedTheme::Light.class_name(), content="theme-light")
  inspect(ResolvedTheme::Dark.class_name(), content="theme-dark")
}
