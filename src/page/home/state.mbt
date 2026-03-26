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
  GotHighlights(Result[ModuleHighlights, String])
  GotCount(Result[PackageCount, String])
  FilterChanged(String)
  ToggleAllModules
  ToggleTheme
}

///|

///|
struct ModuleHighlights {
  recent : Array[ModuleIndex]
  new_modules : Array[ModuleIndex]
  popular : Array[ModuleIndex]
}

///|
enum LazyStatus[T] {
  Idle
  Loading
  Failed
  Success(T)
}

///|
pub struct Model {
  highlights : Status[ModuleHighlights]
  all_modules : LazyStatus[AllModules]
  show_all_modules : Bool
  filter : String
  filtered_modules : Array[ModuleIndex]
  showing_lines : Int
  showing_packages : Int
  showing_downloads : Int
}

///|
struct PackageCount {
  total_packages : Int
  total_lines : Int
  total_downloads : Int
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
struct SearchIndex {
  entry : ModuleIndex
  path : String
  name : String
  author : String
  keywords : Array[String]
  recency_penalty : Int
}

///|
struct AllModules {
  indices : Map[Char, Array[ModuleIndex]]
  search_index : Lazy[Array[SearchIndex]]
}

///|
extern "js" fn recency_penalty(date : String) -> Int =
  #|function recencyPenalty(dateString) {
  #|  const t = Date.parse(dateString);
  #|  if (!Number.isFinite(t)) return 200;
  #|  const diffDays = Math.max(0, (Date.now() - t) / 86400000);
  #|  return Math.min(200, Math.floor(diffDays * 3));
  #|}

///|
fn sanitize_for_fuzzy(text : String) -> String {
  let sb = StringBuilder::new()
  let mut changed = false
  for c in text {
    if c.to_int() <= 0xFFFF {
      sb.write_char(c)
    } else {
      changed = true
    }
  }
  if changed {
    sb.to_string()
  } else {
    text
  }
}

///|
let highlights_limit = 12

///|
pub fn load(dispatch~ : (Msg) -> Cmd) -> (Cmd, Model) {
  (
    batch([
      @http.get(
        "/api/v0/modules?recent=\{highlights_limit}&new=\{highlights_limit}&popular=\{highlights_limit}",
        expect=Json(
          result => dispatch(GotHighlights(result)),
          decode_highlights,
        ),
      ),
      @http.get(
        "/api/v0/modules/statistics",
        expect=Json(result => dispatch(GotCount(result)), decode_statistics),
      ),
    ]),
    {
      highlights: Loading,
      all_modules: Idle,
      show_all_modules: false,
      filter: "",
      filtered_modules: [],
      showing_lines: 0,
      showing_packages: 0,
      showing_downloads: 0,
    },
  )
}

///|
fn fetch_all_modules(dispatch : (Msg) -> Cmd) -> Cmd {
  @http.get(
    "/api/v0/modules",
    expect=Json(result => dispatch(GotAllModule(result)), decode_modules),
  )
}

///|
pub fn update(
  msg : Msg,
  model : Model,
  dispatch~ : (Msg) -> Cmd,
) -> (Cmd, Model) {
  match msg {
    GotAllModule(Ok(modules)) => {
      let indices = sort_modules_by_name(modules)
      let search_index = Lazy::new(fn() { build_search_index(indices) })
      let model = { ..model, all_modules: Success({ indices, search_index }) }
      let filtered_modules = if model.filter.is_empty() {
        []
      } else {
        filter_indices(model.filter, search_index.force())
      }
      (none, { ..model, filtered_modules, })
    }
    GotHighlights(Ok(highlights)) =>
      (none, { ..model, highlights: Success(highlights) })
    GotCount(Ok(stat)) =>
      (
        none,
        {
          ..model,
          showing_lines: stat.total_lines,
          showing_packages: stat.total_packages,
          showing_downloads: stat.total_downloads,
        },
      )
    GotAllModule(Err(msg)) | GotHighlights(Err(msg)) | GotCount(Err(msg)) => {
      println(msg)
      (none, { ..model, all_modules: Failed })
    }
    FilterChanged(filter) =>
      if filter.is_empty() {
        (none, { ..model, filter, filtered_modules: [] })
      } else {
        match model.all_modules {
          Idle =>
            (
              fetch_all_modules(dispatch),
              { ..model, all_modules: Loading, filter, filtered_modules: [] },
            )
          Loading => (none, { ..model, filter, filtered_modules: [] })
          Success(all) => {
            let filtered_modules = filter_indices(
              filter,
              all.search_index.force(),
            )
            (none, { ..model, filter, filtered_modules })
          }
          Failed => (none, { ..model, filter, filtered_modules: [] })
        }
      }
    ToggleAllModules => {
      let show = not(model.show_all_modules)
      match model.all_modules {
        Idle if show =>
          (
            fetch_all_modules(dispatch),
            { ..model, all_modules: Loading, show_all_modules: show },
          )
        _ => (none, { ..model, show_all_modules: show })
      }
    }
    ToggleTheme => (none, model)
  }
}

///|
pub fn is_theme_toggle(msg : Msg) -> Bool {
  match msg {
    ToggleTheme => true
    _ => false
  }
}

///|
pub fn filter_indices(
  filter : String,
  index : Array[SearchIndex],
) -> Array[ModuleIndex] {
  fn split_tokens(filter : String) -> Array[String] {
    filter
    .split(" ")
    .filter_map(fn(part) {
      let trimmed = part.trim()
      if trimmed.is_empty() {
        None
      } else {
        Some(trimmed.to_string())
      }
    })
    .collect()
  }

  fn matches_primary(
    tokens : Array[String],
    path_lower : String,
    name_lower : String,
    author_lower : String,
    keywords_lower : Array[String],
  ) -> Bool {
    fn keyword_contains(
      token_view : StringView,
      keywords_lower : Array[String],
    ) -> Bool {
      for kw in keywords_lower {
        if kw.contains(token_view) {
          return true
        }
      }
      false
    }

    fn keyword_has_prefix(
      token_view : StringView,
      keywords_lower : Array[String],
    ) -> Bool {
      for kw in keywords_lower {
        if kw.has_prefix(token_view) {
          return true
        }
      }
      false
    }

    for token in tokens {
      let token_view = token[:]
      let mut matched = false
      if token.length() <= 1 {
        for part in path_lower.split("/") {
          if part.has_prefix(token_view) {
            matched = true
            break
          }
        }
        if !matched {
          matched = name_lower.has_prefix(token_view) ||
            author_lower.has_prefix(token_view)
        }
        if !matched {
          matched = keyword_has_prefix(token_view, keywords_lower)
        }
      } else {
        matched = path_lower.contains(token_view) ||
          name_lower.contains(token_view) ||
          author_lower.contains(token_view) ||
          keyword_contains(token_view, keywords_lower)
      }
      if !matched {
        return false
      }
    }
    true
  }

  let safe_filter = sanitize_for_fuzzy(filter)
  let filter_lower = safe_filter.to_lower()
  let tokens = split_tokens(filter_lower)
  if safe_filter.is_empty() {
    return []
  }
  let query = @fuzzy_match.Query::new(filter_lower)
  fn update_best(best : Int?, score : Int) -> Int? {
    match best {
      None => Some(score)
      Some(value) => if score < value { Some(score) } else { best }
    }
  }

  fn consider(
    best : Int?,
    query : @fuzzy_match.Query,
    text : String,
    penalty : Int,
  ) -> Int? {
    if text.is_empty() {
      best
    } else {
      let score = query.score(item=text)
      if score == 0 {
        best
      } else {
        update_best(best, score + penalty)
      }
    }
  }

  let hits = index
    .iter()
    .filter_map(fn(entry) {
      if tokens.is_empty() {
        return None
      }
      let path_lower = entry.path
      let name_lower = entry.name
      let author_lower = entry.author
      let keywords_lower = entry.keywords
      if !matches_primary(
          tokens, path_lower, name_lower, author_lower, keywords_lower,
        ) {
        return None
      }
      let keyword_penalty = 200
      let best = consider(None, query, entry.path, 0)
      let best = consider(best, query, entry.name, 0)
      let best = consider(best, query, entry.author, 0)
      let best = entry.keywords.fold(init=best, fn(acc, kw) {
        consider(acc, query, kw, keyword_penalty)
      })
      match best {
        None => None
        Some(score) => Some((score + entry.recency_penalty, entry.entry))
      }
    })
    .collect()
  hits.sort_by(fn(a, b) { a.0 - b.0 })
  let limit = 200
  let count = if hits.length() < limit { hits.length() } else { limit }
  hits[:count].map(fn(x) { x.1 })
}

///|
fn build_search_index(
  indices : Map[Char, Array[ModuleIndex]],
) -> Array[SearchIndex] {
  indices
  .values()
  .flat_map(Array::iter)
  .map(fn(mod) {
    let path = sanitize_for_fuzzy(mod.path).to_lower()
    let name = sanitize_for_fuzzy(mod.name).to_lower()
    let author = sanitize_for_fuzzy(mod.author).to_lower()
    let keywords = match mod.keywords {
      None => []
      Some(items) =>
        items
        .map(fn(kw) { sanitize_for_fuzzy(kw).to_lower() })
        .filter(fn(kw) { !kw.is_empty() })
    }
    let recency_penalty = match mod.created_at {
      None => 0
      Some(time) => recency_penalty(time)
    }
    { entry: mod, path, name, author, keywords, recency_penalty }
  })
  .collect()
}

///|
fn decode_statistics(json : Json) -> Result[PackageCount, String] {
  match json {
    {
      "total_packages": Number(total_packages, ..),
      "total_lines": Number(total_lines, ..),
      "total_downloads": Number(total_downloads, ..),
      ..
    } =>
      Ok({
        total_lines: total_lines.to_int(),
        total_packages: total_packages.to_int(),
        total_downloads: total_downloads.to_int(),
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
fn decode_module_array(json : Json) -> Array[ModuleIndex] raise {
  match json {
    Array(items) => items.map(decode_module_index)
    _ => fail("expecting an array")
  }
}

///|
fn decode_highlights(json : Json) -> Result[ModuleHighlights, String] {
  match json {
    { "recent": recent_json, "new": new_json, "popular": popular_json, .. } =>
      Ok({
        recent: decode_module_array(recent_json),
        new_modules: decode_module_array(new_json),
        popular: decode_module_array(popular_json),
      }) catch {
        e => Err(e.to_string())
      }
    _ => Err("expecting highlights object with recent, new, popular")
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
    let c = to_upper(index.name.get_char(0).unwrap())
    let key = if c >= 'A' && c <= 'Z' { c } else { '#' }
    match all_modules.get(key) {
      None => all_modules[key] = [index]
      Some(indices) => indices.push(index)
    }
  }
  all_modules
}
