///|
fn floating_view(cards_expanded : Bool) -> @html.Html[Message] {
  let button = if cards_expanded {
    icon_button_view("expansion.svg", text="Fold cards", click=FoldAllCards)
  } else {
    icon_button_view("reduction.svg", text="Expand cards", click=ExpandAllCards)
  }
  div(class="absolute top-4 right-4", [button])
}
