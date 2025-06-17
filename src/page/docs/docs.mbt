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
enum Msg {
  ToggleDocDetail(String)
  DocModeChanged(CardMode)
  GotResource(Result[Resource, String])
  GotModuleIndex(Result[ModuleIndex, String])
  GotPackageData(Result[PackageData, String])
  SidebarTabClicked(String)
  ToggleSidebarItem(ItemTarget)
  ClickSidebarItem(ItemTarget)
  ToggleSearchPanel(Bool)
  SearchFilterChanged(String)
  ToggleSidebarFab
  CopyInstallCommand(String)
  CopyInstallSuccess
}

///|
struct Model {
  fragment : String
  path : String
  resource : Status[Resource]
  module_index : Status[ModuleIndex]
  package_data : Status[PackageData]
  search_entries : Status[Lazy[Array[SearchEntry]]]
  // The collapsed documents in the main view
  collapsed_docs : FoldedState
  // The sidebar items related to current package, including the sub-packages
  sidebar_document : Array[@tree.Tree[ItemTarget]]
  // The collapsed items in the sidebar
  sidebar_collapsed : Set[ItemTarget]
  // The current expanded tab in the sidebar
  sidebar_tab : String
  // The sidebar fab button
  sidebar_fab : Bool
  search : SearchModel
  install_copied : Bool
}

///|
pub fn load(path : String, fragment : String?) -> (Cmd[Msg], Model) {
  (
    batch([
      @http.get(
        "/assets/" + path.trim("/").to_string() + "/resource.json",
        expect=Json(GotResource(_), decode_resource),
      ),
      @dialog.close("search-panel"),
    ]),
    {
      module_index: Loading,
      fragment: fragment.or(""),
      path,
      sidebar_document: [],
      sidebar_collapsed: @immut/sorted_set.new(),
      sidebar_tab: "Documentation",
      sidebar_fab: false,
      package_data: Loading,
      collapsed_docs: FoldedState::new(),
      resource: Loading,
      search: { filter: "", results: Loading },
      search_entries: Loading,
      install_copied: false,
    },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    GotResource(result) =>
      match result {
        Ok({ kind, .. } as resource) => {
          let cmd = match kind {
            Module({ module_index_path, .. }) =>
              @http.get(
                "/assets/" + module_index_path,
                expect=Json(GotModuleIndex(_), decode_module_index),
              )
            Package({ package_data_path, module_path, .. }) =>
              batch([
                @http.get(
                  "/assets/" + package_data_path,
                  expect=Json(GotPackageData(_), decode_package_data),
                ),
                @http.get(
                  "/assets/" + module_path + "/module_index.json",
                  expect=Json(GotModuleIndex(_), decode_module_index),
                ),
              ])
            RootPackage({ module_index_path, package_data_path, .. }) =>
              batch([
                @http.get(
                  "/assets/" + module_index_path,
                  expect=Json(GotModuleIndex(_), decode_module_index),
                ),
                @http.get(
                  "/assets/" + package_data_path,
                  expect=Json(GotPackageData(_), decode_package_data),
                ),
              ])
          }
          (cmd, { ..model, resource: Success(resource) })
        }
        Err(msg) => {
          println(msg)
          (none(), { ..model, resource: Failed })
        }
      }
    GotModuleIndex(result) =>
      (
        none(),
        match result {
          Ok(module_index) => {
            let sidebar_document = module_index._
              .find_node(model.path)
              .unwrap()
              .to_document_items()
            {
              ..model,
              sidebar_document,
              module_index: Success(module_index),
              search_entries: Success(
                Lazy::new(load_search_entries(module_index)),
              ),
            }
          }
          Err(msg) => {
            println(msg)
            { ..model, module_index: Failed }
          }
        },
      )
    GotPackageData(result) => {
      let model = match result {
        Ok({ types, traits, misc, .. } as package_data) => {
          // collapse all implementations by default
          let types_impls = types.iter().flat_map(fn(x) { x.impls.iter() })
          let traits_impls = traits.iter().flat_map(fn(x) { x.impls.iter() })
          let misc_impls = misc.iter().flat_map(fn(x) { x.impls.iter() })
          let collapsed_docs = types_impls
            .concat(traits_impls)
            .concat(misc_impls)
            .map(ImplDoc::get_id)
            .fold(init=model.collapsed_docs, FoldedState::add)
          { ..model, collapsed_docs, package_data: Success(package_data) }
        }
        Err(msg) => {
          println(msg)
          { ..model, package_data: Failed }
        }
      }
      (@nav.scroll_to(model.fragment), model)
    }
    ToggleDocDetail(id) => {
      let folded_items = if model.collapsed_docs.contains(id) {
        model.collapsed_docs.remove(id)
      } else {
        model.collapsed_docs.add(id)
      }
      (none(), { ..model, collapsed_docs: folded_items })
    }
    DocModeChanged(card_mode) =>
      (
        none(),
        { ..model, collapsed_docs: model.collapsed_docs.set_mode(card_mode) },
      )
    SidebarTabClicked(sidebar_tab) => (none(), { ..model, sidebar_tab, })
    ToggleSidebarItem(id) => {
      let sidebar_collapsed = if model.sidebar_collapsed.contains(id) {
        model.sidebar_collapsed.remove(id)
      } else {
        model.sidebar_collapsed.add(id)
      }
      (none(), { ..model, sidebar_collapsed, })
    }
    ClickSidebarItem(id) => {
      let model = { ..model, sidebar_fab: false }
      match id {
        Package(path) => (@nav.push_url("/docs/" + path), { ..model, path, })
        Symbol(id) | Section(id) => (@nav.scroll_to(id), model)
      }
    }
    ToggleSearchPanel(open) => {
      let cmd = if open {
        @dialog.show("search-panel")
      } else {
        @dialog.close("search-panel")
      }
      (cmd, model)
    }
    SearchFilterChanged(filter) => {
      let results = match model.search_entries {
        Failed => @util.Failed
        Loading => @util.Loading
        Success(indices) => Success(search(indices, filter))
      }
      let search = { filter, results }
      (none(), { ..model, search, })
    }
    ToggleSidebarFab => {
      let sidebar_fab = not(model.sidebar_fab)
      (none(), { ..model, sidebar_fab, })
    }
    CopyInstallCommand(command) =>
      (@clipboard.copy(Text(command), copied=Msg::CopyInstallSuccess), model)
    CopyInstallSuccess => (none(), { ..model, install_copied: true })
  }
}

///|
fn breadcrumbs(
  path : String,
  module_path : String,
  module_index : ModuleIndex
) -> Html[Msg] {
  let module_path = module_path.trim("/").to_string()
  let path = path.trim("/")
  let paths = path.trim_start("/").split("/").collect()
  let mut acc_path = ""
  let elems = []
  for path in paths {
    let path = path.to_string()
    acc_path += if acc_path == "" { path } else { "/" + path.to_string() }
    let elem = if acc_path.has_prefix(module_path) &&
      module_index._.find_node(acc_path) is Some(node) &&
      (acc_path == module_path || not(node.pkg.is_empty())) {
      a(klass="hover:underline", href="/docs/" + acc_path, [text(path)])
    } else {
      div(klass="text-gray-700 font-normal", [text(path)])
    }
    elems.push(elem)
  }
  let separator = div(klass="text-gray-300 text-base", [text(" / ")])
  div(
    klass="text-base text-gray-800 font-semibold flex gap-2",
    elems.iter().intersperse(separator).collect(),
  )
}

///|
fn logo() -> Html[Msg] {
  div(klass="w-full h-full flex justify-end border-b top-0 z-20", [
    div(klass="h-full flex items-center w-full 2xl:w-2/3", [
      a(klass="border-gray-300 w-full", href="/", [
        h1(klass="font-title text-gray-700 font-semibold mx-12", [
          text("🥮 mooncakes.io"),
        ]),
      ]),
    ]),
  ])
}

///|
fn navbar(
  path : String,
  module_path : String,
  module_index : ModuleIndex,
  card_mode : CardMode
) -> Html[Msg] {
  div(
    klass="bg-white w-full h-full border-b select-none flex items-center gap-4 pl-12 top-0 z-10",
    [
      if module_path == path {
        nothing()
      } else {
        breadcrumbs(path, module_path, module_index)
      },
      div(klass="flex-grow", []),
      card_mode_toggle(mode=card_mode, click=DocModeChanged(_)),
      button(
        klass="bg-gray-100 border hover:border-mooncake2 border-opacity-0 transition-all rounded mx-2 py-1 px-2 lg:w-1/5 text-gray-500 flex items-center gap-2",
        click=ToggleSearchPanel(true),
        [
          img(klass="w-5 h-5", src=@config.SEARCH, []),
          div(klass="hidden lg:block text-nowrap", [text("search")]),
        ],
      ),
    ],
  )
}

///|
pub fn view(model : Model) -> Html[Msg] {
  let navbar = match (model.module_index, model.resource) {
    (Success(module_index), Success(resource)) => {
      let module_path = match resource.kind {
        Module({ meta_info, .. }) => Some(meta_info.name)
        Package({ module_path, .. }) => Some(module_path)
        RootPackage(_) => Some(model.path)
      }
      navbar(
        model.path,
        module_path.or(""),
        module_index,
        model.collapsed_docs.card_mode,
      )
    }
    _ => nothing()
  }
  let source_files = match model.resource {
    Success(
      {
        kind: Package({ source_files, .. })
        | RootPackage({ source_files, .. }),
        ..,
      }
    ) => source_files
    _ => []
  }
  let sidebar_ele = div(klass="w-full h-full flex justify-end", [
    div(klass="pl-6 pr-3 py-3 overflow-y-auto w-full 2xl:w-2/3", [
      sidebar(
        model.sidebar_document,
        source_files,
        model.sidebar_tab,
        model.sidebar_collapsed,
        package_path=model.path,
      ),
    ]),
  ])
  let main = match model.resource {
    Success({ readme_content, kind }) => {
      let meta = match kind {
        Module({ meta_info: meta, .. })
        | RootPackage({ meta_info: meta, .. }) =>
          meta_info(meta, install_copied=model.install_copied)
        Package(_) => nothing()
      }
      div(klass="flex w-full min-h-full justify-begin", [
        div(klass="overflow-y-auto 2xl:w-4/5", [
          meta,
          document(
            readme_content~,
            package_data=model.package_data,
            folded=model.collapsed_docs,
          ),
        ]),
      ])
    }
    Failed => @view.document_not_available(model.path)
    Loading => @view.loading()
  }
  let search = model.search
  let search_panel = @html.dialog(
    klass="lg:backdrop:bg-black/30 lg:backdrop:backdrop-blur lg:rounded lg:shadow-lg absolute max-w-none max-h-none w-full h-screen m-0 lg:m-auto lg:w-2/5 lg:h-[80%]",
    id="search-panel",
    [
      div(
        klass="h-12 border-b bg-white rounded-none sticky top-0 text-base w-full flex",
        [
          @html.input(
            input_type=Text,
            value=search.filter,
            placeholder="search...",
            input=SearchFilterChanged(_),
            klass="outline-none m-0 flex-grow px-4 p-2",
          ),
          div(
            klass="size-12 container hover:bg-gray-200 flex justify-center items-center",
            click=ToggleSearchPanel(false),
            [img(src=@config.icon_close, [])],
          ),
        ],
      ),
      match search.results {
        Loading => nothing()
        Failed => text("load indices failed")
        Success(results) =>
          @html.ul(
            klass="overflow-y-auto flex-grow",
            results.map(fn(x) {
              let color = match x.entry.kind {
                "Package" => "text-yellow-700"
                "Trait" => "text-blue-700"
                "Type" => "text-green-700"
                "Method" => "text-moonbit"
                "Value" => "text-purple-700"
                _ => "text-gray-700"
              }
              @html.li(klass="border-b px-4 py-2 bg-white hover:bg-gray-100", [
                a(href=x.entry.href, klass="grid grid-cols-[1fr_auto] ", [
                  span(
                    klass="",
                    x.matching.map(fn {
                      (true, str) =>
                        span(klass="text-moonbit font-semibold", [
                          text(str.to_string()),
                        ])
                      (false, str) =>
                        span(klass="text-gray-600", [text(str.to_string())])
                    }),
                  ),
                  span(klass="font-thin text-tiny lg:text-base \{color}", [
                    text(x.entry.kind),
                  ]),
                ]),
              ])
            }),
          )
      },
    ],
  )
  let show_sidebar_dialog = if model.sidebar_fab { "flex" } else { "none" }
  let sidebar_dialog = div(
    klass="fixed inset-0 justify-center items-center",
    style=["display: " + show_sidebar_dialog],
    [
      div(
        klass="fixed inset-0 bg-black/40 z-10",
        style=["display: " + show_sidebar_dialog],
        click=ToggleSidebarFab,
        [],
      ),
      div(
        klass="bg-white w-3/4 h-3/4 overflow-y-auto rounded p-4 shadow-lg z-20",
        [
          sidebar(
            model.sidebar_document,
            source_files,
            model.sidebar_tab,
            model.sidebar_collapsed,
            package_path=model.path,
          ),
        ],
      ),
    ],
  )
  let fab = @html.button(
    klass="flex lg:hidden fixed bottom-4 right-4 bg-mooncake2 text-white rounded-full shadow-lg w-12 h-12 items-center justify-center cursor-pointer hover:bg-moonbit-dark transition-all select-none",
    click=ToggleSidebarFab,
    [img(klass="size-5", src=@config.HAMBURGER_BUTTON, [])],
  )
  div(
    klass="grid grid-rows-[3em_0_auto] grid-cols-1 lg:grid-rows-[3em_auto] lg:grid-cols-4 h-screen",
    [
      div(
        klass="bg-[#f7f7f7] col-start-1 row-start-1 hidden lg:block lg:col-start-1 col-span-1 lg:row-start-1 row-span-1",
        [logo()],
      ),
      div(
        klass="col-start-1 row-start-1 lg:col-start-2 col-span-3 lg:row-start-1 row-span-1",
        [navbar],
      ),
      div(
        klass="bg-[#f7f7f7] col-start-1 row-start-2 lg:col-start-1 col-span-1 lg:row-start-2 lg:row-span-2 overflow-y-auto scrollbar-thin scrollbar-thumb-gray-400 scrollbar-track-transparent",
        [sidebar_ele],
      ),
      div(
        klass="col-start-1 row-start-3 lg:col-start-2 lg:col-span-3 lg:row-start-2 lg:row-span-2 overflow-y-auto scrollbar-thin scrollbar-thumb-gray-400 scrollbar-track-transparent",
        [main],
      ),
      search_panel,
      sidebar_dialog,
      fab,
    ],
  )
}
