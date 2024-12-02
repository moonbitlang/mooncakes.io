fn button_view[M](value : String, click? : M) -> @html.Html[M] {
  div(
    class="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] self-center transition-transform px-2 py-1 rounded text-sm flex select-none text-gray-800",
    click?,
    [text(value)],
  )
}

fn icon_button_view[M](
  icon : String,
  text? : String,
  click? : M,
  size~ : Int = 25,
) -> @html.Html[M] {
  let text = match text {
    None => []
    Some(value) => [@html.text(value)]
  }
  div(
    class="hover:bg-gray-200 active:bg-gray-300 active:translate-y-[3px] transition-transform px-2 py-1 rounded text-sm select-none text-gray-800",
    click?,
    [
      div(
        class="self-center min-w-4 flex gap-2",
        [@html.img(class="w-4",src=icon, []), ..text],
      ),
    ],
  )
}


