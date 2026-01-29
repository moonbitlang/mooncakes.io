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
pub fn[M] loading() -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    h1(class="text-2xl font-bold m-10", [text("Loading...")]),
  ])
}

///|
pub fn[M] load_failed(resource : String) -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    h1(class="text-2xl font-bold text-gray-700 m-10", [
      text("Failed to load \{resource}"),
    ]),
  ])
}

///|
pub fn[M] document_not_available(path : String) -> Html[M] {
  div(class="flex flex-col items-center justify-center min-h-[60vh] w-full", [
    div(
      class="max-w-2xl w-[92%] sm:w-full px-4 sm:px-6 py-6 text-gray-900 translate-x-2 sm:translate-x-0",
      [
        div(class="flex flex-col sm:flex-row items-start gap-4", [
          div(
            class="mt-1 size-10 sm:size-12 rounded-full bg-amber-100 text-amber-700 flex items-center justify-center text-lg sm:text-xl font-semibold",
            [text("!")],
          ),
          div(class="flex-1", [
            h1(class="text-lg sm:text-xl font-semibold", [
              text("Docs not ready"),
            ]),
            p(class="text-sm text-gray-500 mt-1", [text(path)]),
            p(class="text-sm text-gray-600 mt-3", [
              text("This usually means the docs build is pending or failed."),
            ]),
            ul(class="list-disc text-sm text-gray-600 mt-3 pl-5 space-y-1", [
              li([text("Docs will appear after the build completes.")]),
              li([text("The module itself may fail to compile.")]),
              li([
                text("If this persists for a few hours, you can "),
                a(
                  class="hover:text-mooncake2 transition-colors underline underline-offset-4",
                  href="https://github.com/moonbitlang/mooncakes.io/issues/new",
                  [text("report to us")],
                ),
                text("."),
              ]),
            ]),
          ]),
        ]),
      ],
    ),
  ])
}
