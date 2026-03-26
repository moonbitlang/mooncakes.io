///|
fn navbar(
  path : String,
  module_path : String,
  module_index : ModuleIndex?,
  card_mode : CardMode,
  dispatch : (Msg) -> Cmd,
  theme_toggle? : Html,
) -> Html {
  let breadcrumbs_view = div(class="hidden lg:block border-l pl-4", [
    breadcrumbs(path, module_path, module_index),
  ])
  let search_btn = button(
    class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm transition-colors text-gray-400 lg:w-36",
    on_click=dispatch(ToggleSearchPanel(true)),
    [
      img(class="w-4 h-4 ui-icon", src=@config.SEARCH, nothing),
      div(class="hidden lg:block text-nowrap", [text("Search")]),
    ],
  )
  let right = div(class="flex items-center gap-2", [
    search_btn,
    card_mode_toggle(mode=card_mode, click=x => dispatch(DocModeChanged(x))),
    theme_toggle.unwrap_or(nothing),
  ])
  @view.navbar(left_extra=breadcrumbs_view, right~, style=Sticky)
}
