///|
fn footer_view() -> @html.Html[Message] {
  div(
    class="h-28 p-10 border-t bg-zinc-50 text-gray-600 flex justify-center gap-4",
    [
      p([text("© 2024 mooncakes.io")]),
      @html.a(href="", [text("Docs")]),
      @html.a(href="", [text("Moon")]),
      p([text("made by MoonBit")]),
    ],
  )
}
