///|
pub(all) enum NavbarStyle {
  Sticky
  Fusion
}

///|
pub fn[M] navbar(
  left? : Html[M] = logo(),
  middle? : Html[M],
  right? : Html[M],
  style? : NavbarStyle = Sticky,
) -> Html[M] {
  let class = match style {
    Sticky =>
      "top-0 z-30 border-b sticky bg-white/60 backdrop-blur-md select-none"
    Fusion => ""
  }
  div(class~, [
    div(
      class="container px-5 sm:px-6 flex flex-col gap-2 py-3 min-h-15 lg:flex-row lg:items-center lg:justify-between",
      [
        div(class="w-full flex items-center justify-between lg:w-40", [
          left,
          div(class="lg:hidden", [right.unwrap_or_else(nothing)]),
        ]),
        div(class="w-full lg:flex-1 flex items-center justify-center", [
          middle.unwrap_or_else(nothing),
        ]),
        div(class="hidden lg:flex w-40 justify-end", [
          right.unwrap_or_else(nothing),
        ]),
      ],
    ),
  ])
}

///|
pub fn[M] logo() -> Html[M] {
  a(
    class="border-gray-300 font-title mx-2 font-semibold flex items-center text-nowrap",
    href="/",
    [text("🥮 mooncakes.io")],
  )
}
