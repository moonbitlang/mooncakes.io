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
/// Creates an appearance-neutral semantic button with the project-wide
/// interaction defaults.
pub fn[C : @html.IsChildren] button(
  children : C,
  on_click? : Cmd,
  title? : String,
  class? : String = "",
  style? : Array[String] = [],
  attrs? : @html.Attrs,
) -> Html {
  @html.button(
    style~,
    class="cursor-pointer \{class}",
    title?,
    type_="button",
    on_click?,
    attrs?,
  ) <| children
}

///|
pub fn icon_button(icon : String, text? : String, on_click? : Cmd) -> Html {
  let text = match text {
    None => []
    Some(value) => [@html.select(value)]
  }
  button(
    class="hover:bg-gray-200 dark:hover:bg-gray-800 active:bg-gray-300 dark:active:bg-gray-700 active:translate-y-[3px] transition-transform px-2 py-1 rounded text-sm select-none text-gray-800 dark:text-slate-200",
    on_click?,
  ) <| [
    div(class="self-center min-w-4 flex gap-2") <| [
      img(class="w-4 ui-icon", src=icon),
      ..text,
    ],
  ]
}

///|
pub fn theme_toggle(on_click? : Cmd, lang~ : @i18n.Lang) -> Html {
  button(
    on_click?,
    class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm font-medium transition-colors",
  ) <| [
    img(
      class="theme-toggle-icon theme-toggle-icon-computer",
      src=@config.computer_icon,
    ),
    img(class="theme-toggle-icon theme-toggle-icon-sun", src=@config.sun_icon),
    img(class="theme-toggle-icon theme-toggle-icon-moon", src=@config.moon_icon),
    span(
      class="sr-only theme-toggle-label theme-toggle-label-system",
      lang.select(
        en="Using system theme. Switch to light mode.",
        zh="当前使用系统主题。切换到浅色模式。",
      ),
    ),
    span(
      class="sr-only theme-toggle-label theme-toggle-label-light",
      lang.select(
        en="Using light mode. Switch to dark mode.",
        zh="当前使用浅色模式。切换到深色模式。",
      ),
    ),
    span(
      class="sr-only theme-toggle-label theme-toggle-label-dark",
      lang.select(
        en="Using dark mode. Switch to system theme.",
        zh="当前使用深色模式。切换到系统主题。",
      ),
    ),
  ]
}
