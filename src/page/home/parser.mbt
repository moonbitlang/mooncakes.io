///|
fn parse_metadata(
  modules_json : Json
) -> Result[Map[String, ModuleIndex], String] {
  fn parse_index {
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

  let result = {}
  guard let { "modules": Array(modules) } = modules_json
  for mod in modules {
    match parse_index(mod) {
      Ok(index) => result.set(index.path, index)
      Err(msg) => return Err(msg)
    }
  }
  Ok(result)
}
