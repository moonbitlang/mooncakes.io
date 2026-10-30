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
