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
pub(all) enum CaretConfig {
  LeftCenter
  LeftTop
}

///|
pub fn[M] collapse(
  header~ : Html[M],
  body~ : Html[M],
  collapsed~ : Bool,
  toggle~ : M,
  caret_config? : CaretConfig = LeftTop,
) -> Html[M] {
  let (body, icon) = if collapsed {
    (nothing(), @config.SECTION_CLOSE)
  } else {
    (body, @config.SECTION_OPEN)
  }
  let caret_style = match caret_config {
    LeftCenter => "self-center"
    LeftTop => ""
  }
  let button_style = match caret_config {
    LeftCenter => "flex h-full w-6"
    LeftTop => "h-6 w-6 top-0 m-1"
  }
  let button = div(
    class="absolute \{button_style} p-1 hover:bg-gray-200 active:bg-gray-300",
    click=toggle,
    [img(src=icon, class="size-4 ui-icon \{caret_style}", [])],
  )
  div([div(class="relative flex items-center", [button, header]), body])
}
