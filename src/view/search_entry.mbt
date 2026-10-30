///|
#cfg(target="js")
extern "js" fn focus_module_search_input() -> Unit =
  #| () => document.getElementById('module-search-input')?.focus({preventScroll:true})

///|
#cfg(target="js")
pub fn focus_search_input() -> Cmd {
  @cmd.custom_cmd(kind=AfterRender, _ => focus_module_search_input())
}

///|
#cfg(not(target="js"))
pub fn focus_search_input() -> Cmd {
  @cmd.none
}

///|
fn search_entry() -> Html {
  @rui.button(
    variant=Ghost,
    class="site-search-entry",
    title="Search modules and packages",
    attrs=@html.Attrs::build().aria_label("Search modules and packages"),
    style=["font-family:inherit"],
    on_click=@cmd.batch([@nav.push_url("/search"), focus_search_input()]),
  ) <| [
    img(
      src=@config.search,
      alt="",
      class="ui-icon h-4 w-4 shrink-0",
      attrs=@html.Attrs::build().data_set("icon", "inline-start"),
    ),
    span(class="hidden sm:inline", "Search"),
  ]
}
