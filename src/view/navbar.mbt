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
      class="container flex flex-col items-center justify-center py-2 lg:gap-2 min-h-15 lg:flex-row lg:justify-between",
      [
        div(class="w-40", [left]),
        div(class="w-full lg:flex-1 flex items-center justify-center", [
          middle.unwrap_or_else(nothing),
        ]),
        div(class="w-40", [right.unwrap_or_else(nothing)]),
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
