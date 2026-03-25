///|
fn docs_notice_item(body : Array[Html]) -> Html {
  @html.li(class="docs-state-list-item", body)
}

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
fn tone_icon(tone : String) -> Html {
  match tone {
    "failed" => icon_failed()
    "queued" => icon_queued()
    _ => icon_outdated()
  }
}

///|
fn docs_notice_card(
  tone : String,
  title : String,
  summary : String,
  items : Array[Html],
  extra? : Html,
) -> Html {
  div(class="docs-state-shell", [
    div(class="docs-state-card docs-state-card-\{tone}", [
      div(class="docs-state-header", [
        div(class="flex items-center gap-2", [
          tone_icon(tone),
          h1(class="docs-state-title", [text(title)]),
        ]),
        p(class="docs-state-summary", [text(summary)]),
      ]),
      @html.ul(class="docs-state-list", items),
      extra.unwrap_or(nothing),
    ]),
  ])
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
  let report_link = p(
    class="docs-state-summary",
    style=["margin-top: 0.75rem"],
    [
      text("If this seems wrong, "),
      a(
        class="docs-state-link",
        href="https://github.com/moonbitlang/mooncakes.io/issues/new",
        [text("report it")],
      ),
      text("."),
    ],
  )
  docs_notice_card(
    "failed",
    "Build failed",
    "Documentation failed to generate for this version.",
    [],
    extra=build_log_panel(
      build_log_open,
      build_log,
      dispatch,
      footer=report_link,
    ),
  )
}

///|
fn queued_docs_notice() -> Html {
  docs_notice_card(
    "queued",
    "Building docs",
    "Documentation is being generated. This usually takes a few minutes.",
    [
      docs_notice_item([text("Refresh the page to check progress.")]),
      docs_notice_item([
        text("The package is already available for installation."),
      ]),
    ],
  )
}

///|
fn outdated_docs_notice() -> Html {
  docs_notice_card(
    "outdated",
    "No docs available",
    "This release was published before doc generation was available.",
    [
      docs_notice_item([
        text("Try the latest version for browsable documentation."),
      ]),
      docs_notice_item([text("The package is still installable.")]),
    ],
  )
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
      versioned_docs_path(manifest.name, manifest.module_, manifest.version)
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
  let source_files = model.source_files
  let meta : Html = if model.path == module_path {
    match model.module_meta {
      Success(meta) => {
        let meta = match model.manifest {
          Success(manifest) => { ..meta, version: manifest.version }
          _ => meta
        }
        meta_info(meta, install_copied=model.install_copied, dispatch)
      }
      _ => nothing
    }
  } else {
    nothing
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
  let document_view = match model.readme_content {
    Success(readme_content) =>
      document(
        hide_large_package=model.hide_large_package,
        readme_content~,
        package_data=model.package_data,
        folded=model.collapsed_docs,
        module_name~,
        module_version~,
        dispatch,
      )
    Failed => nothing
    Loading =>
      match model.module_meta {
        Success(
          { build_status: Some(BuildQueued) | Some(BuildFailed) | None, .. }
        ) => nothing
        Failed => nothing
        _ => @view.loading()
      }
  }
  let main = div([
    meta,
    docs_notice,
    document_view,
    div(class="h-[30vh]", nothing),
  ])
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
      (match search.results {
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
      }),
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
        class="bg-zinc-50 w-3/4 h-3/4 overflow-y-auto rounded p-4 shadow-lg z-20",
        [
          sidebar(
            model.sidebar_document,
            source_files,
            model.sidebar_tab,
            package_path~,
            model.sidebar_collapsed,
            dispatch,
          ),
        ],
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
        class="container lg:px-4 h-full w-full flex flex-col md:flex-row relative md:gap-4",
        [
          div(
            class="overflow-y-auto hidden md:block md:sticky md:top-15 md:pt-3 md:min-w-64 md:h-[calc(100vh-3.75em)] lg:max-w-[300px]",
            [
              div(class="w-full", [
                sidebar(
                  model.sidebar_document,
                  source_files,
                  model.sidebar_tab,
                  package_path~,
                  model.sidebar_collapsed,
                  dispatch,
                ),
              ]),
            ],
          ),
          div(class="flex-1 min-w-0 max-w-4xl", [main, fab, sidebar_dialog]),
          div(class="md:w-40", nothing),
        ],
      ),
    ]),
    @view.footer(),
  ])
}
