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
/// Compare two strings in dictionary order
fn compare_strings(a : String, b : String) -> Int {
  let len_a = a.length()
  let len_b = b.length()
  let min_len = if len_a < len_b { len_a } else { len_b }
  for i in 0..<min_len {
    let char_a = a[i].to_int()
    let char_b = b[i].to_int()
    if char_a != char_b {
      return char_a - char_b
    }
  }
  len_a - len_b
}

///|
fn IndexNode::to_document_items(
  self : IndexNode,
) -> Array[@tree.Tree[ItemTarget]] {
  fn build_tree(
    parent_path : String,
    node : IndexNode,
  ) -> @tree.Tree[ItemTarget]? {
    let full_path = if parent_path.is_empty() {
      node.name
    } else {
      parent_path + "/" + node.name
    }
    let sub_packages : Array[@tree.Tree[ItemTarget]] = node.childs
      .values()
      .filter_map(fn(child) { build_tree(full_path, child) })
      .collect()
    sub_packages.sort_by(compare_items)
    let symbols = match node.pkg {
      Some(pkg) => pkg.to_document_items()
      None => []
    }
    let children = [..sub_packages, ..symbols]
    match (node.pkg, children) {
      (None, []) => None
      (None, _) => Some(@tree.Node(id=Group(full_path), node.name, children))
      (Some(pkg), []) => Some(@tree.Item(id=Package(pkg.path), node.name))
      (Some(pkg), _) =>
        Some(@tree.Node(id=Package(pkg.path), node.name, children))
    }
  }

  let items : Array[@tree.Tree[ItemTarget]] = self.childs
    .values()
    .filter_map(fn(child) { build_tree(self.name, child) })
    .collect()
  // Flatten single top-level group nodes (e.g. "async" when viewing moonbitlang/async)
  match items {
    [@tree.Node(_, children, ..)] => children
    _ => items
  }
}

///|
fn[Id] compare_items(a : @tree.Tree[Id], b : @tree.Tree[Id]) -> Int {
  compare_strings(a.get_name(), b.get_name())
}

///|
priv enum SymbolKind {
  KReadme
  KTrait
  KType
  KTypeAlias
  KValue
  KMethod
} derive(Compare, Eq)

///|
priv enum ItemTarget {
  Package(String)
  Group(String)
  Symbol(pkg_path~ : String, kind~ : SymbolKind, String)
} derive(Compare, Eq)

///|
fn PkgIndex::to_document_items(
  self : PkgIndex,
) -> Array[@tree.Tree[ItemTarget]] {
  let { traits, types, typealias_, values, misc, path } = self
  let readme_item : @tree.Tree[ItemTarget] = @tree.Item(
    id=Symbol(pkg_path=path, kind=KReadme, "readme"),
    "README",
  )
  let result : Array[@tree.Tree[ItemTarget]] = []
  for t in traits {
    result.push(
      @tree.Item(id=Symbol(pkg_path=path, kind=KTrait, t.name), t.name),
    )
  }
  for ty in types {
    if ty.methods.is_empty() {
      result.push(
        @tree.Item(id=Symbol(pkg_path=path, kind=KType, ty.name), ty.name),
      )
    } else {
      result.push(
        @tree.FixedNode(
          id=Symbol(pkg_path=path, kind=KType, ty.name),
          ty.name,
          ty.methods.map(fn(meth) {
            @tree.Item(
              id=Symbol(pkg_path=path, kind=KMethod, ty.name + "::" + meth),
              meth,
            )
          }),
        ),
      )
    }
  }
  for ta in typealias_ {
    result.push(
      @tree.Item(id=Symbol(pkg_path=path, kind=KTypeAlias, ta.name), ta.name),
    )
  }
  for v in values {
    result.push(
      @tree.Item(id=Symbol(pkg_path=path, kind=KValue, v.name), v.name),
    )
  }
  for m in misc {
    if m.methods.is_empty() {
      result.push(
        @tree.Item(id=Symbol(pkg_path=path, kind=KType, m.name), m.name),
      )
    } else {
      result.push(
        @tree.FixedNode(
          id=Symbol(pkg_path=path, kind=KType, m.name),
          m.name,
          m.methods.map(fn(meth) {
            @tree.Item(
              id=Symbol(pkg_path=path, kind=KMethod, m.name + "::" + meth),
              meth,
            )
          }),
        ),
      )
    }
  }
  result.sort_by(compare_items)
  result.insert(0, readme_item)
  result
}

///|
fn sidebar_icon(id : ItemTarget, expanded : Bool) -> Html {
  match id {
    Package(_) | Group(_) =>
      if expanded {
        img(src=@config.FOLDER_OPEN, class="size-4 shrink-0 ui-icon", nothing)
      } else {
        img(src=@config.FOLDER_CLOSE, class="size-4 shrink-0 ui-icon", nothing)
      }
    Symbol(_, kind=KReadme, ..) =>
      img(src=@config.FILE_ICON, class="size-4 shrink-0 ui-icon", nothing)
    Symbol(_, kind~, ..) => symbol_icon(kind)
  }
}

///|
fn symbol_icon(kind : SymbolKind) -> Html {
  let (bg, label) = match kind {
    KReadme => ("bg-gray-200 text-gray-500", "R")
    KTrait => ("bg-blue-100 text-blue-600", "Tr")
    KType => ("bg-emerald-100 text-emerald-600", "T")
    KTypeAlias => ("bg-violet-100 text-violet-600", "A")
    KValue => ("bg-amber-100 text-amber-600", "V")
    KMethod => ("bg-orange-100 text-orange-600", "f")
  }
  div(
    class="size-4 shrink-0 rounded flex items-center justify-center text-[8px] font-bold leading-none \{bg}",
    [text(label)],
  )
}

///|
fn sidebar(
  document_index : Array[@tree.Tree[ItemTarget]],
  sidebar_state : SortedSet[ItemTarget],
  dispatch : (Msg) -> Cmd,
) -> Html {
  div(class="text-gray-700 flex flex-col", [
    div(
      class="flex items-center gap-1 px-1 sticky top-0 z-10 pt-3 pb-1.5 border-b border-gray-100 mb-1",
      style=["background-color: #fafafa"],
      [
        @html.button(
          class="text-[11px] text-gray-400 hover:text-gray-600 px-1.5 py-0.5 rounded hover:bg-gray-100 transition-colors",
          on_click=dispatch(ExpandAllSidebar),
          [text("Expand all")],
        ),
        @html.button(
          class="text-[11px] text-gray-400 hover:text-gray-600 px-1.5 py-0.5 rounded hover:bg-gray-100 transition-colors",
          on_click=dispatch(CollapseAllSidebar),
          [text("Collapse all")],
        ),
      ],
    ),
    @tree.view(
      toggle=x => dispatch(ToggleSidebarItem(x)),
      click=x => dispatch(ClickSidebarItem(x)),
      state=sidebar_state,
      indicator=Symbol(pkg_path="", kind=KValue, ""),
      icon=sidebar_icon,
      document_index,
    ),
  ])
}

///|
fn source_files_section(files : Array[String], package_path~ : String) -> Html {
  if files.is_empty() {
    return nothing
  }
  let package_path = package_path.trim(char_set="/")
  div(class="mx-4 md:mx-0 mt-8 mb-4", [
    h3(class="text-gray-800 font-semibold text-lg mb-3 border-b pb-2", [
      text("Source Files"),
    ]),
    ul(
      class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-1",
      files.map(fn(x) {
        @html.li([
          a(
            class="block text-sm font-mono text-blue-600 hover:text-blue-800 hover:bg-gray-50 px-2 py-1 rounded transition-colors",
            href="/assets/\{package_path}/\{x}.html",
            escape=true,
            [text(x)],
          ),
        ])
      }),
    ),
  ])
}
