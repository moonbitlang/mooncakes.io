// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
priv enum Resource {
  Package(PackageResources)
  Module(ModuleResources)
  RootPackage(RootPackageResources)
  PublishList(PublishResources)
  BackendList(BackendResources)
}

///|
priv struct MetaInfo {
  name : String
  author : String
  version : String
  license : String?
  keywords : Array[String]
  description : String?
  repository : String?
} derive(Show)

///|
priv struct ModuleResources {
  meta_info : MetaInfo
  module_index_path : String
  readme_content : String
}

///|
priv struct PackageResources {
  package_data_path : String
  source_files : Array[String]
  module_path : String
  readme_content : String
}

///|
priv struct PublishResources {
  publish : Array[(String, String)]
}

///|
priv struct BackendResources {
  backend : Array[String]
}

///|
priv struct RootPackageResources {
  meta_info : MetaInfo
  module_index_path : String
  package_data_path : String
  source_files : Array[String]
  readme_content : String
}

///|
fn decode_meta_info(json : Json) -> MetaInfo!Error {
  fn parse_package(json : Json) -> MetaInfo!Error {
    guard json
      is {
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
      })
      is [name, version] else {
      fail!("Error when parsing name and version.")
    }
    guard [repository, license, description].map(fn {
        Some(x) => x.as_string()
        None => None
      })
      is [repository, license, description] else {
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
    { author, name, description, version, license, repository, keywords }
  }

  parse_package!(json)
}

///|
fn decode_module_resources(json : Json) -> ModuleResources!Error {
  match json {
    {
      "readme_content": String(readme_content),
      "module_index": String(module_index_path),
      "meta_info": meta_info,
      ..
    } =>
      {
        module_index_path,
        meta_info: decode_meta_info!(meta_info),
        readme_content,
      }
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
      "readme_content": String(readme_content),
      ..
    } => {
      let ls : Array[String] = []
      for x in source_files {
        match x {
          String(s) => ls.push(s)
          _ => fail!("invalid source_files")
        }
      }
      { package_data_path, source_files: ls, module_path, readme_content }
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
      "readme_content": String(readme_content),
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
        readme_content,
      }
    }
    _ => fail!("missing field package_data or source_files: \{json}")
  }
}

///|
fn decode_backend_resources(json : Json) -> BackendResources!Error {
  match json {
    { "backends": Array(xs), .. } => {
      let xs = map_with_error!(xs, fn {
        String(x) => x
        _ => fail!("invalid json in backend list")
      })
      { backend: xs }
    }
    _ => fail!("missing field backends")
  }
}

///|
fn decode_publish_resources(json : Json) -> PublishResources!Error {
  match json {
    { "publish": Array(xs), .. } => {
      let xs = map_with_error!(xs, fn {
        { "version": String(version), "created_at": String(created_at), .. } =>
          (version, created_at)
        _ => fail!("invalid json in publish list")
      })
      { publish: xs }
    }
    _ => fail!("missing field publish")
  }
}

///|
fn decode_resource(json : Json) -> Result[Resource, String] {
  guard json is { "kind": String(kind), .. } else {
    Err("invalid resource.json")
  }
  try {
    let kind = match kind {
      "module" => Module(decode_module_resources!(json))
      "package" => Package(decode_package_resources!(json))
      "module_and_package" => RootPackage(decode_root_package_resources!(json))
      "publish_list" => PublishList(decode_publish_resources!(json))
      "backend_list" => BackendList(decode_backend_resources!(json))
      _ => fail!("invalid kind: \{kind}")
    }
    Ok(kind)
  } catch {
    err => Err(err.to_string())
  }
}
