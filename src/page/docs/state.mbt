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
  ToggleBuildLog
  GotBuildLog(Result[String, String])
  GotResource(Result[ResourceInfo, String])
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
  ClickAnchor(String)
}

///|
struct Model {
  fragment : String
  path : String
  manifest : Status[Manifest]
  module_meta : Status[MetaInfo]
  build_log_open : Bool
  build_log : BuildLogStatus
  readme_content : Status[String]
  source_files : Array[String]
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
priv enum BuildLogStatus {
  LogIdle
  LogLoading
  LogFailed
  LogSuccess(String)
}

///|
extern "js" fn encode_uri_component(value : String) -> String = "(value) => encodeURIComponent(value)"

///|
extern "js" fn smooth_scroll_to_element(id : String) -> Unit =
  #| (id) => {
  #|   const el = document.getElementById(id);
  #|   if (el) el.scrollIntoView({ behavior: 'smooth' });
  #| }

///|
pub fn scroll_to_smooth(id : String) -> Cmd {
  @rabbita.effect(fn() { smooth_scroll_to_element(id) })
}

///|
fn has_docs_assets(build_status : BuildStatus?) -> Bool {
  match build_status {
    Some(BuildSuccess | BuildLegacy) => true
    _ => false
  }
}

///|
fn log_docs_error(msg : String) -> Unit {
  if msg.contains("Json parse error") {
    ()
  } else {
    println(msg)
  }
}

///|
fn load_docs_assets(
  path : String,
  manifest : Manifest,
  dispatch : (Msg) -> Cmd,
) -> Array[Cmd] {
  let module_name = manifest.module_
  let version = manifest.version
  let asset_path = versioned_asset_path(path, module_name, version)
  let current_module_path = docs_current_module_path(path, manifest.module_)
  let module_asset_path = versioned_asset_path(
    current_module_path, module_name, version,
  )
  [
    @http.get(
      "/assets/" + asset_path + "/resource.json",
      expect=Json(result => dispatch(GotResource(result)), decode_resource_info),
    ),
    @http.get(
      "/assets/" + module_asset_path + "/module_index.json",
      expect=Json(
        result => dispatch(GotModuleIndex(result)),
        decode_module_index,
      ),
    ),
    ..if manifest.has_package {
      [
        @http.get(
          "/assets/" + asset_path + "/package_data.json",
          expect=Json(
            result => dispatch(GotPackageData(result)),
            decode_package_data,
          ),
        ),
      ]
    } else {
      []
    },
  ]
}

///|
fn get_text(url : String, on_result : (Result[String, String]) -> Cmd) -> Cmd {
  let expect : @http.Expecting[Cmd, String] = Text(on_result)
  @http.get(url, expect~)
}

///|
pub fn load(
  path : String,
  fragment : String?,
  dispatch~ : (Msg) -> Cmd,
) -> (Cmd, Model) {
  let path = path.trim(char_set="/").to_string()
  (
    batch([
      @http.get(
        "/api/v0/manifest/" + path,
        expect=Json(result => dispatch(GotManifest(result)), decode_manifest),
      ),
      @dialog.close("search-panel"),
    ]),
    {
      module_index: Loading,
      fragment: fragment.unwrap_or(""),
      path,
      manifest: Loading,
      module_meta: Loading,
      build_log_open: false,
      build_log: LogIdle,
      readme_content: Loading,
      source_files: [],
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
          let has_docs = has_docs_assets(manifest.module_meta.build_status)
          let cmd = if has_docs {
            batch(load_docs_assets(model.path, manifest, dispatch))
          } else {
            none
          }
          (
            cmd,
            {
              ..model,
              manifest: Success(manifest),
              module_meta: Success(manifest.module_meta),
              readme_content: if has_docs {
                Loading
              } else {
                Failed
              },
              source_files: [],
              module_index: if has_docs {
                Loading
              } else {
                Failed
              },
              package_data: if has_docs &&
                !(model.path == manifest.name && !manifest.has_package) {
                Loading
              } else {
                Failed
              },
            },
          )
        }
        Err(_) =>
          (
            none,
            {
              ..model,
              manifest: Failed,
              module_meta: Failed,
              readme_content: Failed,
              source_files: [],
              module_index: Failed,
              package_data: Failed,
            },
          )
      }
    ToggleBuildLog => {
      let build_log_open = !model.build_log_open
      let cmd = match (build_log_open, model.build_log, model.manifest) {
        (true, LogIdle | LogFailed, Success(manifest)) =>
          get_text(
            "/api/v0/builds/log?module=" +
            encode_uri_component(manifest.module_) +
            "&version=" +
            encode_uri_component(manifest.version),
            (result : Result[String, String]) => dispatch(GotBuildLog(result)),
          )
        _ => none
      }
      let build_log = match (build_log_open, model.build_log) {
        (true, LogIdle | LogFailed) => LogLoading
        _ => model.build_log
      }
      (cmd, { ..model, build_log_open, build_log })
    }
    GotBuildLog(result) =>
      (
        none,
        match result {
          Ok(log) => { ..model, build_log: LogSuccess(log) }
          Err(msg) => {
            println(msg)
            { ..model, build_log: LogFailed }
          }
        },
      )
    GotResource(result) =>
      (
        none,
        match result {
          Ok(resource) =>
            {
              ..model,
              readme_content: Success(resource.readme_content),
              source_files: resource.source_files,
            }
          Err(msg) => {
            log_docs_error(msg)
            { ..model, readme_content: Failed, source_files: [] }
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
            // Expand first-level items by default
            let sidebar_collapsed = sidebar_document.fold(
              init=model.sidebar_collapsed,
              fn(set, item) {
                match item {
                  Node(id~, _, _) => set.add(id)
                  _ => set
                }
              },
            )
            {
              ..model,
              sidebar_document,
              sidebar_collapsed,
              module_index: Success(module_index),
              search_entries: Success(
                Lazy::new(load_search_entries(module_index)),
              ),
            }
          }
          Err(msg) => {
            log_docs_error(msg)
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
          let current_module_path = match model.manifest {
            Success(manifest) =>
              docs_current_module_path(model.path, manifest.module_)
            _ => docs_module_path(model.path)
          }
          let path = docs_apply_current_version(path, current_module_path)
          (@nav.push_url("/docs/" + path), { ..model, path, })
        }
        Symbol(id) | Section(id) =>
          (batch([@nav.push_url("#" + id), scroll_to_smooth(id)]), model)
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
    ClickAnchor(id) =>
      (batch([@nav.push_url("#" + id), scroll_to_smooth(id)]), model)
  }
}

///|
pub fn get_path(model : Model) -> String {
  model.path
}

///|
pub fn is_theme_toggle(msg : Msg) -> Bool {
  match msg {
    ToggleTheme => true
    _ => false
  }
}
