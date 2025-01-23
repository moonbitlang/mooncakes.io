///|
pub const URL_BASE = "http://127.0.0.1:3000"

///|
pub const README_ICON = "/readme.svg"

///|
pub const TYPE_ICON = "/type.svg"

///|
pub const TYPE_ALIAS_ICON = "/code-brackets.svg"

///|
pub const VALUE_ICON = "/code-brackets.svg"

///|
pub const TRAIT_ICON = "/components.svg"

///|
pub const INDICES = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

///|
pub const FOLDER_OPEN = "/folder-open.svg"

///|
pub const FOLDER_CLOSE = "/folder-close.svg"

///|
pub const SECTION_OPEN = "/section-open.svg"

///|
pub const SECTION_CLOSE = "/section-close.svg"

///|
pub const EXPANSION = "/expansion.svg"

///|
pub const REDUCTION = "/reduction.svg"

///|
pub const FILTER = "/filter.svg"

///|
pub const SHARE = "/share.svg"

///|
pub const LOGO = "/mooncake-pic.png"

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
      p([text("© 2024 mooncakes.io")]),
      @html.a(href="", [text("Docs")]),
      @html.a(href="", [text("Moon")]),
      p([text("made by MoonBit")]),
    ],
  )
}
