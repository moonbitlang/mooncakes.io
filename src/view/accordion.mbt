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
pub fn[M] accordion(
  class? : String,
  click? : (String) -> M,
  showing : String,
  items : Array[(String, Html[M])]
) -> Html[M] {
  ul(
    class?,
    items.map(x => {
      let (title, childs) = x
      let folded = title != showing
      let folded_style = if folded { "" } else { "bg-gray-100" }
      let click = click.map(fn(f) {
        if title == showing {
          f("")
        } else {
          f(title)
        }
      })
      let childs = if folded { nothing() } else { childs }
      div(class="w-full", [
        div(
          class="w-full rounded px-2 py-1 select-none font-semibold text-gray-700 hover:bg-gray-200 \{folded_style}",
          click?,
          [text(title)],
        ),
        div(class="ml-2", [childs]),
      ])
    }),
  )
}
