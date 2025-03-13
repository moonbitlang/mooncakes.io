///|
pub fn code_block[M](moonbit : String) -> @html.Html[M] {
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
      span(class="text-gray-400", [
        span([text("@" + path.join("/"))]),
        text("."),
        span(class="text-blue-900", [text(name)]),
      ])
  }

  let elems = spans.map(go)
  div(elems.to_array())
}
