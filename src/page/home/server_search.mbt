///|
struct SummaryFragment {
  text : String
  matched : Bool
} derive(Eq, @debug.Debug, @json.FromJson)

///|
struct PackageMatch {
  package_ : String
  name : String
  summary : String
  summary_version : String
  is_summary_current : Bool
  summary_fragments : Array[SummaryFragment]
} derive(Eq, @debug.Debug)

///|
impl @json.FromJson for PackageMatch with fn from_json(value, path) {
  guard value
    is {
      "package": String(package_),
      "name": String(name),
      "summary": String(summary),
      "summary_version": String(summary_version),
      "is_summary_current": current,
      ..
    } else {
    raise @json.JsonDecodeError((path, "Invalid package match"))
  }
  let fragments : Array[SummaryFragment] = match value {
    { "summary_fragments": fragments, .. } => @json.from_json(fragments)
    _ => [{ text: summary, matched: false, }]
  }
  {
    package_,
    name,
    summary,
    summary_version,
    is_summary_current: @json.from_json(current),
    summary_fragments: fragments,
  }
}

///|
struct SearchResult {
  module_info : ModuleIndex
  downloads : Int64?
  matched_package_count : Int
  matched_packages : Array[PackageMatch]
} derive(Eq, @debug.Debug)

///|
impl @json.FromJson for SearchResult with fn from_json(value, path) {
  let module_info = decode_module_index(value, path)
  let downloads = match value {
    { "downloads": Number(n, ..), .. } => Some(n.to_int64())
    _ => None
  }
  let matched_packages : Array[PackageMatch] = match value {
    { "matched_packages": matches, .. } => @json.from_json(matches)
    _ => []
  }
  let matched_package_count = match value {
    { "matched_package_count": Number(n, ..), .. } => n.to_int()
    _ => matched_packages.length()
  }
  { module_info, downloads, matched_package_count, matched_packages, }
}

///|
enum SearchPhase {
  Inactive
  Debouncing
  Loading
  Ready
  Failed
} derive(Eq, @debug.Debug)

///|
struct SearchModel {
  input : String
  request_id : Int
  phase : SearchPhase
  results : Array[SearchResult]
} derive(Eq, @debug.Debug)

///|
priv enum SearchMsg {
  Changed(String)
  Debounced(Int)
  Completed(Int, Result[Array[SearchResult], Error])
  TimedOut(Int)
  Retry
}

///|
enum SearchAction {
  Nothing
  Schedule(Int)
  Fetch(Int, String)
} derive(Eq, @debug.Debug)

///|
fn initial_search() -> SearchModel {
  { input: "", request_id: 0, phase: Inactive, results: [], }
}

///|
fn update_search(
  model : SearchModel,
  msg : SearchMsg,
) -> (SearchModel, SearchAction) {
  match msg {
    Changed(input) => {
      if input.trim() == model.input.trim() {
        return ({ ..model, input, }, Nothing)
      }
      let request_id = model.request_id + 1
      if input.trim().is_empty() {
        ({ input, request_id, phase: Inactive, results: [], }, Nothing)
      } else {
        (
          { input, request_id, phase: Debouncing, results: [], },
          Schedule(request_id),
        )
      }
    }
    Debounced(id) if id == model.request_id && model.phase == Debouncing =>
      ({ ..model, phase: Loading, }, Fetch(id, model.input.trim().to_owned()))
    Completed(id, result) if id == model.request_id && model.phase == Loading =>
      match result {
        Ok(results) => ({ ..model, phase: Ready, results, }, Nothing)
        Err(_) => ({ ..model, phase: Failed, results: [], }, Nothing)
      }
    TimedOut(id) if id == model.request_id && model.phase == Loading =>
      ({ ..model, phase: Failed, results: [], }, Nothing)
    Retry if model.phase == Failed && !model.input.trim().is_empty() => {
      let request_id = model.request_id + 1
      (
        { ..model, request_id, phase: Loading, },
        Fetch(request_id, model.input.trim().to_owned()),
      )
    }
    _ => (model, Nothing)
  }
}

///|
fn search_url(query : String) -> String {
  @config.api_url(
    "/api/v0/search?kw=\{@util.encode_uri_component(query)}&limit=20",
  )
}

///|
fn package_match_href(result : SearchResult, pkg : PackageMatch) -> String {
  let mod = result.module_info
  let version = if pkg.summary_version.is_empty() {
    mod.version
  } else {
    pkg.summary_version
  }
  let base = if mod.path == "moonbitlang/core" || version.is_empty() {
    mod.path
  } else {
    "\{mod.path}@\{version}"
  }
  let relpath = if pkg.package_.is_empty() { "" } else { "/\{pkg.package_}" }
  "/docs/\{base}\{relpath}"
}
