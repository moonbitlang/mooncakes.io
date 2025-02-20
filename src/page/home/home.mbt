///|
pub enum Msg {
  GotModuleIndices(Result[Indices, String])
  ClickModuleCard(String)
  FilterChanged(String)
}

///|
pub struct Model {
  indices : @util.Status[Indices]
  filter : String
  filtered_modules : Array[ModuleIndex]
}

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
    { indices: Loading, filter: "", filtered_modules: [] },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotModuleIndices(result) =>
      (
        @tea.none(),
        match result {
          Ok(modules) => { ..model, indices: Success(modules) }
          Err(_) => { ..model, indices: Failed }
        },
      )
    FilterChanged(filter) => {
      let filtered_modules = match model.indices {
        Success(indices) => filter_indices(filter, indices)
        _ => []
      }
      (@tea.none(), { ..model, filter, filtered_modules })
    }
    ClickModuleCard(module_name) =>
      (@browser.push_url("/docs/" + module_name), model)
  }
}

///|
pub fn filter_indices(filter : String, indices : Indices) -> Array[ModuleIndex] {
  indices.all_modules
  .values()
  .flat_map(fn(x) { x.iter() })
  .filter(fn(x) {
    fn is_matched(s1 : String) {
      s1.to_upper().contains(filter.to_upper())
    }

    is_matched(x.path) ||
    x.keywords.map_or(false, fn(keywords) { keywords.iter().any(is_matched) }) ||
    x.description.map_or(false, is_matched)
  })
  .collect()
}

///|
pub fn view(model : Model) -> @html.Html[Msg] {
  let module_list = match model.indices {
    Loading => @html.text("Loading...")
    Failed => @html.text("Load Failed")
    Success(indices) =>
      if model.filter == "" {
        recently_updated(indices.recently_updated)
      } else {
        search_result(model.filtered_modules)
      }
  }
  div(class="flex flex-col min-h-screen", [
    // @view.navbar(),
    search_bar(),
    // banner(),
    module_list,
    div(class="mt-auto", [@view.footer()]),
  ])
}

///|
extern "js" fn compare_date(date1 : String, date2 : String) -> Int =
  #|function compareDate(date1_str, date2_str) {
  #|  const date1 = new Date(date1_str);
  #|  const date2 = new Date(date2_str);
  #|  if (date1 > date2) return -1;
  #|  if (date1 < date2) return 1;
  #|  return 0;
  #|}

///|
fn decode_module_indices(modules_json : Json) -> Result[Indices, String] {
  fn decode_index {
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

  fn to_upper(c : Char) -> Char {
    if c >= 'a' && c <= 'z' {
      Char::from_int(c.to_int() - 'a'.to_int() + 'A'.to_int())
    } else {
      c
    }
  }

  guard let { "modules": Array(modules), .. } = modules_json
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
  let recently_updated = indices
    ..sort_by(fn(a, b) {
      match (a, b) {
        ({ created_at: Some(v1), .. }, { created_at: Some(v2), .. }) =>
          match compare_date(v1, v2) {
            0 => -a.name.compare(b.name)
            order => order
          }
        ({ created_at: None, .. }, { created_at: Some(_), .. }) => 1
        ({ created_at: Some(_), .. }, { created_at: None, .. }) => -1
        ({ created_at: None, .. }, { created_at: None, .. }) =>
          -a.name.compare(b.name)
      }
    })
    .iter()
    .take(12)
    .collect()
  Ok({ recently_updated, all_modules })
}
