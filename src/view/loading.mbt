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
pub fn loading() -> Html {
  div(class="flex items-center justify-center py-16 w-full", [
    div(class="flex gap-1.5", [
      div(class="loading-dot w-2 h-2 rounded-full bg-gray-400", nothing),
      div(class="loading-dot w-2 h-2 rounded-full bg-gray-400", nothing),
      div(class="loading-dot w-2 h-2 rounded-full bg-gray-400", nothing),
    ]),
  ])
}

///|
pub fn skeleton_module_cards(count : Int) -> Html {
  let cards = Array::makei(count, fn(_i) {
    div(
      class="h-24 lg:h-30 bg-white border border-gray-200 rounded-md py-3 px-4 flex flex-col gap-3",
      [
        div(class="flex gap-2", [
          div(class="h-4 w-16 bg-gray-200 rounded", nothing),
          div(class="h-4 w-24 bg-gray-200 rounded", nothing),
        ]),
        div(class="h-3 w-3/4 bg-gray-200 rounded", nothing),
        div(class="h-3 w-16 bg-gray-200 rounded self-end", nothing),
      ],
    )
  })
  div(
    class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-2 lg:gap-4 animate-pulse",
    cards,
  )
}

///|
pub fn skeleton_profile() -> Html {
  div(class="flex flex-col items-center animate-pulse", [
    div(class="w-32 h-32 rounded-full bg-gray-200 mb-4", nothing),
    div(class="h-7 w-40 bg-gray-200 rounded", nothing),
  ])
}

///|
pub fn skeleton_published_modules(count : Int) -> Html {
  let cards = Array::makei(count, fn(_i) {
    div(class="border border-gray-200 rounded-lg p-4 bg-white flex flex-col", [
      div(class="h-5 w-24 bg-gray-200 rounded mb-3", nothing),
      div(class="mt-auto flex justify-end", [
        div(class="h-5 w-14 bg-gray-200 rounded", nothing),
      ]),
    ])
  })
  div(class="animate-pulse", [
    div(class="h-7 w-48 bg-gray-200 rounded mb-6", nothing),
    div(class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4", cards),
  ])
}

///|
pub fn skeleton_code_frequency() -> Html {
  div(class="animate-pulse", [
    div(class="h-7 w-44 bg-gray-200 rounded mb-6", nothing),
    div(
      class="bg-white rounded-xl border px-4 sm:px-6 lg:px-10 pb-6 pt-6 sm:pt-8 lg:pt-10",
      [
        div(class="h-40 bg-gray-200 rounded", nothing),
        div(class="flex gap-4 mt-4", [
          div(class="h-3 w-16 bg-gray-200 rounded", nothing),
          div(class="h-3 w-16 bg-gray-200 rounded", nothing),
          div(class="h-3 w-20 bg-gray-200 rounded", nothing),
        ]),
      ],
    ),
  ])
}

///|
pub fn load_failed(resource : String) -> Html {
  div(class="flex flex-col items-center justify-center py-16 w-full", [
    p(class="text-sm text-gray-400", [text("Failed to load \{resource}")]),
  ])
}

///|
pub fn document_not_available(path : String) -> Html {
  div(class="docs-state-shell", [
    div(class="docs-state-card docs-state-card-failed", [
      div(class="docs-state-header", [
        h1(class="docs-state-title", [text("Docs not ready")]),
        p(class="docs-state-path", [text(path)]),
        p(class="docs-state-summary", [
          text(
            "This usually means the docs build is still pending or the generated assets are temporarily missing.",
          ),
        ]),
      ]),
      ul(class="docs-state-list", [
        li(class="docs-state-list-item", [
          text("Docs are still building or the generated assets are missing."),
        ]),
        li(class="docs-state-list-item", [
          text("The module may have failed to compile during the docs build."),
        ]),
        li(class="docs-state-list-item", [
          text("If this persists for a few hours, "),
          a(
            class="docs-state-link",
            href="https://github.com/moonbitlang/mooncakes.io/issues/new",
            [text("report it")],
          ),
          text("."),
        ]),
      ]),
    ]),
  ])
}
