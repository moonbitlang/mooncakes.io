///|
fn icon_failed() -> Html {
  @svg.svg(
    width=20,
    height=20,
    view_box="0 0 20 20",
    class="docs-state-icon shrink-0",
    [
      @svg.circle(
        cx=10,
        cy=10,
        r=9,
        fill="none",
        stroke="#ef4444",
        stroke_width=2,
      ),
      @svg.line(
        x1=7,
        y1=7,
        x2=13,
        y2=13,
        stroke="#ef4444",
        stroke_width=2,
        stroke_linecap="round",
      ),
      @svg.line(
        x1=13,
        y1=7,
        x2=7,
        y2=13,
        stroke="#ef4444",
        stroke_width=2,
        stroke_linecap="round",
      ),
    ],
  )
}

///|
fn icon_queued() -> Html {
  @svg.svg(
    width=20,
    height=20,
    view_box="0 0 20 20",
    class="docs-state-icon shrink-0",
    [
      @svg.circle(
        cx=10,
        cy=10,
        r=9,
        fill="none",
        stroke="#3b82f6",
        stroke_width=2,
      ),
      @svg.line(
        x1=10,
        y1=5,
        x2=10,
        y2=10,
        stroke="#3b82f6",
        stroke_width=2,
        stroke_linecap="round",
      ),
      @svg.line(
        x1=10,
        y1=10,
        x2=14,
        y2=10,
        stroke="#3b82f6",
        stroke_width=2,
        stroke_linecap="round",
      ),
    ],
  )
}

///|
fn icon_outdated() -> Html {
  @svg.svg(
    width=20,
    height=20,
    view_box="0 0 20 20",
    class="docs-state-icon shrink-0",
    [
      @svg.circle(
        cx=10,
        cy=10,
        r=9,
        fill="none",
        stroke="#9ca3af",
        stroke_width=2,
      ),
      @svg.line(
        x1=7,
        y1=10,
        x2=13,
        y2=10,
        stroke="#9ca3af",
        stroke_width=2,
        stroke_linecap="round",
      ),
    ],
  )
}

///|
fn build_log_view(build_log : BuildLogStatus) -> Html {
  match build_log {
    LogIdle | LogLoading => @view.loading()
    LogFailed =>
      div(class="docs-state-log-note docs-state-log-note-error", [
        text("Failed to load build log."),
      ])
    LogSuccess(log) => pre(class="docs-state-log-pre", [code([text(log)])])
  }
}

///|
fn build_log_panel(
  build_log_open : Bool,
  build_log : BuildLogStatus,
  dispatch : (Msg) -> Cmd,
  footer? : Html = nothing,
) -> Html {
  let toggle_icon = if build_log_open {
    @config.SECTION_OPEN
  } else {
    @config.SECTION_CLOSE
  }
  div(class="docs-state-log-card", [
    button(class="docs-state-log-toggle", on_click=dispatch(ToggleBuildLog), [
      p(class="docs-state-log-title", [text("Build log")]),
      img(src=toggle_icon, class="size-4 ui-icon shrink-0", nothing),
    ]),
    if build_log_open {
      let show_footer = match build_log {
        LogIdle | LogLoading => false
        _ => true
      }
      div(class="docs-state-log-body", [
        build_log_view(build_log),
        if show_footer {
          footer
        } else {
          nothing
        },
      ])
    } else {
      nothing
    },
  ])
}

///|
fn failed_docs_notice(
  build_log_open : Bool,
  build_log : BuildLogStatus,
  dispatch : (Msg) -> Cmd,
) -> Html {
  div(class="flex flex-col items-center justify-center py-16 text-center", [
    icon_failed(),
    p(class="mt-3 text-base text-gray-500", [text("Build failed")]),
    p(class="mt-1 text-sm text-gray-400", [
      text("Documentation failed to generate for this version."),
    ]),
    p(class="mt-2 text-sm text-gray-400", [
      text("The package is ready to install and use as a dependency."),
    ]),
    div(class="mt-8 w-full text-left", [
      build_log_panel(
        build_log_open,
        build_log,
        dispatch,
        footer=p(class="docs-state-summary", style=["margin-top: 0.75rem"], [
          text("If this seems wrong, "),
          a(
            class="text-blue-500 hover:text-blue-700 transition-colors",
            href="https://github.com/moonbitlang/mooncakes.io/issues/new",
            [text("report it")],
          ),
          text("."),
        ]),
      ),
    ]),
  ])
}

///|
fn queued_docs_notice() -> Html {
  div(class="flex flex-col items-center justify-center py-16 text-center", [
    icon_queued(),
    p(class="mt-3 text-base text-gray-500", [text("Building documentation...")]),
    p(class="mt-1 text-sm text-gray-400", [
      text("This may take a few minutes. "),
      a(
        href="/build-queue",
        class="text-blue-500 hover:text-blue-700 transition-colors",
        [text("View build queue")],
      ),
    ]),
    p(class="mt-2 text-sm text-gray-400", [
      text("The package is ready to install and use as a dependency."),
    ]),
  ])
}

///|
fn outdated_docs_notice() -> Html {
  div(class="flex flex-col items-center justify-center py-16 text-center", [
    icon_outdated(),
    p(class="mt-3 text-base text-gray-500", [text("No documentation available")]),
    p(class="mt-1 text-sm text-gray-400", [
      text("This version was published before doc generation was available."),
    ]),
    p(class="mt-2 text-sm text-gray-400", [
      text("The package is ready to install and use as a dependency."),
    ]),
  ])
}

///|
pub fn view(model : Model, dispatch~ : (Msg) -> Cmd) -> Html {
  let theme_toggle = @view.theme_toggle(on_click=dispatch(ToggleTheme))
  let module_index = match model.module_index {
    Success(module_index) => Some(module_index)
    _ => None
  }
  let current_module_path = match model.manifest {
    Success(manifest) => docs_current_module_path(model.path, manifest.module_)
    _ => docs_module_path(model.path)
  }
  let module_path = match model.manifest {
    Success(_) => current_module_path
    _ => docs_module_path(model.path)
  }
  let package_path = match model.manifest {
    Success(manifest) =>
      versioned_docs_path(model.path, manifest.module_, manifest.version)
    _ => model.path
  }
  let navbar : Html = navbar(
    model.path,
    module_path,
    module_index,
    model.collapsed_docs.card_mode,
    dispatch,
    theme_toggle~,
  )
  let resolved_meta = match model.module_meta {
    Success(meta) => {
      let meta = match model.manifest {
        Success(manifest) => { ..meta, version: manifest.version }
        _ => meta
      }
      Some(meta)
    }
    _ => None
  }
  // Full meta info shown on mobile/tablet only (root package page)
  let meta_mobile : Html = if model.path == module_path {
    match resolved_meta {
      Some(meta) =>
        div(class="xl:hidden", [
          meta_info(meta, install_copied=model.install_copied, dispatch),
        ])
      None => nothing
    }
  } else {
    nothing
  }
  // Compact meta sidebar shown on desktop (all pages)
  let meta_right : Html = match resolved_meta {
    Some(meta) =>
      div(class="animate-fade-in", [
        meta_sidebar(meta, install_copied=model.install_copied, dispatch),
      ])
    None =>
      if model.module_meta is Loading {
        @view.skeleton_meta_sidebar()
      } else {
        nothing
      }
  }
  let docs_loaded = match model.readme_content {
    Success(_) => true
    _ => false
  }
  let docs_notice = match (model.manifest, model.module_meta) {
    (Failed, _) | (_, Failed) =>
      if docs_loaded {
        nothing
      } else {
        @view.document_not_available(model.path)
      }
    (Success(_), Success(meta)) =>
      match meta.build_status {
        Some(BuildQueued) =>
          if docs_loaded {
            nothing
          } else {
            queued_docs_notice()
          }
        Some(BuildFailed) =>
          if docs_loaded {
            nothing
          } else {
            failed_docs_notice(model.build_log_open, model.build_log, dispatch)
          }
        None => if docs_loaded { nothing } else { outdated_docs_notice() }
        Some(BuildSuccess) | Some(BuildLegacy) =>
          match (model.readme_content, model.module_index, model.package_data) {
            (Failed, _, _) | (_, Failed, _) =>
              @view.document_not_available(model.path)
            (_, _, Failed) =>
              match model.manifest {
                Success(manifest) if manifest.has_package =>
                  @view.document_not_available(model.path)
                _ => nothing
              }
            _ => nothing
          }
      }
    _ => nothing
  }
  let (module_name, module_version) = match model.manifest {
    Success(manifest) => (manifest.module_, manifest.version)
    _ => ("", "")
  }
  let content_ready = model.readme_content is Success(_) &&
    not(model.package_data is Loading)
  let (document_view, source_files_view) = if content_ready {
    let doc = match model.readme_content {
      Success(readme_content) =>
        div(class="animate-fade-in", [
          document(
            hide_large_package=model.hide_large_package,
            readme_content~,
            package_data=model.package_data,
            folded=model.collapsed_docs,
            module_name~,
            module_version~,
            dispatch,
          ),
        ])
      _ => nothing
    }
    let src = source_files_section(model.source_files, package_path~)
    (doc, src)
  } else {
    let skeleton = match model.module_meta {
      Success(
        { build_status: Some(BuildQueued) | Some(BuildFailed) | None, .. }
      ) => nothing
      Failed => nothing
      _ =>
        match model.readme_content {
          Failed => nothing
          _ => @view.skeleton_docs_content()
        }
    }
    (skeleton, nothing)
  }
  let main = div([meta_mobile, docs_notice, document_view, source_files_view])
  let search = model.search
  let search_panel : Html = @html.dialog(
    class="lg:backdrop:bg-black/30 lg:backdrop:backdrop-blur lg:rounded lg:shadow-lg fixed max-w-none max-h-none w-full h-screen m-0 lg:m-auto lg:w-2/5 lg:h-[80%] overscroll-contain",
    id="search-panel",
    [
      div(
        class="h-12 border-b bg-white rounded-none sticky top-0 text-base w-full flex",
        [
          @html.input(
            input_type=Text,
            value=search.filter,
            placeholder="search...",
            on_input=x => dispatch(SearchFilterChanged(x)),
            class="outline-none m-0 flex-grow px-4 p-2",
            nothing,
          ),
          div(
            class="size-12 container hover:bg-gray-200 flex justify-center items-center",
            on_click=dispatch(ToggleSearchPanel(false)),
            [img(class="ui-icon", src=@config.icon_close, nothing)],
          ),
        ],
      ),
      match search.results {
        Loading => nothing
        Failed => text("load indices failed")
        Success(results) =>
          @html.ul(
            class="overflow-y-auto flex-grow",
            results.map(fn(x) {
              let color = match x.entry.kind {
                "Package" => "text-yellow-700"
                "Trait" => "text-blue-700"
                "Type" => "text-green-700"
                "Method" => "text-moonbit"
                "Value" => "text-purple-700"
                _ => "text-gray-700"
              }
              @html.li(
                class="border-b px-4 py-2 bg-white hover:bg-gray-100",
                on_click=dispatch(ToggleSearchPanel(false)),
                [
                  a(href=x.entry.href, class="grid grid-cols-[1fr_auto] ", [
                    span(
                      class="",
                      x.matching.map(x => {
                        match x {
                          (true, str) =>
                            span(class="text-moonbit font-semibold", [
                              text(str.to_string()),
                            ])
                          (false, str) =>
                            span(class="text-gray-600", [text(str.to_string())])
                        }
                      }),
                    ),
                    span(class="font-thin text-tiny lg:text-base \{color}", [
                      text(x.entry.kind),
                    ]),
                  ]),
                ],
              )
            }),
          )
      },
    ],
  )
  let show_sidebar_dialog = if model.sidebar_fab { "flex" } else { "none" }
  let sidebar_dialog : Html = div(
    class="fixed inset-0 justify-center items-center z-100",
    style=["display: " + show_sidebar_dialog],
    [
      div(
        class="fixed inset-0 bg-black/40 z-10",
        style=["display: " + show_sidebar_dialog],
        on_click=dispatch(ToggleSidebarFab),
        nothing,
      ),
      div(
        class="bg-zinc-50 w-3/4 h-3/4 overflow-y-auto rounded px-4 pb-4 shadow-lg z-20",
        [sidebar(model.sidebar_document, model.sidebar_collapsed, dispatch)],
      ),
    ],
  )
  let fab : Html = @html.button(
    class="flex lg:hidden fixed bottom-4 right-4 bg-mooncake2 text-white rounded-full shadow-lg w-12 h-12 items-center justify-center cursor-pointer hover:bg-moonbit-dark transition-all select-none",
    on_click=dispatch(ToggleSidebarFab),
    [img(class="size-5", src=@config.HAMBURGER_BUTTON, nothing)],
  )
  div(class="min-h-screen w-full flex-col", [
    search_panel,
    navbar,
    div(class="flex-1", [
      div(
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4 xl:gap-8",
        [
          div(
            class="overflow-y-auto hidden md:block md:sticky md:top-header md:min-w-64 md:h-[calc(100vh-3.5rem)] lg:max-w-[300px]",
            [
              div(class="w-full", [
                if model.module_index is Loading {
                  @view.skeleton_sidebar()
                } else {
                  div(class="animate-fade-in", [
                    sidebar(
                      model.sidebar_document,
                      model.sidebar_collapsed,
                      dispatch,
                    ),
                  ])
                },
              ]),
            ],
          ),
          div(class="flex-1 min-w-0 max-w-4xl", [main, fab, sidebar_dialog]),
          div(
            class="hidden xl:block xl:sticky xl:top-header xl:pt-3 xl:w-64 xl:h-[calc(100vh-3.5rem)] overflow-y-auto shrink-0",
            [meta_right],
          ),
        ],
      ),
    ]),
    @view.footer(),
  ])
}
