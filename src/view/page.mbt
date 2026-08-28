///|
pub fn page(
  lang~ : @i18n.Lang,
  header? : Html = navbar(lang~),
  main? : Html,
  footer? : Html,
) -> Html {
  let footer = footer.unwrap_or(footer_content(lang))
  div(
    class="w-full flex-col bg-zinc-50 dark:bg-zinc-950 dark:[--sidebar-bg:var(--color-zinc-950)]",
  ) <| [
    header,
    div(class="flex-1 min-h-screen") <| [
      div(
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4",
        main.unwrap_or(nothing),
      ),
    ],
    footer,
  ]
}
