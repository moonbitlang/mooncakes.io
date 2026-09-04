///|
priv struct BuildItem {
  module_ : String
  version : String
  status : String
  created_at : String
  finished_at : String?
} derive(Eq)

///|
struct BuildData {
  queued : Array[BuildItem]
  recent_completed : Array[BuildItem]
} derive(Eq)

///|
pub fn build_queue_page(app_actions~ : Val[Html]) -> Val[Html] {
  let builds : @rabbita.Resource[BuildData] = @rabbita.create_resource(inject => {
    @http.get(@config.api_url("/api/v0/builds")).expect_json(inject)
  })
  builds.view2(app_actions, fn(status, app_actions) {
    if status is Failed(error) {
      println(error)
    }
    @view.page(
      header=@view.navbar(right=app_actions),
      main=div(class="container max-w-3xl mx-auto px-4 py-8") <| [
        h1(
          class="text-2xl font-bold text-gray-900 dark:text-slate-50 mb-6",
          "Build Queue",
        ),
        build_section(
          "In Queue",
          status,
          data => data.queued,
          "No builds in queue.",
        ),
        build_section(
          "Recent Builds",
          status,
          data => data.recent_completed,
          "No recent builds.",
        ),
      ],
    )
  })
}

///|
impl @json.FromJson for BuildData with fn from_json(json : Json, path) {
  match json {
    { "queued": Array(queued), "recent_completed": Array(recent), .. } => {
      let queued_items = []
      for x in queued {
        match x {
          {
            "module": String(module_),
            "version": String(version),
            "created_at": String(created_at),
            ..
          } =>
            queued_items.push({
              module_,
              version,
              status: "QUEUED",
              created_at,
              finished_at: None,
            })
          _ => raise JsonDecodeError((path, "invalid queued item: \{Repr(x)}"))
        }
      }
      let recent_completed_items = []
      for x in recent {
        match x {
          {
            "module": String(module_),
            "version": String(version),
            "status": String(status),
            "created_at": String(created_at),
            ..
          } => {
            let finished_at = match x {
              { "finished_at": String(t), .. } => Some(t)
              _ => None
            }
            recent_completed_items.push({
              module_,
              version,
              status,
              created_at,
              finished_at,
            })
          }
          _ => raise JsonDecodeError((path, "invalid build item: \{Repr(x)}"))
        }
      }
      { queued: queued_items, recent_completed: recent_completed_items, }
    }
    _ => raise JsonDecodeError((path, "invalid builds response"))
  }
}
