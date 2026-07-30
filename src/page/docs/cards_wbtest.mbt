///|
test "rewrite relative README URLs to versioned source assets" {
  assert_eq(
    readme_href(
      "./logos/banner.svg", "Arcelyth/aitne", "0.4.13", "Arcelyth/aitne",
    ),
    "https://assets.mooncakes.io/source/Arcelyth/aitne@0.4.13/logos/banner.svg",
  )
  assert_eq(
    readme_href("images/logo.png", "alice/tool", "1.2.3", "alice/tool/lib"),
    "https://assets.mooncakes.io/source/alice/tool@1.2.3/lib/images/logo.png",
  )
}

///|
test "preserve non-relative README URLs" {
  let urls = [
    "#install", "/images/logo.png", "//cdn.example.com/logo.png", "HTTP://example.com/logo.png",
    "https://example.com/logo.png", "mailto:hello@example.com", "tel:+123456789",
  ]
  for url in urls {
    assert_eq(
      readme_href(url, "Arcelyth/aitne", "0.4.13", "Arcelyth/aitne"),
      url,
    )
  }
}

///|
test "preserve README URLs without complete module context" {
  assert_eq(readme_href("logo.png", "", "0.4.13", "Arcelyth/aitne"), "logo.png")
  assert_eq(
    readme_href("logo.png", "Arcelyth/aitne", "", "Arcelyth/aitne"),
    "logo.png",
  )
  assert_eq(readme_href("logo.png", "Arcelyth/aitne", "0.4.13", ""), "logo.png")
}
