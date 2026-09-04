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
fn load_search_entries(
  indices : ModuleIndex,
  module_name~ : String,
  module_version~ : String,
) -> () -> Array[SearchEntry] {
  fn() {
    let results = []
    indices
    .iter()
    .each(x => {
      match x {
        {
          pkg: Some({ path, traits, errors, types, typealias_, values, misc, }),
          ..
        } => {
          let vpath = versioned_docs_path(path, module_name, module_version)
          results.push({
            kind: "Package",
            fullname: "@\{path}",
            href: "/docs/\{vpath}",
          })
          typealias_.each(fn(x) {
            results.push({
              kind: "Typealias",
              fullname: "@\{path}.\{x.name}",
              href: "/docs/\{vpath}#\{x.name}",
            })
          })
          traits.each(fn(x) {
            results.push({
              kind: "Trait",
              fullname: "@\{path}.\{x.name}",
              href: "/docs/\{vpath}#\{x.name}",
            })
          })
          errors.each(fn(x) {
            results.push({
              kind: "Error",
              fullname: "@\{path}.\{x.name}",
              href: "/docs/\{vpath}#\{x.name}",
            })
            x.methods.each(fn(meth) {
              results.push({
                kind: "Method",
                fullname: "@\{path}.\{x.name}::\{meth}",
                href: "/docs/\{vpath}#\{x.name}::\{meth}",
              })
            })
          })
          types.each(fn(x) {
            results.push({
              kind: "Type",
              fullname: "@\{path}.\{x.name}",
              href: "/docs/\{vpath}#\{x.name}",
            })
            x.methods.each(fn(meth) {
              results.push({
                kind: "Method",
                fullname: "@\{path}.\{x.name}::\{meth}",
                href: "/docs/\{vpath}#\{x.name}::\{meth}",
              })
            })
          })
          misc.each(fn(x) {
            results.push({
              kind: "Type",
              fullname: "@\{path}.\{x.name}",
              href: "/docs/\{vpath}#\{x.name}",
            })
          })
          values.each(fn(x) {
            results.push({
              kind: "Value",
              fullname: "@\{path}.\{x.name}",
              href: "/docs/\{vpath}#\{x.name}",
            })
          })
        }
        _ => ()
      }
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
      Some(matching) => Some({ matching, score, entry, })
    }
  })
  results.sort_by(fn(a, b) { a.score - b.score })
  results
}

///|
priv struct SearchEntries {
  module_index : Status[ModuleIndex]?
  entries : Lazy[Array[SearchEntry]]?
}

///|
impl Eq for SearchEntries with fn equal(self, other) {
  // The entries are a lazy cache of the module index within this component.
  self.module_index == other.module_index
}

///|
priv enum SearchMsg {
  FilterChanged(String)
}

///|
fn docs_search(
  module_index : Val[Status[ModuleIndex]?],
  manifest : Manifest,
) -> Val[Html] {
  let search_entries = module_index.map(module_index => {
    let entries = if module_index is Some(Loaded(index)) {
      Some(
        Lazy::new(
          load_search_entries(
            index,
            module_name=manifest.module_,
            module_version=manifest.version,
          ),
        ),
      )
    } else {
      None
    }
    { module_index, entries, }
  })
  let (filter, emit) = @rabbita.create_pure_state("", update=(_filter, msg) => {
    match msg {
      FilterChanged(filter) => filter
    }
  })
  filter.view2(search_entries, fn(filter, search_entries) {
    let results = if search_entries.entries is Some(entries) {
      search(entries, filter)
    } else {
      []
    }
    dialog(
      class="lg:backdrop:bg-black/30 lg:backdrop:backdrop-blur lg:rounded lg:shadow-lg fixed max-w-none max-h-none w-full h-screen m-0 lg:m-auto lg:w-2/5 lg:h-[80%] overscroll-contain",
      id="search-panel",
    ) <| [
      div(
        class="h-12 border-b bg-white dark:bg-zinc-900 rounded-none sticky top-0 text-base w-full flex",
      ) <| [
        input(
          input_type=Text,
          value=filter,
          placeholder="search...",
          on_input=filter => emit(FilterChanged(filter)),
          class="outline-none m-0 flex-grow px-4 p-2 dark:placeholder:text-slate-500",
        ),
        button(
          class="size-12 container hover:bg-gray-200 dark:hover:bg-gray-800 flex justify-center items-center",
          on_click=@dialog.close("search-panel"),
          img(class="ui-icon", src=@config.icon_close),
        ),
      ],
      match search_entries.module_index {
        Some(Pending) => nothing
        None | Some(Failed(_)) => text("load indices failed")
        Some(Loaded(_)) =>
          ul(
            class="overflow-y-auto flex-grow",
            results.map(result => {
              let color = match result.entry.kind {
                "Package" => "text-yellow-700 dark:text-yellow-400"
                "Trait" => "text-blue-700 dark:text-indigo-400"
                "Type" => "text-green-700 dark:text-emerald-300"
                "Method" => "text-moonbit"
                "Value" => "text-purple-700 dark:text-violet-300"
                _ => "text-gray-700 dark:text-slate-300"
              }
              li(
                class="border-b px-4 py-2 bg-white dark:bg-zinc-900 hover:bg-gray-100 dark:hover:bg-zinc-900",
                on_click=@dialog.close("search-panel"),
              ) <| [
                a(href=result.entry.href, class="grid grid-cols-[1fr_auto] ") <| [
                  span(
                    result.matching.map(section => {
                      match section {
                        (true, value) =>
                          span(
                            class="text-moonbit font-semibold",
                            value.to_owned(),
                          )
                        (false, value) =>
                          span(
                            class="text-gray-600 dark:text-slate-400",
                            value.to_owned(),
                          )
                      }
                    }),
                  ),
                  span(
                    class="font-thin text-tiny lg:text-base \{color}",
                    result.entry.kind,
                  ),
                ],
              ]
            }),
          )
      },
    ]
  })
}
