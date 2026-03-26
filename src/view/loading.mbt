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
  let card = fn() {
    div(
      class="bg-white border border-gray-200 rounded-md px-4 py-3.5 flex flex-col gap-2.5",
      [
        div(class="flex items-baseline gap-1", [
          div(class="h-4 w-16 bg-gray-200 rounded", nothing),
          div(class="h-4 w-24 bg-gray-200 rounded", nothing),
          div(class="h-3 w-12 bg-gray-200 rounded ml-auto", nothing),
        ]),
        div(class="h-3 w-3/4 bg-gray-200 rounded", nothing),
        div(class="h-3 w-1/2 bg-gray-200 rounded", nothing),
      ],
    )
  }
  let per_column = (count + 2) / 3
  let column = fn() {
    div(
      class="flex flex-col gap-2",
      [
        div(class="h-4 w-28 bg-gray-200 rounded py-2", nothing),
        ..Array::makei(per_column, fn(_) { card() }),
      ],
    )
  }
  div(class="grid grid-cols-1 lg:grid-cols-3 gap-4 animate-pulse", [
    column(),
    column(),
    column(),
  ])
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
pub fn skeleton_docs_content() -> Html {
  fn api_item(title_w : String, sig_lines : Int, content_w : String) -> Html {
    div(class="mb-3 mt-10", [
      // Title bar with border-bottom
      div(class="flex items-center justify-between border-b mb-4 py-2", [
        div(class="h-5 \{title_w} bg-gray-200 rounded", nothing),
      ]),
      // Signature block
      div(
        class="bg-gray-100 rounded-lg px-4 py-2.5",
        Array::makei(sig_lines, fn(_) {
          div(class="h-3.5 w-3/4 bg-gray-200 rounded my-1.5", nothing)
        }),
      ),
      // Content
      div(class="pl-4 mt-3 space-y-2", [
        div(class="h-3.5 \{content_w} bg-gray-200 rounded", nothing),
      ]),
    ])
  }

  div(class="animate-pulse py-4 mx-4 md:mx-0", [
    // README toggle label + content + divider
    div(class="mt-4 mb-8", [
      div(class="h-4 w-16 bg-gray-200 rounded mb-4", nothing),
      div(class="space-y-2.5 mb-6", [
        div(class="h-3.5 w-full bg-gray-200 rounded", nothing),
        div(class="h-3.5 w-5/6 bg-gray-200 rounded", nothing),
        div(class="h-3.5 w-3/5 bg-gray-200 rounded", nothing),
      ]),
      div(class="border-b border-gray-200 mt-4", nothing),
    ]),
    // API doc items
    api_item("w-32", 1, "w-full"),
    api_item("w-40", 2, "w-5/6"),
    api_item("w-24", 1, "w-2/3"),
  ])
}

///|
pub fn skeleton_sidebar() -> Html {
  div(class="animate-pulse space-y-1 pt-1", [
    div(class="flex items-center gap-2 px-2 py-1", [
      div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
      div(class="h-3.5 w-24 bg-gray-200 rounded", nothing),
    ]),
    div(class="pl-5 space-y-1", [
      div(class="flex items-center gap-2 px-2 py-1", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-20 bg-gray-200 rounded", nothing),
      ]),
      div(class="flex items-center gap-2 px-2 py-1", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-28 bg-gray-200 rounded", nothing),
      ]),
      div(class="flex items-center gap-2 px-2 py-1", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-16 bg-gray-200 rounded", nothing),
      ]),
    ]),
    div(class="flex items-center gap-2 px-2 py-1", [
      div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
      div(class="h-3.5 w-20 bg-gray-200 rounded", nothing),
    ]),
    div(class="flex items-center gap-2 px-2 py-1", [
      div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
      div(class="h-3.5 w-32 bg-gray-200 rounded", nothing),
    ]),
    div(class="pl-5 space-y-1", [
      div(class="flex items-center gap-2 px-2 py-1", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-18 bg-gray-200 rounded", nothing),
      ]),
      div(class="flex items-center gap-2 px-2 py-1", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-24 bg-gray-200 rounded", nothing),
      ]),
    ]),
    div(class="flex items-center gap-2 px-2 py-1", [
      div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
      div(class="h-3.5 w-28 bg-gray-200 rounded", nothing),
    ]),
  ])
}

///|
pub fn skeleton_meta_sidebar() -> Html {
  div(class="animate-pulse text-sm", [
    // Install
    div(class="mb-4", [
      div(class="h-4 w-12 bg-gray-200 rounded mb-1.5", nothing),
      div(class="h-8 w-full bg-gray-200 rounded", nothing),
    ]),
    // Meta rows
    div(class="border-t pt-3 space-y-2", [
      div(class="flex items-center gap-2", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-20 bg-gray-200 rounded", nothing),
      ]),
      div(class="flex items-center gap-2", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-16 bg-gray-200 rounded", nothing),
      ]),
      div(class="flex items-center gap-2", [
        div(class="size-4 bg-gray-200 rounded shrink-0", nothing),
        div(class="h-3.5 w-12 bg-gray-200 rounded", nothing),
      ]),
    ]),
    // Dependencies
    div(class="border-t pt-3 mt-3", [
      div(class="h-4 w-24 bg-gray-200 rounded mb-2", nothing),
      div(class="space-y-1.5", [
        div(class="h-3.5 w-full bg-gray-200 rounded", nothing),
        div(class="h-3.5 w-3/4 bg-gray-200 rounded", nothing),
        div(class="h-3.5 w-5/6 bg-gray-200 rounded", nothing),
      ]),
    ]),
  ])
}

///|
pub fn load_failed(resource : String) -> Html {
  div(class="flex flex-col items-center justify-center py-16 w-full", [
    p(class="text-sm text-gray-400", [text("Failed to load \{resource}")]),
  ])
}

///|
pub fn document_not_available(_path : String) -> Html {
  div(class="docs-state-shell", [
    div(class="docs-state-card docs-state-card-failed", [
      div(class="docs-state-header", [
        h1(class="docs-state-title", [text("Docs unavailable")]),
        p(class="docs-state-summary", [
          text("Documentation assets could not be loaded. "),
          a(
            class="docs-state-link",
            href="https://github.com/moonbitlang/mooncakes.io/issues/new",
            [text("Report it")],
          ),
          text(" if this persists."),
        ]),
      ]),
    ]),
  ])
}
