///|
priv enum ListUiMsg {
  FilterChanged(String)
  CopyRunCommand(String)
  CopyRunSuccess(String)
  CopyRunFailed(String, String)
  ShowcaseTick
  ScrollToSkills
}

///|
struct ListUiModel {
  filter : String
  copied_command : String
  showcase_index : Int
  showcase_chars : Int
} derive(Eq)

///|
priv enum DetailMsg {
  CopyRunCommand(String)
  CopyRunSuccess(String)
  CopyRunFailed(String, String)
  CopySkill(String)
  CopySkillFailed(String)
}

///|
struct WasmEntry {
  module_ : String
  author : String
  author_avatar : String
  version : String
  package_path : String
  name : String
  detail_url : String
  wasm_url : String
  checksum_url : String
  archive_url : String
  repository : String
  description : String
  created_at : String
} derive(Eq)

///|
fn skill_path(entry : WasmEntry) -> String {
  if entry.package_path.is_empty() {
    entry.module_
  } else {
    "\{entry.module_}/\{entry.package_path}"
  }
}

///|
fn versioned_skill_path(entry : WasmEntry) -> String {
  let module_at_version = "\{entry.module_}@\{entry.version}"
  if entry.package_path.is_empty() {
    module_at_version
  } else {
    "\{module_at_version}/\{entry.package_path}"
  }
}

///|
fn runwasm_command(entry : WasmEntry) -> String {
  "moon runwasm \{versioned_skill_path(entry)}"
}

///|
fn filter_entries(
  filter : String,
  entries : Array[WasmEntry],
) -> Array[WasmEntry] {
  let tokens = filter
    .to_lower()
    .split(" ")
    .filter_map(fn(part) {
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
  entries.filter(fn(entry) {
    let haystack = "\{entry.name} \{entry.module_} \{entry.package_path} \{entry.description}".to_lower()
    for token in tokens {
      if !haystack.contains(token[:]) {
        return false
      }
    }
    true
  })
}

///|
impl @json.FromJson for WasmEntry with fn from_json(json : Json, path) {
  match json {
    {
      "module": String(module_),
      "author": String(author),
      "author_avatar"? : author_avatar,
      "version": String(version),
      "package": String(package_path),
      "name": String(name),
      "detail_url": String(detail_url),
      "wasm_url": String(wasm_url),
      "checksum_url": String(checksum_url),
      "archive_url": String(archive_url),
      "repository"? : repository,
      "metadata"? : metadata,
      "created_at": String(created_at),
      ..
    } => {
      let author_avatar = match author_avatar {
        Some(String(url)) => url
        _ => ""
      }
      let repository = match repository {
        Some(String(value)) => value
        _ => ""
      }
      let description = match metadata {
        Some(Object(metadata)) =>
          match metadata.get("description") {
            Some(String(value)) => value
            _ => ""
          }
        _ => ""
      }
      {
        module_,
        author,
        author_avatar,
        version,
        package_path,
        name,
        detail_url,
        wasm_url,
        checksum_url,
        archive_url,
        repository,
        description,
        created_at,
      }
    }
    _ => raise JsonDecodeError((path, "invalid wasm entry: \{Repr(json)}"))
  }
}
