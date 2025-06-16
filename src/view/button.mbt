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
pub fn[M] button(value : String, click? : M) -> Html[M] {
  div(
    klass="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] self-center transition-transform px-2 py-1 rounded text-sm flex select-none text-gray-800",
    click?,
    [text(value)],
  )
}

///|
pub fn[M] icon_button(icon : String, text? : String, click? : M) -> Html[M] {
  let text = match text {
    None => []
    Some(value) => [@html.text(value)]
  }
  div(
    klass="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] transition-transform px-2 py-1 rounded text-sm select-none text-gray-800",
    click?,
    [
      div(
        klass="self-center min-w-4 flex gap-2",
        [img(klass="w-4", src=icon, []), ..text],
      ),
    ],
  )
}

///|
pub fn[M] navbar() -> Html[M] {
  div(klass="font-title h-14 w-full px-8 p-4 border-b select-none", [
    h1(klass="text-gray-700 font-semibold", [text("🥮 mooncakes.io")]),
  ])
}

///|
pub fn[M] footer() -> Html[M] {
  let klass = "hover:text-mooncake2 transition-colors"
  div(
    klass="px-6 min-h-28 lg:mx-10 mt-5 py-10 border-t text-gray-600 flex flex-col md:flex-row justify-center gap-4 md:gap-8",
    [
      p([text("Powered by MoonBit")]),
      a(href="https://github.com/moonbitlang/mooncakes.io", klass~, [
        text("Site source"),
      ]),
      a(href="https://github.com/moonbitlang/mooncakes.io/issues/new", klass~, [
        text("Report issue"),
      ]),
      p([text("© 2025 mooncakes.io")]),
    ],
  )
}
