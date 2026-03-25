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
  let img_class = "w-4 h-4"
  let btn_base = "p-1.5 rounded-full transition-colors cursor-pointer"
  let btn_active = btn_base + " bg-gray-200"
  let btn_normal = btn_base + " hover:bg-gray-100"
  let (l, r) = match mode {
    Expanded => (btn_active, btn_normal)
    Collapsed => (btn_normal, btn_active)
  }
  div(class="flex items-center gap-0.5", [
    div(class=l, on_click=click(Expanded), [
      img(class=img_class + " ui-icon", src=@config.EXPANSION, nothing),
    ]),
    div(class=r, on_click=click(Collapsed), [
      img(class=img_class + " ui-icon", src=@config.REDUCTION, nothing),
    ]),
  ])
}
