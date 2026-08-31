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
  { protocol: Https, host, port: None, path, query: None, fragment, }
}

///|
const TestSkillsHost = "skills.mooncakes.io"

///|
test "resolve root" {
  inspect(
    @util.MooncakesioPath::resolve(test_url(""), TestSkillsHost),
    content=(
      #|home:
    ),
  )
}

///|
test "resolve skills host root" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url_with_host(TestSkillsHost, ""),
      TestSkillsHost,
    ),
    content=(
      #|skills:
    ),
  )
}

///|
test "resolve externally configured skills host root" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url_with_host("skills.example.test", ""),
      "skills.example.test",
    ),
    content=(
      #|skills:
    ),
  )
}

///|
test "resolve build-queue" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("build-queue"), TestSkillsHost),
    content=(
      #|build-queue
    ),
  )
}

///|
test "resolve skills list" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("skills"), TestSkillsHost),
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
      TestSkillsHost,
    ),
    content=(
      #|skills:moonbitlang/parser@0.3.3/cmd/moonfmt
    ),
  )
}

///|
test "resolve user" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("user/mizchi"), TestSkillsHost),
    content=(
      #|user:mizchi
    ),
  )
}

///|
test "resolve docs" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url("docs/mizchi/mbt_rs@0.3.0"),
      TestSkillsHost,
    ),
    content=(
      #|docs: mizchi/mbt_rs@0.3.0, fragment: None
    ),
  )
}

///|
test "resolve docs with package path" {
  inspect(
    @util.MooncakesioPath::resolve(
      test_url("docs/moonbitlang/core/builtin"),
      TestSkillsHost,
    ),
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
      TestSkillsHost,
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
      TestSkillsHost,
    ),
    content=(
      #|docs: moonbitlang/core/builtin, fragment: Some("Array::map")
    ),
  )
}

///|
test "resolve assets" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("assets/foo/bar"), TestSkillsHost),
    content=(
      #|assets:assets/foo/bar
    ),
  )
}

///|
test "resolve not found" {
  inspect(
    @util.MooncakesioPath::resolve(test_url("unknown/path"), TestSkillsHost),
    content=(
      #|not-found:unknown/path
    ),
  )
}
