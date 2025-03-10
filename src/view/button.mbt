///|
pub fn button[M](value : String, click? : M) -> @html.Html[M] {
  div(
    class="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] self-center transition-transform px-2 py-1 rounded text-sm flex select-none text-gray-800",
    click?,
    [text(value)],
  )
}

///|
pub fn icon_button[M](
  icon : String,
  text? : String,
  click? : M
) -> @html.Html[M] {
  let text = match text {
    None => []
    Some(value) => [@html.text(value)]
  }
  div(
    class="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] transition-transform px-2 py-1 rounded text-sm select-none text-gray-800",
    click?,
    [
      div(
        class="self-center min-w-4 flex gap-2",
        [img(class="w-4", src=icon, []), ..text],
      ),
    ],
  )
}

///|
pub fn navbar[M]() -> @html.Html[M] {
  div(class="font-title h-14 w-full px-8 p-4 border-b select-none", [
    h1(class="text-gray-700 font-semibold", [text("🥮 mooncakes.io")]),
  ])
}

///|
pub fn footer[M]() -> @html.Html[M] {
  div(
    class="h-28 p-10 border-t bg-zinc-50 text-gray-600 flex justify-center gap-4",
    [
      p([text("© 2025 mooncakes.io")]),
      a(href="", [text("Docs")]),
      a(href="", [text("Moon")]),
      p([text("made by MoonBit")]),
    ],
  )
}
