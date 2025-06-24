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
            let sidebar_document = module_index
              .inner()
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
