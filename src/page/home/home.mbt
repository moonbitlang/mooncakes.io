///|
pub enum Msg {
  GotModuleIndices(Result[Map[String, ModuleIndex], String])
  ClickModuleCard(String)
}

///|
pub type Model @util.Status[Map[String, ModuleIndex]]

///|
pub(all) struct ModuleIndex {
  author : String
  name : String
  path : String
  version : String
  keywords : Array[String]?
  description : String?
  created_at : String?
}

///|
pub fn load() -> (@tea.Command[Msg], Model) {
  (
    @http.get(
      @config.URL_BASE + "/docs/modules.json",
      expect=Json(Msg::GotModuleIndices, decode_module_indices),
    ),
    Loading,
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotModuleIndices(result) =>
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

///|
fn decode_module_indices(
  modules_json : Json
) -> Result[Map[String, ModuleIndex], String] {
  fn parse_index {
    ({
      "name": String(path),
      "version": String(version),
      "description"? : description,
      "keywords"? : keywords,
      "created_at"? : created_at,
      ..
    } : Json) => {
      let keywords = match keywords {
        Some(Array(keywords)) =>
          Some(keywords.map(fn(x) { x.as_string().unwrap() }))
        _ => None
      }
      let created_at = created_at.map(fn(x) { x.as_string().unwrap() })
      let description = description.map(fn(x) { x.as_string().unwrap() })
      guard let [author, .. name] = path.split("/").collect()
      let name = name
        .iter()
        .intersperse("/")
        .fold(fn(acc, x) { acc + x }, init="")
      Ok({ path, name, author, version, description, keywords, created_at })
    }
    _ => Err("Error when parsing metadata.")
  }

  let result = {}
  guard let { "modules": Array(modules), .. } = modules_json
  for mod in modules {
    match parse_index(mod) {
      Ok(index) => result.set(index.path, index)
      Err(msg) => return Err(msg)
    }
  }
  Ok(result)
}
