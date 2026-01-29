///|
pub fn page(
  header? : Html = navbar(),
  main? : Html,
  footer? : Html = footer(),
) -> Html {
  div(class="w-full flex-col bg-zinc-50", [
    header,
    div(class="flex-1 min-h-screen", [
      div(
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4",
        [main.unwrap_or_else(nothing)],
      ),
    ]),
    footer,
  ])
}
