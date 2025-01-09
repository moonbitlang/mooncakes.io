///|
fn view_navbar[M](title : String) -> @html.Html[M] {
  div(class="font-title h-14 w-full px-8 p-4 border-b select-none", [
    h1(class="text-gray-700 font-semibold", [text(title)]),
  ])
}
