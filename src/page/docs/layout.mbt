///|
fn unresolved_docs_layout(
  path : String,
  content : Html,
  app_actions : Html,
) -> Html {
  div(class="docs-page min-h-screen w-full flex-col") <| [
    navbar(
      path,
      None,
      None,
      card_mode_toggle(mode=Expanded, click=_ => none),
      app_actions~,
    ),
    div(class="flex-1") <| [
      div(class="docs-layout") <| [
        div(
          class="docs-sidebar-panel hidden md:block md:sticky md:top-header md:h-[calc(100vh-3.5rem)]",
        ) <| [
          div(class="docs-sidebar-surface h-full overflow-y-auto") <| [
            div(
              class="animate-pulse flex flex-col gap-2 px-1 pt-3 pb-1.5 border-b border-gray-100 dark:border-zinc-800 mb-1",
            ) <| [
              div(
                class="h-8 w-full rounded-full bg-gray-200 dark:bg-gray-800",
                nothing,
              ),
              div(class="flex items-center gap-3 px-1.5 py-1") <| [
                div(
                  class="h-2.5 w-14 rounded bg-gray-200 dark:bg-gray-800",
                  nothing,
                ),
                div(
                  class="h-2.5 w-16 rounded bg-gray-200 dark:bg-gray-800",
                  nothing,
                ),
              ],
            ],
            @view.skeleton_sidebar(),
          ],
          div(
            class="docs-sidebar-resizer",
            title="Drag to resize navigation",
            attrs=sidebar_resize_attrs(),
            nothing,
          ),
        ],
        div(class="docs-main min-w-0", content),
        div(
          class="docs-metadata hidden xl:block xl:sticky xl:top-header xl:pt-3 xl:h-[calc(100vh-3.5rem)] overflow-y-auto min-w-0",
          @view.skeleton_meta_sidebar(),
        ),
      ],
    ],
    @view.footer(),
  ]
}
