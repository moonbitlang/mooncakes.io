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
pub fn button(value : String, click? : Cmd) -> Html {
  div(
    class="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] self-center transition-transform px-2 py-1 rounded text-sm flex select-none text-gray-800",
    click?,
    [text(value)],
  )
}

///|
pub fn icon_button(icon : String, text? : String, click? : Cmd) -> Html {
  let text = match text {
    None => []
    Some(value) => [@html.text(value)]
  }
  div(
    class="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] transition-transform px-2 py-1 rounded text-sm select-none text-gray-800",
    click?,
    [
      div(
        class="self-center min-w-4 flex gap-2",
        [img(class="w-4 ui-icon", src=icon, nothing()), ..text],
      ),
    ],
  )
}

///|
pub fn theme_toggle(click? : Cmd) -> Html {
  @html.button(
    class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm font-medium transition-colors",
    click?,
    [
      img(
        class="theme-toggle-icon theme-toggle-icon-moon",
        src=@config.MOON_ICON,
        nothing(),
      ),
      img(
        class="theme-toggle-icon theme-toggle-icon-sun",
        src=@config.SUN_ICON,
        nothing(),
      ),
      span(class="sr-only theme-toggle-label theme-toggle-label-light", [
        text("Enable night mode"),
      ]),
      span(class="sr-only theme-toggle-label theme-toggle-label-dark", [
        text("Enable day mode"),
      ]),
    ],
  )
}
