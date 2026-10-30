///|
fn skills_header(app_actions : Html) -> Html {
  @view.navbar(
    left=a(
      href="/skills",
      class="border-gray-300 dark:border-zinc-700 font-title mx-2 font-semibold flex items-center text-nowrap",
      "🥮 mooncakes.io / skills",
    ),
    right=app_actions,
  )
}

///|
pub fn skills_list_page(app_actions~ : Val[Html]) -> Val[Html] {
  let (model, emit) = @rabbita.create_state_with_init(
    init=emit => {
      let model : SkillsModel = {
        request_id: 0,
        phase: Loading,
        entries: [],
        filter: "",
      }
      (model, skills_request(model, emit))
    },
    update=update_skills,
  )
  model.view2(app_actions, (model, actions) => {
    let visible_entries = filter_entries(model.filter, model.entries)
    skills_page(
      skills_header(actions),
      div(class="w-full") <| [
        marketplace_hero(browse=@nav.scroll_to("skills")),
        div(id="skills", class="h-0 scroll-mt-header", ""),
        sticky_search(
          model.filter,
          if model.phase == Ready {
            model.entries.length().to_string()
          } else {
            "..."
          },
          on_filter=filter => emit(FilterChanged(filter)),
        ),
        match model.phase {
          Loading => skeleton_skill_cards(6)
          Failed =>
            div(class="mx-auto max-w-[90rem] p-8 text-center") <| [
              @view.load_failed("skills"),
              button(on_click=emit(Retry), class="mt-4 underline", "Retry"),
            ]
          Ready =>
            div(class="mx-auto w-full max-w-[90rem] px-4 py-6 sm:px-6 lg:px-8") <| [
              p(
                class="mb-4 text-sm text-gray-500 dark:text-gray-400",
                if visible_entries.length() == 1 {
                  "1 skill found"
                } else {
                  "\{visible_entries.length()} skills found"
                },
              ),
              if visible_entries.is_empty() {
                p(
                  class="py-12 text-center text-gray-500 dark:text-gray-400",
                  if model.entries.is_empty() {
                    "No skills yet. Publish your first skill below."
                  } else {
                    "No skills found."
                  },
                )
              } else {
                div(
                  class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3",
                  visible_entries.map(entry_card),
                )
              },
            ]
        },
        div(
          id="publish",
          source_context_section(
            model.entries.length().to_string(),
            browse=@nav.scroll_to("skills"),
          ),
        ),
      ],
    )
  })
}

///|
pub fn skill_detail_page(
  reference : String,
  app_actions~ : Val[Html],
) -> Val[Html] {
  let resource : @rabbita.Resource[SkillDetail] = @rabbita.create_resource(inject => {
    @http.get("/api/v0/skills/\{reference}").expect_json(inject)
  })
  let (copied, emit) = @rabbita.create_state("", update=(
    model,
    msg : SkillsMsg,
    emit,
  ) => {
    match msg {
      Copy(command) =>
        (
          model,
          @clipboard.copy(Text(command), copied=emit(Copied(command)), failed=_ => {
            emit(Copied(""))
          }),
        )
      Copied(command) => (command, none)
      _ => (model, none)
    }
  })
  copied.view3(resource, app_actions, (copied, resource, actions) => {
    let content = match resource {
      Pending => detail_loading_skeleton()
      Failed(_) =>
        div(class="p-12 text-center") <| [
          p("This skill version could not be loaded."),
          a(
            href="/skills",
            class="mt-4 inline-block underline",
            "Browse skills",
          ),
        ]
      Loaded(detail) => {
        let entry = detail.entry
        div(
          class="mx-auto w-full max-w-[90rem] px-4 py-8 animate-fade-in sm:px-6 lg:px-8 lg:py-10",
        ) <| [
          a(
            href="/skills",
            class="mb-6 inline-block text-sm text-gray-500 hover:underline",
            "← All skills",
          ),
          div(
            class="grid grid-cols-1 gap-6 lg:grid-cols-[minmax(0,1fr)_22rem] lg:items-start",
          ) <| [
            div(class="min-w-0") <| [
              h1(
                class="break-words font-mono text-4xl font-bold leading-tight tracking-normal text-gray-950 dark:text-slate-50 sm:text-5xl",
                entry.name,
              ),
              p(
                class="mt-3 max-w-3xl font-mono text-sm leading-6 text-gray-600 dark:text-slate-400",
                entry.description,
              ),
              div(class="mt-6 space-y-4") <| [
                sidebar_window(
                  "$ files",
                  div(class="px-3 py-3") <| [
                    div(
                      class="inline-flex rounded-md border border-gray-300 dark:border-zinc-700 bg-white dark:bg-zinc-900 px-3 py-1.5 font-mono text-xs font-semibold text-gray-900 dark:text-slate-50",
                      "SKILL.md",
                    ),
                  ],
                ),
                sidebar_window(
                  "SKILL.md",
                  div(class="min-w-0 px-5 py-6 md:px-8") <| [
                    button(
                      class="mb-4 text-xs underline",
                      on_click=emit(Copy(detail.readme)),
                      if copied == detail.readme {
                        "Copied"
                      } else {
                        "Copy SKILL.md"
                      },
                    ),
                    @view.markdown(strip_skill_frontmatter(detail.readme), transform_link=href => {
                      let lower = href.to_lower()
                      if href.has_prefix("#") ||
                        lower.has_prefix("https://") ||
                        lower.has_prefix("http://") ||
                        lower.has_prefix("mailto:") {
                        href
                      } else {
                        let owner = @util.encode_uri_component(entry.owner)
                        let release = @util.encode_uri_component(
                          "\{entry.name}@\{entry.version}",
                        )
                        @config.asset_url("/skills/\{owner}/\{release}/\{href}")
                      }
                    }),
                  ],
                ),
              ],
            ],
            div(class="w-full space-y-6 lg:sticky lg:top-24 lg:self-start") <| [
              sidebar_window(
                "Skill",
                metadata_body([
                  metadata_author_row(entry),
                  metadata_text_row("Name", "\{entry.owner}/\{entry.name}"),
                  metadata_text_row("Version", entry.version),
                  metadata_text_row(
                    "Published",
                    @util.get_relative_time(entry.created_at),
                  ),
                ]),
              ),
              sidebar_window(
                "Versions",
                div(
                  class="max-h-64 space-y-2 overflow-y-auto p-4",
                  detail.versions.map(version => {
                    a(
                      href="/skills/\{entry.owner}/\{entry.name}@\{version}",
                      class="block break-all font-mono text-sm hover:underline",
                      version,
                    )
                  }),
                ),
              ),
              sidebar_window(
                "Download",
                div(class="space-y-4 p-4") <| [
                  action_link(entry.archive_url, "Download ZIP"),
                  p(class="text-xs text-gray-500", "SHA-256"),
                  p(class="break-all font-mono text-xs", entry.archive_sha256),
                ],
              ),
            ],
          ],
        ]
      }
    }
    skills_page(skills_header(actions), content)
  })
}
