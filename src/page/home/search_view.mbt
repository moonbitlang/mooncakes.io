///|
fn search_result_card(result : SearchResult) -> Html {
  let mod = result.module_info
  @html.article(
    class="search-result p-4 sm:p-5 border rounded-md bg-white dark:bg-zinc-900 min-w-0",
  ) <| [
    div(class="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1") <| [
      h2(class="text-base font-semibold min-w-0 break-words") <| [
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
      div(
        class="flex items-baseline gap-3 text-sm text-gray-600 dark:text-slate-400",
      ) <| [
        span(mod.version),
        match result.downloads {
          Some(count) =>
            span(
              class="tabular-nums",
              "\{format_stat_text(count.to_string())} downloads",
            )
          None => nothing
        },
      ],
    ],
    match mod.description {
      Some(description) if !description.is_empty() =>
        p(
          class="mt-2 text-sm leading-6 text-gray-700 dark:text-slate-300 break-words",
          description,
        )
      _ => nothing
    },
    if result.matched_packages.is_empty() {
      p(
        class="mt-3 text-sm text-gray-600 dark:text-slate-400",
        "Matches module metadata or combined package documentation.",
      )
    } else {
      div(class="mt-4 border-t pt-3 space-y-4") <| result.matched_packages.map(pkg => {
        let fragments = if pkg.summary_fragments.is_empty() {
          [{ text: pkg.summary, matched: false, }]
        } else {
          pkg.summary_fragments
        }
        div(class="min-w-0") <| [
          div(class="flex flex-wrap items-baseline gap-x-3 gap-y-1") <| [
            a(
              href=package_match_href(result, pkg),
              class="font-mono text-sm text-yellow-800 dark:text-yellow-300 hover:underline break-all",
              pkg.name,
            ),
            if !pkg.is_summary_current {
              span(
                class="text-sm text-gray-600 dark:text-slate-400",
                "Summary from v\{pkg.summary_version}",
              )
            } else {
              nothing
            },
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
      })
    },
    if result.matched_package_count > result.matched_packages.length() {
      p(
        class="mt-3 text-sm text-gray-600 dark:text-slate-400",
        "Showing \{result.matched_packages.length()} of \{result.matched_package_count} matching packages.",
      )
    } else {
      nothing
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
          search.results.map(search_result_card),
        )
    },
  ]
}
