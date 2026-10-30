///|
pub(all) struct ModuleIndex {
  author : String
  name : String
  path : String
  version : String
  yanked : String?
  keywords : Array[String]?
  description : String?
  created_at : String?
  is_new : Bool
} derive(Eq, @debug.Debug)

///|
pub fn decode_module_index(
  item : Json,
  json_path : @json.JsonPath,
) -> ModuleIndex raise @json.JsonDecodeError {
  match item {
    {
      "name": String(path),
      "version": String(version),
      "keywords": Array(keywords),
      "description": String(description),
      "is_new": True
      | False as bool,
      "created_at": String(time),
      ..
    } => {
      let keywords = Some(
        keywords.filter_map(fn(x) {
          match x {
            String(s) => Some(s)
            _ => None
          }
        }),
      )
      let description = Some(description)
      let created_at = Some(time)
      // we need Json::Boolean(x), not Json::True and Json::False
      let is_new = match bool {
        True => true
        False => false
        _ => raise @json.JsonDecodeError((json_path, "invalid is_new field"))
      }
      let (author, name) = match path.split("/").collect() {
        [author, .. name] => (author, name)
        _ =>
          raise @json.JsonDecodeError(
            (json_path, "unexpected module path: \{path}"),
          )
      }
      let name = name.iter().map(StringView::to_owned).join("/")
      {
        path,
        name,
        author: author.to_owned(),
        version,
        yanked: decode_yanked(item),
        description,
        keywords,
        created_at,
        is_new,
      }
    }
    _ =>
      raise @json.JsonDecodeError(
        (json_path, "unexpected item in json: \{Repr(item)}"),
      )
  }
}

///|
pub impl @json.FromJson for ModuleIndex with fn from_json(json : Json, path) {
  decode_module_index(json, path)
}

///|
pub fn versioned_module_path(mod : ModuleIndex) -> String {
  if mod.version.is_empty() || mod.path == "moonbitlang/core" {
    mod.path
  } else {
    "\{mod.path}@\{mod.version}"
  }
}

///|
pub extend ModuleIndex with Eq::{equal, not_equal}

///|
pub extend ModuleIndex with @debug.Debug::{to_repr}

///|
pub extend ModuleIndex with @json.FromJson::{from_json}
