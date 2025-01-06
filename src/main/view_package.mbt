///|
fn view_package(model : ModelBody) -> @html.Html[Message] {
  div(
    class="flex flex-col overflow-scroll scrollbar-thin h-screen scrollbar-thumb-purple-300 scrollbar-track-transparent",
    [
      div([view_navbar(NAVBAR)]),
      div([floating_view(model.sidebar.cards_expanded)]),
      div(class="flex w-full flex-1", [
        div(class="w-1/4 p-3 min-w-[300px] max-w-[400px] border-r", [
          meta_info_view(model.meta_info),
          div(
            class="sticky top-[-1px] overflow-y-scroll max-h-screen scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
            [sidebar_view(model.sidebar)],
          ),
        ]),
        div(class="flex-grow overflow-y-auto w-screen bg-[#fcfcfd]", [
          detail_cards_view(model.detail_cards),
        ]),
      ]),
      footer_view(),
    ],
  )
}
