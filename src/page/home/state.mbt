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
  GotModuleIndices(Result[Indices, String])
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
  indices : Status[Indices]
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
  is_new : Bool
}

///|
pub fn load() -> (Cmd[Msg], Model) {
  (
    @cmd.batch([
      @http.get(
        "/assets/modules.json",
        expect=Json(GotModuleIndices(_), decode_module_indices),
      ),
      @http.get(
        "/assets/count.json",
        expect=Json(GotCount(_), decode_statistics),
      ),
    ]),
    {
      indices: Loading,
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
    GotModuleIndices(result) =>
      (
        none(),
        match result {
          Ok(modules) => { ..model, indices: Success(modules) }
          Err(_) => { ..model, indices: Failed }
        },
      )
    GotCount(result) =>
      match result {
        Ok(stat) => {
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
        Err(msg) => {
          println(msg)
          (none(), model)
        }
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
      let filtered_modules = match model.indices {
        Success(indices) => filter_indices(filter, indices)
        _ => []
      }
      (none(), { ..model, filter, filtered_modules })
    }
  }
}

///|
pub fn filter_indices(filter : String, indices : Indices) -> Array[ModuleIndex] {
  indices.all_modules
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
extern "js" fn compare_date(date1 : String, date2 : String) -> Int =
  #|function compareDate(date1_str, date2_str) {
  #|  const date1 = new Date(date1_str);
  #|  const date2 = new Date(date2_str);
  #|  if (date1 > date2) return -1;
  #|  if (date1 < date2) return 1;
  #|  return 0;
  #|}

///|
extern "js" fn is_within_one_week(date : String) -> Bool =
  #|created_at_str => {
  #|  const created_at = new Date(created_at_str);
  #|  const now = new Date();
  #|  const oneWeekAgo = new Date(now.setDate(now.getDate() - 7));
  #|  return created_at > oneWeekAgo;
  #|}

///|
fn decode_statistics(json : Json) -> Result[PackageCount, String] {
  match json {
    {
      "totalPackages": Number(total_packages, ..),
      "totalLines": Number(total_lines, ..),
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
fn decode_module_indices(modules_json : Json) -> Result[Indices, String] {
  fn decode_index(json) {
    match json {
      ({
        "name": String(path),
        "version": String(version),
        "description"? : description,
        "keywords"? : keywords,
        "created_at"? : created_at,
        "is_first_version"? : is_first_version,
        ..
      } : Json) => {
        // TODO: Option::map should be an error-polymorphic function
        let is_first_version = (is_first_version.unwrap_or(Json::boolean(false))
        |> @json.from_json) catch {
          JsonDecodeError(e) => return Err(e.to_string())
        }
        let keywords = match keywords {
          Some(Array(keywords)) =>
            Some(keywords.map(fn(x) { x.as_string().unwrap() }))
          _ => None
        }
        let created_at = created_at.map(fn(x) { x.as_string().unwrap() })
        let description = description.map(fn(x) { x.as_string().unwrap() })
        guard path.split("/").collect() is [author, .. name]
        let name = name.iter().map(@string.View::to_string).join("/")
        // assuming the first version is "0.1.0" or "0.0.1". 
        // We need the backend to provide more accurate data in the future.
        let is_new = created_at is Some(date) &&
          is_within_one_week(date) &&
          is_first_version
        Ok({
          path,
          name,
          author: author.to_string(),
          version,
          description,
          keywords,
          created_at,
          is_new,
        })
      }
      _ => Err("Error when parsing metadata.")
    }
  }

  fn to_upper(c : Char) -> Char {
    if c >= 'a' && c <= 'z' {
      guard (c.to_int() - 'a'.to_int() + 'A'.to_int()).to_char() is Some(c)
      c
    } else {
      c
    }
  }

  guard modules_json is { "modules": Array(modules), .. }
  let indices = []
  for mod in modules {
    match decode_index(mod) {
      Ok(index) =>
        // Filter out the test modules
        match index.keywords {
          Some(keywords) if keywords.contains("mooncakes-test") => ()
          _ => indices.push(index)
        }
      Err(msg) => return Err(msg)
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
  let recently_updated = indices
    ..sort_by((x, y) => match (x, y) {
      (
        { created_at: Some(v1), name: n1, .. },
        { created_at: Some(v2), name: n2, .. },
      ) =>
        match compare_date(v1, v2) {
          0 => -n1.compare(n2)
          order => order
        }
      ({ created_at: None, .. }, { created_at: Some(_), .. }) => 1
      ({ created_at: Some(_), .. }, { created_at: None, .. }) => -1
      ({ created_at: None, name: n1, .. }, { created_at: None, name: n2, .. }) =>
        -n1.compare(n2)
    })
    .iter()
    .take(15)
    .collect()
  Ok({ recently_updated, all_modules })
}
