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
  ToggleAllModules
}

///|
struct ModuleHighlights {
  recent : Array[ModuleCard]
  new_modules : Array[ModuleCard]
  popular : Array[ModuleCard]
} derive(Eq)

///|
priv struct ModuleCard {
  module_info : ModuleIndex
  badge : ModuleCardBadge
} derive(Eq)

///|
priv enum ModuleCardBadge {
  Version
  PublishedAt
  Trends(Int64)
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
} derive(Eq)

///|
struct PackageCount {
  total_modules : Int32
  total_packages : Int32
  total_lines : Int32
  total_downloads : Int32
} derive(Eq)

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
impl @json.FromJson for ModuleHighlights with fn from_json(json : Json, path) {
  match json {
    {
      "recent": Array(recent),
      "new": Array(new_modules),
      "popular": Array(popular),
      ..
    } =>
      {
        recent: recent.map(item => {
          module_info: decode_module_index(item, path),
          badge: PublishedAt,
        }),
        new_modules: new_modules.map(item => {
          module_info: decode_module_index(item, path),
          badge: PublishedAt,
        }),
        popular: popular.map(item => {
          guard item is { "trends": Number(downloads, ..), .. } else {
            raise @json.JsonDecodeError(
              (path, "expecting trends in Trends module"),
            )
          }
          {
            module_info: decode_module_index(item, path),
            badge: Trends(downloads.to_int64()),
          }
        }),
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
