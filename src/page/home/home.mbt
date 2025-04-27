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
  FilterChanged(String)
}

///|
pub struct Model {
  indices : Status[Indices]
  filter : String
  filtered_modules : Array[ModuleIndex]
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
}

///|
pub fn load() -> (Command[Msg], Model) {
  (
    @http.get(
      "/assets/modules.json",
      expect=Json(Msg::GotModuleIndices, decode_module_indices),
    ),
    { indices: Loading, filter: "", filtered_modules: [] },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (Command[Msg], Model) {
  match msg {
    GotModuleIndices(result) =>
      (
        none(),
        match result {
          Ok(modules) => { ..model, indices: Success(modules) }
          Err(_) => { ..model, indices: Failed }
        },
      )
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
  .flat_map(fn(x) { x.iter() })
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
fn banner() -> Html[Msg] {
  fn button(value, target, color) {
    a(
      href=target,
      class="py-2 px-6 select-none text-md rounded-full hover:opacity-80 transition-all \{color}",
      [text(value)],
    )
  }

  div(
    class="container lg:w-3/5 flex flex-col-reverse lg:flex-row items-center justify-between",
    [
      div(class="text-center lg:text-left mx-4 bg-bottom rounded-xl flex-col", [
        div(class="text-slate-700", [
          h1(class="font-semibold text-4xl lg:text-5xl", [
            text("The Package Registry"),
          ]),
          h1(class="font-semibold text-4xl lg:text-5xl mt-2", [
            text("for"),
            span(class="text-moonbit font-extrabold", [text(" MoonBit ")]),
            text("community"),
          ]),
          h2(class="text-lg lg:text-2xl mt-4 text-zinc-500 flex gap-1", [
            text("Browse, search and share package and documentation"),
          ]),
        ]),
        div(class="flex mt-4 gap-4 justify-center lg:justify-start", [
          button(
            "Getting Started", "https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
            "bg-yellow-600 text-white",
          ),
          button(
            "Install Moon", "https://www.moonbitlang.com/download/", "bg-gray-200 text-gray-800",
          ),
        ]),
      ]),
      img(class="w-[340px] h-[340px]", src="mooncake-pic.png", []),
    ],
  )
}

///|
pub fn view(model : Model) -> Html[Msg] {
  let module_list = match model.indices {
    Loading => @view.loading()
    Failed => @view.load_failed("module indices")
    Success(indices) =>
      if model.filter == "" {
        div([
          recently_updated(indices.recently_updated),
          all_modules(indices.all_modules),
        ])
      } else {
        search_result(model.filtered_modules)
      }
  }
  let banner = if model.filter == "" { banner() } else { nothing() }
  div(class="flex flex-col min-h-screen", [
    navbar(),
    banner,
    hr(class="m-4 border-gray-200"),
    module_list,
    div(class="mt-auto", [@view.footer()]),
  ])
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
fn decode_module_indices(modules_json : Json) -> Result[Indices, String] {
  fn decode_index {
    ({
      "name": String(path),
      "version": String(version),
      "description"? : description,
      "keywords"? : keywords,
      "created_at"? : created_at,
      ..
    } : Json) => {
      let keywords = match keywords {
        Some(Array(keywords)) =>
          Some(keywords.map(fn(x) { x.as_string().unwrap() }))
        _ => None
      }
      let created_at = created_at.map(fn(x) { x.as_string().unwrap() })
      let description = description.map(fn(x) { x.as_string().unwrap() })
      guard path.split("/").collect() is [author, .. name]
      let name = name.iter().map(@string.View::to_string).join("/")
      Ok({
        path,
        name,
        author: author.to_string(),
        version,
        description,
        keywords,
        created_at,
      })
    }
    _ => Err("Error when parsing metadata.")
  }

  fn to_upper(c : Char) -> Char {
    if c >= 'a' && c <= 'z' {
      Char::from_int(c.to_int() - 'a'.to_int() + 'A'.to_int())
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
    let first_letter = to_upper(index.name[0])
    match all_modules.get(first_letter) {
      None => all_modules[first_letter] = [index]
      Some(indices) => indices.push(index)
    }
  }
  let recently_updated = indices
    ..sort_by(fn(a, b) {
      match (a, b) {
        ({ created_at: Some(v1), .. }, { created_at: Some(v2), .. }) =>
          match compare_date(v1, v2) {
            0 => -a.name.compare(b.name)
            order => order
          }
        ({ created_at: None, .. }, { created_at: Some(_), .. }) => 1
        ({ created_at: Some(_), .. }, { created_at: None, .. }) => -1
        ({ created_at: None, .. }, { created_at: None, .. }) =>
          -a.name.compare(b.name)
      }
    })
    .iter()
    .take(12)
    .collect()
  Ok({ recently_updated, all_modules })
}
