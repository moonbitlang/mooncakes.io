///|
fn status_icon(status : String) -> Html {
  match status {
    "SUCCESS" =>
      // Filled green circle with white checkmark
      @svg.svg(width=18, height=18, view_box="0 0 18 18", class="shrink-0") <| [
        @svg.circle(cx=9, cy=9, r=9, fill="var(--color-green-500)"),
        @svg.path(
          d="M5.5 9.5 L7.5 11.5 L12.5 6.5",
          fill="none",
          stroke="white",
          stroke_width=2,
        ),
      ]
    "FAILED" =>
      // Filled red circle with white X
      @svg.svg(width=18, height=18, view_box="0 0 18 18", class="shrink-0") <| [
        @svg.circle(cx=9, cy=9, r=9, fill="var(--color-red-500)"),
        @svg.line(
          x1=6,
          y1=6,
          x2=12,
          y2=12,
          stroke="white",
          stroke_width=2,
          stroke_linecap="round",
        ),
        @svg.line(
          x1=12,
          y1=6,
          x2=6,
          y2=12,
          stroke="white",
          stroke_width=2,
          stroke_linecap="round",
        ),
      ]
    _ =>
      // Filled blue circle with white clock
      @svg.svg(width=18, height=18, view_box="0 0 18 18", class="shrink-0") <| [
        @svg.circle(cx=9, cy=9, r=9, fill="var(--color-blue-500)"),
        @svg.line(
          x1=9,
          y1=5,
          x2=9,
          y2=9,
          stroke="white",
          stroke_width=2,
          stroke_linecap="round",
        ),
        @svg.line(
          x1=9,
          y1=9,
          x2=12,
          y2=9,
          stroke="white",
          stroke_width=2,
          stroke_linecap="round",
        ),
      ]
  }
}

///|
fn build_row(item : BuildItem) -> Html {
  let module_parts = item.module_.split("/").collect()
  let (author, name) = match module_parts {
    [author, .. rest] =>
      (author.to_owned(), rest.iter().map(StringView::to_owned).join("/"))
    _ => ("", item.module_)
  }
  div(
    class="flex flex-col md:flex-row md:items-center gap-1 md:gap-3 px-4 py-3 bg-white dark:bg-zinc-900 border border-gray-200 dark:border-zinc-800 rounded-lg hover:border-gray-300 dark:hover:border-zinc-700 transition-colors",
  ) <| [
    div(class="flex items-center gap-3 min-w-0") <| [
      status_icon(item.status),
      a(
        href="/docs/\{item.module_}@\{item.version}",
        class="text-sm font-medium text-gray-900 dark:text-slate-50 hover:text-blue-600 dark:hover:text-blue-300 transition-colors truncate",
      ) <| [
        span(class="text-gray-500 dark:text-gray-400 font-normal", author),
        span(class="text-gray-300 dark:text-gray-500 mx-0.5", "/"),
        text(name),
      ],
    ],
    div(class="flex items-center gap-2 ml-auto pl-[1.875rem] md:pl-0 shrink-0") <| [
      span(
        class="text-xs text-gray-500 dark:text-gray-400 font-mono",
        "v\{item.version}",
      ),
      span(class="text-xs text-gray-300 dark:text-gray-500", "·"),
      span(
        class="text-xs text-gray-400 dark:text-slate-500",
        @util.get_relative_time(item.finished_at.unwrap_or(item.created_at)),
      ),
    ],
  ]
}

///|
fn skeleton_build_rows(count : Int) -> Html {
  let rows = Array::makei(count, fn(_i) {
    div(
      class="flex flex-col md:flex-row md:items-center gap-1 md:gap-3 px-4 py-3 bg-white dark:bg-zinc-900 border border-gray-200 dark:border-zinc-800 rounded-lg",
    ) <| [
      div(class="flex items-center gap-3") <| [
        div(
          class="size-[18px] bg-gray-200 dark:bg-gray-800 rounded-full shrink-0",
          nothing,
        ),
        div(
          class="h-4 w-48 max-w-full bg-gray-200 dark:bg-gray-800 rounded",
          nothing,
        ),
      ],
      div(
        class="flex items-center gap-2 ml-auto pl-[1.875rem] md:pl-0 shrink-0",
      ) <| [
        div(class="h-3 w-14 bg-gray-200 dark:bg-gray-800 rounded", nothing),
        div(class="h-3 w-20 bg-gray-200 dark:bg-gray-800 rounded", nothing),
      ],
    ]
  })
  div(class="flex flex-col gap-2 animate-pulse", rows)
}

///|
fn build_section(
  title : String,
  status : Status[BuildData],
  items : (BuildData) -> Array[BuildItem],
  empty_text : String,
) -> Html {
  let content = match status {
    Pending => skeleton_build_rows(5)
    Failed(_) => @view.load_failed(title)
    Loaded(data) => {
      let list = items(data)
      if list.is_empty() {
        div(
          class="py-8 text-center text-gray-400 dark:text-slate-500 text-sm",
          empty_text,
        )
      } else {
        div(class="flex flex-col gap-2 animate-fade-in", list.map(build_row))
      }
    }
  }
  div(class="mb-8") <| [
    h2(
      class="text-lg font-semibold text-gray-800 dark:text-slate-200 mb-3",
      title,
    ),
    content,
  ]
}
