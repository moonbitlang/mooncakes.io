///|
priv enum BuildLogStatus {
  LogIdle
  LogLoading
  LogFailed
  LogSuccess(String)
} derive(Eq)

///|
priv struct BuildLogModel {
  build_log_open : Bool
  build_log : BuildLogStatus
} derive(Eq)

///|
priv enum BuildLogMsg {
  ToggleBuildLog
  GotBuildLog(Result[String, Error])
}

///|
fn build_status_icon(kind : String) -> Html {
  let color = match kind {
    "failed" => "var(--color-red-500)"
    "queued" => "var(--color-blue-500)"
    _ => "var(--color-gray-400)"
  }
  @svg.svg(
    width=20,
    height=20,
    view_box="0 0 20 20",
    class="docs-state-icon shrink-0",
  ) <| [
    @svg.circle(cx=10, cy=10, r=9, fill="none", stroke=color, stroke_width=2),
    match kind {
      "failed" =>
        @svg.path(
          d="M7 7l6 6m0-6-6 6",
          fill="none",
          stroke=color,
          stroke_width=2,
        )
      "queued" =>
        @svg.path(d="M10 5v5h4", fill="none", stroke=color, stroke_width=2)
      _ => @svg.path(d="M7 10h6", fill="none", stroke=color, stroke_width=2)
    },
  ]
}

///|
fn docs_build_notice(manifest : Manifest) -> Val[Html?] {
  match manifest.module_meta.build_status {
    Some(BuildFailed) => {
      let (model, emit) = @rabbita.create_state(
        { build_log_open: false, build_log: LogIdle, },
        update=(model, msg, emit) => {
          match msg {
            ToggleBuildLog => {
              let build_log_open = !model.build_log_open
              let cmd = match (build_log_open, model.build_log) {
                (true, LogIdle | LogFailed) =>
                  @http.get(
                    @config.api_url(
                      "/api/v0/builds/log?module=\{@util.encode_uri_component(manifest.module_)}&version=\{@util.encode_uri_component(manifest.version)}",
                    ),
                  ).expect_text((result : Result[String, Error]) => {
                    emit(GotBuildLog(result))
                  })
                _ => none
              }
              let build_log = match (build_log_open, model.build_log) {
                (true, LogIdle | LogFailed) => LogLoading
                _ => model.build_log
              }
              ({ build_log_open, build_log, }, cmd)
            }
            GotBuildLog(result) =>
              (
                match result {
                  Ok(log) => { ..model, build_log: LogSuccess(log), }
                  Err(err) => {
                    println(err.to_string())
                    { ..model, build_log: LogFailed, }
                  }
                },
                none,
              )
          }
        },
      )
      model.map(model => {
        let icon = if model.build_log_open {
          @config.section_open
        } else {
          @config.section_close
        }
        Some(
          div(
            class="flex flex-col items-center justify-center py-16 text-center",
          ) <| [
            build_status_icon("failed"),
            p(
              class="mt-3 text-base text-gray-500 dark:text-gray-400",
              "Build failed",
            ),
            p(
              class="mt-1 text-sm text-gray-400 dark:text-slate-500",
              "Documentation failed to generate for this version.",
            ),
            p(
              class="mt-2 text-sm text-gray-400 dark:text-slate-500",
              "The package is ready to install and use as a dependency.",
            ),
            div(class="mt-8 w-full text-left") <| [
              div(
                class="docs-state-log-card border-t border-slate-200/95 dark:border-gray-700",
              ) <| [
                button(
                  class="docs-state-log-toggle hover:bg-slate-400/10 dark:hover:bg-slate-700/30",
                  on_click=emit(ToggleBuildLog),
                ) <| [
                  p(
                    class="docs-state-log-title text-gray-900 dark:text-slate-50",
                    "Build log",
                  ),
                  img(src=icon, class="size-4 ui-icon shrink-0"),
                ],
                if model.build_log_open {
                  div(class="docs-state-log-body") <| [
                    match model.build_log {
                      LogIdle | LogLoading => @view.loading()
                      LogFailed =>
                        div(
                          class="docs-state-log-note docs-state-log-note-error text-red-700 dark:text-red-300",
                          "Failed to load build log.",
                        )
                      LogSuccess(content) =>
                        pre(class="docs-state-log-pre", code(content))
                    },
                    match model.build_log {
                      LogIdle | LogLoading => nothing
                      _ =>
                        p(
                          class="docs-state-summary text-gray-500 dark:text-slate-400",
                          style=["margin-top: 0.75rem"],
                        ) <| [
                          text("If this seems wrong, "),
                          a(
                            class="text-blue-500 dark:text-sky-300 hover:text-blue-700 dark:hover:text-blue-300 transition-colors",
                            href="https://github.com/moonbitlang/mooncakes.io/issues/new",
                            "report it",
                          ),
                          text("."),
                        ]
                    },
                  ]
                } else {
                  nothing
                },
              ],
            ],
          ],
        )
      })
    }
    Some(BuildQueued) =>
      Val::constant(
        Some(
          div(
            class="flex flex-col items-center justify-center py-16 text-center",
          ) <| [
            build_status_icon("queued"),
            p(
              class="mt-3 text-base text-gray-500 dark:text-gray-400",
              "Building documentation...",
            ),
            p(class="mt-1 text-sm text-gray-400 dark:text-slate-500") <| [
              text("This may take a few minutes. "),
              a(
                href="/build-queue",
                class="text-blue-500 dark:text-sky-300 hover:text-blue-700 dark:hover:text-blue-300 transition-colors",
                "View build queue",
              ),
            ],
            p(
              class="mt-2 text-sm text-gray-400 dark:text-slate-500",
              "The package is ready to install and use as a dependency.",
            ),
          ],
        ),
      )
    None =>
      Val::constant(
        Some(
          div(
            class="flex flex-col items-center justify-center py-16 text-center",
          ) <| [
            build_status_icon("outdated"),
            p(
              class="mt-3 text-base text-gray-500 dark:text-gray-400",
              "No documentation available",
            ),
            p(
              class="mt-1 text-sm text-gray-400 dark:text-slate-500",
              "This version was published before doc generation was available.",
            ),
            p(
              class="mt-2 text-sm text-gray-400 dark:text-slate-500",
              "The package is ready to install and use as a dependency.",
            ),
          ],
        ),
      )
    Some(BuildSuccess | BuildLegacy) => Val::constant(None)
  }
}
