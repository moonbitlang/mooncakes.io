///|
fn search_page_url(query : String) -> String {
  if query.is_empty() {
    "/search"
  } else {
    "/search?q=\{@util.encode_uri_component(query)}"
  }
}

///|
fn search_results(query : String) -> Val[Html] {
  let (search, emit) = @rabbita.create_state_with_init(
    init=emit => (initial_search(), emit(Changed(query))),
    update=(model, msg, emit) => {
      let (next, action) = update_search(model, msg)
      let command = match action {
        Nothing => none
        Schedule(id) => @rabbita.delay(emit(Debounced(id)), 250)
        Fetch(id, query) =>
          @rabbita.batch([
            @http.get(search_url(query)).expect_json(result => {
              emit(Completed(id, result))
            }),
            @rabbita.delay(emit(TimedOut(id)), 15000),
          ])
      }
      (next, command)
    },
  )
  search.view(search => search_results_view(search, emit(Retry)))
}

///|
pub fn search_page(query : Val[String], app_actions~ : Val[Html]) -> Val[Html] {
  let results = query.switch_by(by=query => query, search_results)
  query.view3(results, app_actions, (query, results, actions) => {
    @view.page(
      header=@view.navbar(active=Modules, right=actions),
      main=@html.main_(class="mx-auto w-full max-w-4xl px-4 pt-10 sm:pt-14") <| [
        h1(
          class="text-3xl font-semibold text-gray-900 dark:text-slate-100",
          "Search",
        ),
        div(class="relative mt-6") <| [
          img(
            src=@config.search,
            alt="",
            class="ui-icon pointer-events-none absolute left-4 top-1/2 z-10 h-4 w-4 -translate-y-1/2",
          ),
          @rui.input(
            input_type=Search,
            id="module-search-input",
            name="q",
            value=query,
            autofocus=true,
            placeholder="Search modules and packages…",
            attrs=@html.Attrs::build()
              .aria_label("Search modules and packages")
              .aria_controls("search-results"),
            style=[
              "font-family:inherit;-webkit-font-smoothing:inherit;text-rendering:inherit;height:3rem;padding-left:2.75rem;font-size:1rem",
            ],
            on_input=query => @nav.replace_url(search_page_url(query)),
          ),
        ],
        if query.trim().is_empty() {
          p(
            class="py-5 text-sm text-gray-500 dark:text-slate-400",
            "Search by module name, package path, or a keyword.",
          )
        } else {
          nothing
        },
        results,
      ],
    )
  })
}
