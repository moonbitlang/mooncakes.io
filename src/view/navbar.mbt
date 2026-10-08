///|
pub(all) enum NavbarStyle {
  Sticky
  Fusion
}

///|
pub fn navbar(
  left? : Html = logo(),
  left_extra? : Html,
  middle? : Html,
  right? : Html,
  style? : NavbarStyle = Sticky,
) -> Html {
  let class = match style {
    Sticky =>
      "top-0 z-30 border-b sticky bg-white/60 dark:bg-zinc-900/60 backdrop-blur-md select-none h-header"
    Fusion => "select-none"
  }
  let middle_view = match middle {
    Some(m) =>
      div(
        class="col-span-2 row-start-2 w-full flex items-center justify-center lg:col-span-1 lg:col-start-2 lg:row-start-1",
        m,
      )
    None => nothing
  }
  let has_middle = !(middle is None)
  if has_middle {
    div(class~) <| [
      div(
        class="container px-5 sm:px-6 grid grid-cols-[minmax(0,1fr)_auto] items-center gap-x-4 gap-y-2 py-2.5 lg:grid-cols-[auto_minmax(0,1fr)_auto]",
      ) <| [
        div(class="col-start-1 row-start-1 flex items-center gap-4 min-w-0") <| [
          left,
          left_extra.unwrap_or(nothing),
        ],
        middle_view,
        div(
          class="col-start-2 row-start-1 flex items-center gap-2 justify-end lg:col-start-3",
          right.unwrap_or(nothing),
        ),
      ],
    ]
  } else {
    div(class~) <| [
      div(
        class="container px-5 sm:px-6 flex items-center justify-between h-full",
      ) <| [
        div(class="flex items-center gap-4 min-w-0") <| [
          left,
          left_extra.unwrap_or(nothing),
        ],
        div(class="flex items-center gap-2 shrink-0", right.unwrap_or(nothing)),
      ],
    ]
  }
}

///|
pub fn logo() -> Html {
  a(
    class="border-gray-300 dark:border-zinc-700 font-title mx-2 font-semibold flex items-center text-nowrap",
    href="/",
    "🥮 mooncakes.io",
  )
}
