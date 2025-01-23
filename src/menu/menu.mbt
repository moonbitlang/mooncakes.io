///|
pub enum Msg {
  GotMenuInfo(Result[Map[String, @meta.MetaInfoModel], String])
  ClickModuleCard(String)
}

///|
pub type Model @load.Loading[Map[String, @meta.MetaInfoModel]]

///|
pub fn load() -> (@tea.Command[Msg], Model) {
  (
    @http.get(
      @config.URL_BASE + "/modules.json",
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
          Err(error) => Failed
        },
      )
    ClickModuleCard(module_name) =>
      (@browser.push_url("/" + module_name), model)
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
