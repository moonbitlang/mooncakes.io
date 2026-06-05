///|
pub fn footer() -> Html {
  let class = "hover:text-mooncake2 transition-colors"
  div(
    class="px-6 min-h-28 lg:mx-10 mt-5 py-10 border-t text-gray-600 flex flex-col md:flex-row justify-center gap-4 md:gap-8",
  ) <| [
    p("Powered by MoonBit"),
    a(href="https://github.com/moonbitlang/mooncakes.io", class~, "Site source"),
    a(
      href="https://github.com/moonbitlang/mooncakes.io/issues/new",
      class~,
      "Report issue",
    ),
    a(href="/", class~, "Packages"),
    a(href="/build-queue", class~, "Build queue"),
    a(href="/skills", class~, "Skills"),
    a(
      href=@config.api_url("/api/v0/modules/statistics?raw=true"),
      class~,
      escape=true,
      "Statistics",
    ),
    p("© 2026 mooncakes.io"),
  ]
}
