///|
fn unresolved_docs_layout(
  path : String,
  content : Html,
  app_actions : Html,
) -> Html {
  div(class="min-h-screen w-full flex-col") <| [
    navbar(
      path,
      None,
      None,
      card_mode_toggle(mode=Expanded, click=_ => none),
      app_actions~,
    ),
    div(class="flex-1") <| [
      div(
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4 xl:gap-8",
      ) <| [
        div(
          class="overflow-y-auto hidden md:block md:sticky md:top-header md:min-w-64 md:h-[calc(100vh-3.5rem)] lg:max-w-[300px]",
          div(class="w-full", @view.skeleton_sidebar()),
        ),
        div(class="flex-1 min-w-0 max-w-4xl", content),
        div(
          class="hidden xl:block xl:sticky xl:top-header xl:pt-3 xl:w-64 xl:h-[calc(100vh-3.5rem)] overflow-y-auto shrink-0",
          @view.skeleton_meta_sidebar(),
        ),
      ],
    ],
    @view.footer(),
  ]
}
