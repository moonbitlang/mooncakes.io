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
fn meta_info_item_view(
  title~ : String,
  elem : Html[Msg],
  grow~ : Bool = false
) -> Html[Msg] {
  let grow = if grow { "grow" } else { "" }
  div(class="flex items-center gap-3 text-gray-600 \{grow}", [
    p(class="font-bold text-sm", [text(title)]),
    div(class="grow", [elem]),
  ])
}

///|
fn install_view(path~ : String) -> Html[Msg] {
  div(
    class="text-sm h-8 p-2 pr-10 font-roboto border rounded outline-none bg-zinc-100 flex items-center",
    [text("moon add \{path}")],
  )
}

///|
fn tag_view(value : String) -> Html[Msg] {
  div(
    class="self-center border rounded bg-zinc-50 px-2 text-[12px] text-gray-600 overflow-hidden",
    [text(value)],
  )
}

///|
fn meta_info(model : MetaInfo) -> Html[Msg] {
  let model_license = match model.license {
    Some(l) =>
      meta_info_item_view(title="License", p(class="text-gray-600", [text(l)]))
    None => nothing()
  }
  let model_repo = match model.repository {
    Some(repo) =>
      meta_info_item_view(
        title="Repository",
        p([a(class="hover:underline", href=repo, [text(repo)])]),
      )
    None => nothing()
  }
  let model_description = match model.description {
    Some(d) => p(class="text-gray-600 flex items-center text-sm", [text(d)])
    None => nothing()
  }
  let meta_separator = div(class="border-l border-gray-200 my-1 mx-2", [])
  div(class="px-4 sm:px-8 p-6 border-b mx-4", [
    div(class="flex gap-3 flex-wrap mb-2", [
      model_description,
      div(class="flex gap-2", model.keywords.map(tag_view)),
    ]),
    div(class="flex gap-3 flex-wrap", [
      meta_info_item_view(title="Install", div([install_view(path=model.name)])),
      div(class="grow", []),
      div(
        class="flex gap-2 flex-wrap",
        [
          meta_info_item_view(
            title="Author",
            p(class="text-gray-600", [text(model.author)]),
          ),
          model_license,
          model_repo,
        ]
        .iter()
        .intersperse(meta_separator)
        .collect(),
      ),
    ]),
  ])
}
