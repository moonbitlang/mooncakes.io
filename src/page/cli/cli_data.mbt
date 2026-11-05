///|
#derive(Eq, @json.FromJson)
priv struct CliEntry {
  package_path : String
  version : String
  description : String
  docs_url : String
}

///|
#derive(@json.FromJson)
priv struct CliResult {
  items : Array[CliEntry]
  total : Int32
  page : Int32
  limit : Int32
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
  page : Int32
  limit : Int32
  total : Int32
  copying : String
  copied : String
}

///|
priv enum Msg {
  Retry
  Completed(Int32, Result[CliResult, Error])
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
    @http.get("/api/v0/cli?page=\{model.page}&limit=\{model.limit}").expect_json(result => {
        emit(Completed(model.request_id, result))
      },
    ),
    browser_delay(emit(TimedOut(model.request_id)), 15000),
  ])
}

///|
fn update(model : Model, msg : Msg, emit : @rabbita.Emit[Msg]) -> (Model, Cmd) {
  match msg {
    Retry => {
      let next = { ..model, phase: Loading, request_id: model.request_id + 1, }
      (next, request(next, emit))
    }
    Completed(id, Ok(result)) if id == model.request_id &&
      model.phase == Loading =>
      (
        {
          ..model,
          phase: Ready,
          entries: result.items,
          page: result.page,
          limit: result.limit,
          total: result.total,
        },
        none,
      )
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
fn page_url(page : Int32) -> String {
  if page == 1 {
    "/cli"
  } else {
    "/cli?page=\{page}"
  }
}
