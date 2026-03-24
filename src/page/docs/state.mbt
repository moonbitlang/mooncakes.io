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
  GotManifest(Result[Manifest, String])
  GotModuleMeta(Result[MetaInfo, String])
  GotReadme(Result[String, String])
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
  CopyInstallFailed(String)
  ShowLargePackage
  ToggleTheme
}

///|
struct Model {
  fragment : String
  path : String
  manifest : Status[Manifest]
  module_meta : Status[MetaInfo]
  readme_content : Status[String]
  module_index : Status[ModuleIndex]
  package_data : Status[PackageData]
  search_entries : Status[Lazy[Array[SearchEntry]]]
  // The collapsed documents in the main view
  collapsed_docs : FoldedState
  // The sidebar items related to current package, including the sub-packages
  sidebar_document : Array[@tree.Tree[ItemTarget]]
  // The collapsed items in the sidebar
  sidebar_collapsed : SortedSet[ItemTarget]
  // The current expanded tab in the sidebar
  sidebar_tab : String
  // The sidebar fab button
  sidebar_fab : Bool
  search : SearchModel
  install_copied : Bool
  hide_large_package : Bool
}

///|
pub fn load(
  path : String,
  fragment : String?,
  dispatch~ : (Msg) -> Cmd,
) -> (Cmd, Model) {
  let path = path.trim(char_set="/").to_string()
  let module_path = docs_module_path(path)
  let module_api_path = docs_module_api_path(path)
  (
    batch([
      @http.get(
        "/api/v0/manifest/" + path,
        expect=Json(result => dispatch(GotManifest(result)), decode_manifest),
      ),
      @http.get(
        "/api/v0/modules/" + module_api_path,
        expect=Json(
          result => dispatch(GotModuleMeta(result)),
          decode_module_meta,
        ),
      ),
      @http.get(
        "/assets/" + path + "/resource.json",
        expect=Json(
          result => dispatch(GotReadme(result)),
          decode_readme_content,
        ),
      ),
      @http.get(
        "/assets/" + module_path + "/module_index.json",
        expect=Json(
          result => dispatch(GotModuleIndex(result)),
          decode_module_index,
        ),
      ),
      @dialog.close("search-panel"),
    ]),
    {
      module_index: Loading,
      fragment: fragment.unwrap_or(""),
      path,
      manifest: Loading,
      module_meta: Loading,
      readme_content: Loading,
      sidebar_document: [],
      sidebar_collapsed: @immut/sorted_set.new(),
      sidebar_tab: "Documentation",
      sidebar_fab: false,
      package_data: Loading,
      collapsed_docs: FoldedState::new(),
      search: { filter: "", results: Loading },
      search_entries: Loading,
      install_copied: false,
      hide_large_package: true,
    },
  )
}

///|
pub fn update(
  msg : Msg,
  model : Model,
  dispatch~ : (Msg) -> Cmd,
) -> (Cmd, Model) {
  match msg {
    GotManifest(result) =>
      match result {
        Ok(manifest) => {
          let cmd = if manifest.has_package {
            @http.get(
              "/assets/" + model.path + "/package_data.json",
              expect=Json(
                result => dispatch(GotPackageData(result)),
                decode_package_data,
              ),
            )
          } else {
            none
          }
          let package_data = if manifest.has_package {
            model.package_data
          } else {
            Failed
          }
          (cmd, { ..model, manifest: Success(manifest), package_data })
        }
        Err(_) => (none, { ..model, manifest: Failed, package_data: Failed })
      }
    GotModuleMeta(result) =>
      (
        none,
        match result {
          Ok(module_meta) => { ..model, module_meta: Success(module_meta) }
          Err(_) => { ..model, module_meta: Failed }
        },
      )
    GotReadme(result) =>
      (
        none,
        match result {
          Ok(readme_content) =>
            { ..model, readme_content: Success(readme_content) }
          Err(msg) => {
            println(msg)
            { ..model, readme_content: Failed }
          }
        },
      )
    GotModuleIndex(result) =>
      (
        none,
        match result {
          Ok(module_index) => {
            let sidebar_document = match
              module_index.0.find_node(docs_lookup_path(model.path)) {
              Some(node) => node.to_document_items()
              None => []
            }
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
        Err(_) => { ..model, package_data: Failed }
      }
      (@nav.scroll_to(model.fragment), model)
    }
    ToggleDocDetail(id) => {
      let folded_items = if model.collapsed_docs.contains(id) {
        model.collapsed_docs.remove(id)
      } else {
        model.collapsed_docs.add(id)
      }
      (none, { ..model, collapsed_docs: folded_items })
    }
    DocModeChanged(card_mode) =>
      (
        none,
        { ..model, collapsed_docs: model.collapsed_docs.set_mode(card_mode) },
      )
    SidebarTabClicked(sidebar_tab) => (none, { ..model, sidebar_tab, })
    ToggleSidebarItem(id) => {
      let sidebar_collapsed = if model.sidebar_collapsed.contains(id) {
        model.sidebar_collapsed.remove(id)
      } else {
        model.sidebar_collapsed.add(id)
      }
      (none, { ..model, sidebar_collapsed, })
    }
    ClickSidebarItem(id) => {
      let model = { ..model, sidebar_fab: false }
      match id {
        Package(path) => {
          let path = docs_apply_current_version(path, model.path)
          (@nav.push_url("/docs/" + path), { ..model, path, })
        }
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
      (none, { ..model, search, })
    }
    ToggleSidebarFab => {
      let sidebar_fab = !model.sidebar_fab
      (none, { ..model, sidebar_fab, })
    }
    CopyInstallCommand(command) =>
      (
        @clipboard.copy(Text(command), copied=dispatch(CopyInstallSuccess), failed=reason => {
          dispatch(CopyInstallFailed(reason))
        }),
        model,
      )
    CopyInstallSuccess => (none, { ..model, install_copied: true })
    CopyInstallFailed(reason) => {
      println(reason)
      (none, { ..model, install_copied: false })
    }
    ShowLargePackage => (none, { ..model, hide_large_package: false })
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
