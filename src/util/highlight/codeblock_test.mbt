///|
test "parse_signature1" {
  let signature = "fn parse_signature(signature : String) -> Array[CodeSpan]"
  let spans = @highlight.parse(signature)
  inspect!(
    spans,
    content=
      #|[Keyword("fn"), Space(1), LIdent("parse_signature"), Symbol("("), LIdent("signature"), Space(1), Symbol(":"), Space(1), UIdent("String"), Symbol(")"), Space(1), Symbol("->"), Space(1), UIdent("Array"), Symbol("["), UIdent("CodeSpan"), Symbol("]")]
    ,
  )
}

///|
test "parse_signature with link" {
  let signature = "fn <a href=\"list#T\">T</a>::concat[A](self : <a href=\"list#T\">Tasdfasdf</a>[A], other : <a href=\"list#T\">T</a>[A]) -> <a href=\"list#T\">T</a>[A]"
  let spans = @highlight.parse(signature)
  inspect!(
    spans,
    content=
      #|[Keyword("fn"), Space(1), Link(href="list#T", content="T"), Symbol(":"), Symbol(":"), LIdent("concat"), Symbol("["), UIdent("A"), Symbol("]"), Symbol("("), LIdent("self"), Space(1), Symbol(":"), Space(1), Link(href="list#T", content="Tasdfasdf"), Symbol("["), UIdent("A"), Symbol("]"), Symbol(","), Space(1), LIdent("other"), Space(1), Symbol(":"), Space(1), Link(href="list#T", content="T"), Symbol("["), UIdent("A"), Symbol("]"), Symbol(")"), Space(1), Symbol("->"), Space(1), Link(href="list#T", content="T"), Symbol("["), UIdent("A"), Symbol("]")]
    ,
  )
}
