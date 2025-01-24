///|
pub enum Msg {
  GotMenuInfo(Result[Map[String, ModuleIndex], String])
  ClickModuleCard(String)
}

///|
pub type Model @util.Status[Map[String, ModuleIndex]]

///|
pub fn load() -> (@tea.Command[Msg], Model) {
  (
    @http.get(
      @config.URL_BASE + "/docs/modules.json",
      expect=Json(Msg::GotMenuInfo, parse_metadata),
    ),
    Loading,
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotMenuInfo(result) =>
      (
        @tea.none(),
        match result {
          Ok(modules) => Success(modules)
          Err(_) => Failed
        },
      )
    ClickModuleCard(module_name) =>
      (@browser.push_url("/docs/" + module_name), model)
  }
}

///|
pub fn view(model : Model) -> @html.Html[Msg] {
  match model._ {
    Loading => @html.text("Loading...")
    Failed => @html.text("Load Failed")
    Success(modules) => view_menu(modules)
  }
}
