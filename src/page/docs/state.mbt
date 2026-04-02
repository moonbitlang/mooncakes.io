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
  ToggleSidebarItem(ItemTarget)
  ClickSidebarItem(ItemTarget)
  ExpandAllSidebar
  CollapseAllSidebar
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
  path : Result[@util.MooncakePath, @util.UnsolvedMooncakePath]
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
extern "js" fn smooth_scroll_to_top() -> Unit =
  #| () => { window.scrollTo({ top: 0, behavior: 'smooth' }); }

///|
pub fn scroll_to_top() -> Cmd {
  @rabbita.effect(fn() { smooth_scroll_to_top() })
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
  resolved : @util.MooncakePath,
  manifest : Manifest,
  dispatch : (Msg) -> Cmd,
) -> Array[Cmd] {
  let asset_path = make_versioned_asset_path(resolved)
  let module_asset_path = resolved.module_path() + "@" + resolved.version()
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
    if manifest.has_package {
      @http.get(
        "/assets/" + asset_path + "/package_data.json",
        expect=Json(
          result => dispatch(GotPackageData(result)),
          decode_package_data,
        ),
      )
    } else {
      none
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
  path : @util.UnsolvedMooncakePath,
  fragment : String?,
  dispatch~ : (Msg) -> Cmd,
) -> (Cmd, Model) {
  let path_str = path.package_path()
  (
    batch([
      @http.get(
        "/api/v0/manifest/" + path_str,
        expect=Json(result => dispatch(GotManifest(result)), decode_manifest),
      ),
      @dialog.close("search-panel"),
    ]),
    {
      module_index: Loading,
      fragment: fragment.unwrap_or(""),
      path: Err(path),
      manifest: Loading,
      module_meta: Loading,
      build_log_open: false,
      build_log: LogIdle,
      readme_content: Loading,
      source_files: [],
      sidebar_document: [],
      sidebar_collapsed: @immut/sorted_set.new(),
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
          let unsolved = match model.path {
            Err(u) => u
            Ok(resolved) =>
              @util.UnsolvedMooncakePath::new(resolved.package_path())
          }
          let resolved = @util.MooncakePath::resolve(
            unsolved,
            module_path=manifest.module_,
            latest_version=manifest.version,
          )
          let path : Result[@util.MooncakePath, @util.UnsolvedMooncakePath] = match
            resolved {
            Some(r) => Ok(r)
            None => Err(unsolved)
          }
          let has_docs = has_docs_assets(manifest.module_meta.build_status)
          let cmd = if has_docs {
            match resolved {
              Some(resolved) =>
                batch(load_docs_assets(resolved, manifest, dispatch))
              None => none
            }
          } else {
            none
          }
          let is_root_package = match resolved {
            Some(resolved) => resolved.package_path() == manifest.name
            None => false
          }
          (
            cmd,
            {
              ..model,
              path,
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
                !(is_root_package && !manifest.has_package) {
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
            let sidebar_document = module_index.0.to_document_items()
            {
              ..model,
              sidebar_document,
              module_index: Success(module_index),
              search_entries: Success(
                Lazy::new(
                  {
                    let (module_name, module_version) = match model.manifest {
                      Success(manifest) => (manifest.module_, manifest.version)
                      _ => ("", "")
                    }
                    load_search_entries(
                      module_index,
                      module_name~,
                      module_version~,
                    )
                  },
                ),
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
        Ok({ types, traits, errors, misc, .. } as package_data) => {
          // collapse all implementations by default
          let types_impls = types.iter().flat_map(fn(x) { x.impls.iter() })
          let traits_impls = traits.iter().flat_map(fn(x) { x.impls.iter() })
          let errors_impls = errors.iter().flat_map(fn(x) { x.impls.iter() })
          let misc_impls = misc.iter().flat_map(fn(x) { x.impls.iter() })
          let collapsed_docs = types_impls
            .concat(traits_impls)
            .concat(errors_impls)
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
        Group(id) => {
          // Group nodes have no package, just toggle expand/collapse
          let sidebar_collapsed = if model.sidebar_collapsed.contains(Group(id)) {
            model.sidebar_collapsed.remove(Group(id))
          } else {
            model.sidebar_collapsed.add(Group(id))
          }
          (none, { ..model, sidebar_collapsed, })
        }
        Package(path) => {
          let url_path = match model.manifest {
            Success(manifest) =>
              versioned_docs_path(path, manifest.module_, manifest.version)
            _ => path
          }
          (@nav.push_url("/docs/" + url_path), model)
        }
        Symbol(pkg_path~, kind=KReadme, _) => {
          let url_path = match model.manifest {
            Success(manifest) =>
              versioned_docs_path(pkg_path, manifest.module_, manifest.version)
            _ => pkg_path
          }
          (batch([@nav.push_url("/docs/" + url_path), scroll_to_top()]), model)
        }
        Symbol(pkg_path~, id, ..) => {
          let same_package = match model.path {
            Ok(resolved) => resolved.package_path() == pkg_path
            Err(_) => false
          }
          if same_package {
            (batch([@nav.push_url("#" + id), scroll_to_smooth(id)]), model)
          } else {
            let url_path = match model.manifest {
              Success(manifest) =>
                versioned_docs_path(
                  pkg_path,
                  manifest.module_,
                  manifest.version,
                )
              _ => pkg_path
            }
            (@nav.push_url("/docs/" + url_path + "#" + id), model)
          }
        }
      }
    }
    ExpandAllSidebar => {
      fn collect_node_ids(
        items : Array[@tree.Tree[ItemTarget]],
        set : SortedSet[ItemTarget],
      ) -> SortedSet[ItemTarget] {
        items.fold(init=set, fn(s, item) {
          match item {
            @tree.Node(id~, _, children) =>
              collect_node_ids(children, s.add(id))
            _ => s
          }
        })
      }

      let sidebar_collapsed = collect_node_ids(
        model.sidebar_document,
        model.sidebar_collapsed,
      )
      (none, { ..model, sidebar_collapsed, })
    }
    CollapseAllSidebar =>
      (none, { ..model, sidebar_collapsed: @immut/sorted_set.new() })
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
  match model.path {
    Ok(resolved) => resolved.package_path()
    Err(unsolved) => unsolved.package_path()
  }
}

///|
pub fn is_same_path(
  model : Model,
  new_path : @util.UnsolvedMooncakePath,
) -> Bool {
  match model.path {
    Ok(resolved) => resolved.is_same_package(new_path, check_version=false)
    Err(_) => false
  }
}

///|
pub fn is_same_module(
  model : Model,
  new_path : @util.UnsolvedMooncakePath,
) -> Bool {
  match model.path {
    Ok(resolved) => resolved.is_same_module(new_path, check_version=false)
    Err(_) => false
  }
}

///|
pub fn navigate_package(
  model : Model,
  path : @util.UnsolvedMooncakePath,
  fragment : String?,
  dispatch~ : (Msg) -> Cmd,
) -> (Cmd, Model) {
  match model.manifest {
    Success(manifest) => {
      let resolved = @util.MooncakePath::resolve(
        path,
        module_path=manifest.module_,
        latest_version=manifest.version,
      )
      let model_path : Result[@util.MooncakePath, @util.UnsolvedMooncakePath] = match
        resolved {
        Some(r) => Ok(r)
        None => Err(path)
      }
      let has_docs = has_docs_assets(manifest.module_meta.build_status)
      if !has_docs {
        return (
          none,
          {
            ..model,
            path: model_path,
            readme_content: Failed,
            source_files: [],
            package_data: Failed,
          },
        )
      }
      match resolved {
        Some(r) => {
          let asset_path = make_versioned_asset_path(r)
          let cmds : Array[Cmd] = [
            @http.get(
              "/assets/" + asset_path + "/resource.json",
              expect=Json(
                result => dispatch(GotResource(result)),
                decode_resource_info,
              ),
            ),
            @http.get(
              "/assets/" + asset_path + "/package_data.json",
              expect=Json(
                result => dispatch(GotPackageData(result)),
                decode_package_data,
              ),
            ),
          ]
          (
            batch(cmds),
            {
              ..model,
              path: model_path,
              fragment: fragment.unwrap_or(""),
              readme_content: Loading,
              source_files: [],
              package_data: Loading,
              collapsed_docs: FoldedState::new(),
              hide_large_package: true,
            },
          )
        }
        None => load(path, fragment, dispatch~)
      }
    }
    _ => load(path, fragment, dispatch~)
  }
}

///|
pub fn is_theme_toggle(msg : Msg) -> Bool {
  match msg {
    ToggleTheme => true
    _ => false
  }
}
