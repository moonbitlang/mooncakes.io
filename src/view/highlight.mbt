///|
pub fn highlight[M](moonbit : String) -> @html.Html[M] {
  let spans = @highlight.parse(moonbit)
  let elems = spans.map(fn {
    Code(s) => @html.span([text(s)])
    Keyword(s) => @html.span(class="text-pink-700", [text(s)])
    Symbol(s) => @html.span(class="text-zinc-800", [text(s)])
    Link(href~, content~) =>
      @html.a(
        class="hover:bg-gray-200 active:translate-y-[3px] px-[1px] py-[1px] text-blue-600 rounded",
        href~,
        [@html.span([text(content)])],
      )
    UIdent(s) => @html.span(class="text-gray-700", [text(s)])
    LIdent(s) => @html.span(class="text-yellow-700", [text(s)])
    Newline => @html.br()
    Space(n) => @html.span([text(" ".repeat(n))])
    StringLiteral(s) | NumberLiteral(s) =>
      @html.span(class="text-orange-800", [text(s)])
  })
  div(elems)
}
