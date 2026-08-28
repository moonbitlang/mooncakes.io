///|
fn command_line(
  entries : Status[Array[WasmEntry]],
  showcase_index : Int,
  showcase_chars : Int,
) -> Html {
  let path = match entries {
    Success(entries) if entries.length() > 0 =>
      versioned_skill_path(entries[showcase_index % entries.length()])
    _ => ""
  }
  let path_token = command_prefix(
    path,
    visible_path_chars(path, showcase_chars),
  )
  div(class="w-full") <| [
    div(
      class="min-h-32 overflow-hidden rounded-md border border-gray-300 dark:border-zinc-700 bg-zinc-950 text-left",
    ) <| [
      div(class="flex h-8 items-center gap-1.5 border-b border-white/10 px-3") <| [
        span(class="h-2.5 w-2.5 rounded-full bg-red-400", ""),
        span(class="h-2.5 w-2.5 rounded-full bg-yellow-400", ""),
        span(class="h-2.5 w-2.5 rounded-full bg-green-500", ""),
        span(
          class="ml-2 font-mono text-xs text-zinc-500 dark:text-gray-400",
          "moon runwasm",
        ),
      ],
      div(
        class="flex min-w-0 items-center overflow-hidden px-4 py-4 font-mono text-xs lg:text-sm",
      ) <| [
        span(class="shrink-0 whitespace-pre text-zinc-400", "$ "),
        span(class="shrink-0 whitespace-pre text-sky-300", "moon "),
        span(
          class="shrink-0 whitespace-pre font-semibold text-emerald-300",
          "runwasm ",
        ),
        span(
          class="flex min-w-0 flex-1 items-center overflow-hidden text-left text-zinc-100",
        ) <| [
          span(class="min-w-0 truncate", path_token),
          if path.is_empty() {
            nothing
          } else {
            span(
              class="ml-0.5 inline-block h-4 w-1.5 shrink-0 animate-pulse bg-zinc-100 align-middle",
              "",
            )
          },
        ],
      ],
    ],
  ]
}

///|
fn visible_path_chars(path : String, frame : Int) -> Int {
  let path_length = path.iter().count()
  let hold_frames = 30
  let delete_step = 4
  if frame <= path_length {
    frame
  } else if frame <= path_length + hold_frames {
    path_length
  } else {
    let deleted = (frame - path_length - hold_frames) * delete_step
    if deleted >= path_length {
      0
    } else {
      path_length - deleted
    }
  }
}

///|
fn command_prefix(command : String, count : Int) -> String {
  if count <= 0 {
    ""
  } else if count >= command.iter().count() {
    command
  } else {
    let end = command.offset_of_nth_char(count).unwrap_or(command.length())
    command.sub(end~).to_owned()
  }
}

///|
fn runwasm_showcase(
  entries : Status[Array[WasmEntry]],
  showcase_index : Int,
  showcase_chars : Int,
  lang : @i18n.Lang,
) -> Html {
  div(
    class="mx-auto w-full max-w-[90rem] px-4 pb-10 pt-16 sm:px-6 lg:px-8 lg:pt-20",
  ) <| [
    div(
      class="overflow-hidden rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 shadow-sm",
    ) <| [
      div(
        class="flex h-9 items-center gap-1.5 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950 px-3",
      ) <| [
        span(class="size-2 rounded-full bg-red-400", ""),
        span(class="size-2 rounded-full bg-yellow-400", ""),
        span(class="size-2 rounded-full bg-green-500", ""),
        span(
          class="ml-2 font-mono text-xs text-gray-500 dark:text-gray-400",
          lang.select(en="Install moon", zh="安装 moon"),
        ),
      ],
      div(
        class="grid gap-6 px-5 py-6 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:px-6",
      ) <| [
        div(class="min-w-0") <| [
          h2(
            class="text-2xl font-bold tracking-normal text-gray-950 dark:text-slate-50",
            lang.select(
              en="Run a published skill in one command",
              zh="一条命令运行已发布的技能",
            ),
          ),
          p(
            class="mt-3 max-w-xl text-sm leading-6 text-gray-600 dark:text-slate-400",
            lang.select(
              en="Install moon, pick an optimized executable entry, and run the same sandboxed command across platforms with moon runwasm.",
              zh="安装 moon，选择优化后的可执行入口，即可通过 moon runwasm 在不同平台运行同一个沙箱命令。",
            ),
          ),
          a(
            href="https://www.moonbitlang.com/download/",
            class="mt-5 inline-flex items-center gap-2 rounded-md border border-[#c7856b] bg-[#d79a82] px-4 py-2 text-sm font-semibold text-zinc-950 shadow-sm transition-colors hover:bg-[#e2aa94]",
          ) <| [
            span(lang.select(en="Try now", zh="立即尝试")),
            @svg.svg(width=16, height=16, view_box="0 0 16 16", class="size-4") <| [
              @svg.path(
                d="M3 8h9",
                fill="none",
                stroke="currentColor",
                stroke_width=2,
              ),
              @svg.path(
                d="M8.5 4.5 12 8l-3.5 3.5",
                fill="none",
                stroke="currentColor",
                stroke_width=2,
              ),
            ],
          ],
        ],
        command_line(entries, showcase_index, showcase_chars),
      ],
    ],
  ]
}

///|
fn skill_count(entries : Status[Array[WasmEntry]]) -> String {
  match entries {
    Success(entries) => entries.length().to_string()
    _ => "..."
  }
}

///|
fn hero_arrow() -> Html {
  @svg.svg(width=16, height=16, view_box="0 0 16 16", class="size-4") <| [
    @svg.path(d="M3 8h9", fill="none", stroke="currentColor", stroke_width=2),
    @svg.path(
      d="M8.5 4.5 12 8l-3.5 3.5",
      fill="none",
      stroke="currentColor",
      stroke_width=2,
    ),
  ]
}

///|
fn skills_page(header : Html, main : Html, lang : @i18n.Lang) -> Html {
  div(class="skills-page w-full flex-col bg-white dark:bg-zinc-900") <| [
    header,
    div(class="min-h-screen flex-1") <| [
      div(class="relative flex h-full w-full flex-col", main),
    ],
    @view.footer(lang),
  ]
}

///|
fn hero_feature_card(
  index : String,
  title : String,
  body : String,
  action : String,
  icon : String,
  action_href? : String = "",
  highlighted? : Bool = false,
  emit~ : (Msg) -> Cmd,
) -> Html {
  let border_class = if highlighted {
    "border-mooncake2/40 shadow-mooncake2/10"
  } else {
    "border-gray-200 dark:border-zinc-800 shadow-gray-200/60"
  }
  let action_class = if highlighted {
    "text-[#c7856b]"
  } else {
    "text-gray-700 dark:text-slate-300"
  }
  div(
    class="relative flex min-h-[12rem] flex-col rounded-lg border \{border_class} bg-white dark:bg-zinc-900 px-4 py-4 shadow-sm",
  ) <| [
    div(class="flex items-start justify-between gap-4") <| [
      span(
        class="font-mono text-xs tracking-[0.12em] text-gray-400 dark:text-slate-500",
        index,
      ),
      div(
        class="flex size-9 shrink-0 items-center justify-center rounded-full border border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950",
      ) <| [
        img(class="size-4 ui-icon", src=icon),
      ],
    ],
    @html.h3(
      class="mt-7 text-base font-semibold leading-tight tracking-normal text-gray-950 dark:text-slate-50",
      title,
    ),
    p(class="mt-3 text-sm leading-6 text-gray-600 dark:text-slate-400", body),
    if action_href.is_empty() {
      button(
        class="mt-auto inline-flex w-fit items-center gap-2 pt-4 text-xs font-semibold \{action_class}",
        on_click=emit(ScrollToSkills),
      ) <| [
        span(action),
        hero_arrow(),
      ]
    } else {
      a(
        href=action_href,
        class="mt-auto inline-flex w-fit items-center gap-2 pt-4 text-xs font-semibold \{action_class}",
        escape=true,
      ) <| [
        span(action),
        hero_arrow(),
      ]
    },
  ]
}

///|
fn marketplace_hero(
  entries : Status[Array[WasmEntry]],
  lang : @i18n.Lang,
  emit~ : (Msg) -> Cmd,
) -> Html {
  div(
    class="w-full border-b border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900 text-gray-950 dark:text-slate-50",
  ) <| [
    div(
      class="mx-auto w-full max-w-[92rem] px-4 py-8 text-center sm:px-6 lg:px-8 lg:py-10",
    ) <| [
      div(class="relative mx-auto max-w-5xl overflow-visible") <| [
        div(
          class="skills-hero-word pointer-events-none absolute inset-x-0 -top-8 select-none text-7xl font-black tracking-tight text-gray-100 dark:text-slate-400/10 sm:text-8xl lg:text-9xl",
          lang.select(en="SKILLS", zh="技能"),
        ),
        div(
          class="relative mx-auto inline-flex items-center gap-2 rounded-full border border-gray-300 dark:border-zinc-700 bg-gray-50 dark:bg-zinc-950 px-3 py-1 font-mono text-xs uppercase tracking-wide text-gray-600 dark:text-slate-400",
        ) <| [
          span(class="size-2 rounded-full bg-mooncake2", ""),
          span(
            lang.select(
              en="MoonBit / Sandboxed local commands",
              zh="MoonBit / 沙箱本地命令",
            ),
          ),
        ],
        h1(
          class="relative mx-auto mt-5 max-w-4xl text-4xl font-bold leading-tight tracking-normal text-gray-950 dark:text-slate-50 sm:text-5xl lg:text-6xl",
          lang.select(
            en="MoonBit Skills Marketplace",
            zh="MoonBit 技能市场",
          ),
        ),
        p(
          class="relative mx-auto mt-4 max-w-3xl text-base leading-7 text-gray-600 dark:text-slate-400 sm:text-lg",
          lang.select(
            en="Push a package and mooncakes.io automatically builds optimized, cross-platform executable binaries that are easy to run in a local sandbox.",
            zh="推送软件包后，mooncakes.io 会自动构建经过优化、可跨平台运行的二进制文件，方便在本地沙箱中执行。",
          ),
        ),
        div(
          class="relative mt-6 flex flex-wrap items-center justify-center gap-2",
        ) <| [
          span(
            class="rounded-full border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1 text-sm text-gray-600 dark:text-slate-400 shadow-sm",
            lang.select(
              en="\{skill_count(entries)} executable entries",
              zh="\{skill_count(entries)} 个可执行入口",
            ),
          ),
          span(
            class="rounded-full border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1 text-sm text-gray-600 dark:text-slate-400 shadow-sm",
            lang.select(en="local sandbox", zh="本地沙箱"),
          ),
          span(
            class="rounded-full border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1 text-sm text-gray-600 dark:text-slate-400 shadow-sm",
            lang.select(
              en="cross-platform binaries",
              zh="跨平台二进制文件",
            ),
          ),
        ],
        div(
          class="relative mt-6 flex flex-wrap items-center justify-center gap-3",
        ) <| [
          button(
            class="rounded-md bg-[#d79a82] px-4 py-2 text-sm font-semibold text-zinc-950 shadow-sm transition-colors hover:bg-[#e2aa94]",
            on_click=emit(ScrollToSkills),
          ) <| span(lang.select(en="Search Skills", zh="搜索技能")),
          a(
            href="https://www.moonbitlang.com/download/",
            class="rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-4 py-2 text-sm font-semibold text-gray-900 dark:text-slate-50 shadow-sm transition-colors hover:border-gray-400 dark:hover:border-zinc-600 hover:bg-gray-50 dark:hover:bg-zinc-950",
            lang.select(en="Install moon", zh="安装 moon"),
          ),
        ],
      ],
    ],
  ]
}

///|
fn source_context_section(
  entries : Status[Array[WasmEntry]],
  lang : @i18n.Lang,
  emit~ : (Msg) -> Cmd,
) -> Html {
  div(class="mx-auto w-full max-w-[90rem] px-4 py-8 sm:px-6 lg:px-8") <| [
    div(class="border-t border-gray-200 dark:border-zinc-800 pt-7") <| [
      span(
        class="inline-flex rounded-full border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900 px-3 py-1 text-xs font-medium text-gray-600 dark:text-slate-400",
        "MoonBit wasm",
      ),
      h2(
        class="mt-4 max-w-2xl text-2xl font-bold leading-tight tracking-normal text-gray-950 dark:text-slate-50 sm:text-3xl",
        lang.select(
          en="Publish once, distribute safely across platforms",
          zh="一次发布，安全分发到各个平台",
        ),
      ),
      div(
        class="mt-4 max-w-3xl space-y-3 text-sm leading-6 text-gray-600 dark:text-slate-400",
      ) <| [
        p() <| [
          @html.select(
            lang.select(
              en="Under the hood, mooncakes.io compiles each skill to optimized ",
              zh="mooncakes.io 会在后台把每个技能编译为经过优化的 ",
            ),
          ),
          a(
            href="https://developer.mozilla.org/en-US/docs/WebAssembly/Guides/Concepts",
            class="font-medium text-gray-900 dark:text-slate-50 underline underline-offset-2 hover:text-[#c7856b]",
            "WebAssembly (Wasm)",
          ),
          @html.select(
            lang.select(
              en=" binaries, then exposes them as executable commands through moon runwasm. The Wasm sandbox keeps commands isolated while the same artifact stays portable across platforms.",
              zh=" 二进制文件，再通过 moon runwasm 将它们作为可执行命令提供。Wasm 沙箱会隔离命令，同时让同一份产物能够跨平台运行。",
            ),
          ),
        ],
        p(
          lang.select(
            en="Add SKILL.md and repository links so users can inspect what a command does before they reuse it.",
            zh="添加 SKILL.md 和仓库链接，让用户在复用命令前了解它的用途。",
          ),
        ),
      ],
      div(class="mt-6 grid gap-3 lg:grid-cols-3") <| [
        hero_feature_card(
          "01",
          lang.select(en="Fast publishing", zh="快速发布"),
          lang.select(
            en="Ship a MoonBit package with SKILL.md so its executable entry is discoverable on mooncakes.io.",
            zh="发布包含 SKILL.md 的 MoonBit 软件包，让它的可执行入口能够在 mooncakes.io 上被发现。",
          ),
          lang.select(en="Publish packages", zh="发布软件包"),
          @config.search,
          action_href="https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
          highlighted=true,
          emit~,
        ),
        hero_feature_card(
          "02",
          lang.select(
            en="Build optimized binaries",
            zh="构建优化后的二进制文件",
          ),
          lang.select(
            en="mooncakes.io automatically builds uploaded packages into Wasm binaries, then optimizes them with wasm-opt.",
            zh="mooncakes.io 会自动把上传的软件包构建成 Wasm 二进制文件，再使用 wasm-opt 进行优化。",
          ),
          lang.select(en="Browse binaries", zh="浏览二进制文件"),
          @config.book_open,
          emit~,
        ),
        hero_feature_card(
          "03",
          lang.select(en="Share and browse skills", zh="分享和浏览技能"),
          lang.select(
            en="Share your skill with others, or browse skills published by other MoonBit users.",
            zh="与其他人分享你的技能，或浏览其他 MoonBit 用户发布的技能。",
          ),
          lang.select(en="Browse skills", zh="浏览技能"),
          @config.download,
          emit~,
        ),
      ],
      div(
        class="mt-6 flex flex-col gap-4 border-t border-gray-200 dark:border-zinc-800 pt-5 lg:flex-row lg:items-center lg:justify-between",
      ) <| [
        p(
          class="max-w-2xl text-sm leading-6 text-gray-600 dark:text-slate-400",
          lang.select(
            en="A published module gives users optimized executable binaries, SKILL.md context, and a consistent cross-platform artifact.",
            zh="发布模块后，用户可以获得经过优化的可执行文件、SKILL.md 说明以及一致的跨平台产物。",
          ),
        ),
        div(class="flex flex-wrap gap-2") <| [
          span(
            class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
            lang.select(
              en="\{skill_count(entries)} wasm entries",
              zh="\{skill_count(entries)} 个 wasm 入口",
            ),
          ),
          span(
            class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
            "moon-wasm-opt",
          ),
          span(
            class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
            lang.select(en="cross-platform wasm", zh="跨平台 wasm"),
          ),
        ],
      ],
    ],
  ]
}

///|
fn sticky_search(
  filter : String,
  entries : Status[Array[WasmEntry]],
  lang : @i18n.Lang,
  emit~ : (Msg) -> Cmd,
) -> Html {
  div(
    class="skills-search-sticky sticky top-header z-20 border-b border-gray-200 dark:border-zinc-800 bg-white/85 dark:bg-zinc-950/85 px-4 py-4 backdrop-blur-md",
  ) <| [
    div(class="relative mx-auto w-full max-w-5xl") <| [
      div(
        class="overflow-hidden rounded-lg border border-mooncake2/35 bg-white dark:bg-zinc-900 shadow-sm shadow-mooncake2/10",
      ) <| [
        div(
          class="flex h-8 items-center gap-1.5 border-b border-mooncake2/20 bg-mooncake2/5 px-3",
        ) <| [
          span(class="size-2 rounded-full bg-red-400", ""),
          span(class="size-2 rounded-full bg-yellow-400", ""),
          span(class="size-2 rounded-full bg-green-500", ""),
          span(
            class="ml-1 font-mono text-xs text-gray-500 dark:text-gray-400",
            lang.select(
              en="Type to search \{skill_count(entries)} skills",
              zh="输入内容，搜索 \{skill_count(entries)} 个技能",
            ),
          ),
        ],
        div(class="flex items-center gap-2 px-4 py-4 font-mono text-sm") <| [
          span(class="shrink-0 text-emerald-600 dark:text-emerald-300", "$"),
          span(class="shrink-0 text-gray-500 dark:text-gray-400", "find"),
          img(class="size-4 shrink-0 opacity-70 ui-icon", src=@config.search),
          input(
            input_type=Text,
            value=filter,
            placeholder=lang.select(
              en="Filter skills ...",
              zh="筛选技能……",
            ),
            class="min-w-0 flex-1 bg-transparent outline-none placeholder:text-gray-400 dark:placeholder:text-slate-500",
            on_input=x => emit(FilterChanged(x)),
          ),
        ],
      ],
    ],
  ]
}

///|
fn author_avatar(author : String, avatar_url : String) -> Html {
  if avatar_url == "" {
    let initial = if author == "" {
      "U"
    } else {
      let end = author.offset_of_nth_char(1).unwrap_or(author.length())
      author.sub(end~).to_owned().to_upper()
    }
    div(
      class="flex size-5 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-blue-400 to-purple-500 text-[10px] font-bold text-white",
      initial,
    )
  } else {
    img(class="size-5 shrink-0 rounded-full object-cover", src=avatar_url)
  }
}

///|
fn entry_card(
  entry : WasmEntry,
  copied_command : String,
  lang : @i18n.Lang,
  emit~ : (Msg) -> Cmd,
) -> Html {
  let skill_name = entry.name.split("/").last().unwrap().to_owned()
  let run_cmd = runwasm_command(entry)
  let copied = copied_command == run_cmd
  let failed = copied_command == "failed:\{run_cmd}"
  let copy_icon = if copied {
    @config.ok
  } else if failed {
    @config.icon_close
  } else {
    @config.clipboard
  }
  let copy_class = if copied {
    "absolute right-2 top-1/2 z-20 inline-flex size-7 -translate-y-1/2 items-center justify-center rounded border border-emerald-300 dark:border-emerald-800 bg-emerald-50 dark:bg-emerald-950 transition-colors hover:border-emerald-400 dark:hover:border-emerald-700 hover:bg-emerald-100 dark:hover:bg-emerald-900 active:bg-emerald-200 dark:active:bg-emerald-800"
  } else if failed {
    "absolute right-2 top-1/2 z-20 inline-flex size-7 -translate-y-1/2 items-center justify-center rounded border border-red-300 dark:border-red-800 bg-red-50 dark:bg-red-950 transition-colors hover:border-red-400 dark:hover:border-red-700 hover:bg-red-100 dark:hover:bg-red-900 active:bg-red-200 dark:active:bg-red-800"
  } else {
    "absolute right-2 top-1/2 z-20 inline-flex size-7 -translate-y-1/2 items-center justify-center rounded border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 transition-colors hover:border-gray-400 dark:hover:border-zinc-600 hover:bg-gray-100 dark:hover:bg-zinc-900 active:bg-gray-200 dark:active:bg-gray-800"
  }
  let copy_title = if copied {
    lang.select(en="Copied", zh="已复制")
  } else if failed {
    lang.select(en="Copy failed", zh="复制失败")
  } else {
    lang.select(en="Copy command", zh="复制命令")
  }
  div(
    class="skills-card group flex h-full min-w-0 flex-col overflow-hidden rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 text-left transition-all hover:-translate-y-0.5 hover:border-gray-500 hover:shadow-xl hover:shadow-gray-300/60",
  ) <| [
    a(href=entry.detail_url, class="flex min-w-0 flex-1 flex-col") <| [
      div(
        class="flex h-9 items-center justify-between gap-3 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950 px-3",
      ) <| [
        div(class="flex min-w-0 items-center gap-1.5") <| [
          span(class="size-2 rounded-full bg-red-400", ""),
          span(class="size-2 rounded-full bg-yellow-400", ""),
          span(class="size-2 rounded-full bg-green-500", ""),
          span(
            class="ml-1 min-w-0 truncate font-mono text-xs text-gray-500 dark:text-gray-400",
            "\{skill_name}.wasm",
          ),
        ],
        span(
          class="shrink-0 font-mono text-[11px] text-gray-400 dark:text-slate-500",
          @util.get_relative_time(entry.created_at, lang),
        ),
      ],
      div(class="min-h-32 flex-1 px-4 py-4") <| [
        div(class="flex min-w-0 items-center gap-2") <| [
          author_avatar(entry.author, entry.author_avatar),
          div(
            class="min-w-0 truncate font-mono text-sm text-gray-600 dark:text-slate-400",
          ) <| [
            span(
              class="text-sky-600 dark:text-sky-300",
              lang.select(en="from ", zh="来自 "),
            ),
            span(
              class="text-emerald-700 dark:text-emerald-300",
              "\"\{entry.module_}\"",
            ),
          ],
        ],
        p(
          class="mt-4 min-h-16 line-clamp-3 text-sm leading-6 text-gray-600 dark:text-slate-400",
          if entry.description.is_empty() {
            lang.select(en="No description provided.", zh="暂无描述。")
          } else {
            entry.description
          },
        ),
      ],
    ],
    div(
      class="relative z-10 min-w-0 border-t border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950 px-3 py-0.5 pr-11",
    ) <| [
      span(
        class="block min-w-0 truncate font-mono text-[11px] leading-7 text-gray-500 dark:text-gray-400",
        run_cmd,
      ),
      button(
        class=copy_class,
        title=copy_title,
        on_click=emit(CopyRunCommand(run_cmd)),
      ) <| [
        img(class="pointer-events-none size-3.5 ui-icon", src=copy_icon),
      ],
    ],
  ]
}

///|
fn skeleton_skill_cards(count : Int) -> Html {
  let card = fn() {
    div(
      class="flex h-full min-w-0 flex-col overflow-hidden rounded-md border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900",
    ) <| [
      div(
        class="flex h-9 items-center justify-between gap-3 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950 px-3",
      ) <| [
        div(class="flex min-w-0 items-center gap-1.5") <| [
          span(class="size-2 rounded-full bg-gray-200 dark:bg-gray-800", ""),
          span(class="size-2 rounded-full bg-gray-200 dark:bg-gray-800", ""),
          span(class="size-2 rounded-full bg-gray-200 dark:bg-gray-800", ""),
          div(
            class="ml-1 h-3 w-24 rounded bg-gray-200 dark:bg-gray-800",
            nothing,
          ),
        ],
        div(
          class="h-3 w-14 shrink-0 rounded bg-gray-200 dark:bg-gray-800",
          nothing,
        ),
      ],
      div(class="min-h-28 flex-1 px-4 py-4") <| [
        div(class="flex min-w-0 items-center gap-2") <| [
          div(
            class="size-5 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800",
            nothing,
          ),
          div(class="h-4 w-36 rounded bg-gray-200 dark:bg-gray-800", nothing),
        ],
        div(
          class="mt-3 h-5 w-3/4 rounded bg-gray-200 dark:bg-gray-800",
          nothing,
        ),
        div(
          class="mt-2 h-5 w-1/2 rounded bg-gray-200 dark:bg-gray-800",
          nothing,
        ),
      ],
      div(
        class="flex items-center gap-2 border-t border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950 px-3 py-2",
      ) <| [
        div(class="h-3 flex-1 rounded bg-gray-200 dark:bg-gray-800", nothing),
        div(
          class="size-7 shrink-0 rounded border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900",
          nothing,
        ),
      ],
    ]
  }
  div(
    class="mx-auto w-full max-w-[90rem] px-4 pt-6 animate-fade-in sm:px-6 lg:px-8",
  ) <| [
    div(
      class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3 animate-pulse",
      Array::makei(count, fn(_) { card() }),
    ),
  ]
}

///|
fn list_content(
  entries : Status[Array[WasmEntry]],
  filter : String,
  copied_command : String,
  lang : @i18n.Lang,
  emit~ : (Msg) -> Cmd,
) -> Html {
  match entries {
    Loading => skeleton_skill_cards(9)
    Failed => @view.load_failed(lang.select(en="skills", zh="技能"), lang)
    Success(entries) => {
      let visible_entries = if filter.trim().is_empty() {
        entries
      } else {
        filter_entries(filter, entries)
      }
      if visible_entries.is_empty() {
        div(
          class="mx-auto w-full max-w-[90rem] px-4 py-10 text-center text-sm text-gray-400 dark:text-slate-500 sm:px-6 lg:px-8",
          lang.select(en="No skills found.", zh="未找到技能。"),
        )
      } else {
        div(
          class="mx-auto w-full max-w-[90rem] px-4 pt-6 animate-fade-in sm:px-6 lg:px-8",
        ) <| [
          div(
            class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3",
            visible_entries.map(e => entry_card(e, copied_command, lang, emit~)),
          ),
        ]
      }
    }
  }
}

///|
fn skills_logo() -> Html {
  a(
    href="https://skills.mooncakes.io/",
    class="border-gray-300 dark:border-zinc-700 font-title mx-2 font-semibold flex items-center text-nowrap",
    "🥮 skills.mooncakes.io",
  )
}

///|
fn list_view(
  entries : Status[Array[WasmEntry]],
  filter : String,
  copied_command : String,
  showcase_index : Int,
  showcase_chars : Int,
  lang : @i18n.Lang,
  app_actions : Html,
  emit~ : (Msg) -> Cmd,
) -> Html {
  skills_page(
    @view.navbar(
      lang~,
      left=skills_logo(),
      left_extra=span(
        class="rounded-full border border-gray-300/60 bg-transparent px-2 py-0.5 text-xs font-medium text-gray-500 dark:text-gray-400",
        lang.select(en="experimental", zh="实验性"),
      ),
      right=app_actions,
    ),
    div(class="w-full") <| [
      marketplace_hero(entries, lang, emit~),
      div(id="skills", class="h-0 scroll-mt-header", ""),
      sticky_search(filter, entries, lang, emit~),
      list_content(entries, filter, copied_command, lang, emit~),
      source_context_section(entries, lang, emit~),
      runwasm_showcase(entries, showcase_index, showcase_chars, lang),
    ],
    lang,
  )
}

///|
fn action_link(href : String, label : String) -> Html {
  a(
    href~,
    download=download_filename(href, label),
    escape=true,
    class="inline-flex w-full items-center justify-center gap-2 rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-2 text-sm font-medium text-gray-700 dark:text-slate-300 transition-colors hover:border-mooncake2 hover:text-gray-900 dark:hover:text-slate-50",
  ) <| [
    img(class="size-4 shrink-0 ui-icon", src=@config.download),
    span(label),
  ]
}

///|
fn download_filename(href : String, fallback : String) -> String {
  let filename = href.split("/").last().unwrap_or("")
  if filename.is_empty() {
    fallback
  } else {
    filename.to_owned()
  }
}

///|
fn run_command_view(
  command : String,
  copied~ : Bool,
  lang : @i18n.Lang,
  emit : (Msg) -> Cmd,
) -> Html {
  let icon = if copied { @config.ok } else { @config.clipboard }
  div(
    class="mt-4 overflow-hidden rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900",
  ) <| [
    div(
      class="flex h-9 items-center gap-1.5 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950 px-3",
    ) <| [
      span(class="size-2 rounded-full bg-red-400", ""),
      span(class="size-2 rounded-full bg-yellow-400", ""),
      span(class="size-2 rounded-full bg-green-500", ""),
      span(
        class="ml-1 font-mono text-xs text-gray-500 dark:text-gray-400",
        "moon runwasm",
      ),
    ],
    div(class="flex min-w-0 items-center gap-2 px-3 py-3") <| [
      span(class="min-w-0 flex-1 break-all font-mono text-sm", command),
      button(
        class="inline-flex size-8 shrink-0 items-center justify-center rounded border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 transition-colors hover:border-gray-400 dark:hover:border-zinc-600 hover:bg-gray-100 dark:hover:bg-zinc-900 active:bg-gray-200 dark:active:bg-gray-800",
        title=if copied {
          lang.select(en="Copied", zh="已复制")
        } else {
          lang.select(en="Copy command", zh="复制命令")
        },
        on_click=emit(CopyRunCommand(command)),
      ) <| [
        img(class="pointer-events-none size-4 ui-icon", src=icon),
      ],
    ],
  ]
}

///|
fn skill_markdown_href(entry : WasmEntry, href : String) -> String {
  let lower = href.to_lower()
  if href.has_prefix("#") ||
    href.has_prefix("/") ||
    href.has_prefix("//") ||
    lower.has_prefix("http://") ||
    lower.has_prefix("https://") ||
    lower.has_prefix("mailto:") ||
    lower.has_prefix("tel:") {
    href
  } else {
    let base = if entry.package_path.is_empty() {
      @config.asset_url("/assets/\{entry.module_}@\{entry.version}")
    } else {
      @config.asset_url(
        "/assets/\{entry.module_}@\{entry.version}/\{entry.package_path}",
      )
    }
    "\{base}/\{href}"
  }
}

///|
fn is_frontmatter_line(line : StringView) -> Bool {
  let line = line.trim(chars=" \t\r")
  line == "---" || line == "..."
}

///|
fn looks_like_skill_frontmatter(line : StringView) -> Bool {
  let line = line.trim(chars=" \t\r")
  line.has_prefix("name:") || line.has_prefix("description:")
}

///|
fn strip_skill_frontmatter(content : String) -> String {
  let lines = content.split("\n").to_array()
  guard lines.length() > 2 && is_frontmatter_line(lines[0]) else { content }
  let mut close_index : Int? = None
  let mut has_metadata = false
  for i, line in lines {
    if i > 0 {
      match close_index {
        None =>
          if is_frontmatter_line(line) {
            close_index = Some(i)
          } else if looks_like_skill_frontmatter(line) {
            has_metadata = true
          }
        Some(_) => ()
      }
    }
  }
  match close_index {
    Some(close_index) if has_metadata => {
      let body : Array[String] = []
      let mut seen_content = false
      for i, line in lines {
        if i > close_index {
          let line = line.trim_end(chars="\r").to_owned()
          if seen_content || !line.trim().is_empty() {
            body.push(line)
            seen_content = true
          }
        }
      }
      body.join("\n")
    }
    _ => content
  }
}

///|
fn readme_content(
  entry : WasmEntry,
  readme : Status[String],
  lang : @i18n.Lang,
) -> Html {
  match readme {
    Loading => @view.skeleton_docs_content()
    Failed | Success("") =>
      p(
        class="mt-8 text-center text-sm text-gray-400 dark:text-slate-500",
        lang.select(
          en="\{skill_path(entry)} does not have a SKILL.md file",
          zh="\{skill_path(entry)} 没有 SKILL.md 文件",
        ),
      )
    Success(content) =>
      div(
        class="animate-fade-in",
        @view.markdown(strip_skill_frontmatter(content), lang, transform_link=href => {
          skill_markdown_href(entry, href)
        }),
      )
  }
}

///|
fn sidebar_window(title : String, body : Html) -> Html {
  div(
    class="overflow-hidden rounded-xl border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900",
  ) <| [
    div(
      class="flex h-10 items-center justify-between gap-3 border-b border-gray-300 dark:border-zinc-700 bg-gray-50 dark:bg-zinc-950 px-4",
    ) <| [
      span(
        class="min-w-0 truncate font-mono text-xs text-gray-500 dark:text-gray-400",
        title,
      ),
    ],
    body,
  ]
}

///|
fn metadata_row(label : String, value : Html) -> Html {
  div(
    class="border-b border-gray-100 dark:border-zinc-800 py-3 last:border-b-0",
  ) <| [
    div(
      class="font-mono text-[11px] uppercase tracking-wide text-gray-400 dark:text-slate-500",
      label,
    ),
    div(class="mt-1 min-w-0", value),
  ]
}

///|
fn metadata_text_row(label : String, value : String) -> Html {
  metadata_row(
    label,
    div(
      class="min-w-0 break-words font-mono text-sm text-gray-800 dark:text-slate-200",
      value,
    ),
  )
}

///|
fn metadata_link_row(label : String, href : String, value : String) -> Html {
  metadata_row(
    label,
    a(
      href~,
      escape=true,
      title=value,
      class="block min-w-0 break-words text-sm text-gray-800 dark:text-slate-200 hover:text-gray-950 dark:hover:text-slate-50 hover:underline",
      value,
    ),
  )
}

///|
fn metadata_author_row(entry : WasmEntry, lang : @i18n.Lang) -> Html {
  metadata_row(
    lang.select(en="Author", zh="作者"),
    div(class="flex min-w-0 items-center gap-2") <| [
      author_avatar(entry.author, entry.author_avatar),
      a(
        href="/user/\{entry.author}",
        class="min-w-0 break-words font-mono text-sm text-gray-800 dark:text-slate-200 hover:text-gray-950 dark:hover:text-slate-50 hover:underline",
        entry.author,
      ),
    ],
  )
}

///|
fn metadata_body(rows : Array[Html]) -> Html {
  div(class="px-4 py-2") <| [
    div(class="divide-y divide-gray-100", rows),
  ]
}

///|
fn skill_files_window(lang : @i18n.Lang) -> Html {
  sidebar_window(
    lang.select(en="$ files", zh="$ 文件"),
    div(class="px-3 py-3") <| [
      div(
        class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
        "SKILL.md",
      ),
    ],
  )
}

///|
fn detail_sidebar(entry : WasmEntry, lang : @i18n.Lang) -> Html {
  let package_value = if entry.package_path.is_empty() {
    lang.select(en="(root)", zh="（根目录）")
  } else {
    entry.package_path
  }
  let repository_href = if entry.repository.has_prefix("https://") ||
    entry.repository.has_prefix("http://") {
    entry.repository
  } else {
    "https://\{entry.repository}"
  }
  let repository_display = if entry.repository.has_prefix("https://") {
    entry.repository[8:].to_owned()
  } else if entry.repository.has_prefix("http://") {
    entry.repository[7:].to_owned()
  } else {
    entry.repository
  }
  div(class="space-y-6") <| [
    sidebar_window(
      "$ cat moon.mod",
      metadata_body([
        metadata_author_row(entry, lang),
        if entry.repository.is_empty() {
          nothing
        } else {
          metadata_link_row(
            lang.select(en="Repository", zh="仓库"),
            repository_href,
            repository_display,
          )
        },
        metadata_text_row(lang.select(en="Version", zh="版本"), entry.version),
      ]),
    ),
    sidebar_window(
      lang.select(en="skill path", zh="技能路径"),
      metadata_body([
        metadata_text_row(lang.select(en="Module", zh="模块"), entry.module_),
        metadata_text_row(
          lang.select(en="Package", zh="软件包"),
          package_value,
        ),
        metadata_text_row(
          lang.select(en="Published", zh="发布时间"),
          @util.get_relative_time(entry.created_at, lang),
        ),
      ]),
    ),
    sidebar_window(
      "$ download --local",
      div(class="flex flex-col gap-3 p-4") <| [
        action_link(
          entry.wasm_url,
          lang.select(en="Download wasm", zh="下载 wasm"),
        ),
        action_link(
          entry.checksum_url,
          lang.select(en="Download checksum", zh="下载校验和"),
        ),
      ],
    ),
  ]
}

///|
fn copy_skill_button(
  readme : Status[String],
  lang : @i18n.Lang,
  emit : (Msg) -> Cmd,
) -> Html {
  match readme {
    Success(content) if !content.trim().is_empty() =>
      button(
        class="inline-flex size-7 shrink-0 items-center justify-center rounded border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 transition-colors hover:border-gray-400 dark:hover:border-zinc-600 hover:bg-gray-100 dark:hover:bg-zinc-900 active:bg-gray-200 dark:active:bg-gray-800",
        title=lang.select(en="Copy skill", zh="复制技能"),
        on_click=emit(CopySkill(content)),
      ) <| [
        img(class="pointer-events-none size-3.5 ui-icon", src=@config.clipboard),
      ]
    _ => nothing
  }
}

///|
fn skill_markdown_window(
  entry : WasmEntry,
  readme : Status[String],
  lang : @i18n.Lang,
  emit : (Msg) -> Cmd,
) -> Html {
  div(
    class="overflow-hidden rounded-xl border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900",
  ) <| [
    div(
      class="flex h-10 items-center justify-between gap-3 border-b border-gray-300 dark:border-zinc-700 bg-gray-50 dark:bg-zinc-950 px-3",
    ) <| [
      div(class="flex min-w-0 items-center gap-1.5") <| [
        span(class="size-2 rounded-full bg-red-400", ""),
        span(class="size-2 rounded-full bg-yellow-400", ""),
        span(class="size-2 rounded-full bg-green-500", ""),
        span(
          class="ml-1 min-w-0 truncate font-mono text-xs text-gray-500 dark:text-gray-400",
          "SKILL.md",
        ),
      ],
      div(class="flex shrink-0 items-center gap-2") <| [
        span(
          class="font-mono text-[11px] text-gray-400 dark:text-slate-500",
          lang.select(en="read-only", zh="只读"),
        ),
        copy_skill_button(readme, lang, emit),
      ],
    ],
    div(class="min-w-0 px-5 py-6 md:px-8") <| [
      readme_content(entry, readme, lang),
    ],
  ]
}

///|
fn detail_content(
  entry : WasmEntry,
  readme : Status[String],
  command_copied~ : Bool,
  lang : @i18n.Lang,
  emit : (Msg) -> Cmd,
) -> Html {
  let skill_name = entry.name.split("/").last().unwrap().to_owned()
  let run_cmd = runwasm_command(entry)
  div(
    class="mx-auto w-full max-w-[90rem] px-4 py-8 animate-fade-in sm:px-6 lg:px-8 lg:py-10",
  ) <| [
    div(
      class="grid grid-cols-1 gap-6 lg:grid-cols-[minmax(0,1fr)_22rem] lg:items-start",
    ) <| [
      div(class="min-w-0") <| [
        h1(
          class="break-words font-mono text-4xl font-bold leading-tight tracking-normal text-gray-950 dark:text-slate-50 sm:text-5xl",
          skill_name,
        ),
        if entry.description.is_empty() {
          nothing
        } else {
          p(
            class="mt-3 max-w-3xl font-mono text-sm leading-6 text-gray-600 dark:text-slate-400",
          ) <| [
            span(class="text-emerald-600 dark:text-emerald-300", "// "),
            span(entry.description),
          ]
        },
        run_command_view(run_cmd, copied=command_copied, lang, emit),
        div(class="mt-6 space-y-3") <| [
          skill_files_window(lang),
          skill_markdown_window(entry, readme, lang, emit),
        ],
      ],
      div(
        class="w-full lg:sticky lg:top-24 lg:self-start lg:shrink-0",
        detail_sidebar(entry, lang),
      ),
    ],
  ]
}

///|
fn detail_loading_skeleton() -> Html {
  div(class="mx-auto w-full max-w-[90rem] px-4 py-8 sm:px-6 lg:px-8") <| [
    div(
      class="grid grid-cols-1 gap-8 lg:grid-cols-[minmax(0,1fr)_22rem] animate-pulse",
    ) <| [
      div(class="min-w-0") <| [
        div(
          class="h-9 w-80 max-w-full rounded-md bg-gray-200 dark:bg-gray-800",
          nothing,
        ),
        div(
          class="mt-6 h-12 w-2/3 rounded bg-gray-200 dark:bg-gray-800",
          nothing,
        ),
        div(
          class="mt-4 h-5 w-4/5 rounded bg-gray-200 dark:bg-gray-800",
          nothing,
        ),
        div(
          class="mt-6 overflow-hidden rounded-md border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900",
        ) <| [
          div(
            class="h-9 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950",
            nothing,
          ),
          div(class="flex gap-6 px-4 py-3") <| [
            div(class="h-4 w-24 rounded bg-gray-200 dark:bg-gray-800", nothing),
            div(class="h-4 w-28 rounded bg-gray-200 dark:bg-gray-800", nothing),
            div(class="h-4 w-24 rounded bg-gray-200 dark:bg-gray-800", nothing),
          ],
        ],
        div(
          class="mt-8 overflow-hidden rounded-md border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900",
        ) <| [
          div(
            class="h-10 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950",
            nothing,
          ),
          div(class="space-y-3 px-5 py-6 md:px-8") <| [
            div(class="h-6 w-1/2 rounded bg-gray-200 dark:bg-gray-800", nothing),
            div(
              class="h-4 w-full rounded bg-gray-200 dark:bg-gray-800",
              nothing,
            ),
            div(class="h-4 w-5/6 rounded bg-gray-200 dark:bg-gray-800", nothing),
            div(class="h-4 w-2/3 rounded bg-gray-200 dark:bg-gray-800", nothing),
          ],
        ],
      ],
      div(
        class="overflow-hidden rounded-lg border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900",
      ) <| [
        div(
          class="h-10 border-b border-gray-200 dark:border-zinc-800 bg-gray-50 dark:bg-zinc-950",
          nothing,
        ),
        div(class="space-y-4 px-4 py-5") <| [
          div(class="h-6 w-36 rounded bg-gray-200 dark:bg-gray-800", nothing),
          div(class="h-4 w-full rounded bg-gray-200 dark:bg-gray-800", nothing),
          div(class="h-9 w-full rounded bg-gray-200 dark:bg-gray-800", nothing),
          div(class="h-12 w-full rounded bg-gray-200 dark:bg-gray-800", nothing),
          div(class="h-10 w-full rounded bg-gray-200 dark:bg-gray-800", nothing),
        ],
      ],
    ],
  ]
}

///|
fn detail_view(
  entry_status : Status[WasmEntry],
  readme : Status[String],
  command_copied~ : Bool,
  lang : @i18n.Lang,
  app_actions : Html,
  emit~ : (Msg) -> Cmd,
) -> Html {
  let content = match entry_status {
    Loading => detail_loading_skeleton()
    Failed => @view.load_failed(lang.select(en="skill", zh="技能"), lang)
    Success(entry) => detail_content(entry, readme, command_copied~, lang, emit)
  }
  skills_page(
    @view.navbar(
      lang~,
      left=skills_logo(),
      left_extra=span(
        class="rounded-full border border-gray-300/60 bg-transparent px-2 py-0.5 text-xs font-medium text-gray-500 dark:text-gray-400",
        lang.select(en="experimental", zh="实验性"),
      ),
      right=app_actions,
    ),
    div(class="w-full", content),
    lang,
  )
}

///|
pub fn view(
  model : Model,
  lang~ : @i18n.Lang,
  app_actions~ : Html,
  emit~ : (Msg) -> Cmd,
) -> Html {
  match model {
    List(entries, filter~, copied_command~, showcase_index~, showcase_chars~) =>
      list_view(
        entries,
        filter,
        copied_command,
        showcase_index,
        showcase_chars,
        lang,
        app_actions,
        emit~,
      )
    Detail(entry_status, readme~, command_copied~) =>
      detail_view(
        entry_status,
        readme,
        command_copied~,
        lang,
        app_actions,
        emit~,
      )
  }
}
