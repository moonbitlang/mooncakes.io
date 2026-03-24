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
  div(class="flex flex-col items-center justify-center h-full w-full", [
    h1(class="text-2xl font-bold m-10", [text("Loading...")]),
  ])
}

///|
pub fn load_failed(resource : String) -> Html {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    h1(class="text-2xl font-bold text-gray-700 m-10", [
      text("Failed to load \{resource}"),
    ]),
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
