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
      "top-0 z-30 border-b sticky bg-white/60 backdrop-blur-md select-none"
    Fusion => "select-none"
  }
  let middle_view = match middle {
    Some(m) =>
      div(class="w-full lg:flex-1 flex items-center justify-center", [m])
    None => nothing
  }
  div(class~, [
    div(
      class="container px-5 sm:px-6 flex flex-col gap-2 py-2.5 lg:flex-row lg:items-center lg:justify-between",
      [
        div(class="w-full flex items-center justify-between lg:w-auto", [
          div(class="flex items-center gap-4", [
            left,
            left_extra.unwrap_or(nothing),
          ]),
          div(class="flex items-center gap-2 lg:hidden", [
            right.unwrap_or(nothing),
          ]),
        ]),
        middle_view,
        div(class="hidden lg:flex items-center gap-2 justify-end", [
          right.unwrap_or(nothing),
        ]),
      ],
    ),
  ])
}

///|
pub fn logo() -> Html {
  a(
    class="border-gray-300 font-title mx-2 font-semibold flex items-center text-nowrap",
    href="/",
    [text("🥮 mooncakes.io")],
  )
}
