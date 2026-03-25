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
priv enum CardMode {
  Expanded
  Collapsed
}

///|
fn card_mode_toggle(mode~ : CardMode, click~ : (CardMode) -> Cmd) -> Html {
  let (icon, next_mode) = match mode {
    Expanded => (@config.REDUCTION, Collapsed)
    Collapsed => (@config.EXPANSION, Expanded)
  }
  @html.button(
    class="theme-toggle hidden md:inline-flex items-center rounded-full px-3 py-1.5 transition-colors",
    on_click=click(next_mode),
    [img(class="w-4 h-4 ui-icon", src=icon, nothing)],
  )
}
