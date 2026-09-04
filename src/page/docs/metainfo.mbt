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
fn install_button(command : String, copied~ : Bool, copy~ : Cmd) -> Html {
  let icon = if copied { @config.ok } else { @config.clipboard }
  button(
    class="hover:bg-gray-100 dark:hover:bg-zinc-900 active:bg-gray-200 dark:active:bg-gray-800 bg-white dark:bg-zinc-900 md:shadow-xs transition-colors text-black dark:text-slate-50 text-sm px-3 p-2 font-mono border rounded outline-none flex justify-between items-center gap-2",
    on_click=copy,
  ) <| [
    span(class="overflow-x-auto text-nowrap", command),
    img(class="size-4 ui-icon", src=icon),
  ]
}

///|
fn tag(value : String) -> Html {
  div(
    class="self-center border rounded bg-zinc-50 dark:bg-zinc-950 px-2 text-[12px] text-gray-600 dark:text-slate-400 overflow-hidden",
    value,
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
    url[8:].to_owned()
  } else if url.has_prefix("http://") {
    url[7:].to_owned()
  } else {
    url
  }
  if s.has_suffix("/") {
    s[:s.length() - 1].to_owned()
  } else {
    s
  }
}

///|
priv enum MetadataMsg {
  CopyInstallCommand(String)
  CopyInstallSuccess
  CopyInstallFailed(String)
}

///|
priv struct Metadata {
  mobile : Html
  sidebar : Html
} derive(Eq)

///|
fn docs_metadata(manifest : Manifest) -> Val[Metadata] {
  let (install_copied, emit) = @rabbita.create_state(false, update=(
    model,
    msg,
    emit,
  ) => {
    match msg {
      CopyInstallCommand(command) =>
        (
          model,
          @clipboard.copy(Text(command), copied=emit(CopyInstallSuccess), failed=e => {
            emit(CopyInstallFailed(e))
          }),
        )
      CopyInstallSuccess => (true, none)
      CopyInstallFailed(reason) => {
        println(reason)
        (false, none)
      }
    }
  })
  install_copied.map(install_copied => {
    let metadata = { ..manifest.module_meta, version: manifest.version, }
    let model_description : Html = div(class="pl-7 py-2 mb-2") <| [
      h1(
        class="text-xl md:text-2xl font-bold mb-2",
        metadata.name.split("/").last().unwrap().to_owned(),
      ),
      match metadata.description {
        Some(d) =>
          p(
            class="text-gray-600 dark:text-slate-400 flex items-center text-sm",
            d,
          )
        None => nothing
      },
      match metadata.keywords {
        [] => nothing
        keywords => div(class="flex gap-2 mt-2", keywords.map(tag))
      },
    ]
    let mobile = div(
      class="md:my-4 py-2 bg-gray-50 dark:bg-zinc-950 md:rounded overflow-clip border-b md:border-b-0",
    ) <| [
      model_description,
      // Install
      div(class="px-6 py-3 border-t") <| [
        if metadata.name == "moonbitlang/core" {
          p(
            class="text-sm text-gray-500 dark:text-gray-400",
            "Installed by default",
          )
        } else {
          install_button(
            "moon add \{metadata.name}@\{metadata.version}",
            copied=install_copied,
            copy=emit(
              CopyInstallCommand(
                "moon add \{metadata.name}@\{metadata.version}",
              ),
            ),
          )
        },
        if metadata.name == "moonbitlang/core" {
          nothing
        } else {
          a(
            class="text-xs text-gray-400 dark:text-slate-500 hover:text-gray-600 dark:hover:text-slate-300 mt-1.5 inline-block",
            href="https://download.mooncakes.io/user/\{metadata.name}/\{metadata.version}.zip",
            "Download zip",
          )
        },
      ],
      // Meta grid
      div(class="px-6 py-3 border-t grid grid-cols-2 gap-x-4 gap-y-2 text-sm") <| [
        div <| [
          span(class="text-gray-400 dark:text-slate-500 text-xs", "Author"),
          div(
            a(
              href="/user/\{metadata.author}",
              class="hover:underline",
              metadata.author,
            ),
          ),
        ],
        div <| [
          span(class="text-gray-400 dark:text-slate-500 text-xs", "Version"),
          div(metadata.version),
        ],
        match metadata.license {
          Some(l) =>
            div <| [
              span(class="text-gray-400 dark:text-slate-500 text-xs", "License"),
              div(l),
            ]
          None => nothing
        },
        match metadata.repository {
          Some(repo) =>
            div(class="min-w-0") <| [
              span(
                class="text-gray-400 dark:text-slate-500 text-xs",
                "Repository",
              ),
              div <| [
                a(
                  class="hover:underline truncate block",
                  escape=true,
                  href=repo,
                  title=repo,
                  display_url(repo),
                ),
              ],
            ]
          None => nothing
        },
        if metadata.updated_at is Some(updated_at) {
          div <| [
            span(
              class="text-gray-400 dark:text-slate-500 text-xs",
              "Last updated",
            ),
            div(@util.get_relative_time(updated_at)),
          ]
        } else {
          nothing
        },
        if metadata.downloads > 0 && metadata.name != "moonbitlang/core" {
          div <| [
            span(class="text-gray-400 dark:text-slate-500 text-xs", "Downloads"),
            div(format_downloads(metadata.downloads)),
          ]
        } else {
          nothing
        },
      ],
      // Dependencies
      if metadata.deps.is_empty() {
        nothing
      } else {
        div(class="px-6 py-3 border-t") <| [
          p(class="font-semibold text-sm mb-1.5", "Dependencies"),
          ul(
            class="space-y-0.5",
            metadata.deps.map(pair => {
              let (name, version) = pair
              li(
                class="font-mono text-[13px] flex justify-between gap-2 min-w-0",
              ) <| [
                a(
                  class="hover:underline text-gray-700 dark:text-slate-300 truncate",
                  href="/docs/\{name}@\{version}",
                  title=name,
                  name,
                ),
                span(
                  class="text-gray-400 dark:text-slate-500 shrink-0",
                  version,
                ),
              ]
            }),
          ),
        ]
      },
    ]
    let install_cmd = "moon add \{metadata.name}@\{metadata.version}"
    let install_icon = if install_copied {
      @config.ok
    } else {
      @config.clipboard
    }
    let sidebar = div(
      class="text-sm text-gray-900 dark:text-slate-50 font-medium",
    ) <| [
      // Install
      div(class="mb-4") <| [
        p(class="font-semibold mb-1.5", "Install"),
        if metadata.name == "moonbitlang/core" {
          p(class="text-gray-500 dark:text-gray-400", "Installed by default")
        } else {
          button(
            class="group/install hover:bg-gray-100 dark:hover:bg-zinc-900 active:bg-gray-200 dark:active:bg-gray-800 bg-white dark:bg-zinc-900 transition-colors text-[13px] text-left px-2.5 py-1.5 font-mono border rounded relative",
            on_click=emit(CopyInstallCommand(install_cmd)),
          ) <| [
            span(class="break-all", install_cmd),
            div(
              class="absolute right-1 top-0 bottom-0 flex items-center px-1 bg-gray-100 dark:bg-zinc-900 rounded opacity-0 group-hover/install:opacity-100 transition-opacity",
              img(class="size-4 ui-icon", src=install_icon),
            ),
          ]
        },
        if metadata.name == "moonbitlang/core" {
          nothing
        } else {
          a(
            class="text-xs text-gray-400 dark:text-slate-500 hover:text-gray-600 dark:hover:text-slate-300 mt-1.5 inline-block",
            href="https://download.mooncakes.io/user/\{metadata.name}/\{metadata.version}.zip",
            "Download zip",
          )
        },
      ],
      // Description & Keywords
      match (metadata.description, metadata.keywords) {
        (None, []) => nothing
        _ =>
          div(class="border-t pt-3 mb-3 text-[13px]") <| [
            match metadata.description {
              Some(d) =>
                p(class="text-gray-500 dark:text-gray-400 line-clamp-3", d)
              None => nothing
            },
            match metadata.keywords {
              [] => nothing
              keywords =>
                div(
                  class="flex flex-wrap gap-1 mt-1.5",
                  keywords.map(fn(k) {
                    span(
                      class="border rounded px-1.5 py-0.5 text-[11px] text-gray-500 dark:text-gray-400 bg-zinc-50 dark:bg-zinc-950",
                      k,
                    )
                  }),
                )
            },
          ]
      },
      // Meta
      div(class="border-t pt-3 space-y-2.5 text-[13px]") <| [
        div(class="flex items-center gap-2") <| [
          img(class="w-4 h-4 ui-icon shrink-0", src=@config.user),
          a(
            href="/user/\{metadata.author}",
            class="hover:underline",
            metadata.author,
          ),
        ],
        div(class="flex items-center gap-2") <| [
          img(class="w-4 h-4 ui-icon shrink-0", src=@config.tag),
          text(metadata.version),
        ],
        match metadata.license {
          Some(l) =>
            div(class="flex items-center gap-2") <| [
              img(class="w-4 h-4 ui-icon shrink-0", src=@config.license),
              text(l),
            ]
          None => nothing
        },
        match metadata.repository {
          Some(repo) =>
            div(class="flex items-center gap-2 min-w-0") <| [
              img(class="w-4 h-4 ui-icon shrink-0", src=@config.repo),
              a(
                class="hover:underline truncate",
                escape=true,
                href=repo,
                title=repo,
                display_url(repo),
              ),
            ]
          None => nothing
        },
        if metadata.updated_at is Some(updated_at) {
          div(class="flex items-center gap-2") <| [
            img(class="w-4 h-4 ui-icon shrink-0", src=@config.updated),
            text("Updated \{@util.get_relative_time(updated_at)}"),
          ]
        } else {
          nothing
        },
        if metadata.downloads > 0 && metadata.name != "moonbitlang/core" {
          div(class="flex items-center gap-2") <| [
            img(class="w-4 h-4 ui-icon shrink-0", src=@config.download),
            text("\{format_downloads(metadata.downloads)} downloads"),
          ]
        } else {
          nothing
        },
      ],
      // Dependencies
      if metadata.deps.is_empty() {
        nothing
      } else {
        div(class="border-t pt-3 mt-3") <| [
          p(class="font-semibold text-[13px] mb-1.5", "Dependencies"),
          ul(
            class="space-y-0.5",
            metadata.deps.map(fn(pair) {
              let (name, version) = pair
              li(
                class="font-mono text-[13px] flex justify-between gap-2 min-w-0",
              ) <| [
                a(
                  class="hover:underline text-gray-700 dark:text-slate-300 truncate",
                  href="/docs/\{name}@\{version}",
                  title=name,
                  name,
                ),
                span(
                  class="text-gray-400 dark:text-slate-500 shrink-0",
                  version,
                ),
              ]
            }),
          ),
        ]
      },
    ]
    { mobile, sidebar: div(class="animate-fade-in", sidebar), }
  })
}
