///|
#derive(Eq, @json.FromJson)
priv struct CliEntry {
  package_path : String
  version : String
  description : String
  docs_url : String
}

///|
#derive(Eq)
priv enum Phase {
  Loading
  Ready
  Failed
}

///|
#derive(Eq)
priv struct Model {
  request_id : Int32
  phase : Phase
  entries : Array[CliEntry]
  filter : String
  copying : String
  copied : String
}

///|
priv enum Msg {
  Filter(String)
  Retry
  Completed(Int32, Result[Array[CliEntry], Error])
  TimedOut(Int32)
  Copy(String)
  Copied(String)
  ClearCopy(String)
}

///|
#cfg(target="js")
fn browser_delay(cmd : Cmd, ms : Int32) -> Cmd {
  @rabbita.delay(cmd, ms)
}

///|
// Delayed commands run immediately during SSR.
#cfg(not(target="js"))
fn browser_delay(_cmd : Cmd, _ms : Int32) -> Cmd {
  none
}

///|
fn request(model : Model, emit : @rabbita.Emit[Msg]) -> Cmd {
  @rabbita.batch([
    @http.get("/api/v0/cli").expect_json(result => {
      emit(Completed(model.request_id, result))
    }),
    browser_delay(emit(TimedOut(model.request_id)), 15000),
  ])
}

///|
fn update(model : Model, msg : Msg, emit : @rabbita.Emit[Msg]) -> (Model, Cmd) {
  match msg {
    Filter(filter) => ({ ..model, filter, }, none)
    Retry => {
      let next = { ..model, phase: Loading, request_id: model.request_id + 1, }
      (next, request(next, emit))
    }
    Completed(id, Ok(entries)) if id == model.request_id &&
      model.phase == Loading => ({ ..model, phase: Ready, entries, }, none)
    Completed(id, Err(_)) | TimedOut(id) if id == model.request_id &&
      model.phase == Loading => ({ ..model, phase: Failed, }, none)
    Copy(command) =>
      (
        { ..model, copying: command, copied: "", },
        @clipboard.copy(Text(command), copied=emit(Copied(command))),
      )
    Copied(command) if model.copying == command =>
      (
        { ..model, copied: command, },
        browser_delay(emit(ClearCopy(command)), 2000),
      )
    ClearCopy(command) if model.copied == command =>
      ({ ..model, copied: "", }, none)
    _ => (model, none)
  }
}

///|
fn visible_entries(model : Model) -> Array[CliEntry] {
  let tokens = model.filter
    .to_lower()
    .split(" ")
    .filter(part => !part.is_empty())
    .collect()
  model.entries.filter(entry => {
    let haystack = "\{entry.package_path} \{entry.description}".to_lower()
    tokens.iter().all(token => haystack.contains(token))
  })
}
