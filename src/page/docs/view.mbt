///|
pub fn[T] view(model : Model, to_msg : (Msg) -> T) -> Html[T] {
  let theme_toggle = @view.theme_toggle(click=to_msg(ToggleTheme))
  let navbar : Html[T] = match (model.module_index, model.resource) {
    (Success(module_index), Success(resource)) => {
      let module_path = match resource.kind {
        Module({ meta_info, .. }) => Some(meta_info.name)
        Package({ module_path, .. }) => Some(module_path)
        RootPackage(_) => Some(model.path)
      }
      navbar(
        model.path,
        module_path.unwrap_or(""),
        module_index,
        model.collapsed_docs.card_mode,
        to_msg,
        theme_toggle~,
      )
    }
    _ => nothing()
  }
  let source_files = match model.resource {
    Success(
      {
        kind: Package({ source_files, .. })
        | RootPackage({ source_files, .. }),
        ..,
      }
    ) => source_files
    _ => []
  }
  let main = match model.resource {
    Success({ readme_content, kind }) => {
      let meta : Html[T] = match kind {
        Module({ meta_info: meta, .. })
        | RootPackage({ meta_info: meta, .. }) =>
          meta_info(meta, install_copied=model.install_copied, to_msg)
        Package(_) => nothing()
      }
      div([
        meta,
        document(
          hide_large_package=model.hide_large_package,
          readme_content~,
          package_data=model.package_data,
          folded=model.collapsed_docs,
          to_msg,
        ),
      ])
    }
    Failed => @view.document_not_available(model.path)
    Loading => @view.loading()
  }
  let search = model.search
  let search_panel : Html[T] = @html.dialog(
    class="lg:backdrop:bg-black/30 lg:backdrop:backdrop-blur lg:rounded lg:shadow-lg absolute max-w-none max-h-none w-full h-screen m-0 lg:m-auto lg:w-2/5 lg:h-[80%]",
    id="search-panel",
    [
      div(
        class="h-12 border-b bg-white rounded-none sticky top-0 text-base w-full flex",
        [
          @html.input(
            input_type=Text,
            value=search.filter,
            placeholder="search...",
            input=x => to_msg(SearchFilterChanged(x)),
            class="outline-none m-0 flex-grow px-4 p-2",
          ),
          div(
            class="size-12 container hover:bg-gray-200 flex justify-center items-center",
            click=to_msg(ToggleSearchPanel(false)),
            [img(class="ui-icon", src=@config.icon_close, [])],
          ),
        ],
      ),
      match search.results {
        Loading => nothing()
        Failed => text("load indices failed")
        Success(results) =>
          @html.ul(
            class="overflow-y-auto flex-grow",
            results.map(fn(x) {
              let color = match x.entry.kind {
                "Package" => "text-yellow-700"
                "Trait" => "text-blue-700"
                "Type" => "text-green-700"
                "Method" => "text-moonbit"
                "Value" => "text-purple-700"
                _ => "text-gray-700"
              }
              @html.li(class="border-b px-4 py-2 bg-white hover:bg-gray-100", [
                a(href=x.entry.href, class="grid grid-cols-[1fr_auto] ", [
                  span(
                    class="",
                    x.matching.map(x => match x {
                      (true, str) =>
                        span(class="text-moonbit font-semibold", [
                          text(str.to_string()),
                        ])
                      (false, str) =>
                        span(class="text-gray-600", [text(str.to_string())])
                    }),
                  ),
                  span(class="font-thin text-tiny lg:text-base \{color}", [
                    text(x.entry.kind),
                  ]),
                ]),
              ])
            }),
          )
      },
    ],
  )
  let show_sidebar_dialog = if model.sidebar_fab { "flex" } else { "none" }
  let sidebar_dialog : Html[T] = div(
    class="fixed inset-0 justify-center items-center z-100",
    style=["display: " + show_sidebar_dialog],
    [
      div(
        class="fixed inset-0 bg-black/40 z-10",
        style=["display: " + show_sidebar_dialog],
        click=to_msg(ToggleSidebarFab),
        [],
      ),
      div(
        class="bg-zinc-50 w-3/4 h-3/4 overflow-y-auto rounded p-4 shadow-lg z-20",
        [
          sidebar(
            model.sidebar_document,
            source_files,
            model.sidebar_tab,
            model.sidebar_collapsed,
            package_path=model.path,
            to_msg,
          ),
        ],
      ),
    ],
  )
  let fab : Html[T] = @html.button(
    class="flex lg:hidden fixed bottom-4 right-4 bg-mooncake2 text-white rounded-full shadow-lg w-12 h-12 items-center justify-center cursor-pointer hover:bg-moonbit-dark transition-all select-none",
    click=to_msg(ToggleSidebarFab),
    [img(class="size-5", src=@config.HAMBURGER_BUTTON, [])],
  )
  div(class="min-h-screen w-full flex-col", [
    div(
      class="top-0 z-30 border-b sticky bg-white md:bg-white/60 md:backdrop-blur-md",
      [div(class="container px-2 lg:px-4", [search_panel, navbar])],
    ),
    div(class="flex-1", [
      div(
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4",
        [
          div(
            class="overflow-y-auto hidden md:block md:sticky md:top-15 md:min-w-64 md:h-[calc(100vh-3.75em)] lg:max-w-[300px]",
            [
              div(class="w-full", [
                sidebar(
                  model.sidebar_document,
                  source_files,
                  model.sidebar_tab,
                  model.sidebar_collapsed,
                  package_path=model.path,
                  to_msg,
                ),
              ]),
            ],
          ),
          div(class="flex-1 min-w-0", [main, fab, sidebar_dialog]),
          div(class="md:w-40", []),
        ],
      ),
    ]),
    @view.footer(),
  ])
}
