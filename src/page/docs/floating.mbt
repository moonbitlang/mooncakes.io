///|
fn floating_view(cards_expanded : Bool) -> @html.Html[Msg] {
  let button = if cards_expanded {
    @view.icon_button(@config.EXPANSION, text="Fold cards", click=FoldAllCards)
  } else {
    @view.icon_button(
      @config.REDUCTION,
      text="Expand cards",
      click=ExpandAllCards,
    )
  }
  div(class="absolute top-4 right-4", [button])
}
