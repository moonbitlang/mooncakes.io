///|
test "markdown rejects executable destinations before and after rewriting" {
  for
    value in [
      "javascript:alert(1)", "  JaVaScRiPt:alert(1)", "java\nscript:alert(1)", "\u0000javascript:alert(1)",
      "data:text/html,<script>alert(1)</script>", "vbscript:msgbox(1)", "file:///etc/passwd",
    ] {
    assert_eq(markdown_url(value), "#")
    assert_eq(markdown_url(value, transform_link=_ => "/apparently-safe"), "#")
  }
  assert_eq(
    markdown_url("README.md", transform_link=_ => "javascript:alert(1)"),
    "#",
  )
  assert_eq(markdown_url("mailto:hello@example.com", image=true), "#")
}

///|
test "markdown preserves web, mail and relative URLs" {
  for
    value in [
      "https://example.com/", "http://example.com/", "mailto:hello@example.com",
      "../README.md", "/docs/moonbitlang/core", "#heading", "?tab=docs",
    ] {
    assert_eq(markdown_url(value), value)
  }
  assert_eq(
    markdown_url("README.md", transform_link=url => "/docs/\{url}"),
    "/docs/README.md",
  )
}

///|
#cfg(target="native")
#warnings("-alert_experimental")
async test "rendered markdown removes executable inline reference and autolinks" {
  let html = @rabbita.new(() => {
    @rabbita.Val::constant(
      @html.html([
        @html.head(@html.nothing),
        @html.body(
          markdown(
            "[inline](javascript:alert) <javascript:alert> [ref][x]\n\n[x]: javascript:alert\n\n![image](data:text/html,bad)",
          ),
        ),
      ]),
    )
  }).render(url="https://mooncakes.io/")
  assert_false(html.contains("href=\"javascript:"))
  assert_false(html.contains("src=\"data:"))
}
