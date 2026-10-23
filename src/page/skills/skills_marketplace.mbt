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
      let model : SkillsSearchModel = {
        query: "",
        request_id: 0,
        offset: 0,
        phase: Loading,
        page: { items: [], total: 0, limit: 24, offset: 0, },
        copied: "",
      }
      (model, skills_request(model, emit))
    },
    update=update_skills,
  )
  model.view2(app_actions, (model, actions) => {
    skills_page(
      skills_header(actions),
      div(class="w-full") <| [
        marketplace_hero(
          model.page.total.to_string(),
          agent_skills=true,
          browse=@nav.scroll_to("skills"),
        ),
        div(id="skills", class="h-0 scroll-mt-header", ""),
        sticky_search(model.query, model.page.total.to_string(), on_filter=query => {
          emit(Changed(query))
        }),
        match model.phase {
          Waiting | Loading => skeleton_skill_cards(6)
          Failed =>
            div(class="mx-auto max-w-[90rem] p-8 text-center") <| [
              @view.load_failed("skills"),
              button(
                on_click=emit(Page(model.offset)),
                class="mt-4 underline",
                "Retry",
              ),
            ]
          Ready =>
            div(class="mx-auto w-full max-w-[90rem] px-4 py-6 sm:px-6 lg:px-8") <| [
              p(
                class="mb-4 text-sm text-gray-500 dark:text-gray-400",
                if model.page.total == 1 {
                  "1 skill found"
                } else {
                  "\{model.page.total} skills found"
                },
              ),
              if model.page.items.is_empty() {
                p(
                  class="py-12 text-center text-gray-500 dark:text-gray-400",
                  "No skills found. Try another search or publish your first skill below.",
                )
              } else {
                div(
                  class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3",
                  model.page.items.map(entry => {
                    let command = skill_download_command(entry)
                    entry_card(
                      skill_card_entry(entry),
                      model.copied,
                      command~,
                      file_label="\{entry.name} / SKILL.md",
                      copy=emit(Copy(command)),
                    )
                  }),
                )
              },
              div(class="mt-6 flex justify-center gap-6") <| [
                if model.offset > 0 {
                  button(
                    class="rounded border border-gray-300 dark:border-zinc-700 px-4 py-2",
                    on_click=emit(Page((model.offset - 24).max(0))),
                    "Previous",
                  )
                } else {
                  nothing
                },
                if model.offset + model.page.items.length() < model.page.total {
                  button(
                    class="rounded border border-gray-300 dark:border-zinc-700 px-4 py-2",
                    on_click=emit(Page(model.offset + 24)),
                    "Next",
                  )
                } else {
                  nothing
                },
              ],
            ]
        },
        div(
          id="publish",
          source_context_section(
            model.page.total.to_string(),
            agent_skills=true,
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
    let path = reference
      .split("/")
      .map(part => @util.encode_uri_component(part.to_owned()))
      .join("/")
    @http.get(@config.api_url("/api/v0/skill/\{path}")).expect_json(inject)
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
        let command = skill_download_command(entry)
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
              run_command(
                command,
                label="skills",
                copied=copied == command,
                copy=emit(Copy(command)),
              ),
              div(class="mt-6 space-y-4") <| [
                div(
                  id="skill-files",
                  sidebar_window(
                    "$ files",
                    div(class="space-y-2 p-4") <| [
                      p(
                        class="text-xs text-gray-500 dark:text-gray-400",
                        "The ZIP contains all files listed below.",
                      ),
                      div(
                        class="max-h-64 overflow-y-auto",
                        detail.files.map(file => {
                          div(
                            class="flex justify-between gap-4 py-1 font-mono text-xs",
                          ) <| [
                            span(class="break-all", file.path),
                            span(
                              class="shrink-0 text-gray-500",
                              "\{file.size} B",
                            ),
                          ]
                        }),
                      ),
                    ],
                  ),
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
                        "#skill-files"
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
                  metadata_author_row(skill_card_entry(entry)),
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
