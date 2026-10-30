///|
fn unresolved_docs_layout(
  path : String,
  content : Html,
  app_actions : Html,
) -> Html {
  div(class="docs-page min-h-screen w-full flex-col") <| [
    @view.navbar(right=app_actions, active=Modules, style=Static),
    div(class="flex-1") <| [
      div(
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4 xl:gap-8",
      ) <| [
        div(
          class="overflow-y-auto hidden md:block md:sticky md:top-0 md:w-64 md:shrink-0 md:h-screen",
          div(class="w-full", @view.skeleton_sidebar()),
        ),
        div(class="flex-1 min-w-0 max-w-4xl") <| [
          docs_navigation(path, None, None, nothing),
          content,
        ],
        div(
          class="hidden xl:block xl:sticky xl:top-0 xl:pt-3 xl:w-64 xl:h-screen overflow-y-auto shrink-0",
          @view.skeleton_meta_sidebar(),
        ),
      ],
    ],
    @view.footer(),
  ]
}
