///|
pub fn not_found[M]() -> Html[M] {
  div(class="flex flex-col items-center justify-center h-screen", [
    h1(class="text-4xl font-bold", [text("404")]),
    p(class="text-lg", [text("Page not found")]),
    a(href="/", class="text-blue-500", [text("Go back to home")]),
  ])
}
