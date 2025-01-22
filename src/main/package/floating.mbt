///|
fn floating_view(sidebar:@load.Loading[SidebarModel]) -> @html.Html[Msg] {
  let cards_expanded = match sidebar {
    Success(sidebar) => sidebar.cards_expanded
    _ => false
  }
  let button = if cards_expanded {
    icon_button_view(@constants.EXPANSION, text="Fold cards", click=FoldAllCards)
  } else {
    icon_button_view(@constants.REDUCTION, text="Expand cards", click=ExpandAllCards)
  }
  div(class="absolute top-4 right-4", [button])
}
