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
  div(class="skills-page w-full flex-col bg-white dark:bg-zinc-900") <| [
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
  action_href~ : String = "",
  highlighted~ : Bool = false,
  browse~ : Cmd,
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
    h3(
      class="mt-7 text-base font-semibold leading-tight tracking-normal text-gray-950 dark:text-slate-50",
      title,
    ),
    p(class="mt-3 text-sm leading-6 text-gray-600 dark:text-slate-400", body),
    if action_href.is_empty() {
      button(
        class="mt-auto inline-flex w-fit items-center gap-2 pt-4 text-xs font-semibold \{action_class}",
        on_click=browse,
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
fn marketplace_hero(browse~ : Cmd) -> Html {
  div(
    class="w-full border-b border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900 text-gray-950 dark:text-slate-50",
  ) <| [
    div(
      class="mx-auto w-full max-w-[92rem] px-4 py-8 text-center sm:px-6 lg:px-8 lg:py-10",
    ) <| [
      div(class="relative mx-auto max-w-5xl overflow-visible") <| [
        div(
          class="skills-hero-word pointer-events-none absolute inset-x-0 -top-8 select-none text-7xl font-black tracking-tight text-gray-100 dark:text-slate-400/10 sm:text-8xl lg:text-9xl",
          "SKILLS",
        ),
        div(
          class="relative mx-auto inline-flex items-center gap-2 rounded-full border border-gray-300 dark:border-zinc-700 bg-gray-50 dark:bg-zinc-950 px-3 py-1 font-mono text-xs uppercase tracking-wide text-gray-600 dark:text-slate-400",
        ) <| [
          span(class="size-2 rounded-full bg-mooncake2", ""),
          span("Agent Skills / mooncakes.io"),
        ],
        h1(
          class="relative mx-auto mt-5 max-w-4xl text-4xl font-bold leading-tight tracking-normal text-gray-950 dark:text-slate-50 sm:text-5xl lg:text-6xl",
          "Skills Marketplace",
        ),
        p(
          class="relative mx-auto mt-4 max-w-3xl text-base leading-7 text-gray-600 dark:text-slate-400 sm:text-lg",
          "Discover, publish and download skills for your agents. Explore the instructions, choose a version, and get the complete skill directory.",
        ),
        div(
          class="relative mt-6 flex flex-wrap items-center justify-center gap-2",
        ) <| [
          span(
            class="rounded-full border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1 text-sm text-gray-600 dark:text-slate-400 shadow-sm",
            "Open Agent Skills",
          ),
          span(
            class="rounded-full border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1 text-sm text-gray-600 dark:text-slate-400 shadow-sm",
            "Versioned releases",
          ),
          span(
            class="rounded-full border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1 text-sm text-gray-600 dark:text-slate-400 shadow-sm",
            "Complete skill archives",
          ),
        ],
        div(
          class="relative mt-6 flex flex-wrap items-center justify-center gap-3",
        ) <| [
          button(
            class="rounded-md bg-[#d79a82] px-4 py-2 text-sm font-semibold text-zinc-950 shadow-sm transition-colors hover:bg-[#e2aa94]",
            on_click=browse,
          ) <| span("Browse Skills"),
          a(
            href="#publish",
            class="rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-4 py-2 text-sm font-semibold text-gray-900 dark:text-slate-50 shadow-sm transition-colors hover:border-gray-400 dark:hover:border-zinc-600 hover:bg-gray-50 dark:hover:bg-zinc-950",
            "Publish a skill",
          ),
        ],
      ],
    ],
  ]
}

///|
fn source_context_section(count : String, browse~ : Cmd) -> Html {
  div(class="mx-auto w-full max-w-[90rem] px-4 py-8 sm:px-6 lg:px-8") <| [
    div(class="border-t border-gray-200 dark:border-zinc-800 pt-7") <| [
      span(
        class="inline-flex rounded-full border border-gray-200 dark:border-zinc-800 bg-white dark:bg-zinc-900 px-3 py-1 text-xs font-medium text-gray-600 dark:text-slate-400",
        "Agent Skills",
      ),
      h2(
        class="mt-4 max-w-2xl text-2xl font-bold leading-tight tracking-normal text-gray-950 dark:text-slate-50 sm:text-3xl",
        "Publish once, share skills across agents",
      ),
      div(
        class="mt-4 max-w-3xl space-y-3 text-sm leading-6 text-gray-600 dark:text-slate-400",
      ) <| [
        p() <| [
          text("Use skills to publish a "),
          a(
            href="#publish",
            class="font-medium text-gray-900 dark:text-slate-50 underline underline-offset-2 hover:text-[#c7856b]",
            "complete skill directory",
          ),
          text(
            " with SKILL.md, scripts and references. Every release has its own version, so others can find and download the exact skill you shared.",
          ),
        ],
        p(
          "Read the instructions, choose a version, and bring the complete skill directory to your agent.",
        ),
      ],
      div(class="mt-6 grid gap-3 lg:grid-cols-3") <| [
        hero_feature_card(
          "01",
          "Publish your skill",
          "Add a name and description to SKILL.md, run moon login, then publish the directory with skills publish.",
          "Sign in",
          @config.search,
          action_href="/settings",
          highlighted=true,
          browse~,
        ),
        hero_feature_card(
          "02",
          "Find the right skill",
          "Browse available skills. Read SKILL.md and compare versions before choosing a skill for your workflow.",
          "Browse skills",
          @config.book_open,
          browse~,
        ),
        hero_feature_card(
          "03",
          "Download and reuse",
          "Save a ZIP or use the CLI to extract it into a directory. Get the instructions and supporting files together.",
          "Browse skills",
          @config.download,
          browse~,
        ),
      ],
      div(
        class="mt-6 flex flex-col gap-4 border-t border-gray-200 dark:border-zinc-800 pt-5 lg:flex-row lg:items-center lg:justify-between",
      ) <| [
        p(
          class="max-w-2xl text-sm leading-6 text-gray-600 dark:text-slate-400",
          "Publish your first release: skills publish ./my-skill --version 1.0.0",
        ),
        div(class="flex flex-wrap gap-2") <| [
          span(
            class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
            "\{count} skill entries",
          ),
          span(
            class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
            "versioned releases",
          ),
          span(
            class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
            "complete directories",
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
      author.exact_view(end~).to_owned().to_upper()
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
fn entry_card(entry : SkillEntry) -> Html {
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
            "\{entry.name} / SKILL.md",
          ),
        ],
        span(
          class="shrink-0 font-mono text-[11px] text-gray-400 dark:text-slate-500",
          @util.get_relative_time(entry.created_at),
        ),
      ],
      div(class="min-h-32 flex-1 px-4 py-4") <| [
        div(class="flex min-w-0 items-center gap-2") <| [
          author_avatar(entry.owner, entry.author_avatar),
          div(
            class="min-w-0 truncate font-mono text-sm text-gray-600 dark:text-slate-400",
          ) <| [
            span(class="text-sky-600 dark:text-sky-300", "from "),
            span(
              class="text-emerald-700 dark:text-emerald-300",
              "\"\{entry.owner}/\{entry.name}\"",
            ),
          ],
        ],
        p(
          class="mt-4 min-h-16 line-clamp-3 text-sm leading-6 text-gray-600 dark:text-slate-400",
          if entry.description.is_empty() {
            "No description provided."
          } else {
            entry.description
          },
        ),
      ],
    ],
  ]
}

///|
fn skeleton_skill_cards(count : Int32) -> Html {
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
  let mut close_index : Int32? = None
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
fn metadata_author_row(entry : SkillEntry) -> Html {
  metadata_row(
    "Author",
    div(class="flex min-w-0 items-center gap-2") <| [
      author_avatar(entry.owner, entry.author_avatar),
      a(
        href="/user/\{entry.owner}",
        class="min-w-0 break-words font-mono text-sm text-gray-800 dark:text-slate-200 hover:text-gray-950 dark:hover:text-slate-50 hover:underline",
        entry.owner,
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
