///|
fn docs_search_button() -> Val[Html] {
  @rui.tooltip(
    id="docs-api-search-tooltip",
    trigger_variant=Ghost,
    trigger_size=Icon,
    trigger_attrs=@html.Attrs::build()
      .aria_label("Find API")
      .aria_keyshortcuts("/"),
    trigger_style=["font-family:inherit"],
    content_style=["font-family:inherit"],
    delay=250,
    side=Bottom,
    align=End,
    side_offset=8,
    on_trigger_click=@dialog.show("search-panel"),
    img(
      class="w-4 h-4 ui-icon",
      src=@config.asset_url("/icons/lucide/funnel.svg"),
      alt="",
    ),
    span(class="flex items-center gap-3") <| [
      text("Find API in this module"),
      @rui.kbd(attrs=@html.Attrs::build().aria_hidden("true"), "/"),
    ],
  )
}

///|
fn docs_navigation(
  path : String,
  module_path : String?,
  module_index : ModuleIndex?,
  document_actions : Html,
  search_button? : Html,
) -> Html {
  @html.nav(
    class="docs-context-bar",
    attrs=@html.Attrs::build().aria_label("Documentation navigation"),
  ) <| [
    div(class="docs-context-inner") <| [
      div(
        class="docs-context-path",
        breadcrumbs(path, module_path, module_index),
      ),
      div(class="docs-context-actions") <| [..search_button, document_actions],
    ],
  ]
}
