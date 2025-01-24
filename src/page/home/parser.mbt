///|
fn parse_metadata(
  modules_json : Json
) -> Result[Map[String, MetaInfoModel], String] {
  fn parse_package(json : Json) -> Result[MetaInfoModel, String] {
    guard let {
      "name"? : name,
      "version"? : version,
      "description"? : description,
      "keywords"? : keywords,
      "created_at"? : created_at,
    } = json else {
      _ => Err("Error when parsing metadata.")
    }
    guard let [name, version] = [name, version].map(fn(x) {
      match x {
        Some(String(str)) => str
        _ => abort("Error when parsing name and version.")
      }
    }) else {
      _ => Err("Error when parsing name and version.")
    }
    guard let [description, created_at] = [description, created_at].map(fn {
      Some(x) => x.as_string()
      None => None
    }) else {
      _ => Err("Error when parsing description.")
    }
    let keywords = match keywords {
      Some(Array(keywords)) => keywords.map(fn(x) { x.as_string().unwrap() })
      None => []
      _ => abort("Error when parsing keywords.")
    }
    let iter = name.iter()
    let author = String::from_array(
      iter.take_while(fn(x) { x != '/' }).collect(),
    )
    let package_name = String::from_array(
      iter.drop_while(fn(x) { x != '/' }).drop(1).collect(),
    )
    Ok({
      author,
      name: package_name,
      module_path: name,
      description,
      version,
      keywords,
      created_at,
    })
  }

  let result = {}
  guard let { "modules": Array(modules) } = modules_json
  for module_ in modules {
    guard let Ok(package) = parse_package(module_) else {
      Err(x) => return Err(x)
    }
    result.set(package.module_path, package)
  }
  Ok(result)
}
