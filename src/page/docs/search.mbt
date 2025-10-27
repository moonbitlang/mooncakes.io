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
priv struct SearchModel {
  filter : String
  results : Status[Array[SearchResult]]
}

///|
priv struct SearchResult {
  matching : Array[(Bool, StringView)]
  score : Int
  entry : SearchEntry
}

///|
priv struct SearchEntry {
  kind : String
  href : String
  fullname : String
}

///|
fn load_search_entries(indices : ModuleIndex) -> () -> Array[SearchEntry] {
  fn() {
    let results = []
    indices
    .iter()
    .each(x => match x {
      { pkg: Some({ path, traits, types, typealias_, values, misc }), .. } => {
        results.push({
          kind: "Package",
          fullname: "@" + path,
          href: "/docs/" + path,
        })
        traits.each(fn(x) {
          results.push({
            kind: "Trait",
            fullname: "@" + path + "." + x.name,
            href: "/docs/" + path + "#" + x.name,
          })
        })
        types.each(fn(x) {
          results.push({
            kind: "Type",
            fullname: "@" + path + "." + x.name,
            href: "/docs/" + path + "#" + x.name,
          })
          x.methods.each(fn(meth) {
            results.push({
              kind: "Method",
              fullname: "@" + path + "." + x.name + "::" + meth,
              href: "/docs/" + path + "#" + x.name + "::" + meth,
            })
          })
        })
        typealias_.each(fn(x) {
          results.push({
            kind: "Typealias",
            fullname: "@" + path + "." + x.name,
            href: "/docs/" + path + "#" + x.name,
          })
        })
        values.each(fn(x) {
          results.push({
            kind: "Value",
            fullname: "@" + path + "." + x.name,
            href: "/docs/" + path + "#" + x.name,
          })
        })
        misc.each(fn(x) {
          results.push({
            kind: "Type",
            fullname: "@" + path + "." + x.name,
            href: "/docs/" + path + "#" + x.name,
          })
        })
      }
      _ => ()
    })
    results
  }
}

///|
fn search(
  entries : Lazy[Array[SearchEntry]],
  filter : String,
) -> Array[SearchResult] {
  if filter.is_empty() {
    return []
  }
  let results = entries.force()
  let query = @fuzzy_match.Query::new(filter)
  let results = results.filter_map(fn(entry) {
    let score = query.score(item=entry.fullname)
    match query.split_by_matching_sections(item=entry.fullname) {
      None => None
      Some(matching) => Some({ matching, score, entry })
    }
  })
  results.sort_by(fn(a, b) { a.score - b.score })
  results
}
