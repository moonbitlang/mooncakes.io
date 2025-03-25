///|
pub fn code_block[M](moonbit : String, collapse_namespace~ : Bool) -> Html[M] {
  let spans = @highlight.parse(moonbit)
  fn go {
    @highlight.Unknown(c) => span([text(String::from_array([c]))])
    Keyword(s) => span(class="text-pink-700", [text(s)])
    Symbol(s) => span(class="text-zinc-800", [text(s)])
    Link(href~, content) =>
      a(
        class="hover:bg-gray-300 transition-colors active:translate-y-[3px] px-[1px] py-[1px] text-blue-600 rounded",
        href="/docs/" + href,
        content.map(go),
      )
    UIdent(s) => span(class="text-blue-900", [text(s)])
    LIdent(s) => span(class="text-yellow-700", [text(s)])
    Newline => br()
    Space(n) => span([text(" ".repeat(n))])
    CharLit(s) | StringLit(s) | Number(s) =>
      span(class="text-orange-800", [text(s)])
    Comment(s) => span(class="text-green-800", [text(s)])
    QualIdent(path, name) =>
      if collapse_namespace {
        span(class="group relative", [
          div(
            class="absolute bottom-[120%] inset-0 flex items-center justify-center ",
            [
              div(
                class="z-10 -translate-y-2/3 inline-block group-hover:inline-block hidden text-gray-700 border-gray-300 border px-2 py-1 bg-white rounded shadow-lg",
                [
                  text("@" + path.join("/") + "."),
                  span(class="text-blue-900", [text(name)]),
                ],
              ),
            ],
          ),
          span(class="text-blue-900", [text(name)]),
        ])
      } else {
        span([
          span(class="text-gray-600", [text("@" + path.join("/") + ".")]),
          span(class="text-blue-900", [text(name)]),
        ])
      }
  }

  let elems = spans.map(go)
  div(elems.to_array())
}
