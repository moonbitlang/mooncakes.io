///|
priv struct SearchModel {
  filter : String
  results : Status[Array[SearchResult]]
}

///|
priv struct SearchResult {
  kind : String
  name : String
  href : String
  package : String
}

///|
fn search(indices : ModuleIndex, filter : String) -> Array[SearchResult] {
  let results = []
  if filter != "" {
    let filter = filter.to_lower()
    indices
    .iter()
    .each(fn {
      { package: Some({ path, traits, types, typealias_, values, misc }), .. } => {
        if path.to_lower().contains(filter) {
          results.push({
            kind: "Package",
            name: path.split("/").last().or(path),
            href: "/docs/" + path,
            package: path,
          })
        }
        traits.each(fn(x) {
          if x.name.to_lower().contains(filter) {
            results.push({
              kind: "Trait",
              name: x.name,
              href: "/docs/" + path + "#" + x.name,
              package: path,
            })
          }
        })
        types.each(fn(x) {
          if x.name.to_lower().contains(filter) {
            results.push({
              kind: "Type",
              name: x.name,
              href: "/docs/" + path + "#" + x.name,
              package: path,
            })
          }
          x.methods.each(fn(meth) {
            if meth.to_lower().contains(filter) {
              results.push({
                kind: "Method",
                name: x.name + "::" + meth,
                href: "/docs/" + path + "#" + x.name + "::" + meth,
                package: path,
              })
            }
          })
        })
        typealias_.each(fn(x) {
          if x.name.to_lower().contains(filter) {
            results.push({
              kind: "Typealias",
              name: x.name,
              href: "/docs/" + path + "#" + x.name,
              package: path,
            })
          }
        })
        values.each(fn(x) {
          if x.name.to_lower().contains(filter) {
            results.push({
              kind: "Value",
              name: x.name,
              href: "/docs/" + path + "#" + x.name,
              package: path,
            })
          }
        })
        misc.each(fn(x) {
          if x.name.to_lower().contains(filter) {
            results.push({
              kind: "Type",
              name: x.name,
              href: "/docs/" + path + "#" + x.name,
              package: path,
            })
          }
        })
      }
      _ => ()
    })
  }
  results
}
