///|
pub fn[M] footer() -> Html[M] {
  let class = "hover:text-mooncake2 transition-colors"
  div(
    class="px-6 min-h-28 lg:mx-10 mt-5 py-10 border-t text-gray-600 flex flex-col md:flex-row justify-center gap-4 md:gap-8",
    [
      p([text("Powered by MoonBit")]),
      a(href="https://github.com/moonbitlang/mooncakes.io", class~, [
        text("Site source"),
      ]),
      a(href="https://github.com/moonbitlang/mooncakes.io/issues/new", class~, [
        text("Report issue"),
      ]),
      a(
        href="https://mooncakes.io/api/v0/modules/statistics?raw=true",
        class~,
        escape=true,
        [text("Statistics")],
      ),
      p([text("© 2026 mooncakes.io")]),
    ],
  )
}
