///|
test "strip skill frontmatter" {
  let content =
    #|---
    #|name: Yoorkin/cowsay
    #|description: Build and run cowsay.
    #|---
    #|
    #|# Yoorkin/cowsay
    #|
    #|Use it from MoonBit.
    #|
  inspect(
    strip_skill_frontmatter(content),
    content=(
      #|# Yoorkin/cowsay
      #|
      #|Use it from MoonBit.
      #|
    ),
  )
}

///|
test "strip skill frontmatter with crlf and dot close" {
  let content = "---\r\nname: demo\r\n...\r\n\r\n# Demo\r\n"
  inspect(strip_skill_frontmatter(content), content="# Demo\n")
}

///|
test "keep markdown thematic breaks without skill metadata" {
  let content =
    #|---
    #|This is just markdown.
    #|---
    #|
  inspect(strip_skill_frontmatter(content), content~)
}

///|
fn sample_entry(package_path : String) -> WasmEntry {
  {
    module_: "alice/cowsay",
    author: "alice",
    author_avatar: "",
    version: "0.1.2",
    yanked: None,
    package_path,
    name: if package_path.is_empty() {
      "alice/cowsay"
    } else {
      "alice/cowsay/\{package_path}"
    },
    detail_url: "",
    wasm_url: "",
    checksum_url: "",
    archive_url: "",
    repository: "",
    description: "",
    created_at: "2026-06-10T00:00:00Z",
  }
}

///|
test "runwasm command includes module version" {
  inspect(
    runwasm_command(sample_entry("")),
    content="moon runwasm alice/cowsay@0.1.2",
  )
  inspect(
    runwasm_command(sample_entry("cmd/cow")),
    content="moon runwasm alice/cowsay@0.1.2/cmd/cow",
  )
}

///|
test "download filename falls back to link label" {
  inspect(
    download_filename(
      @config.asset_url(
        "/assets/moonbitlang/parser@0.3.4/cmd/moonfmt/moonfmt.wasm",
      ),
      "Download wasm",
    ),
    content="moonfmt.wasm",
  )
  inspect(
    download_filename("", "Download checksum"),
    content="Download checksum",
  )
}

///|
test "decode skill deprecation and older responses" {
  let fields : Map[String, Json] = {
    "module": "alice/cowsay",
    "author": "alice",
    "version": "0.1.2",
    "package": "cmd/cow",
    "name": "alice/cowsay/cmd/cow",
    "detail_url": "/skills/alice/cowsay@0.1.2/cmd/cow",
    "wasm_url": "/cowsay.wasm",
    "checksum_url": "/cowsay.sha256",
    "archive_url": "/skills.zip",
    "created_at": "2026-06-10T00:00:00Z",
  }
  let older : WasmEntry = @json.from_json(fields.to_json())
  assert_eq(older.yanked, None)
  fields["yanked"] = true
  fields["yanked_reason"] = "Use alice/cowsay-next."
  let deprecated : WasmEntry = @json.from_json(fields.to_json())
  assert_eq(deprecated.yanked, Some("Use alice/cowsay-next."))
  fields["yanked_reason"] = null
  let without_reason : WasmEntry = @json.from_json(fields.to_json())
  assert_eq(without_reason.yanked, Some(""))
  fields["yanked"] = false
  let restored : WasmEntry = @json.from_json(fields.to_json())
  assert_eq(restored.yanked, None)
}
