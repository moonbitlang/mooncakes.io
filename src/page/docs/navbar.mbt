///|
fn navbar(
  path : String,
  module_path : String?,
  module_index : ModuleIndex?,
  card_mode : CardMode,
  lang : @i18n.Lang,
  emit : (Msg) -> Cmd,
  app_actions~ : Html,
) -> Html {
  let breadcrumbs_view = div(
    class="hidden lg:block border-l pl-4",
    breadcrumbs(path, module_path, module_index),
  )
  let search_btn = button(
    class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm transition-colors text-gray-400 dark:text-slate-500 lg:w-36",
    on_click=emit(ToggleSearchPanel(true)),
  ) <| [
    img(class="w-4 h-4 ui-icon", src=@config.search),
    div(
      class="hidden lg:block text-nowrap",
      lang.select(en="Search", zh="搜索"),
    ),
  ]
  let right = div(class="flex items-center gap-2") <| [
    search_btn,
    card_mode_toggle(mode=card_mode, lang~, click=x => emit(DocModeChanged(x))),
    app_actions,
  ]
  @view.navbar(lang~, left_extra=breadcrumbs_view, right~, style=Sticky)
}
