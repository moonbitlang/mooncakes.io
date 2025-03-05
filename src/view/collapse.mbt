///|
pub(all) enum CaretConfig {
  LeftCenter
  LeftTop
}

///|
pub fn collapse[M](
  header~ : @html.T[M],
  body~ : @html.T[M],
  collapsed~ : Bool,
  toggle~ : M,
  caret_config~ : CaretConfig = LeftTop
) -> @html.T[M] {
  let (body, icon) = if collapsed {
    (nothing(), @config.SECTION_CLOSE)
  } else {
    (body, @config.SECTION_OPEN)
  }
  let caret_style = match caret_config {
    LeftCenter => "self-center"
    LeftTop => ""
  }
  let button_style = match caret_config {
    LeftCenter => "flex h-full w-6"
    LeftTop => "h-6 w-6 top-0 m-1"
  }
  let button = div(
    class="absolute \{button_style} p-1 hover:bg-gray-200 active:bg-gray-300",
    click=toggle,
    [img(src=icon, class="size-4 \{caret_style}", [])],
  )
  div([div(class="relative flex items-center", [button, header]), body])
}
