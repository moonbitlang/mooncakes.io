///|
enum ResourceKind {
  Package(PackageResources)
  Module(ModuleResources)
  RootPackage(RootPackageResources)
}

///|
struct MetaInfo {
  name : String
  author : String
  version : String
  license : String?
  keywords : Array[String]
  description : String?
  repository : String?
}

///|
struct ModuleResources {
  meta_info : MetaInfo
  module_index_path : String
}

///|
struct PackageResources {
  package_data_path : String
  source_files : Array[String]
  module_path : String
}

///|
struct RootPackageResources {
  meta_info : MetaInfo
  module_index_path : String
  package_data_path : String
  source_files : Array[String]
}

///|
struct Resource {
  readme_content : String
  kind : ResourceKind
}

///|
fn decode_meta_info(json : Json) -> MetaInfo!Error {
  fn parse_package(json : Json) -> MetaInfo!Error {
    guard json is {
      "name"? : name,
      "repository"? : repository,
      "version"? : version,
      "license"? : license,
      "description"? : description,
      "keywords"? : keywords,
      ..
    } else {
      fail!("Error when parsing metadata.")
    }
    guard [name, version].map(fn(x) {
      match x {
        Some(String(str)) => str
        _ => abort("Error when parsing name and version.")
      }
    }) is [name, version] else {
      fail!("Error when parsing name and version.")
    }
    guard [repository, license, description].map(fn {
      Some(x) => x.as_string()
      None => None
    }) is [repository, license, description] else {
      fail!("Error when parsing repository, license, description, readme.")
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
    {
      author,
      name: package_name,
      description,
      version,
      license,
      repository,
      keywords,
    }
  }

  parse_package!(json)
}

///|
fn decode_module_resources(json : Json) -> ModuleResources!Error {
  match json {
    { "module_index": String(module_index_path), "meta_info": meta_info, .. } =>
      { module_index_path, meta_info: decode_meta_info!(meta_info) }
    _ => fail!("missing field module_index or source_files")
  }
}

///|
fn decode_package_resources(json : Json) -> PackageResources!Error {
  match json {
    {
      "package_data": String(package_data_path),
      "source_files": Array(source_files),
      "module_path": String(module_path),
      ..
    } => {
      let ls : Array[String] = []
      for x in source_files {
        match x {
          String(s) => ls.push(s)
          _ => fail!("invalid source_files")
        }
      }
      { package_data_path, source_files: ls, module_path }
    }
    _ => fail!("missing field package_data or source_files: \{json}")
  }
}

///|
fn decode_root_package_resources(json : Json) -> RootPackageResources!Error {
  match json {
    {
      "package_data": String(package_data_path),
      "source_files": Array(source_files),
      "module_index": String(module_index_path),
      "meta_info": meta_info,
      ..
    } => {
      let ls : Array[String] = []
      for x in source_files {
        match x {
          String(s) => ls.push(s)
          _ => fail!("invalid source_files")
        }
      }
      {
        package_data_path,
        source_files: ls,
        module_index_path,
        meta_info: decode_meta_info!(meta_info),
      }
    }
    _ => fail!("missing field package_data or source_files: \{json}")
  }
}

///|
fn decode_resource(json : Json) -> Result[Resource, String] {
  guard json
    is { "kind": String(kind), "readme_content": String(readme_content), .. } else {
    Err("invalid resource.json")
  }
  try {
    let kind = match kind {
      "module" => Module(decode_module_resources!(json))
      "package" => Package(decode_package_resources!(json))
      "module_and_package" => RootPackage(decode_root_package_resources!(json))
      _ => panic()
    }
    Ok({ readme_content, kind })
  } catch {
    err => Err(err.to_string())
  }
}
