///|
fn test_url(path : String, fragment? : String? = None) -> @url.Url {
  test_url_with_host("mooncakes.io", path, fragment~)
}

///|
fn test_url_with_host(
  host : String,
  path : String,
  fragment? : String? = None,
) -> @url.Url {
  { protocol: Https, host, port: None, path, query: None, fragment }
}

///|
test "resolve root" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("")),
    content=(
      #|home:
    ),
  )
}

///|
test "resolve skills host root" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url_with_host("skills.mooncakes.io", ""),
    ),
    content=(
      #|skills:
    ),
  )
}

///|
test "resolve build-queue" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("build-queue")),
    content=(
      #|build-queue
    ),
  )
}

///|
test "resolve skills list" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("skills")),
    content=(
      #|skills:
    ),
  )
}

///|
test "resolve skills detail" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url("skills/moonbitlang/parser@0.3.3/cmd/moonfmt"),
    ),
    content=(
      #|skills:moonbitlang/parser@0.3.3/cmd/moonfmt
    ),
  )
}

///|
test "resolve user" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("user/mizchi")),
    content=(
      #|user:mizchi
    ),
  )
}

///|
test "resolve docs" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("docs/mizchi/mbt_rs@0.3.0")),
    content=(
      #|docs: mizchi/mbt_rs@0.3.0, fragment: None
    ),
  )
}

///|
test "resolve docs with package path" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("docs/moonbitlang/core/builtin")),
    content=(
      #|docs: moonbitlang/core/builtin, fragment: None
    ),
  )
}

///|
test "resolve docs with fragment" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url("docs/mizchi/mbt_rs@0.3.0", fragment=Some("MyType")),
    ),
    content=(
      #|docs: mizchi/mbt_rs@0.3.0, fragment: Some("MyType")
    ),
  )
}

///|
test "resolve docs with package path and fragment" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url("docs/moonbitlang/core/builtin", fragment=Some("Array::map")),
    ),
    content=(
      #|docs: moonbitlang/core/builtin, fragment: Some("Array::map")
    ),
  )
}

///|
test "resolve assets" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("assets/foo/bar")),
    content=(
      #|assets:assets/foo/bar
    ),
  )
}

///|
test "resolve not found" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("unknown/path")),
    content=(
      #|not-found:unknown/path
    ),
  )
}
