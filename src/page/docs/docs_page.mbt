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
fn has_docs_assets(build_status : BuildStatus?) -> Bool {
  match build_status {
    Some(BuildSuccess | BuildLegacy) => true
    _ => false
  }
}

///|
fn docs_skeleton(
  requested : @util.UnsolvedMooncakePath,
  app_actions : Val[Html],
) -> Val[Html] {
  app_actions.view(app_actions => {
    unresolved_docs_layout(
      requested.package_path(),
      @view.skeleton_docs_content(),
      app_actions,
    )
  })
}

///|
fn docs_failed(
  requested : @util.UnsolvedMooncakePath,
  app_actions : Val[Html],
) -> Val[Html] {
  app_actions.view(app_actions => {
    unresolved_docs_layout(
      requested.package_path(),
      @view.document_not_available(requested.package_path()),
      app_actions,
    )
  })
}

///|
priv struct ResolvedModule {
  path : @util.MooncakePath
  manifest : Manifest
} derive(Eq)

///|
priv enum DocsPage {
  Loading(@util.UnsolvedMooncakePath)
  Failed(@util.UnsolvedMooncakePath)
  Resolved(ResolvedModule)
} derive(Eq)

///|
impl @rabbita.Enumerate for DocsPage with fn tag(self) {
  match self {
    Loading(requested) => "loading:\{requested}"
    Failed(requested) => "failed:\{requested}"
    Resolved(module_) =>
      "module:\{module_.path.module_path()}@\{module_.path.version()}"
  }
}

///|
fn docs_module(
  manifest : Manifest,
  path : Val[@util.UnsolvedMooncakePath],
  fragment : Val[String],
  app_actions : Val[Html],
) -> Val[Html] {
  let resolved = path.map(requested => {
    let resolved = @util.MooncakePath::resolve(
      requested,
      module_path=manifest.module_,
      latest_version=manifest.latest_version,
    )
    if resolved is Some(resolved) && resolved.version() == manifest.version {
      Some(resolved)
    } else {
      None
    }
  })
  let index : @rabbita.Resource[ModuleIndex]? = if has_docs_assets(
      manifest.module_meta.build_status,
    ) {
    let module_asset_path = "\{manifest.module_}@\{manifest.version}"
    Some(
      @rabbita.create_resource(inject => {
        @http.get(
          @config.asset_url("/assets/\{module_asset_path}/module_index.json"),
        ).expect_json(inject)
      }),
    )
  } else {
    None
  }
  let module_index = if index is Some(index) {
    index.map(status => Some(status))
  } else {
    Val::constant(None)
  }
  let search_panel = docs_search(module_index, manifest)
  let sidebar = docs_sidebar(module_index, resolved, manifest)
  let metadata = docs_metadata(manifest)
  let build_notice = docs_build_notice(manifest)
  let document = path.switch(requested => {
    let resolved = @util.MooncakePath::resolve(
      requested,
      module_path=manifest.module_,
      latest_version=manifest.latest_version,
    )
    if resolved is Some(resolved) && resolved.version() == manifest.version {
      docs_package(
        manifest,
        resolved,
        fragment,
        module_index=index,
        build_notice~,
      )
    } else {
      // TODO(rabbita#167): the outgoing branch can see the next module's path.
      Val::constant((@view.skeleton_docs_content(), nothing))
    }
  })
  document.view7(
    path,
    module_index,
    search_panel,
    sidebar,
    metadata,
    app_actions,
    fn(
      document,
      requested,
      module_index,
      search_panel,
      sidebar,
      metadata,
      app_actions,
    ) {
      let module_index = match module_index {
        Some(Loaded(index)) => Some(index)
        _ => None
      }
      let (content, document_actions) = document
      let path = requested.package_path()
      let metadata_mobile = if path == manifest.module_ {
        div(class="xl:hidden", metadata.mobile)
      } else {
        nothing
      }
      div(class="min-h-screen w-full flex-col") <| [
        search_panel,
        navbar(
          path,
          Some(manifest.module_),
          module_index,
          document_actions,
          app_actions~,
        ),
        div(class="flex-1") <| [
          div(
            class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4 xl:gap-8",
          ) <| [
            div(
              class="overflow-y-auto hidden md:block md:sticky md:top-header md:min-w-64 md:h-[calc(100vh-3.5rem)] lg:max-w-[300px]",
              div(class="w-full", sidebar.desktop),
            ),
            div(class="flex-1 min-w-0 max-w-4xl") <| [
              metadata_mobile,
              content,
              sidebar.fab,
              sidebar.dialog,
            ],
            div(
              class="hidden xl:block xl:sticky xl:top-header xl:pt-3 xl:w-64 xl:h-[calc(100vh-3.5rem)] overflow-y-auto shrink-0",
              metadata.sidebar,
            ),
          ],
        ],
        @view.footer(),
      ]
    },
  )
}

///|
pub fn docs_page(
  path : Val[@util.UnsolvedMooncakePath],
  fragment : Val[String],
  app_actions~ : Val[Html],
) -> Val[Html] {
  // TODO: replace this local cache when Rabbita supports reactive resource
  // refreshes that retain the resolved module while its package path changes.
  let mut last_loaded : @rabbita.Status[Manifest]? = None
  let status : @rabbita.Resource[Manifest] = path.switch(path => {
    if last_loaded is Some(status) &&
      status is Loaded(manifest) &&
      @util.MooncakePath::resolve(
        path,
        module_path=manifest.module_,
        latest_version=manifest.latest_version,
      )
      is Some(resolved) &&
      resolved.version() == manifest.version {
      Val::constant(status)
    } else {
      @rabbita.create_resource(inject => {
        @http.get(@config.api_url("/api/v0/manifest/\{path}")).expect_json(
          inject,
        )
      })
    }
  })

  let page : Val[DocsPage] = status.map2(path, (status, path) => {
    match status {
      Loaded(manifest) => {
        let result = @util.MooncakePath::resolve(
          path,
          module_path=manifest.module_,
          latest_version=manifest.latest_version,
        )
        if result is Some(resolved) && resolved.version() == manifest.version {
          last_loaded = Some(status)
          Resolved({ path: resolved, manifest, })
        } else {
          Failed(path)
        }
      }
      Failed(_) => Failed(path)
      Pending => Loading(path)
    }
  })

  page.switch(page => {
    match page {
      Loading(requested) => docs_skeleton(requested, app_actions)
      Failed(requested) => docs_failed(requested, app_actions)
      Resolved(module_) =>
        docs_module(module_.manifest, path, fragment, app_actions)
    }
  })
}
