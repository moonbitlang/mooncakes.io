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
pub fn loading[M]() -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    h1(class="text-2xl font-bold m-10", [text("Loading...")]),
  ])
}

///|
pub fn load_failed[M](resource : String) -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    h1(class="text-2xl font-bold text-gray-700 m-10", [
      text("Failed to load \{resource}"),
    ]),
  ])
}

///|
pub fn document_not_available[M](path : String) -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    div(class="text-gray-900 m-10", [
      h1(class="text-lg mb-2 font-semibold text-center", [
        text("Document for \{path} is not available"),
      ]),
      ul(class="list-disc text-gray-600", [
        li([
          text(
            "The package may be outdated and we cannot build document for it.",
          ),
        ]),
        li([
          text(
            "It also could be an error in mooncakes.io, please report it to us.",
          ),
        ]),
      ]),
    ]),
  ])
}
