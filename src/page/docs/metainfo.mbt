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
  icon? : String
) -> Html[Msg] {
  let title_content = match icon {
    Some(icon_src) =>
      div(klass="flex items-center gap-2", [
        img(klass="w-[14px] h-[14px]", src=icon_src, []),
        span(klass="text-gray-700", [text(title)]),
      ])
    None => text(title)
  }
  div(klass="flex border-t flex-col gap-2 text-gray-800 px-8 py-4 grow", [
    p(klass="font-bold text-sm", [title_content]),
    div(klass="grow", [elem]),
  ])
}

///|
fn install_view(command : String, copied~ : Bool) -> Html[Msg] {
  let icon = if copied { @config.ok } else { @config.clipboard }
  div(
    klass="hover:bg-gray-100 active:bg-gray-200 bg-white shadow-sm transition-colors text-black text-sm px-3 p-2 font-mono border rounded outline-none flex justify-between items-center gap-2",
    click=Msg::CopyInstallCommand(command),
    [
      span(klass="overflow-x-auto text-nowrap", [text(command)]),
      img(klass="size-4", src=icon, []),
    ],
  )
}

///|
fn tag_view(value : String) -> Html[Msg] {
  div(
    klass="self-center border rounded bg-zinc-50 px-2 text-[12px] text-gray-600 overflow-hidden",
    [text(value)],
  )
}

///|
fn meta_info(model : MetaInfo, install_copied~ : Bool) -> Html[Msg] {
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
        p([a(klass="hover:underline", href=repo, [text(repo)])]),
      )
    None => nothing()
  }
  let model_description = div(klass="pl-7 py-4", [
    h1(klass="text-2xl font-bold mb-4", [
      text(model.name.split("/").last().unwrap().to_string()),
    ]),
    match model.description {
      Some(d) => p(klass="text-gray-600 flex items-center text-sm", [text(d)])
      None => nothing()
    },
    div(klass="flex gap-2 my-2", model.keywords.map(tag_view)),
  ])
  div(klass="mx-7 my-4 py-2 bg-gray-50 rounded overflow-clip", [
    model_description,
    div(
      klass="flex flex-wrap content-stretch",
      [
        meta_info_item_view(
          icon=@config.user,
          title="Author",
          p([text(model.author)]),
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
      .intersperse(div(klass="", []))
      .collect(),
    ),
    if model.deps.is_empty() {
      nothing()
    } else {
      meta_info_item_view(
        icon=@config.deps,
        title="Dependencies",
        ul(
          klass="",
          model.deps.map(fn {
            (name, version) =>
              @html.li(klass="font-mono text-sm text-gray-300", [
                a(klass="hover:underline text-gray-900", href="/docs/\{name}", [
                  text(name),
                ]),
                span(klass="text-gray-500", [text(" " + version)]),
              ])
          }),
        ),
      )
    },
    meta_info_item_view(
      icon=@config.terminal,
      title="Install",
      if model.name == "moonbitlang/core" {
        div(klass="text-gray-600", [
          text("This module is installed by default."),
        ])
      } else {
        install_view(
          "moon add \{model.name}@\{model.version}",
          copied=install_copied,
        )
      },
    ),
  ])
}
