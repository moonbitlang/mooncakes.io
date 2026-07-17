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
    package_path,
    name: if package_path.is_empty() {
      "alice/cowsay"
    } else {
      "alice/cowsay/\{package_path}"
    },
    detail_url: "",
    wasm_url: "",
    checksum_url: "",
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
