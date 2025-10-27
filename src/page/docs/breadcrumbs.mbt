///|
fn breadcrumbs(
  path : String,
  module_path : String,
  module_index : ModuleIndex,
) -> Html[Msg] {
  let module_path = module_path.trim(char_set="/").to_string()
  let path = path.trim(char_set="/")
  let paths = path.trim_start(char_set="/").split("/").collect()
  let mut acc_path = ""
  let elems = []
  for path in paths {
    let path = path.to_string()
    acc_path += if acc_path == "" { path } else { "/" + path.to_string() }
    let elem = if acc_path.has_prefix(module_path) &&
      module_index.inner().find_node(acc_path) is Some(node) &&
      (acc_path == module_path || not(node.pkg.is_empty())) {
      a(class="hover:underline", href="/docs/" + acc_path, [text(path)])
    } else {
      div(class="text-gray-700 font-normal", [text(path)])
    }
    elems.push(elem)
  }
  let separator = div(class="text-gray-300 text-base", [text(" / ")])
  div(
    class="text-base text-gray-800 font-semibold flex gap-2",
    elems.iter().intersperse(separator).collect(),
  )
}
