///|
pub enum Msg {
  GotEntries(Result[Array[WasmEntry], Error])
  GotEntry(Result[WasmEntry, Error])
  GotSkill(Result[String, Error])
  FilterChanged(String)
  CopyRunCommand(String)
  CopyRunSuccess(String)
  CopyRunFailed(String, String)
  CopySkill(String)
  CopySkillFailed(String)
  ShowcaseTick
  ScrollToSkills
  ToggleTheme
}

///|
pub(all) enum Model {
  List(
    Status[Array[WasmEntry]],
    filter~ : String,
    copied_command~ : String,
    showcase_index~ : Int,
    showcase_chars~ : Int
  )
  Detail(Status[WasmEntry], readme~ : Status[String], command_copied~ : Bool)
}

///|
pub(all) struct WasmEntry {
  module_ : String
  author : String
  author_avatar : String
  version : String
  package_path : String
  name : String
  detail_url : String
  wasm_url : String
  checksum_url : String
  repository : String
  description : String
  created_at : String
}

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
pub fn load(emit~ : (Msg) -> Cmd) -> (Cmd, Model) {
  (
    @http.get(@config.api_url("/api/v0/skills")).expect_json(r => {
      emit(GotEntries(r))
    }),
    List(
      Loading,
      filter="",
      copied_command="",
      showcase_index=0,
      showcase_chars=0,
    ),
  )
}

///|
pub fn load_detail(entry : String, emit~ : (Msg) -> Cmd) -> (Cmd, Model) {
  (
    @rabbita.batch([
      @http.get(@config.api_url("/api/v0/skills/\{entry}")).expect_json(r => {
        emit(GotEntry(r))
      }),
      @http.get(@config.asset_url("/assets/\{entry}/SKILL.md")).expect_text(r => {
        emit(GotSkill(r))
      }),
    ]),
    Detail(Loading, readme=Loading, command_copied=false),
  )
}

///|
pub fn update(msg : Msg, model : Model, emit~ : (Msg) -> Cmd) -> (Cmd, Model) {
  match msg {
    GotEntries(Ok(entries)) => {
      let (filter, copied_command, showcase_index, showcase_chars) = match
        model {
        List(_, filter~, copied_command~, showcase_index~, showcase_chars~) =>
          (filter, copied_command, showcase_index, showcase_chars)
        _ => ("", "", 0, 0)
      }
      (
        none,
        List(
          Success(entries),
          filter~,
          copied_command~,
          showcase_index~,
          showcase_chars~,
        ),
      )
    }
    GotEntry(Ok(entry)) => {
      let readme = match model {
        Detail(_, readme~, ..) => readme
        _ => Loading
      }
      (none, Detail(Success(entry), readme~, command_copied=false))
    }
    GotSkill(Ok(content)) =>
      match model {
        Detail(entry_status, command_copied~, ..) => {
          let trimmed = content.trim()
          let readme : Status[String] = if trimmed.has_prefix("<?xml") &&
            trimmed.contains("<Code>NoSuchKey</Code>") {
            Failed
          } else {
            Success(content)
          }
          (none, Detail(entry_status, readme~, command_copied~))
        }
        _ => (none, model)
      }
    GotEntries(Err(err)) => {
      println(err.to_string())
      match model {
        List(_, filter~, copied_command~, showcase_index~, showcase_chars~) =>
          (
            none,
            List(
              Failed,
              filter~,
              copied_command~,
              showcase_index~,
              showcase_chars~,
            ),
          )
        _ => (none, model)
      }
    }
    GotEntry(Err(err)) => {
      println(err.to_string())
      match model {
        Detail(_, readme~, command_copied~) =>
          (none, Detail(Failed, readme~, command_copied~))
        _ => (none, model)
      }
    }
    GotSkill(Err(err)) => {
      println(err.to_string())
      match model {
        Detail(entry_status, command_copied~, ..) =>
          (none, Detail(entry_status, readme=Failed, command_copied~))
        _ => (none, model)
      }
    }
    FilterChanged(filter) =>
      match model {
        List(entries, copied_command~, ..) =>
          (
            none,
            List(
              entries,
              filter~,
              copied_command~,
              showcase_index=0,
              showcase_chars=0,
            ),
          )
        _ => (none, model)
      }
    CopyRunCommand(command) =>
      (
        @clipboard.copy(Text(command), copied=emit(CopyRunSuccess(command)), failed=e => {
          emit(CopyRunFailed(command, e))
        }),
        model,
      )
    CopyRunSuccess(command) =>
      match model {
        List(entries, filter~, showcase_index~, showcase_chars~, ..) =>
          (
            none,
            List(
              entries,
              filter~,
              copied_command=command,
              showcase_index~,
              showcase_chars~,
            ),
          )
        Detail(entry_status, readme~, ..) =>
          (none, Detail(entry_status, readme~, command_copied=true))
      }
    CopyRunFailed(command, reason) => {
      println(reason)
      match model {
        List(entries, filter~, showcase_index~, showcase_chars~, ..) =>
          (
            none,
            List(
              entries,
              filter~,
              copied_command="failed:\{command}",
              showcase_index~,
              showcase_chars~,
            ),
          )
        Detail(entry_status, readme~, ..) =>
          (none, Detail(entry_status, readme~, command_copied=false))
      }
    }
    CopySkill(content) =>
      (
        @clipboard.copy(Text(content), failed=e => emit(CopySkillFailed(e))),
        model,
      )
    CopySkillFailed(reason) => {
      println(reason)
      (none, model)
    }
    ShowcaseTick =>
      match model {
        List(
          Success(entries),
          filter~,
          copied_command~,
          showcase_index~,
          showcase_chars~
        ) if entries.length() > 0 => {
          let current_index = showcase_index % entries.length()
          let path_length = versioned_skill_path(entries[current_index])
            .iter()
            .count()
          let hold_frames = 30
          let delete_step = 4
          let delete_frames = (path_length + delete_step - 1) / delete_step
          let cycle_frames = path_length + hold_frames + delete_frames
          let (next_index, next_chars) = if showcase_chars < cycle_frames {
            (current_index, showcase_chars + 1)
          } else {
            ((current_index + 1) % entries.length(), 0)
          }
          (
            none,
            List(
              Success(entries),
              filter~,
              copied_command~,
              showcase_index=next_index,
              showcase_chars=next_chars,
            ),
          )
        }
        _ => (none, model)
      }
    ScrollToSkills => (@nav.scroll_to("skills"), model)
    ToggleTheme => (none, model)
  }
}

///|
pub fn subscriptions(model : Model, emit~ : (Msg) -> Cmd) -> @sub.Sub {
  match model {
    List(Success(entries), ..) if entries.length() > 0 =>
      @sub.every(80, emit(ShowcaseTick))
    _ => @sub.none
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
        repository,
        description,
        created_at,
      }
    }
    _ => raise JsonDecodeError((path, "invalid wasm entry: \{to_repr(json)}"))
  }
}
