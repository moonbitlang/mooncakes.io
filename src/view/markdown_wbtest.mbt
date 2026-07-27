///|
#warnings("-alert_unstable")
test "markdown renders heading ids and anchor links" {
  let rendered = @rabbita.render_to_string(() => {
    @rabbita.Val::constant(
      markdown(
        "# Hello, World!\n\n## Hello, World!\n\n[Jump](#hello-world)",
        heading_anchors=true,
      ),
    )
  })
  assert_true(rendered.contains("id=\"hello-world\""))
  // One link comes from the heading itself and one from `[Jump](#hello-world)`.
  assert_eq(rendered.split("href=\"#hello-world\"").count(), 3)
  assert_true(rendered.contains("id=\"hello-world-1\""))
  assert_true(rendered.contains("href=\"#hello-world-1\""))
  assert_true(rendered.contains(">#</a>"))
}

///|
#warnings("-alert_unstable")
test "markdown heading anchors are opt-in" {
  let rendered = @rabbita.render_to_string(() => {
    @rabbita.Val::constant(markdown("# Details"))
  })
  assert_false(rendered.contains("id=\"details\""))
  assert_false(rendered.contains("href=\"#details\""))
}
