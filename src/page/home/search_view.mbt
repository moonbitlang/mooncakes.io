///|
fn search_module_card(result : SearchResult) -> Html {
  let mod = result.module_info
  @html.article(
    class="search-module-card p-4 border rounded-md bg-white dark:bg-zinc-900 min-w-0",
    attrs=@html.Attrs::build().aria_label("Module \{mod.path}"),
  ) <| [
    div(class="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1") <| [
      h2(class="text-base font-semibold min-w-0 break-words") <| [
        span(
          class=if mod.yanked is Some(_) {
            "box-decoration-clone bg-linear-to-r from-gray-400 to-gray-400 bg-size-[100%_2px] bg-position-[left_55%] bg-no-repeat dark:from-gray-500 dark:to-gray-500"
          } else {
            ""
          },
        ) <| [
          a(
            href="/user/\{mod.author}",
            class="text-gray-600 dark:text-slate-400 hover:underline",
            mod.author,
          ),
          span(class="px-1 text-gray-500", "/"),
          a(
            href="/docs/\{versioned_path(mod)}",
            class="hover:underline break-all",
            mod.name,
          ),
        ],
      ],
      div(
        class="ml-auto flex flex-wrap items-baseline justify-end gap-x-3 gap-y-1 text-xs text-gray-600 dark:text-slate-400",
      ) <| [
        span(class="whitespace-nowrap", mod.version),
        if result.downloads is Some(count) {
          span(
            class="whitespace-nowrap tabular-nums",
            "\{format_stat_text(count.to_string())} downloads",
          )
        } else {
          nothing
        },
      ],
    ],
    if mod.description is Some(description) && !description.is_empty() {
      p(
        class="mt-2 text-sm leading-6 text-gray-700 dark:text-slate-300 break-words",
        description,
      )
    } else {
      nothing
    },
    div(
      class="flex flex-wrap items-end gap-x-4 gap-y-2 text-xs text-gray-500 dark:text-slate-400",
    ) <| [
      if mod.keywords is Some(keywords) && !keywords.is_empty() {
        @html.ul(
          class="mt-2 flex min-w-0 flex-1 basis-48 flex-wrap gap-x-3 gap-y-1",
          attrs=@html.Attrs::build().role("list").aria_label("Module keywords"),
          keywords.map(keyword => @html.li(class="break-all", keyword)),
        )
      } else {
        nothing
      },
      if mod.created_at is Some(updated_at) && !updated_at.is_empty() {
        @html.time(
          class="mt-2 ml-auto shrink-0 whitespace-nowrap",
          datetime=updated_at,
          @util.get_relative_time(updated_at),
        )
      } else {
        nothing
      },
    ],
  ]
}

///|
fn search_package_card(result : SearchResult, pkg : PackageMatch) -> Html {
  let fragments = if pkg.summary_fragments.is_empty() {
    [{ text: pkg.summary, matched: false, }]
  } else {
    pkg.summary_fragments
  }
  @html.article(
    class="search-package-card p-4 border rounded-md bg-white dark:bg-zinc-900 min-w-0",
    attrs=@html.Attrs::build().aria_label("Package \{pkg.name}"),
  ) <| [
    div(class="flex flex-wrap items-start justify-between gap-x-3 gap-y-1") <| [
      @html.h3(class="min-w-0 font-mono text-sm font-medium break-all") <| [
        a(
          href=package_match_href(result, pkg),
          class="text-yellow-800 dark:text-yellow-300 hover:underline",
          attrs=@html.Attrs::build().aria_label(pkg.name),
          pkg.package_,
        ),
      ],
      div(
        class="ml-auto flex flex-wrap items-baseline justify-end gap-x-3 gap-y-1 text-xs text-gray-500 dark:text-slate-400",
      ) <| [
        if !pkg.is_summary_current {
          span("Summary from v\{pkg.summary_version}")
        } else {
          nothing
        },
        span(
          class="rounded bg-gray-100 px-1.5 py-0.5 whitespace-nowrap dark:bg-zinc-800",
          "Package",
        ),
      ],
    ],
    p(
      class="mt-1 text-sm leading-6 text-gray-700 dark:text-slate-300 whitespace-pre-line break-words",
    ) <| fragments.map(fragment => {
      if fragment.matched {
        @html.mark(
          class="rounded-sm bg-yellow-100 text-yellow-950 dark:bg-yellow-900 dark:text-yellow-100",
          text(fragment.text),
        )
      } else {
        text(fragment.text)
      }
    }),
  ]
}

///|
fn search_result_group(result : SearchResult) -> Html {
  let subpackages = result.matched_packages.filter(pkg => {
    !pkg.package_.is_empty()
  })
  @html.section(
    class="search-result min-w-0",
    attrs=@html.Attrs::build().aria_label(result.module_info.path),
  ) <| [
    search_module_card(result),
    if subpackages.is_empty() {
      nothing
    } else {
      @html.ul(
        class="search-package-list",
        attrs=@html.Attrs::build().role("list").aria_label("Matching packages"),
        subpackages.map(pkg => {
          @html.li(
            class="search-package-item",
            search_package_card(result, pkg),
          )
        }),
      )
    },
  ]
}

///|
fn search_results_view(search : SearchModel, retry : @rabbita.Cmd) -> Html {
  let status = match search.phase {
    Inactive => ""
    Debouncing | Loading => "Searching modules and package summaries…"
    Failed => "Search is unavailable. Please try again."
    Ready if search.results.is_empty() =>
      "No results for “\{search.input.trim()}”."
    Ready =>
      if search.results.length() == 1 {
        "1 module · Most relevant first"
      } else {
        "\{search.results.length()} modules · Most relevant first"
      }
  }
  div(id="search-results", class="container lg:w-4/5 px-4 pb-12") <| [
    p(
      class="py-4 text-sm text-gray-600 dark:text-slate-400",
      attrs=@html.Attrs::build().role("status").aria_live("polite"),
      status,
    ),
    match search.phase {
      Inactive => nothing
      Debouncing | Loading =>
        div(
          attrs=@html.Attrs::build().aria_hidden("true"),
          @view.skeleton_module_cards(3),
        )
      Failed =>
        button(
          class="px-4 py-2 rounded border bg-white dark:bg-zinc-900 text-sm hover:bg-gray-100 dark:hover:bg-zinc-800",
          on_click=retry,
          "Retry search",
        )
      Ready if search.results.is_empty() =>
        p(
          class="text-sm text-gray-700 dark:text-slate-300",
          "Try fewer words, a package name, or another technical term.",
        )
      Ready =>
        div(
          class="grid grid-cols-1 gap-3",
          search.results.map(search_result_group),
        )
    },
  ]
}
