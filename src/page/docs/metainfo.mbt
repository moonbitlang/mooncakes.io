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
fn install_view(
  command : String,
  copied~ : Bool,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let icon = if copied { @config.ok } else { @config.clipboard }
  div(
    class="hover:bg-gray-100 active:bg-gray-200 bg-white md:shadow-xs transition-colors text-black text-sm px-3 p-2 font-mono border rounded outline-none flex justify-between items-center gap-2",
    on_click=dispatch(CopyInstallCommand(command)),
    [
      span(class="overflow-x-auto text-nowrap", [text(command)]),
      img(class="size-4 ui-icon", src=icon, nothing),
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
fn format_downloads(n : Int) -> String {
  if n >= 1000000 {
    "\{n / 1000000}M"
  } else if n >= 1000 {
    "\{n / 1000}K"
  } else {
    n.to_string()
  }
}

///|
fn display_url(url : String) -> String {
  let s = if url.has_prefix("https://") {
    url[8:].to_string()
  } else if url.has_prefix("http://") {
    url[7:].to_string()
  } else {
    url
  }
  if s.has_suffix("/") {
    s[:s.length() - 1].to_string()
  } else {
    s
  }
}

///|
fn meta_sidebar(
  model : MetaInfo,
  install_copied~ : Bool,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let install_cmd = "moon add \{model.name}@\{model.version}"
  let install_icon = if install_copied { @config.ok } else { @config.clipboard }
  div(class="text-sm text-gray-900 font-medium", [
    // Install
    div(class="mb-4", [
      p(class="font-semibold mb-1.5", [text("Install")]),
      if model.name == "moonbitlang/core" {
        p(class="text-gray-500", [text("Installed by default")])
      } else {
        div(
          class="group/install hover:bg-gray-100 active:bg-gray-200 bg-white transition-colors text-[13px] px-2.5 py-1.5 font-mono border rounded relative cursor-pointer",
          on_click=dispatch(CopyInstallCommand(install_cmd)),
          [
            span(class="break-all", [text(install_cmd)]),
            div(
              class="absolute right-1 top-0 bottom-0 flex items-center px-1 bg-gray-100 rounded opacity-0 group-hover/install:opacity-100 transition-opacity",
              [img(class="size-4 ui-icon", src=install_icon, nothing)],
            ),
          ],
        )
      },
      if model.name == "moonbitlang/core" {
        nothing
      } else {
        a(
          class="text-xs text-gray-400 hover:text-gray-600 mt-1.5 inline-block",
          href="https://download.mooncakes.io/user/\{model.name}/\{model.version}.zip",
          [text("Download zip")],
        )
      },
    ]),
    // Description & Keywords
    match (model.description, model.keywords) {
      (None, []) => nothing
      _ =>
        div(class="border-t pt-3 mb-3 text-[13px]", [
          match model.description {
            Some(d) => p(class="text-gray-500 line-clamp-3", [text(d)])
            None => nothing
          },
          match model.keywords {
            [] => nothing
            keywords =>
              div(
                class="flex flex-wrap gap-1 mt-1.5",
                keywords.map(fn(k) {
                  span(
                    class="border rounded px-1.5 py-0.5 text-[11px] text-gray-500 bg-zinc-50",
                    [text(k)],
                  )
                }),
              )
          },
        ])
    },
    // Meta
    div(class="border-t pt-3 space-y-2.5 text-[13px]", [
      div(class="flex items-center gap-2", [
        img(class="w-4 h-4 ui-icon shrink-0", src=@config.user, nothing),
        a(href="/user/\{model.author}", class="hover:underline", [
          text(model.author),
        ]),
      ]),
      div(class="flex items-center gap-2", [
        img(class="w-4 h-4 ui-icon shrink-0", src=@config.tag, nothing),
        text(model.version),
      ]),
      match model.license {
        Some(l) =>
          div(class="flex items-center gap-2", [
            img(class="w-4 h-4 ui-icon shrink-0", src=@config.license, nothing),
            text(l),
          ])
        None => nothing
      },
      match model.repository {
        Some(repo) =>
          div(class="flex items-center gap-2 min-w-0", [
            img(class="w-4 h-4 ui-icon shrink-0", src=@config.repo, nothing),
            a(
              class="hover:underline truncate",
              escape=true,
              href=repo,
              title=repo,
              [text(display_url(repo))],
            ),
          ])
        None => nothing
      },
      if model.downloads > 0 && model.name != "moonbitlang/core" {
        div(class="flex items-center gap-2", [
          img(class="w-4 h-4 ui-icon shrink-0", src=@config.download, nothing),
          text(format_downloads(model.downloads) + " downloads"),
        ])
      } else {
        nothing
      },
    ]),
    // Dependencies
    if model.deps.is_empty() {
      nothing
    } else {
      div(class="border-t pt-3 mt-3", [
        p(class="font-semibold text-[13px] mb-1.5", [text("Dependencies")]),
        ul(
          class="space-y-0.5",
          model.deps.map(fn(pair) {
            let (name, version) = pair
            @html.li(
              class="font-mono text-[13px] flex justify-between gap-2 min-w-0",
              [
                a(
                  class="hover:underline text-gray-700 truncate",
                  href="/docs/\{name}@\{version}",
                  title=name,
                  [text(name)],
                ),
                span(class="text-gray-400 shrink-0", [text(version)]),
              ],
            )
          }),
        ),
      ])
    },
  ])
}

///|
fn meta_info(
  model : MetaInfo,
  install_copied~ : Bool,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let model_description : Html = div(class="pl-7 py-2 mb-2", [
    h1(class="text-xl md:text-2xl font-bold mb-2", [
      text(model.name.split("/").last().unwrap().to_string()),
    ]),
    match model.description {
      Some(d) => p(class="text-gray-600 flex items-center text-sm", [text(d)])
      None => nothing
    },
    match model.keywords {
      [] => nothing
      keywords => div(class="flex gap-2 mt-2", keywords.map(tag_view))
    },
  ])
  div(
    class="md:my-4 py-2 bg-gray-50 md:rounded overflow-clip border-b md:border-b-0",
    [
      model_description,
      // Install
      div(class="px-6 py-3 border-t", [
        if model.name == "moonbitlang/core" {
          p(class="text-sm text-gray-500", [text("Installed by default")])
        } else {
          install_view(
            "moon add \{model.name}@\{model.version}",
            copied=install_copied,
            dispatch,
          )
        },
        if model.name == "moonbitlang/core" {
          nothing
        } else {
          a(
            class="text-xs text-gray-400 hover:text-gray-600 mt-1.5 inline-block",
            href="https://download.mooncakes.io/user/\{model.name}/\{model.version}.zip",
            [text("Download zip")],
          )
        },
      ]),
      // Meta grid
      div(class="px-6 py-3 border-t grid grid-cols-2 gap-x-4 gap-y-2 text-sm", [
        div([
          span(class="text-gray-400 text-xs", [text("Author")]),
          div([
            a(href="/user/\{model.author}", class="hover:underline", [
              text(model.author),
            ]),
          ]),
        ]),
        div([
          span(class="text-gray-400 text-xs", [text("Version")]),
          div([text(model.version)]),
        ]),
        match model.license {
          Some(l) =>
            div([
              span(class="text-gray-400 text-xs", [text("License")]),
              div([text(l)]),
            ])
          None => nothing
        },
        match model.repository {
          Some(repo) =>
            div(class="min-w-0", [
              span(class="text-gray-400 text-xs", [text("Repository")]),
              div([
                a(
                  class="hover:underline truncate block",
                  escape=true,
                  href=repo,
                  title=repo,
                  [text(display_url(repo))],
                ),
              ]),
            ])
          None => nothing
        },
        if model.downloads > 0 && model.name != "moonbitlang/core" {
          div([
            span(class="text-gray-400 text-xs", [text("Downloads")]),
            div([text(format_downloads(model.downloads))]),
          ])
        } else {
          nothing
        },
      ]),
      // Dependencies
      if model.deps.is_empty() {
        nothing
      } else {
        div(class="px-6 py-3 border-t", [
          p(class="font-semibold text-sm mb-1.5", [text("Dependencies")]),
          ul(
            class="space-y-0.5",
            model.deps.map(pair => {
              let (name, version) = pair
              @html.li(
                class="font-mono text-[13px] flex justify-between gap-2 min-w-0",
                [
                  a(
                    class="hover:underline text-gray-700 truncate",
                    href="/docs/\{name}@\{version}",
                    title=name,
                    [text(name)],
                  ),
                  span(class="text-gray-400 shrink-0", [text(version)]),
                ],
              )
            }),
          ),
        ])
      },
    ],
  )
}
