///|
pub fn accordion[M](
  class? : String,
  click? : (String) -> M,
  showing : String,
  items : Array[(String, @html.T[M])]
) -> @html.T[M] {
  @html.ul(
    class?,
    items.map(fn {
      (title, childs) => {
        let folded = title != showing
        let folded_style = if folded { "" } else { "bg-gray-100" }
        let click = click.map(fn(f) {
          if title == showing {
            f("")
          } else {
            f(title)
          }
        })
        let childs = if folded { @html.nothing() } else { childs }
        div(class="w-full", [
          div(
            class="w-full px-2 py-1 select-none font-semibold text-gray-700 hover:bg-gray-200 \{folded_style}",
            click?,
            [text(title)],
          ),
          div(class="ml-2", [childs]),
        ])
      }
    }),
  )
}
