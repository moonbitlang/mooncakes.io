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
priv enum CatalogMsg {
  GotAllModule(Result[Array[ModuleIndex], Error])
  Search(SearchMsg)
  ToggleAllModules
}

///|

///|
struct ModuleHighlights {
  recent : Array[ModuleIndex]
  new_modules : Array[ModuleIndex]
  popular : Array[ModuleIndex]
} derive(Eq)

///|
enum LazyStatus[T] {
  Idle
  Loading
  Failed
  Success(T)
} derive(Eq)

///|
struct CatalogModel {
  all_modules : LazyStatus[AllModules]
  show_all_modules : Bool
  search : SearchModel
} derive(Eq)

///|
struct PackageCount {
  total_modules : Int
  total_packages : Int
  total_lines : Int
  total_downloads : Int
} derive(Eq)

///|
struct ModuleIndex {
  author : String
  name : String
  path : String
  version : String
  keywords : Array[String]?
  description : String?
  created_at : String?
  is_new : Bool
} derive(Eq, @debug.Debug)

///|
priv struct AllModules {
  indices : Map[Char, Array[ModuleIndex]]
} derive(Eq)

///|
let highlights_limit = 12

///|
impl @json.FromJson for PackageCount with fn from_json(json : Json, path) {
  match json {
    {
      "total_modules": Number(total_modules, ..),
      "total_packages": Number(total_packages, ..),
      "total_lines": Number(total_lines, ..),
      "total_downloads": Number(total_downloads, ..),
      ..
    } =>
      {
        total_modules: total_modules.to_int(),
        total_lines: total_lines.to_int(),
        total_packages: total_packages.to_int(),
        total_downloads: total_downloads.to_int(),
      }
    _ => raise JsonDecodeError((path, "failed to parse json: \{Repr(json)}"))
  }
}

///|
fn decode_module_index(
  item : Json,
  json_path : @json.JsonPath,
) -> ModuleIndex raise @json.JsonDecodeError {
  match item {
    {
      "name": String(path),
      "version": String(version),
      "keywords": Array(keywords),
      "description": String(description),
      "is_new": True
      | False as bool,
      "created_at": String(time),
      ..
    } => {
      let keywords = Some(
        keywords.filter_map(fn(x) {
          match x {
            String(s) => Some(s)
            _ => None
          }
        }),
      )
      let description = Some(description)
      let created_at = Some(time)
      // we need Json::Boolean(x), not Json::True and Json::False
      let is_new = match bool {
        True => true
        False => false
        _ => raise JsonDecodeError((json_path, "invalid is_new field"))
      }
      let (author, name) = match path.split("/").collect() {
        [author, .. name] => (author, name)
        _ =>
          raise JsonDecodeError((json_path, "unexpected module path: \{path}"))
      }
      let name = name.iter().map(StringView::to_owned).join("/")
      {
        path,
        name,
        author: author.to_owned(),
        version,
        description,
        keywords,
        created_at,
        is_new,
      }
    }
    _ =>
      raise JsonDecodeError(
        (json_path, "unexpected item in json: \{Repr(item)}"),
      )
  }
}

///|
impl @json.FromJson for ModuleIndex with fn from_json(json : Json, path) {
  decode_module_index(json, path)
}

///|
fn decode_module_array(
  json : Json,
  path : @json.JsonPath,
) -> Array[ModuleIndex] raise @json.JsonDecodeError {
  match json {
    Array(items) => items.map(x => decode_module_index(x, path))
    _ => raise JsonDecodeError((path, "expecting an array"))
  }
}

///|
impl @json.FromJson for ModuleHighlights with fn from_json(json : Json, path) {
  match json {
    { "recent": recent_json, "new": new_json, "popular": popular_json, .. } =>
      {
        recent: decode_module_array(recent_json, path),
        new_modules: decode_module_array(new_json, path),
        popular: decode_module_array(popular_json, path),
      }
    _ =>
      raise JsonDecodeError(
        (path, "expecting highlights object with recent, new, popular"),
      )
  }
}

///|
fn sort_modules_by_name(
  modules : Array[ModuleIndex],
) -> Map[Char, Array[ModuleIndex]] {
  fn to_upper(c : Char) -> Char {
    if c >= 'a' && c <= 'z' {
      guard! (c.to_int() - 'a'.to_int() + 'A'.to_int()).to_char() is Some(c)
      c
    } else {
      c
    }
  }

  let indices = []
  for mod in modules {
    // Filter out the test modules
    match mod.keywords {
      Some(keywords) if keywords.contains("mooncakes-test") => ()
      _ => indices.push(mod)
    }
  }
  indices.sort_by(fn(a, b) { a.name.compare(b.name) })
  let all_modules = Map([])
  for index in indices {
    let c = to_upper(index.name.get_char(0).unwrap_or('#'))
    let key = if c >= 'A' && c <= 'Z' { c } else { '#' }
    match all_modules.get(key) {
      None => all_modules[key] = [index]
      Some(indices) => indices.push(index)
    }
  }
  all_modules
}
