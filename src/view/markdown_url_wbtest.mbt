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
#cfg(not(target="js"))
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

///|
#cfg(not(target="js"))
#warnings("-alert_experimental")
async test "markdown rejects encoded protocols and raw HTML injection" {
  for
    source in [
      "[bad](JaVaScRiPt:alert%281%29)", "[bad](javascript&#58;alert%281%29)", "[bad](java&#x09;script:alert%281%29)",
      "[bad][ref]\n\n[ref]: javascript&#58;alert%281%29", "![bad](data:image/svg+xml,bad)",
      "<img src=x onerror=alert(1)>", "<svg onload=alert(1)></svg>", "<script>alert(1)</script>",
    ] {
    let html = @rabbita.new(() => {
        @rabbita.Val::constant(
          @html.html([@html.head(@html.nothing), @html.body(markdown(source))]),
        )
      })
      .render(url="https://mooncakes.io/")
      .to_lower()
    assert_false(html.contains("href=\"javascript:"))
    assert_false(html.contains("href=\"java\tscript:"))
    assert_false(html.contains("src=\"data:"))
    assert_false(html.contains("onerror="))
    assert_false(html.contains("onload="))
    assert_false(html.contains("<script>alert(1)</script>"))
  }
}
