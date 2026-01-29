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
  elem : Html,
  icon? : String,
) -> Html {
  let title_content = match icon {
    Some(icon_src) =>
      div(class="flex items-center gap-2", [
        img(class="w-[14px] h-[14px] ui-icon", src=icon_src, nothing()),
        span(class="text-gray-700", [text(title)]),
      ])
    None => text(title)
  }
  div(class="flex border-t flex-col gap-2 text-gray-800 px-8 py-4 grow", [
    p(class="font-bold text-sm", [title_content]),
    div(class="grow", [elem]),
  ])
}

///|
fn install_view(
  command : String,
  copied~ : Bool,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let icon = if copied { @config.ok } else { @config.clipboard }
  div(
    class="hover:bg-gray-100 active:bg-gray-200 bg-white md:shadow-xs transition-colors text-black text-sm px-3 p-2 font-mono border rounded outline-none flex justify-between items-center gap-2",
    click=to_cmd(Msg::CopyInstallCommand(command)),
    [
      span(class="overflow-x-auto text-nowrap", [text(command)]),
      img(class="size-4 ui-icon", src=icon, nothing()),
    ],
  )
}

///|
fn tag_view(value : String) -> Html {
  div(
    class="self-center border rounded bg-zinc-50 px-2 text-[12px] text-gray-600 overflow-hidden",
    [text(value)],
  )
}

///|
fn meta_info(
  model : MetaInfo,
  install_copied~ : Bool,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let model_license = match model.license {
    Some(l) =>
      meta_info_item_view(icon=@config.license, title="License", p([text(l)]))
    None => nothing()
  }
  let model_repo = match model.repository {
    Some(repo) =>
      meta_info_item_view(
        icon=@config.repo,
        title="Repository",
        p([a(class="hover:underline", escape=true, href=repo, [text(repo)])]),
      )
    None => nothing()
  }
  let model_description : Html = div(class="pl-7 py-2 mb-2", [
    h1(class="text-2xl font-bold mb-2", [
      text(model.name.split("/").last().unwrap().to_string()),
    ]),
    match model.description {
      Some(d) => p(class="text-gray-600 flex items-center text-sm", [text(d)])
      None => nothing()
    },
    match model.keywords {
      [] => nothing()
      keywords => div(class="flex gap-2 mt-2", keywords.map(tag_view))
    },
  ])
  div(class="md:my-4 py-2 bg-gray-50 md:rounded overflow-clip", [
    model_description,
    div(
      class="flex flex-wrap content-stretch",
      [
        meta_info_item_view(
          icon=@config.user,
          title="Author",
          a(
            href="/user/\{model.author}",
            class="hover:bg-gray-300 transition-colors py-0.5 px-1 rounded",
            [text(model.author)],
          ),
        ),
        meta_info_item_view(
          icon=@config.tag,
          title="Version",
          p([text(model.version)]),
        ),
        model_license,
        model_repo,
      ]
      .iter()
      .intersperse(div(class="", nothing()))
      .collect(),
    ),
    if model.deps.is_empty() {
      nothing()
    } else {
      meta_info_item_view(
        icon=@config.deps,
        title="Dependencies",
        ul(
          class="",
          model.deps.map(pair => {
            let (name, version) = pair
            @html.li(class="font-mono text-sm text-gray-300", [
              a(class="hover:underline text-gray-900", href="/docs/\{name}", [
                text(name),
              ]),
              span(class="text-gray-500", [text(" " + version)]),
            ])
          }),
        ),
      )
    },
    meta_info_item_view(
      icon=@config.terminal,
      title="Install",
      if model.name == "moonbitlang/core" {
        div(class="text-gray-600", [
          text("This module is installed by default."),
        ])
      } else {
        install_view(
          "moon add \{model.name}@\{model.version}",
          copied=install_copied,
          to_cmd,
        )
      },
    ),
  ])
}
