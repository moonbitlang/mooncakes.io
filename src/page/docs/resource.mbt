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
priv enum ResourceKind {
  Package(PackageResources)
  Module(ModuleResources)
  RootPackage(RootPackageResources)
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
  deps : Array[(String, String)]
}

///|
priv struct ModuleResources {
  meta_info : MetaInfo
  module_index_path : String
}

///|
priv struct PackageResources {
  package_data_path : String
  source_files : Array[String]
  module_path : String
}

///|
priv struct RootPackageResources {
  meta_info : MetaInfo
  module_index_path : String
  package_data_path : String
  source_files : Array[String]
}

///|
priv struct Resource {
  readme_content : String
  kind : ResourceKind
}

///|
fn decode_meta_info(json : Json) -> MetaInfo raise Error {
  fn parse_package(json : Json) -> MetaInfo raise Error {
    guard json
      is {
        "name"? : name,
        "repository"? : repository,
        "version"? : version,
        "license"? : license,
        "description"? : description,
        "keywords"? : keywords,
        "deps"? : deps,
        ..
      } else {
      fail("Error when parsing metadata.")
    }
    guard [name, version].map(x => match x {
        Some(String(str)) => str
        _ => abort("Error when parsing name and version.")
      })
      is [name, version] else {
      fail("Error when parsing name and version.")
    }
    // TODO: fix this check
    guard [repository, license, description].map(x => match x {
        Some(String(s)) => Some(s)
        _ => None
      })
      is [repository, license, description] else {
      fail("Error when parsing repository, license, description, readme.")
    }
    let repository = repository.map(normalize_repo_url)
    let keywords = match keywords {
      Some(Array(keywords)) =>
        keywords.filter_map(fn(x) {
          match x {
            String(s) => Some(s)
            _ => None
          }
        })
      None => []
      _ => abort("Error when parsing keywords.")
    }
    let iter = name.iter()
    let author = String::from_array(
      iter.take_while(@builtin.op_notequal('/', _)).collect(),
    )
    let deps = match deps {
      Some(Object(xs)) =>
        map_with_error(xs.iter2().to_array(), x => match x {
          (name, String(version)) => (name, version)
          _ => fail("Error when parsing deps.")
        })
      None => []
      _ => abort("Error when parsing deps.")
    }
    { author, name, description, version, license, repository, keywords, deps }
  }

  parse_package(json)
}

///|
/// Normalizes the repository URL.
/// If the user omits the `https://` prefix, it will be added automatically.
fn normalize_repo_url(url : String) -> String {
  match url {
    [.. "https://", ..] | [.. "http://", ..] => url
    [.. "git@", .. remain] if remain.contains_char(':') &&
      remain.split(":").collect().length() == 2 => url
    _ => "https://" + url
  }
}

///|
fn decode_module_resources(json : Json) -> ModuleResources raise Error {
  match json {
    { "module_index": String(module_index_path), "meta_info": meta_info, .. } =>
      { module_index_path, meta_info: decode_meta_info(meta_info) }
    _ => fail("missing field module_index or source_files")
  }
}

///|
fn decode_package_resources(json : Json) -> PackageResources raise Error {
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
          _ => fail("invalid source_files")
        }
      }
      { package_data_path, source_files: ls, module_path }
    }
    _ => fail("missing field package_data or source_files: \{json}")
  }
}

///|
fn decode_root_package_resources(
  json : Json,
) -> RootPackageResources raise Error {
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
          _ => fail("invalid source_files")
        }
      }
      {
        package_data_path,
        source_files: ls,
        module_index_path,
        meta_info: decode_meta_info(meta_info),
      }
    }
    _ => fail("missing field package_data or source_files: \{json}")
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
      "module" => Module(decode_module_resources(json))
      "package" => Package(decode_package_resources(json))
      "module_and_package" => RootPackage(decode_root_package_resources(json))
      _ => panic()
    }
    Ok({ readme_content, kind })
  } catch {
    err => Err(err.to_string())
  }
}
