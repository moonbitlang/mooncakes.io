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
} derive(Show)

///|
fn[M] card_mode_toggle(mode~ : CardMode, click~ : (CardMode) -> M) -> Html[M] {
  let img_class = "w-[15px] h-[15px]"
  let btn_focused = "border border-slate-300 bg-slate-100"
  let lbtn_normal = "border-y border-l hover:z-30 hover:outline hover:outline-mooncake2"
  let rbtn_normal = "border-y border-r hover:z-30 hover:outline hover:outline-mooncake2"
  let (l, r) = match mode {
    Expanded => (btn_focused, rbtn_normal)
    Collapsed => (lbtn_normal, btn_focused)
  }
  div(klass="flex", [
    div(klass="py-2 px-3 rounded-l \{l}", click=click(Expanded), [
      img(klass=img_class, src=@config.EXPANSION, []),
    ]),
    div(klass="py-2 px-3 rounded-r \{r}", click=click(Collapsed), [
      img(klass=img_class, src=@config.REDUCTION, []),
    ]),
  ])
}
