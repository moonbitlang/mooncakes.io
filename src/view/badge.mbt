///|
pub fn[M] badge(content : Array[Html[M]], class? : String = "") -> Html[M] {
  div(
    class="inline-flex items-center px-2 h-5 rounded text-tiny font-semibold \{class}",
    content,
  )
}
