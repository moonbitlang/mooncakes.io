///|
pub enum Msg {
  GotModuleIndices(Result[Indices, String])
  ClickModuleCard(String)
}

///|
pub type Model @util.Status[Indices]

///|
struct Indices {
  recently_updated : Array[ModuleIndex]
  all_modules : Map[Char, Array[ModuleIndex]]
}

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
  let module_list = match model._ {
    Loading => @html.text("Loading...")
    Failed => @html.text("Load Failed")
    Success(indices) => module_list(indices)
  }
  div(class="flex min-h-screen flex-col", [
    @view.navbar(),
    div(class="flex flex-grow flex-col items-center justify-center", [welcome()]),
    module_list,
    @view.footer(),
  ])
}

///|
fn decode_module_indices(modules_json : Json) -> Result[Indices, String] {
  fn decode_index {
    ({
      "name": String(path),
      "version": String(version),
      "description"? : description,
      "keywords"? : keywords,
      "created_at"? : created_at,
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

  fn to_upper(c : Char) -> Char {
    if c >= 'a' && c <= 'z' {
      Char::from_int(c.to_int() - 'a'.to_int() + 'A'.to_int())
    } else {
      c
    }
  }

  guard let { "modules": Array(modules) } = modules_json
  let indices = []
  for mod in modules {
    match decode_index(mod) {
      Ok(index) => indices.push(index)
      Err(msg) => return Err(msg)
    }
  }
  indices.sort_by(fn(a, b) { a.name.compare(b.name) })
  let all_modules = {}
  for index in indices {
    let first_letter = to_upper(index.name[0])
    match all_modules.get(first_letter) {
      None => all_modules[first_letter] = [index]
      Some(indices) => indices.push(index)
    }
  }

  // FIXME: sort indices by time
  let recently_updated = indices
    ..sort_by(fn(a, b) { a.name.compare(b.name) })
    .iter()
    .take(6)
    .collect()
  Ok({ recently_updated, all_modules })
}
