///|
fn navbar(
  path : String,
  module_path : String,
  module_index : ModuleIndex?,
  card_mode : CardMode,
  dispatch : (Msg) -> Cmd,
  theme_toggle? : Html,
) -> Html {
  let breadcrumbs_view = match module_index {
    Some(module_index) =>
      if module_path == path {
        nothing
      } else {
        div(class="hidden lg:block border-l pl-4", [
          breadcrumbs(path, module_path, module_index),
        ])
      }
    None => nothing
  }
  div(class="select-none flex items-center gap-4 py-2.5", [
    logo(),
    breadcrumbs_view,
    div(class="flex-1", nothing),
    button(
      class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm transition-colors text-gray-400 lg:w-40",
      on_click=dispatch(ToggleSearchPanel(true)),
      [
        img(class="w-4 h-4 ui-icon", src=@config.SEARCH, nothing),
        div(class="hidden lg:block text-nowrap", [text("Search")]),
      ],
    ),
    card_mode_toggle(mode=card_mode, click=x => dispatch(DocModeChanged(x))),
    theme_toggle.unwrap_or(nothing),
  ])
}
