///|
fn copy_button(
  command : String,
  copied : String,
  emit : @rabbita.Emit[Msg],
) -> Html {
  let done = command == copied
  let label = if done { "Command copied" } else { "Copy command: \{command}" }
  button(
    class="cli-copy",
    title=label,
    attrs=@html.Attrs::build().aria_label(label),
    on_click=emit(Copy(command)),
    img(
      class="size-4 ui-icon",
      src=if done { @config.ok } else { @config.clipboard },
      alt="",
    ),
  )
}

///|
fn hero(model : Model, emit : @rabbita.Emit[Msg]) -> Html {
  let example = "moonx cli/tree@0.1.5 -L 2"
  @html.section(class="cli-hero") <| [
    h1() <| [
      span("Pick a CLI."),
      span(class="cli-accent", "Run it with moonx."),
    ],
    p(
      class="cli-intro",
      "Run prebuilt MoonBit WebAssembly tools from the registry.",
    ),
    div(class="cli-example") <| [
      div(class="min-w-0") <| [
        p(class="cli-example-comment", "# Show the directory tree"),
        @html.code() <| [
          span(attrs=@html.Attrs::build().aria_hidden("true"), "$ "),
          text(example),
        ],
      ],
      copy_button(example, model.copied, emit),
    ],
    p(class="cli-install") <| [
      a(href="https://www.moonbitlang.com/download/", "Install MoonBit ↗"),
      span("moonx is included in the toolchain."),
    ],
  ]
}

///|
fn entry_row(
  entry : CliEntry,
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> Html {
  let coordinate = "\{entry.package_path}@\{entry.version}"
  let argument = if coordinate
    .iter()
    .all(c => {
      c
      is ('a'..<='z'
      | 'A'..<='Z'
      | '0'..<='9'
      | '/'
      | '@'
      | '-'
      | '_'
      | '.'
      | '+')
    }) {
    coordinate
  } else {
    "'" + coordinate.replace_all(old="'", new="'\\''") + "'"
  }
  let command = "moonx \{argument}"
  @html.tr() <| [
    @html.td(class="cli-package") <| [
      a(href=entry.docs_url, escape=true) <| [
        span(class="cli-package-path", entry.package_path),
        if entry.description.is_empty() {
          nothing
        } else {
          span(
            class="cli-description",
            title=entry.description,
            entry.description,
          )
        },
      ],
    ],
    @html.td(class="cli-version", entry.version),
    @html.td(class="cli-command") <| [
      div() <| [
        @html.code(command),
        copy_button(command, model.copied, emit),
      ],
    ],
  ]
}

///|
fn pagination(model : Model) -> Html {
  if model.phase != Ready ||
    model.total <= model.limit ||
    model.entries.is_empty() {
    return nothing
  }
  let pages = (model.total - 1) / model.limit + 1
  @html.nav(
    class="cli-pagination",
    attrs=@html.Attrs::build().aria_label("CLI pages"),
  ) <| [
    if model.page > 1 {
      a(href=page_url(model.page - 1), rel="prev", "Previous")
    } else {
      span(attrs=@html.Attrs::build().aria_disabled("true"), "Previous")
    },
    span(class="cli-page-number", "Page \{model.page} of \{pages}"),
    if model.page < pages {
      a(href=page_url(model.page + 1), rel="next", "Next")
    } else {
      span(attrs=@html.Attrs::build().aria_disabled("true"), "Next")
    },
  ]
}

///|
pub fn cli_page(page : Int32, app_actions~ : Val[Html]) -> Val[Html] {
  let (model, emit) = @rabbita.create_state_with_init(
    init=emit => {
      let model : Model = {
        request_id: 0,
        phase: Loading,
        entries: [],
        page,
        limit: 30,
        total: 0,
        copying: "",
        copied: "",
      }
      (model, request(model, emit))
    },
    update~,
  )
  model.view2(app_actions, (model, actions) => {
    let entries = model.entries
    div(class="cli-page") <| [
      @view.navbar(active=Cli, right=actions),
      @html.main_(class="cli-main") <| [
        hero(model, emit),
        @html.section(
          class="cli-directory",
          id="cli-directory",
          attrs=@html.Attrs::build().aria_label("CLI directory"),
        ) <| [
          div(class="cli-toolbar") <| [
            h2("Recently built"),
            pagination(model),
          ],
          p(
            class="sr-only",
            attrs=@html.Attrs::build().role("status").aria_live("polite"),
            if !model.copied.is_empty() {
              "Command copied."
            } else {
              ""
            },
          ),
          match model.phase {
            Loading =>
              p(
                class="cli-message",
                attrs=@html.Attrs::build().role("status"),
                "Loading CLIs…",
              )
            Failed =>
              div(class="cli-message") <| [
                p("The CLI directory could not be loaded."),
                button(class="cli-retry", on_click=emit(Retry), "Try again"),
              ]
            Ready =>
              if entries.is_empty() {
                div(class="cli-message") <| [
                  p(
                    if model.total == 0 {
                      "No CLIs are available yet."
                    } else {
                      "No CLIs on this page."
                    },
                  ),
                  if model.page > 1 {
                    a(
                      class="cli-retry",
                      href=page_url(1),
                      "Back to the first page",
                    )
                  } else {
                    nothing
                  },
                ]
              } else {
                @html.table(class="cli-table") <| [
                  @html.caption(
                    class="sr-only",
                    "Recently built CLI packages and their versioned moonx commands",
                  ),
                  @html.thead(
                    @html.tr() <| [
                      @html.th(class="cli-package", "Package"),
                      @html.th(class="cli-version", "Version"),
                      @html.th(class="cli-command", "Command"),
                    ],
                  ),
                  @html.tbody(
                    entries.map(entry => entry_row(entry, model, emit)),
                  ),
                ]
              }
          },
          if !entries.is_empty() {
            div(class="cli-pagination-bottom", pagination(model))
          } else {
            nothing
          },
        ],
      ],
      @view.footer(),
    ]
  })
}
