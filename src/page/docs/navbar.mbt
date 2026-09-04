///|
fn navbar(
  path : String,
  module_path : String?,
  module_index : ModuleIndex?,
  document_actions : Html,
  app_actions~ : Html,
) -> Html {
  let breadcrumbs_view = div(
    class="hidden lg:block border-l pl-4",
    breadcrumbs(path, module_path, module_index),
  )
  let search_btn = button(
    class="theme-toggle inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm transition-colors text-gray-400 dark:text-slate-500 lg:w-36",
    on_click=match module_path {
      Some(_) => @dialog.show("search-panel")
      None => none
    },
  ) <| [
    img(class="w-4 h-4 ui-icon", src=@config.search),
    div(class="hidden lg:block text-nowrap", "Search"),
  ]
  let right = div(class="flex items-center gap-2") <| [
    search_btn, document_actions, app_actions,
  ]
  @view.navbar(left_extra=breadcrumbs_view, right~, style=Sticky)
}
