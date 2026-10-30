///|
priv struct SkillEntry {
  owner : String
  name : String
  version : String
  author_avatar : String
  description : String
  detail_url : String
  archive_url : String
  archive_sha256 : String
  created_at : String
} derive(Eq, @json.FromJson(fields(archive_sha256(rename="archive_digest"))))

///|
priv struct SkillDetail {
  entry : SkillEntry
  readme : String
  versions : Array[String]
} derive(Eq)

///|
impl @json.FromJson for SkillDetail with fn from_json(value, path) {
  guard value is { "readme": String(readme), "versions": versions, .. } else {
    raise @json.JsonDecodeError((path, "Invalid skill detail"))
  }
  {
    entry: @json.from_json(value),
    readme,
    versions: @json.from_json(versions),
  }
}

///|
priv enum SkillsPhase {
  Loading
  Ready
  Failed
} derive(Eq)

///|
priv struct SkillsModel {
  request_id : Int32
  phase : SkillsPhase
  entries : Array[SkillEntry]
  filter : String
} derive(Eq)

///|
priv enum SkillsMsg {
  FilterChanged(String)
  Retry
  Completed(Int32, Result[Array[SkillEntry], Error])
  TimedOut(Int32)
  Copy(String)
  Copied(String)
}

///|
fn skills_request(model : SkillsModel, emit : @rabbita.Emit[SkillsMsg]) -> Cmd {
  @rabbita.batch([
    @http.get("/api/v0/skills").expect_json(result => {
      emit(Completed(model.request_id, result))
    }),
    skills_timeout(emit(TimedOut(model.request_id))),
  ])
}

///|
#cfg(target="js")
fn skills_timeout(cmd : Cmd) -> Cmd {
  @rabbita.delay(cmd, 15000)
}

///|
// SSR runs delayed commands immediately; a browser timer must not turn the
// server-rendered page into an error before its HTTP request completes.
#cfg(not(target="js"))
fn skills_timeout(_cmd : Cmd) -> Cmd {
  none
}

///|
fn update_skills(
  model : SkillsModel,
  msg : SkillsMsg,
  emit : @rabbita.Emit[SkillsMsg],
) -> (SkillsModel, Cmd) {
  match msg {
    FilterChanged(filter) => ({ ..model, filter, }, none)
    Retry => {
      let next = { ..model, request_id: model.request_id + 1, phase: Loading, }
      (next, skills_request(next, emit))
    }
    Completed(id, Ok(entries)) if id == model.request_id &&
      model.phase == Loading => ({ ..model, entries, phase: Ready, }, none)
    Completed(id, Err(_)) | TimedOut(id) if id == model.request_id &&
      model.phase == Loading => ({ ..model, phase: Failed, }, none)
    _ => (model, none)
  }
}

///|
fn filter_entries(
  filter : String,
  entries : Array[SkillEntry],
) -> Array[SkillEntry] {
  let tokens = filter
    .to_lower()
    .split(" ")
    .filter_map(part => {
      let token = part.trim()
      if token.is_empty() {
        None
      } else {
        Some(token.to_owned())
      }
    })
    .collect()
  if tokens.is_empty() {
    return entries
  }
  entries.filter(entry => {
    let haystack = "\{entry.owner}/\{entry.name} \{entry.description}".to_lower()
    for token in tokens {
      if !haystack.contains(token[:]) {
        return false
      }
    }
    true
  })
}
