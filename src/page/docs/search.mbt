///|
priv struct SearchModel {
  filter : String
  results : Status[Array[SearchResult]]
}

///|
priv struct SearchResult {
  matching : Array[(Bool, @string.StringView)]
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
fn search(indices : ModuleIndex, filter : String) -> Array[SearchResult] {
  if filter.is_empty() {
    return []
  }
  let results = []
  indices
  .iter()
  .each(fn {
    { package: Some({ path, traits, types, typealias_, values, misc }), .. } => {
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
  let query = @fuzzy_match.Query::new(filter)
  results
  .filter_map(fn(entry) {
    let score = query.score(item=entry.fullname)
    match query.split_by_matching_sections(item=entry.fullname) {
      None => None
      Some(matching) => Some({ matching, score, entry })
    }
  })
  ..sort_by(fn(a, b) { a.score - b.score })
}
