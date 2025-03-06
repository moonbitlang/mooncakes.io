///|
fn item_button[M](
  childrens : @html.Html[M],
  icon? : String,
  click? : M
) -> @html.Html[M] {
  let icon = match icon {
    None => div([])
    Some(src) => div(class="size-[12px] self-center mr-1", [img(src~, [])])
  }
  div(class="hover:bg-gray-100 px-2 py-1 rounded text-sm flex", click?, [
    icon, childrens,
  ])
}

///|
fn source_list(
  files : Array[String],
  package_path~ : String
) -> @html.Html[Msg] {
  if files.is_empty() {
    return text("No source files.")
  }
  div(class="", [
    ul(
      files.map(fn(x) {
        item_button(
          a(
            class="w-full",
            href="\{@config.URL_BASE}/docs/\{package_path}/\{x}.html",
            [text(x)],
          ),
        )
      }),
    ),
  ])
}

///| Compare two strings in dictionary order
fn compare_strings(a : String, b : String) -> Int {
  let len_a = a.length()
  let len_b = b.length()
  let min_len = if len_a < len_b { len_a } else { len_b }
  for i in 0..<min_len {
    let char_a = a[i]
    let char_b = b[i]
    if char_a != char_b {
      return char_a - char_b
    }
  }
  len_a - len_b
}

///|
fn IndexNode::to_document_items(
  self : IndexNode
) -> Array[@tree.Tree[ItemTarget]] {
  fn collect_packages(node : IndexNode) {
    match node.package {
      None if not(node.childs.is_empty()) => {
        let childs = node.childs
          .elems()
          .filter_map(collect_packages)
          ..sort_by(compare_items)
        Some(@tree.Node(id=ItemTarget::Package(node.name), node.name, childs))
      }
      Some(pkg) => Some(@tree.Item(id=Package(pkg.path), node.name))
      _ => None
    }
  }

  let packages = self.childs
    .elems()
    .filter_map(collect_packages)
    ..sort_by(compare_items)
  let package_section = match packages {
    [] => []
    xs => [@tree.Node(id=Section("packages-section"), "Sub Packages", xs)]
  }
  let symbols = match self.package {
    None => []
    Some(pkg) => pkg.to_document_items()
  }
  [..symbols, ..package_section]
}

///|
fn compare_items[Id](a : @tree.Tree[Id], b : @tree.Tree[Id]) -> Int {
  compare_strings(a.get_name(), b.get_name())
}

///|
priv enum ItemTarget {
  Package(String)
  Symbol(String)
  Section(String)
} derive(Compare, Eq, Show)

///|
fn PackageIndex::to_document_items(
  self : PackageIndex
) -> Array[@tree.Tree[ItemTarget]] {
  let { traits, types, typealias_, values, misc, path: _ } = self
  let values = values.map(fn(x) { @tree.Item(id=Symbol(x.name), x.name) }) +
    misc.map(fn(misc) {
      if misc.methods.is_empty() {
        @tree.Item(id=Symbol(misc.name), misc.name)
      } else {
        @tree.Node(
          id=Symbol(misc.name),
          misc.name,
          misc.methods.map(fn(meth) {
            @tree.Item(id=Symbol(misc.name + "::" + meth), meth)
          }),
        )
      }
    })
  let traits = traits.map(fn(x) { @tree.Item(id=Symbol(x.name), x.name) })
  let types = types.map(fn(ty) {
      if ty.methods.is_empty() {
        @tree.Item(id=Symbol(ty.name), ty.name)
      } else {
        @tree.Node(
          id=Symbol(ty.name),
          ty.name,
          ty.methods.map(fn(meth) {
            @tree.Item(id=Symbol(ty.name + "::" + meth), meth)
          }),
        )
      }
    }) +
    typealias_.map(fn(x) { @tree.Item(id=Symbol(x.name), x.name) })
  let result = []
  if not(traits.is_empty()) {
    result.push(
      @tree.Node(
        id=Section("trait-section"),
        "Traits",
        traits..sort_by(compare_items),
      ),
    )
  }
  if not(types.is_empty()) {
    result.push(
      @tree.Node(
        id=Section("type-section"),
        "Types",
        types..sort_by(compare_items),
      ),
    )
  }
  if not(values.is_empty()) {
    result.push(
      Node(
        id=Section("value-section"),
        "Values",
        values..sort_by(compare_items),
      ),
    )
  }
  result
}

///|
fn sidebar(
  document_index : Array[@tree.Tree[ItemTarget]],
  source_files : Array[String],
  showing : String,
  package_path~ : String,
  sidebar_state : @immut/sorted_set.T[ItemTarget]
) -> @html.T[Msg] {
  @view.accordion(
    class="text-gray-700 flex flex-col",
    click=Msg::SidebarCategoryClicked,
    showing,
    [
      (
        "Documentation",
        @tree.view(
          toggle=Msg::ToggleSidebarItem,
          click=Msg::ClickSidebarItem,
          state=sidebar_state,
          indicator=Symbol(""),
          document_index,
        ),
      ),
      ("Source files", source_list(source_files, package_path~)),
    ],
  )
}
