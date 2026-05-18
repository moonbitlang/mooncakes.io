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
    @http.get("/api/v0/builds").expect_json(r => emit(GotBuilds(r))),
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
fn decode_queued_item(json : Json) -> BuildItem raise {
  match json {
    {
      "module": String(module_),
      "version": String(version),
      "created_at": String(created_at),
      ..
    } => { module_, version, status: "QUEUED", created_at, finished_at: None }
    _ => fail("invalid queued item: \{to_repr(json)}")
  }
}

///|
fn decode_completed_item(json : Json) -> BuildItem raise {
  match json {
    {
      "module": String(module_),
      "version": String(version),
      "status": String(status),
      "created_at": String(created_at),
      ..
    } => {
      let finished_at = match json {
        { "finished_at": String(t), .. } => Some(t)
        _ => None
      }
      { module_, version, status, created_at, finished_at }
    }
    _ => fail("invalid build item: \{to_repr(json)}")
  }
}

///|
fn decode_builds(json : Json) -> Result[BuildData, String] {
  match json {
    { "queued": Array(queued), "recent_completed": Array(recent), .. } =>
      Ok({
        queued: queued.map(decode_queued_item),
        recent_completed: recent.map(decode_completed_item),
      }) catch {
        e => Err(e.to_string())
      }
    _ => Err("invalid builds response")
  }
}

///|
impl @json.FromJson for BuildData with from_json(json : Json, path) {
  match decode_builds(json) {
    Ok(data) => data
    Err(msg) => raise JsonDecodeError((path, msg))
  }
}
