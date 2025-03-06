///|
pub fn code_block[M](moonbit : String) -> @html.Html[M] {
  let spans = @highlight.parse(moonbit)
  let elems = spans.map(fn {
    Code(s) => span([text(s)])
    Keyword(s) => span(class="text-pink-700", [text(s)])
    Symbol(s) => span(class="text-zinc-800", [text(s)])
    Link(href~, content~) =>
      a(
        class="hover:bg-gray-200 active:translate-y-[3px] px-[1px] py-[1px] text-blue-600 rounded",
        href~,
        [span([text(content)])],
      )
    UIdent(s) => span(class="text-gray-700", [text(s)])
    LIdent(s) => span(class="text-yellow-700", [text(s)])
    Newline => br()
    Space(n) => span([text(" ".repeat(n))])
    StringLiteral(s) | NumberLiteral(s) =>
      span(class="text-orange-800", [text(s)])
  })
  div(elems)
}
