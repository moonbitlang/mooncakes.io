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
      class="min-h-32 overflow-hidden rounded-md border border-gray-300 bg-zinc-950 text-left",
    ) <| [
      div(class="flex h-8 items-center gap-1.5 border-b border-white/10 px-3") <| [
        span(class="h-2.5 w-2.5 rounded-full bg-red-400", ""),
        span(class="h-2.5 w-2.5 rounded-full bg-yellow-400", ""),
        span(class="h-2.5 w-2.5 rounded-full bg-green-500", ""),
        span(class="ml-2 font-mono text-xs text-zinc-500", "moon runwasm"),
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
) -> Html {
  div(
    class="mx-auto w-full max-w-[90rem] px-4 pb-10 pt-16 sm:px-6 lg:px-8 lg:pt-20",
  ) <| [
    div(
      class="overflow-hidden rounded-md border border-gray-300 bg-white shadow-sm",
    ) <| [
      div(
        class="flex h-9 items-center gap-1.5 border-b border-gray-200 bg-gray-50 px-3",
      ) <| [
        span(class="size-2 rounded-full bg-red-400", ""),
        span(class="size-2 rounded-full bg-yellow-400", ""),
        span(class="size-2 rounded-full bg-green-500", ""),
        span(class="ml-2 font-mono text-xs text-gray-500", "Install moon"),
      ],
      div(
        class="grid gap-6 px-5 py-6 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:px-6",
      ) <| [
        div(class="min-w-0") <| [
          h2(
            class="text-2xl font-bold tracking-normal text-gray-950",
            "Run a published skill in one command",
          ),
          p(
            class="mt-3 max-w-xl text-sm leading-6 text-gray-600",
            "Install moon, pick an optimized executable entry, and run the same sandboxed command across platforms with moon runwasm.",
          ),
          a(
            href="https://www.moonbitlang.com/download/",
            class="mt-5 inline-flex items-center gap-2 rounded-md border border-[#c7856b] bg-[#d79a82] px-4 py-2 text-sm font-semibold text-zinc-950 shadow-sm transition-colors hover:bg-[#e2aa94]",
          ) <| [
            span("try now"),
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
fn skills_page(header : Html, main : Html) -> Html {
  div(class="skills-page w-full flex-col bg-white") <| [
    header,
    div(class="min-h-screen flex-1") <| [
      div(class="relative flex h-full w-full flex-col", main),
    ],
    @view.footer(),
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
    "border-gray-200 shadow-gray-200/60"
  }
  let action_class = if highlighted {
    "text-[#c7856b]"
  } else {
    "text-gray-700"
  }
  div(
    class="relative flex min-h-[12rem] flex-col rounded-lg border \{border_class} bg-white px-4 py-4 shadow-sm",
  ) <| [
    div(class="flex items-start justify-between gap-4") <| [
      span(class="font-mono text-xs tracking-[0.12em] text-gray-400", index),
      div(
        class="flex size-9 shrink-0 items-center justify-center rounded-full border border-gray-200 bg-gray-50",
      ) <| [
        img(class="size-4 ui-icon", src=icon),
      ],
    ],
    @html.h3(
      class="mt-7 text-base font-semibold leading-tight tracking-normal text-gray-950",
      title,
    ),
    p(class="mt-3 text-sm leading-6 text-gray-600", body),
    if action_href.is_empty() {
      @html.button(
        type_="button",
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
  emit~ : (Msg) -> Cmd,
) -> Html {
  div(class="w-full border-b border-gray-200 bg-white text-gray-950") <| [
    div(
      class="mx-auto w-full max-w-[92rem] px-4 py-8 text-center sm:px-6 lg:px-8 lg:py-10",
    ) <| [
      div(class="relative mx-auto max-w-5xl overflow-visible") <| [
        div(
          class="skills-hero-word pointer-events-none absolute inset-x-0 -top-8 select-none text-7xl font-black tracking-tight text-gray-100 sm:text-8xl lg:text-9xl",
          "SKILLS",
        ),
        div(
          class="relative mx-auto inline-flex items-center gap-2 rounded-full border border-gray-300 bg-gray-50 px-3 py-1 font-mono text-xs uppercase tracking-wide text-gray-600",
        ) <| [
          span(class="size-2 rounded-full bg-mooncake2", ""),
          span("MoonBit / Sandboxed local commands"),
        ],
        h1(
          class="relative mx-auto mt-5 max-w-4xl text-4xl font-bold leading-tight tracking-normal text-gray-950 sm:text-5xl lg:text-6xl",
          "MoonBit Skills Marketplace",
        ),
        p(
          class="relative mx-auto mt-4 max-w-3xl text-base leading-7 text-gray-600 sm:text-lg",
          "Push a package and mooncakes.io automatically builds optimized, cross-platform executable binaries that are easy to run in a local sandbox.",
        ),
        div(
          class="relative mt-6 flex flex-wrap items-center justify-center gap-2",
        ) <| [
          span(
            class="rounded-full border border-gray-300 bg-white px-3 py-1 text-sm text-gray-600 shadow-sm",
            "\{skill_count(entries)} executable entries",
          ),
          span(
            class="rounded-full border border-gray-300 bg-white px-3 py-1 text-sm text-gray-600 shadow-sm",
            "local sandbox",
          ),
          span(
            class="rounded-full border border-gray-300 bg-white px-3 py-1 text-sm text-gray-600 shadow-sm",
            "cross-platform binaries",
          ),
        ],
        div(
          class="relative mt-6 flex flex-wrap items-center justify-center gap-3",
        ) <| [
          @html.button(
            type_="button",
            class="rounded-md bg-[#d79a82] px-4 py-2 text-sm font-semibold text-zinc-950 shadow-sm transition-colors hover:bg-[#e2aa94]",
            on_click=emit(ScrollToSkills),
          ) <| [
            span("Search Skills"),
          ],
          a(
            href="https://www.moonbitlang.com/download/",
            class="rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-semibold text-gray-900 shadow-sm transition-colors hover:border-gray-400 hover:bg-gray-50",
            "Install moon",
          ),
        ],
      ],
    ],
  ]
}

///|
fn source_context_section(
  entries : Status[Array[WasmEntry]],
  emit~ : (Msg) -> Cmd,
) -> Html {
  div(class="mx-auto w-full max-w-[90rem] px-4 py-8 sm:px-6 lg:px-8") <| [
    div(class="border-t border-gray-200 pt-7") <| [
      span(
        class="inline-flex rounded-full border border-gray-200 bg-white px-3 py-1 text-xs font-medium text-gray-600",
        "MoonBit wasm",
      ),
      h2(
        class="mt-4 max-w-2xl text-2xl font-bold leading-tight tracking-normal text-gray-950 sm:text-3xl",
        "Publish once, distribute safely across platforms",
      ),
      div(class="mt-4 max-w-3xl space-y-3 text-sm leading-6 text-gray-600") <| [
        p() <| [
          @html.text(
            "Under the hood, mooncakes.io compiles each skill to optimized ",
          ),
          a(
            href="https://developer.mozilla.org/en-US/docs/WebAssembly/Guides/Concepts",
            class="font-medium text-gray-900 underline underline-offset-2 hover:text-[#c7856b]",
            "WebAssembly (Wasm)",
          ),
          @html.text(
            " binaries, then exposes them as executable commands through moon runwasm. The Wasm sandbox keeps commands isolated while the same artifact stays portable across platforms.",
          ),
        ],
        p(
          "Add SKILL.md and repository links so users can inspect what a command does before they reuse it.",
        ),
      ],
      div(class="mt-6 grid gap-3 lg:grid-cols-3") <| [
        hero_feature_card(
          "01",
          "Fast publishing",
          "Ship a MoonBit package with SKILL.md so its executable entry is discoverable on mooncakes.io.",
          "Publish packages",
          @config.SEARCH,
          action_href="https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
          highlighted=true,
          emit~,
        ),
        hero_feature_card(
          "02",
          "Build optimized binaries",
          "mooncakes.io automatically builds uploaded packages into Wasm binaries, then optimizes them with wasm-opt.",
          "Browse binaries",
          @config.book_open,
          emit~,
        ),
        hero_feature_card(
          "03",
          "Share and browse skills",
          "Share your skill with others, or browse skills published by other MoonBit users.",
          "Browse skills",
          @config.download,
          emit~,
        ),
      ],
      div(
        class="mt-6 flex flex-col gap-4 border-t border-gray-200 pt-5 lg:flex-row lg:items-center lg:justify-between",
      ) <| [
        p(
          class="max-w-2xl text-sm leading-6 text-gray-600",
          "A published module gives users optimized executable binaries, SKILL.md context, and a consistent cross-platform artifact.",
        ),
        div(class="flex flex-wrap gap-2") <| [
          span(
            class="inline-flex rounded-md border border-gray-300 bg-white px-3 py-1.5 font-mono text-xs font-semibold text-gray-900",
            "\{skill_count(entries)} wasm entries",
          ),
          span(
            class="inline-flex rounded-md border border-gray-300 bg-white px-3 py-1.5 font-mono text-xs font-semibold text-gray-900",
            "moon-wasm-opt",
          ),
          span(
            class="inline-flex rounded-md border border-gray-300 bg-white px-3 py-1.5 font-mono text-xs font-semibold text-gray-900",
            "cross-platform wasm",
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
  emit~ : (Msg) -> Cmd,
) -> Html {
  div(
    class="skills-search-sticky sticky top-header z-20 border-b border-gray-200 px-4 py-4 backdrop-blur-md",
  ) <| [
    div(class="relative mx-auto w-full max-w-5xl") <| [
      div(
        class="overflow-hidden rounded-lg border border-mooncake2/35 bg-white shadow-sm shadow-mooncake2/10",
      ) <| [
        div(
          class="flex h-8 items-center gap-1.5 border-b border-mooncake2/20 bg-mooncake2/5 px-3",
        ) <| [
          span(class="size-2 rounded-full bg-red-400", ""),
          span(class="size-2 rounded-full bg-yellow-400", ""),
          span(class="size-2 rounded-full bg-green-500", ""),
          span(
            class="ml-1 font-mono text-xs text-gray-500",
            "Type to search \{skill_count(entries)} skills",
          ),
        ],
        div(class="flex items-center gap-2 px-4 py-4 font-mono text-sm") <| [
          span(class="shrink-0 text-emerald-600", "$"),
          span(class="shrink-0 text-gray-500", "find"),
          img(class="size-4 shrink-0 opacity-70 ui-icon", src=@config.SEARCH),
          input(
            input_type=Text,
            value=filter,
            placeholder="Filter skills ...",
            class="min-w-0 flex-1 bg-transparent outline-none placeholder:text-gray-400",
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
    "absolute right-2 top-1/2 z-20 inline-flex size-7 -translate-y-1/2 cursor-pointer items-center justify-center rounded border border-emerald-300 bg-emerald-50 transition-colors hover:border-emerald-400 hover:bg-emerald-100 active:bg-emerald-200"
  } else if failed {
    "absolute right-2 top-1/2 z-20 inline-flex size-7 -translate-y-1/2 cursor-pointer items-center justify-center rounded border border-red-300 bg-red-50 transition-colors hover:border-red-400 hover:bg-red-100 active:bg-red-200"
  } else {
    "absolute right-2 top-1/2 z-20 inline-flex size-7 -translate-y-1/2 cursor-pointer items-center justify-center rounded border border-gray-300 bg-white transition-colors hover:border-gray-400 hover:bg-gray-100 active:bg-gray-200"
  }
  let copy_title = if copied {
    "Copied"
  } else if failed {
    "Copy failed"
  } else {
    "Copy command"
  }
  div(
    class="skills-card group flex h-full min-w-0 flex-col overflow-hidden rounded-md border border-gray-300 bg-white text-left transition-all hover:-translate-y-0.5 hover:border-gray-500 hover:shadow-xl hover:shadow-gray-300/60",
  ) <| [
    a(href=entry.detail_url, class="flex min-w-0 flex-1 flex-col") <| [
      div(
        class="flex h-9 items-center justify-between gap-3 border-b border-gray-200 bg-gray-50 px-3",
      ) <| [
        div(class="flex min-w-0 items-center gap-1.5") <| [
          span(class="size-2 rounded-full bg-red-400", ""),
          span(class="size-2 rounded-full bg-yellow-400", ""),
          span(class="size-2 rounded-full bg-green-500", ""),
          span(
            class="ml-1 min-w-0 truncate font-mono text-xs text-gray-500",
            "\{skill_name}.wasm",
          ),
        ],
        span(
          class="shrink-0 font-mono text-[11px] text-gray-400",
          @util.get_relative_time(entry.created_at),
        ),
      ],
      div(class="min-h-32 flex-1 px-4 py-4") <| [
        div(class="flex min-w-0 items-center gap-2") <| [
          author_avatar(entry.author, entry.author_avatar),
          div(class="min-w-0 truncate font-mono text-sm text-gray-600") <| [
            span(class="text-sky-600", "from "),
            span(class="text-emerald-700", "\"\{entry.module_}\""),
          ],
        ],
        p(
          class="mt-4 min-h-16 line-clamp-3 text-sm leading-6 text-gray-600",
          if entry.description.is_empty() {
            "No description provided."
          } else {
            entry.description
          },
        ),
      ],
    ],
    div(
      class="relative z-10 min-w-0 border-t border-gray-200 bg-gray-50 px-3 py-0.5 pr-11",
    ) <| [
      span(
        class="block min-w-0 truncate font-mono text-[11px] leading-7 text-gray-500",
        run_cmd,
      ),
      @html.button(
        class=copy_class,
        title=copy_title,
        type_="button",
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
      class="flex h-full min-w-0 flex-col overflow-hidden rounded-md border border-gray-200 bg-white",
    ) <| [
      div(
        class="flex h-9 items-center justify-between gap-3 border-b border-gray-200 bg-gray-50 px-3",
      ) <| [
        div(class="flex min-w-0 items-center gap-1.5") <| [
          span(class="size-2 rounded-full bg-gray-200", ""),
          span(class="size-2 rounded-full bg-gray-200", ""),
          span(class="size-2 rounded-full bg-gray-200", ""),
          div(class="ml-1 h-3 w-24 rounded bg-gray-200", nothing),
        ],
        div(class="h-3 w-14 shrink-0 rounded bg-gray-200", nothing),
      ],
      div(class="min-h-28 flex-1 px-4 py-4") <| [
        div(class="flex min-w-0 items-center gap-2") <| [
          div(class="size-5 shrink-0 rounded-full bg-gray-200", nothing),
          div(class="h-4 w-36 rounded bg-gray-200", nothing),
        ],
        div(class="mt-3 h-5 w-3/4 rounded bg-gray-200", nothing),
        div(class="mt-2 h-5 w-1/2 rounded bg-gray-200", nothing),
      ],
      div(
        class="flex items-center gap-2 border-t border-gray-200 bg-gray-50 px-3 py-2",
      ) <| [
        div(class="h-3 flex-1 rounded bg-gray-200", nothing),
        div(
          class="size-7 shrink-0 rounded border border-gray-200 bg-white",
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
  emit~ : (Msg) -> Cmd,
) -> Html {
  match entries {
    Loading => skeleton_skill_cards(9)
    Failed => @view.load_failed("skills")
    Success(entries) => {
      let visible_entries = if filter.trim().is_empty() {
        entries
      } else {
        filter_entries(filter, entries)
      }
      if visible_entries.is_empty() {
        div(
          class="mx-auto w-full max-w-[90rem] px-4 py-10 text-center text-sm text-gray-400 sm:px-6 lg:px-8",
          "No skills found.",
        )
      } else {
        div(
          class="mx-auto w-full max-w-[90rem] px-4 pt-6 animate-fade-in sm:px-6 lg:px-8",
        ) <| [
          div(
            class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3",
            visible_entries.map(e => entry_card(e, copied_command, emit~)),
          ),
        ]
      }
    }
  }
}

///|
fn skills_logo() -> Html {
  a(
    href=if current_host() == "skills.mooncakes.io" { "/" } else { "/skills" },
    class="border-gray-300 font-title mx-2 font-semibold flex items-center text-nowrap",
    "🥮 skills.mooncakes.io",
  )
}

///|
extern "js" fn current_host() -> String =
  #|() => window.location.host

///|
fn list_view(
  entries : Status[Array[WasmEntry]],
  filter : String,
  copied_command : String,
  showcase_index : Int,
  showcase_chars : Int,
  emit~ : (Msg) -> Cmd,
) -> Html {
  let theme_toggle = @view.theme_toggle(on_click=emit(ToggleTheme))
  skills_page(
    @view.navbar(
      left=skills_logo(),
      left_extra=span(
        class="rounded-full border border-gray-300/60 bg-transparent px-2 py-0.5 text-xs font-medium text-gray-500",
        "experimental",
      ),
      right=theme_toggle,
    ),
    div(class="w-full") <| [
      marketplace_hero(entries, emit~),
      div(id="skills", class="h-0 scroll-mt-header", ""),
      sticky_search(filter, entries, emit~),
      list_content(entries, filter, copied_command, emit~),
      source_context_section(entries, emit~),
      runwasm_showcase(entries, showcase_index, showcase_chars),
    ],
  )
}

///|
fn action_link(href : String, label : String) -> Html {
  a(
    href~,
    download=download_filename(href, label),
    escape=true,
    class="inline-flex w-full items-center justify-center gap-2 rounded-md border border-gray-300 bg-white px-3 py-2 text-sm font-medium text-gray-700 transition-colors hover:border-mooncake2 hover:text-gray-900",
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
  emit : (Msg) -> Cmd,
) -> Html {
  let icon = if copied { @config.ok } else { @config.clipboard }
  div(class="mt-4 overflow-hidden rounded-md border border-gray-300 bg-white") <| [
    div(
      class="flex h-9 items-center gap-1.5 border-b border-gray-200 bg-gray-50 px-3",
    ) <| [
      span(class="size-2 rounded-full bg-red-400", ""),
      span(class="size-2 rounded-full bg-yellow-400", ""),
      span(class="size-2 rounded-full bg-green-500", ""),
      span(class="ml-1 font-mono text-xs text-gray-500", "moon runwasm"),
    ],
    div(class="flex min-w-0 items-center gap-2 px-3 py-3") <| [
      span(class="min-w-0 flex-1 break-all font-mono text-sm", command),
      @html.button(
        class="inline-flex size-8 shrink-0 cursor-pointer items-center justify-center rounded border border-gray-300 bg-white transition-colors hover:border-gray-400 hover:bg-gray-100 active:bg-gray-200",
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
fn readme_content(entry : WasmEntry, readme : Status[String]) -> Html {
  match readme {
    Loading => @view.skeleton_docs_content()
    Failed | Success("") =>
      p(
        class="mt-8 text-center text-sm text-gray-400",
        "\{skill_path(entry)} does not have a SKILL.md file",
      )
    Success(content) =>
      div(
        class="animate-fade-in",
        @view.markdown(strip_skill_frontmatter(content), transform_link=href => {
          skill_markdown_href(entry, href)
        }),
      )
  }
}

///|
fn sidebar_window(title : String, body : Html) -> Html {
  div(class="overflow-hidden rounded-xl border border-gray-300 bg-white") <| [
    div(
      class="flex h-10 items-center justify-between gap-3 border-b border-gray-300 bg-gray-50 px-4",
    ) <| [
      span(class="min-w-0 truncate font-mono text-xs text-gray-500", title),
    ],
    body,
  ]
}

///|
fn metadata_row(label : String, value : Html) -> Html {
  div(class="border-b border-gray-100 py-3 last:border-b-0") <| [
    div(
      class="font-mono text-[11px] uppercase tracking-wide text-gray-400",
      label,
    ),
    div(class="mt-1 min-w-0", value),
  ]
}

///|
fn metadata_text_row(label : String, value : String) -> Html {
  metadata_row(
    label,
    div(class="min-w-0 break-words font-mono text-sm text-gray-800", value),
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
      class="block min-w-0 break-words text-sm text-gray-800 hover:text-gray-950 hover:underline",
      value,
    ),
  )
}

///|
fn metadata_author_row(entry : WasmEntry) -> Html {
  metadata_row(
    "Author",
    div(class="flex min-w-0 items-center gap-2") <| [
      author_avatar(entry.author, entry.author_avatar),
      a(
        href="/user/\{entry.author}",
        class="min-w-0 break-words font-mono text-sm text-gray-800 hover:text-gray-950 hover:underline",
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
fn skill_files_window() -> Html {
  sidebar_window(
    "$ files",
    div(class="px-3 py-3") <| [
      div(
        class="inline-flex rounded-md border border-gray-300 bg-white px-3 py-1.5 font-mono text-xs font-semibold text-gray-900",
        "SKILL.md",
      ),
    ],
  )
}

///|
fn detail_sidebar(entry : WasmEntry) -> Html {
  let package_value = if entry.package_path.is_empty() {
    "(root)"
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
        metadata_author_row(entry),
        if entry.repository.is_empty() {
          nothing
        } else {
          metadata_link_row("Repository", repository_href, repository_display)
        },
        metadata_text_row("Version", entry.version),
      ]),
    ),
    sidebar_window(
      "skill path",
      metadata_body([
        metadata_text_row("Module", entry.module_),
        metadata_text_row("Package", package_value),
        metadata_text_row(
          "Published",
          @util.get_relative_time(entry.created_at),
        ),
      ]),
    ),
    sidebar_window(
      "$ download --local",
      div(class="flex flex-col gap-3 p-4") <| [
        action_link(entry.wasm_url, "Download wasm"),
        action_link(entry.checksum_url, "Download checksum"),
      ],
    ),
  ]
}

///|
fn copy_skill_button(readme : Status[String], emit : (Msg) -> Cmd) -> Html {
  match readme {
    Success(content) if !content.trim().is_empty() =>
      @html.button(
        class="inline-flex size-7 shrink-0 cursor-pointer items-center justify-center rounded border border-gray-300 bg-white transition-colors hover:border-gray-400 hover:bg-gray-100 active:bg-gray-200",
        title="Copy skill",
        type_="button",
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
  emit : (Msg) -> Cmd,
) -> Html {
  div(class="overflow-hidden rounded-xl border border-gray-300 bg-white") <| [
    div(
      class="flex h-10 items-center justify-between gap-3 border-b border-gray-300 bg-gray-50 px-3",
    ) <| [
      div(class="flex min-w-0 items-center gap-1.5") <| [
        span(class="size-2 rounded-full bg-red-400", ""),
        span(class="size-2 rounded-full bg-yellow-400", ""),
        span(class="size-2 rounded-full bg-green-500", ""),
        span(
          class="ml-1 min-w-0 truncate font-mono text-xs text-gray-500",
          "SKILL.md",
        ),
      ],
      div(class="flex shrink-0 items-center gap-2") <| [
        span(class="font-mono text-[11px] text-gray-400", "readonly"),
        copy_skill_button(readme, emit),
      ],
    ],
    div(class="min-w-0 px-5 py-6 md:px-8") <| [
      readme_content(entry, readme),
    ],
  ]
}

///|
fn detail_content(
  entry : WasmEntry,
  readme : Status[String],
  command_copied~ : Bool,
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
          class="break-words font-mono text-4xl font-bold leading-tight tracking-normal text-gray-950 sm:text-5xl",
          skill_name,
        ),
        if entry.description.is_empty() {
          nothing
        } else {
          p(class="mt-3 max-w-3xl font-mono text-sm leading-6 text-gray-600") <| [
            span(class="text-emerald-600", "// "),
            span(entry.description),
          ]
        },
        run_command_view(run_cmd, copied=command_copied, emit),
        div(class="mt-6 space-y-3") <| [
          skill_files_window(),
          skill_markdown_window(entry, readme, emit),
        ],
      ],
      div(
        class="w-full lg:sticky lg:top-24 lg:self-start lg:shrink-0",
        detail_sidebar(entry),
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
        div(class="h-9 w-80 max-w-full rounded-md bg-gray-200", nothing),
        div(class="mt-6 h-12 w-2/3 rounded bg-gray-200", nothing),
        div(class="mt-4 h-5 w-4/5 rounded bg-gray-200", nothing),
        div(
          class="mt-6 overflow-hidden rounded-md border border-gray-200 bg-white",
        ) <| [
          div(class="h-9 border-b border-gray-200 bg-gray-50", nothing),
          div(class="flex gap-6 px-4 py-3") <| [
            div(class="h-4 w-24 rounded bg-gray-200", nothing),
            div(class="h-4 w-28 rounded bg-gray-200", nothing),
            div(class="h-4 w-24 rounded bg-gray-200", nothing),
          ],
        ],
        div(
          class="mt-8 overflow-hidden rounded-md border border-gray-200 bg-white",
        ) <| [
          div(class="h-10 border-b border-gray-200 bg-gray-50", nothing),
          div(class="space-y-3 px-5 py-6 md:px-8") <| [
            div(class="h-6 w-1/2 rounded bg-gray-200", nothing),
            div(class="h-4 w-full rounded bg-gray-200", nothing),
            div(class="h-4 w-5/6 rounded bg-gray-200", nothing),
            div(class="h-4 w-2/3 rounded bg-gray-200", nothing),
          ],
        ],
      ],
      div(class="overflow-hidden rounded-lg border border-gray-200 bg-white") <| [
        div(class="h-10 border-b border-gray-200 bg-gray-50", nothing),
        div(class="space-y-4 px-4 py-5") <| [
          div(class="h-6 w-36 rounded bg-gray-200", nothing),
          div(class="h-4 w-full rounded bg-gray-200", nothing),
          div(class="h-9 w-full rounded bg-gray-200", nothing),
          div(class="h-12 w-full rounded bg-gray-200", nothing),
          div(class="h-10 w-full rounded bg-gray-200", nothing),
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
  emit~ : (Msg) -> Cmd,
) -> Html {
  let theme_toggle = @view.theme_toggle(on_click=emit(ToggleTheme))
  let content = match entry_status {
    Loading => detail_loading_skeleton()
    Failed => @view.load_failed("skill")
    Success(entry) => detail_content(entry, readme, command_copied~, emit)
  }
  skills_page(
    @view.navbar(
      left=skills_logo(),
      left_extra=span(
        class="rounded-full border border-gray-300/60 bg-transparent px-2 py-0.5 text-xs font-medium text-gray-500",
        "experimental",
      ),
      right=theme_toggle,
    ),
    div(class="w-full", content),
  )
}

///|
pub fn view(model : Model, emit~ : (Msg) -> Cmd) -> Html {
  match model {
    List(entries, filter~, copied_command~, showcase_index~, showcase_chars~) =>
      list_view(
        entries,
        filter,
        copied_command,
        showcase_index,
        showcase_chars,
        emit~,
      )
    Detail(entry_status, readme~, command_copied~) =>
      detail_view(entry_status, readme, command_copied~, emit~)
  }
}
