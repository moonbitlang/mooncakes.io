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
fn[M] item_button(childrens : Html[M], icon? : String, click? : M) -> Html[M] {
  let icon = match icon {
    None => div([])
    Some(src) => div(class="size-[12px] self-center mr-1", [img(src~, [])])
  }
  div(class="hover:bg-gray-100 px-2 py-1 rounded text-sm flex", click?, [
    icon, childrens,
  ])
}

///|
fn source_list(files : Array[String], package_path~ : String) -> Html[Msg] {
  if files.is_empty() {
    return text("No source files.")
  }
  let package_path = package_path.trim("/")
  div(class="", [
    ul(
      files.map(fn(x) {
        item_button(
          a(
            class="w-full",
            href="/assets/\{package_path}/\{x}.html",
            escape=true,
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
    let char_a = a.charcode_at(i)
    let char_b = b.charcode_at(i)
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
    match node.pkg {
      None if not(node.childs.is_empty()) => {
        let childs = node.childs.elems().filter_map(collect_packages)
        childs.sort_by(compare_items)
        Some(@tree.Node(id=ItemTarget::Package(node.name), node.name, childs))
      }
      Some(pkg) => Some(@tree.Item(id=Package(pkg.path), node.name))
      _ => None
    }
  }

  let packages = self.childs.elems().filter_map(collect_packages)
  packages.sort_by(compare_items)
  let package_section = match packages {
    [] => []
    xs => [@tree.Node(id=Section("packages-section"), "Sub Packages", xs)]
  }
  let symbols = match self.pkg {
    None => []
    Some(pkg) => pkg.to_document_items()
  }
  [..symbols, ..package_section]
}

///|
fn[Id] compare_items(a : @tree.Tree[Id], b : @tree.Tree[Id]) -> Int {
  compare_strings(a.get_name(), b.get_name())
}

///|
priv enum ItemTarget {
  Package(String)
  Symbol(String)
  Section(String)
} derive(Compare, Eq, Show)

///|
fn PkgIndex::to_document_items(
  self : PkgIndex
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
    traits.sort_by(compare_items)
    result.push(@tree.Node(id=Section("trait-section"), "Traits", traits))
  }
  if not(types.is_empty()) {
    types.sort_by(compare_items)
    result.push(@tree.Node(id=Section("type-section"), "Types", types))
  }
  if not(values.is_empty()) {
    values.sort_by(compare_items)
    result.push(Node(id=Section("value-section"), "Values", values))
  }
  result
}

///|
fn sidebar(
  document_index : Array[@tree.Tree[ItemTarget]],
  source_files : Array[String],
  showing : String,
  package_path~ : String,
  sidebar_state : Set[ItemTarget]
) -> Html[Msg] {
  @view.accordion(
    class="text-gray-700 flex flex-col",
    click=SidebarTabClicked(_),
    showing,
    [
      (
        "Documentation",
        @tree.view(
          toggle=ToggleSidebarItem(_),
          click=ClickSidebarItem(_),
          state=sidebar_state,
          indicator=Symbol(""),
          document_index,
        ),
      ),
      ("Source files", source_list(source_files, package_path~)),
    ],
  )
}
