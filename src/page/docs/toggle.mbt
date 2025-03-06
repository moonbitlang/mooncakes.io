///|
priv enum CardMode {
  Expanded
  Collapsed
}

///|
fn card_mode_toggle[M](
  mode~ : CardMode,
  click~ : (CardMode) -> M
) -> @html.T[M] {
  let img_class = "w-[15px] h-[15px]"
  let btn_focused = "border border-mooncake2 bg-opacity-10 bg-yellow-500"
  let lbtn_normal = "border-y border-l hover:border-mooncake2"
  let rbtn_normal = "border-y border-r hover:border-mooncake2"
  let (l, r) = match mode {
    Expanded => (btn_focused, rbtn_normal)
    Collapsed => (lbtn_normal, btn_focused)
  }
  div(class="flex", [
    div(class="py-2 px-3 rounded-l \{l}", click=click(Expanded), [
      img(class=img_class, src=@config.EXPANSION, []),
    ]),
    div(class="py-2 px-3 rounded-r \{r}", click=click(Collapsed), [
      img(class=img_class, src=@config.REDUCTION, []),
    ]),
  ])
}
