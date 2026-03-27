///|
fn breadcrumbs(
  path : String,
  module_path : String?,
  module_index : ModuleIndex?,
) -> Html {
  let raw_paths = split_docs_path(path)
  let lookup_paths = split_docs_path(docs_lookup_path(path))
  let lookup_module_path = module_path.map(docs_lookup_path)
  let mut raw_acc_path = ""
  let mut lookup_acc_path = ""
  let elems = []
  for i in 0..<raw_paths.length() {
    let raw_path = raw_paths[i]
    let lookup_path = lookup_paths[i]
    raw_acc_path += if raw_acc_path == "" { raw_path } else { "/" + raw_path }
    lookup_acc_path += if lookup_acc_path == "" {
      lookup_path
    } else {
      "/" + lookup_path
    }
    let elem = match (module_index, lookup_module_path) {
      (Some(module_index), Some(lookup_module_path)) =>
        if lookup_acc_path.has_prefix(lookup_module_path) &&
          module_index.0.find_node(lookup_acc_path) is Some(node) &&
          (lookup_acc_path == lookup_module_path || node.pkg is Some(_)) {
          a(class="hover:underline font-normal", href="/docs/" + raw_acc_path, [
            text(lookup_path),
          ])
        } else {
          div(class="text-gray-700 font-normal", [text(lookup_path)])
        }
      _ => div(class="text-gray-700 font-normal", [text(lookup_path)])
    }
    elems.push(elem)
  }
  let separator = div(class="text-gray-300 text-base", [text(" / ")])
  div(
    class="text-base text-gray-800 font-semibold flex gap-2",
    elems.iter().intersperse(separator).collect(),
  )
}
