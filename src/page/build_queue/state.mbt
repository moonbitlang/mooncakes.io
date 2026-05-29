///|
pub enum Msg {
  GotBuilds(Result[BuildData, Error])
  ToggleTheme
}

///|
pub struct Model {
  queue : Status[Array[BuildItem]]
  recent : Status[Array[BuildItem]]
}

///|
pub(all) struct BuildItem {
  module_ : String
  version : String
  status : String
  created_at : String
  finished_at : String?
}

///|
struct BuildData {
  queued : Array[BuildItem]
  recent_completed : Array[BuildItem]
}

///|
pub fn load(emit~ : (Msg) -> Cmd) -> (Cmd, Model) {
  (
    @http.get(@config.api_url("/api/v0/builds")).expect_json(r => {
      emit(GotBuilds(r))
    }),
    { queue: Loading, recent: Loading },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (Cmd, Model) {
  match msg {
    GotBuilds(Ok(data)) =>
      (
        none,
        { queue: Success(data.queued), recent: Success(data.recent_completed) },
      )
    GotBuilds(Err(e)) => {
      println(e)
      (none, { queue: Failed, recent: Failed })
    }
    ToggleTheme => (none, model)
  }
}

///|
pub fn is_theme_toggle(msg : Msg) -> Bool {
  match msg {
    ToggleTheme => true
    _ => false
  }
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
          _ =>
            raise JsonDecodeError((path, "invalid queued item: \{to_repr(x)}"))
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
          _ =>
            raise JsonDecodeError((path, "invalid build item: \{to_repr(x)}"))
        }
      }
      { queued: queued_items, recent_completed: recent_completed_items }
    }
    _ => raise JsonDecodeError((path, "invalid builds response"))
  }
}
