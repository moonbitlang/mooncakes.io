///|
fn navbar(
  path : String,
  module_path : String,
  module_index : ModuleIndex,
  card_mode : CardMode,
  to_cmd : (Msg) -> Cmd,
  theme_toggle? : Html,
) -> Html {
  div(class="select-none flex items-center gap-4 py-2.5", [
    logo(),
    if module_path == path {
      nothing()
    } else {
      div(class="hidden lg:block border-l pl-4", [
        breadcrumbs(path, module_path, module_index),
      ])
    },
    div(class="flex-1", nothing()),
    button(
      class="bg-gray-200/50 border outline-2 text-sm h-8.5 outline-transparent hover:outline-mooncake2 hover:border-transparent transition-all rounded mx-2 py-1 px-2 lg:w-35 text-gray-500 flex items-center gap-2",
      click=to_cmd(ToggleSearchPanel(true)),
      [
        img(class="w-5 h-5 ui-icon", src=@config.SEARCH, nothing()),
        div(class="hidden lg:block text-nowrap", [text("Search")]),
      ],
    ),
    theme_toggle.unwrap_or_else(nothing),
    card_mode_toggle(mode=card_mode, click=x => to_cmd(DocModeChanged(x))),
  ])
}
