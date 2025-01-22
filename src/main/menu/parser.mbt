///|
fn parse_metadata(
  modules_json : Json
) -> Result[Map[String, @meta.MetaInfoModel], String] {
  fn parse_package(json : Json) -> Result[@meta.MetaInfoModel, String] {
    guard let {
      "name"? : name,
      "repository"? : repository,
      "version"? : version,
      "license"? : license,
      "description"? : description,
      "keywords"? : keywords,
      "readme"? : readme,
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
    guard let [repository, license, description, readme] = [
      repository, license, description, readme,
    ].map(fn {
      Some(x) => Some(x.as_string().unwrap())
      None => None
    }) else {
      _ => Err("Error when parsing repository, license, description, readme.")
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
    let created_at = match created_at {
      Some(json) => Some(as_string(json))
      None => None
    }
    Ok({
      author,
      readme,
      name: package_name,
      module_path: name,
      description,
      version,
      license,
      repository,
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

///|
fn as_string(json : Json) -> String {
  json.as_string().unwrap()
}
