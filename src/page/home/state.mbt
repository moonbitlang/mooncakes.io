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
pub enum Msg {
  GotAllModule(Result[Array[ModuleIndex], String])
  GotRecentModule(Result[Array[ModuleIndex], String])
  GotCount(Result[PackageCount, String])
  IncreaseAnimation(
    PackageCount,
    lines_inc_step~ : Int,
    packages_inc_step~ : Int,
    repeat_times~ : Int
  )
  FilterChanged(String)
}

///|
pub struct Model {
  recent_modules : Status[Array[ModuleIndex]]
  all_modules : Status[Map[Char, Array[ModuleIndex]]]
  filter : String
  filtered_modules : Array[ModuleIndex]
  showing_lines : Int
  showing_packages : Int
}

///|
struct PackageCount {
  total_packages : Int
  total_lines : Int
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
  is_new : Bool
}

///|
pub fn load() -> (Cmd[Msg], Model) {
  (
    @cmd.batch([
      @http.get(
        "/api/v0/modules/all",
        expect=Json(GotAllModule(_), decode_modules),
      ),
      @http.get(
        "/api/v0/modules/recent?limit=15",
        expect=Json(GotRecentModule(_), decode_modules),
      ),
      @http.get(
        "/api/v0/modules/statistics",
        expect=Json(GotCount(_), decode_statistics),
      ),
    ]),
    {
      recent_modules: Loading,
      all_modules: Loading,
      filter: "",
      filtered_modules: [],
      showing_lines: 5000000,
      showing_packages: 2100,
    },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    GotAllModule(Ok(modules)) =>
      (none(), { ..model, all_modules: Success(sort_modules_by_name(modules)) })
    GotRecentModule(Ok(recent)) =>
      (none(), { ..model, recent_modules: Success(recent) })
    GotCount(Ok(stat)) => {
      let repeat_times = 50
      let lines_inc_step = stat.total_lines / repeat_times
      let packages_inc_step = stat.total_packages / repeat_times
      (
        @cmd.task(
          IncreaseAnimation(
            stat,
            lines_inc_step~,
            packages_inc_step~,
            repeat_times~,
          ),
        ),
        { ..model, showing_lines: 0, showing_packages: 0 },
      )
    }
    GotAllModule(Err(msg)) | GotRecentModule(Err(msg)) | GotCount(Err(msg)) => {
      println(msg)
      (none(), model)
    }
    IncreaseAnimation(stat, lines_inc_step~, packages_inc_step~, repeat_times~) =>
      if repeat_times == 0 {
        (
          none(),
          {
            ..model,
            showing_lines: stat.total_lines,
            showing_packages: stat.total_packages,
          },
        )
      } else {
        (
          delay(
            IncreaseAnimation(
              stat,
              lines_inc_step~,
              packages_inc_step~,
              repeat_times=repeat_times - 1,
            ),
            5,
          ),
          {
            ..model,
            showing_lines: model.showing_lines + lines_inc_step,
            showing_packages: model.showing_packages + packages_inc_step,
          },
        )
      }
    FilterChanged(filter) => {
      let filtered_modules = match model.all_modules {
        Success(indices) => filter_indices(filter, indices)
        _ => []
      }
      (none(), { ..model, filter, filtered_modules })
    }
  }
}

///|
pub fn filter_indices(
  filter : String,
  indices : Map[Char, Array[ModuleIndex]],
) -> Array[ModuleIndex] {
  indices
  .values()
  .flat_map(Array::iter)
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
fn decode_statistics(json : Json) -> Result[PackageCount, String] {
  match json {
    {
      "total_packages": Number(total_packages, ..),
      "total_lines": Number(total_lines, ..),
      ..
    } =>
      Ok({
        total_lines: total_lines.to_int(),
        total_packages: total_packages.to_int(),
      })
    _ => Err("failed to parse json: \{json}")
  }
}

///|
fn decode_module_index(item : Json) -> ModuleIndex raise {
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
        _ => panic()
      }
      guard path.split("/").collect() is [author, .. name]
      let name = name.iter().map(StringView::to_string).join("/")
      {
        path,
        name,
        author: author.to_string(),
        version,
        description,
        keywords,
        created_at,
        is_new,
      }
    }
    _ => fail("unexpected item in json: \{item}")
  }
}

///|
fn decode_modules(json : Json) -> Result[Array[ModuleIndex], String] {
  match json {
    Array(items) =>
      Ok(items.map(decode_module_index)) catch {
        e => Err(e.to_string())
      }
    _ => Err("expecting an array")
  }
}

///|
fn sort_modules_by_name(
  modules : Array[ModuleIndex],
) -> Map[Char, Array[ModuleIndex]] {
  fn to_upper(c : Char) -> Char {
    if c >= 'a' && c <= 'z' {
      guard (c.to_int() - 'a'.to_int() + 'A'.to_int()).to_char() is Some(c)
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
  let all_modules = {}
  for index in indices {
    let first_letter = to_upper(index.name.get_char(0).unwrap())
    match all_modules.get(first_letter) {
      None => all_modules[first_letter] = [index]
      Some(indices) => indices.push(index)
    }
  }
  all_modules
}
