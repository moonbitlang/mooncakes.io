///|
pub fn badge(content : Array[Html], class? : String = "") -> Html {
  div(
    class="inline-flex items-center px-2 h-5 rounded text-tiny font-semibold \{class}",
    content,
  )
}
