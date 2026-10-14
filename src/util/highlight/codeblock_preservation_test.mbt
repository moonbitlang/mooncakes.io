///|
fn highlighted_text(source : String) -> String raise {
  let text = StringBuilder()
  for span in @highlight.parse_code(source) {
    match span {
      Keyword(s)
      | Symbol(s)
      | UIdent(s)
      | LIdent(s)
      | StringLit(s)
      | CharLit(s)
      | Number(s)
      | Comment(s)
      | Attr(s) => text.write_string(s)
      QualIdent(path, name) => text.write_string("@\{path}.\{name}")
      Newline => text.write_char('\n')
      Space(n) => text.write_string(" ".repeat(n))
      Unknown(_) => fail("unexpected lexer error in: \{source}")
      Link(_, ..) => fail("unexpected signature link in code")
    }
  }
  text.to_string()
}

///|
test "code highlighting preserves namespaced attributes and extend declarations" {
  let source =
    #|#moonspec.given("a calculator")
    #|fn given_calculator(world : CalcWorld) -> Unit {
    #|  world.result = 0
    #|}
    #|
    #|pub extend CalcWorld with Default::{default}
  assert_eq(highlighted_text(source), source)
  assert_true(
    @highlight.parse_code(source).to_array() is [Attr("#moonspec.given"), ..],
  )
  assert_true(
    @highlight.parse_code("pub extend CalcWorld with Default::{default}").to_array()
    is [Keyword("pub"), Space(1), Keyword("extend"), ..],
  )
  for
    source in [
      "#deprecated", "#deprecated(\"use another function\")", "#moonspec.then",
    ] {
    assert_eq(highlighted_text(source), source)
  }
}

///|
test "code highlighting preserves all newly supported keywords" {
  for
    source in [
      "extend", "var", "proof_assert", "proof_let", "extenum", "declare", "errdefer",
      "nocancel", "nobreak", "where", "lexmatch", "lexscan", "package", "guard!",
      "try?",
    ] {
    assert_eq(highlighted_text(source), source)
    assert_true(
      @highlight.parse_code(source).to_array() is [Keyword(keyword), ..] &&
      keyword == source,
    )
  }
}

///|
test "code highlighting preserves operators ranges and transparent labels" {
  for
    source in [
      "value += 1", "text =~ pattern", "f <| value", "output <+ value", "output <? value",
      "[|1, 2|]", "0..=9", "0..<=9", "0..<9", "9>..0", "9>=..0", "∀", "∃", "true → false",
      "f(label~~)",
    ] {
    assert_eq(highlighted_text(source), source)
  }
}

///|
test "code highlighting preserves regex and byte string interpolation" {
  for
    source in [
      (
        #|re"[a-z]+"
      ),
      (
        #|re""
      ),
      (
        #|re"prefix\{pattern}suffix"
      ),
      (
        #|b"prefix\{value}suffix"
      ),
      (
        #|b"\{value}"
      ),
    ] {
    assert_eq(highlighted_text(source), source)
  }
}
