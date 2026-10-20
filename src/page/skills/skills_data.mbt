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
} derive(Eq, @json.FromJson)

///|
priv struct SkillFile {
  path : String
  size : Int32
} derive(Eq, @json.FromJson)

///|
priv struct SkillDetail {
  entry : SkillEntry
  readme : String
  files : Array[SkillFile]
  versions : Array[String]
} derive(Eq)

///|
impl @json.FromJson for SkillDetail with fn from_json(value, path) {
  guard value
    is { "readme": String(readme), "files": files, "versions": versions, .. } else {
    raise @json.JsonDecodeError((path, "Invalid skill detail"))
  }
  {
    entry: @json.from_json(value),
    readme,
    files: @json.from_json(files),
    versions: @json.from_json(versions),
  }
}

///|
priv struct SkillsSearchPage {
  items : Array[SkillEntry]
  total : Int32
  limit : Int32
  offset : Int32
} derive(Eq, @json.FromJson)

///|
fn skill_card_entry(entry : SkillEntry) -> WasmEntry {
  // Share the existing marketplace card's layout without inheriting its
  // module/version identity or Wasm actions.
  {
    module_: "\{entry.owner}/\{entry.name}",
    author: entry.owner,
    author_avatar: entry.author_avatar,
    version: entry.version,
    yanked: None,
    package_path: "",
    name: entry.name,
    detail_url: entry.detail_url,
    wasm_url: "",
    checksum_url: "",
    archive_url: entry.archive_url,
    repository: "",
    description: entry.description,
    created_at: entry.created_at,
  }
}

///|
fn skill_download_command(entry : SkillEntry) -> String {
  "skills download \{entry.owner}/\{entry.name}@\{entry.version}"
}

///|
fn skills_search_url(query : String, offset : Int32) -> String {
  @config.api_url(
    "/api/v0/skill?q=\{@util.encode_uri_component(query)}&limit=24&offset=\{offset}",
  )
}

///|
priv enum SkillsSearchPhase {
  Waiting
  Loading
  Ready
  Failed
} derive(Eq)

///|
priv struct SkillsSearchModel {
  query : String
  request_id : Int32
  offset : Int32
  phase : SkillsSearchPhase
  page : SkillsSearchPage
  copied : String
} derive(Eq)

///|
priv enum SkillsMsg {
  Changed(String)
  Fetch(Int32)
  Completed(Int32, Result[SkillsSearchPage, Error])
  TimedOut(Int32)
  Page(Int32)
  Copy(String)
  Copied(String)
}

///|
fn skills_request(
  model : SkillsSearchModel,
  emit : @rabbita.Emit[SkillsMsg],
) -> Cmd {
  @rabbita.batch([
    @http.get(skills_search_url(model.query, model.offset)).expect_json(result => {
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
  model : SkillsSearchModel,
  msg : SkillsMsg,
  emit : @rabbita.Emit[SkillsMsg],
) -> (SkillsSearchModel, Cmd) {
  match msg {
    Changed(query) => {
      let next = {
        ..model,
        query,
        offset: 0,
        request_id: model.request_id + 1,
        phase: Waiting,
      }
      (next, @rabbita.delay(emit(Fetch(next.request_id)), 250))
    }
    Fetch(id) if id == model.request_id && model.phase == Waiting =>
      ({ ..model, phase: Loading, }, skills_request(model, emit))
    Page(offset) => {
      let next = {
        ..model,
        offset,
        request_id: model.request_id + 1,
        phase: Loading,
      }
      (next, skills_request(next, emit))
    }
    Completed(id, Ok(page)) if id == model.request_id && model.phase == Loading =>
      ({ ..model, page, phase: Ready, }, none)
    Completed(id, Err(_)) | TimedOut(id) if id == model.request_id &&
      model.phase == Loading => ({ ..model, phase: Failed, }, none)
    Copy(command) =>
      (
        model,
        @clipboard.copy(Text(command), copied=emit(Copied(command)), failed=_ => {
          emit(Copied("failed:\{command}"))
        }),
      )
    Copied(copied) => ({ ..model, copied, }, none)
    _ => (model, none)
  }
}
