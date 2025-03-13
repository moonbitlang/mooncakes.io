///|
pub(all) enum CodeSpan {
  Unknown(Char)
  Keyword(String)
  Symbol(String)
  Link(href~ : String, Array[CodeSpan])
  UIdent(String)
  LIdent(String)
  QualIdent(Array[String], String)
  StringLit(String)
  CharLit(String)
  Number(String)
  Newline
  Space(Int)
  Comment(String)
} derive(Show)

///|
typealias List[A] = @immut/list.T[A]

///|
priv enum State {
  LexStart
  LexSpace(Int)
  LexIdent(List[Char])
  LexQual(List[Char])
  LexQualIdent(Array[String], List[Char])
  LexOp(List[Char])
  LexString(List[Char])
  LexMultiString(List[Char])
  LexNumber(List[Char])
  LexLinkHref(List[Char])
  LexLinkContent(href~ : String, List[Char])
  LexComment(List[Char])
}

///|
let keywords : Set[String] = Set::of([
  "fn", "let", "type", "struct", "enum", "impl", "trait", "derive", "match", "if",
  "else", "typealias", "guard", "for", "in", "while", "loop", "break", "continue",
  "return", "pub", "priv", "mut",
])

///|
let operators : Set[Char] = Set::from_iter("+-*/%&|{}()[]<>!=,.:;~".iter())

///|
pub fn parse(signature : String) -> List[CodeSpan] {
  loop LexStart, signature[:], @immut/list.Nil {
    LexStart, ['\n', .. s], acc =>
      // newline
      // TODO: fix this comment
      continue LexStart, s, Cons(Newline, acc)

    // spaces
    LexStart, [' ', .. s], acc => continue LexSpace(1), s, acc
    LexSpace(n), [' ', .. s], acc => continue LexSpace(n + 1), s, acc
    LexSpace(n), s, acc => continue LexStart, s, Cons(Space(n), acc)

    // comment
    LexStart, [.. "//", .. s], acc => continue LexComment(Nil), s, acc
    LexComment(content), ['\n', .. s] | ([] as s), acc => {
      let content = String::from_iter(content.rev().iter())
      continue LexStart, s, Cons(Newline, Cons(Comment("//" + content), acc))
    }
    LexComment(content), [c, .. s], acc =>
      continue LexComment(Cons(c, content)), s, acc

    // link
    LexStart, [.. "<a href=\"", .. s], acc => continue LexLinkHref(Nil), s, acc
    LexLinkHref(href), [.. "\">", .. s], acc => {
      let href = String::from_iter(href.rev().iter())
      continue LexLinkContent(href~, Nil), s, acc
    }
    LexLinkHref(href), [c, .. s], acc =>
      continue LexLinkHref(Cons(c, href)), s, acc
    LexLinkContent(href~, content), [.. "</a>", .. s], acc => {
      let content = content.rev().iter() |> String::from_iter
      let spans = parse(content)
      continue LexStart, s, Cons(Link(href~, spans.to_array()), acc)
    }
    LexLinkContent(href~, content), [c, .. s], acc =>
      continue LexLinkContent(href~, Cons(c, content)), s, acc

    // numbers
    LexStart, ['0'..='9' as c, .. s], acc =>
      continue LexNumber(Cons(c, Nil)), s, acc
    // TODO: fix this bad formatting
    LexNumber(nums),
    ['0'..='9' | '_' | 'x' | 'b' | 'o' | '.' | 'a'..='f' | 'A'..='F' as c, .. s],
    acc => continue LexNumber(Cons(c, nums)), s, acc
    LexNumber(nums), s, acc => {
      let nums = nums.rev().iter() |> String::from_iter
      continue LexStart, s, Cons(Number(nums), acc)
    }

    // strings
    LexStart, ['"', .. s], acc => continue LexString(Nil), s, acc
    LexString(content), [.. "\\\"", .. s], acc =>
      continue LexString(Cons('"', Cons('\\', content))), s, acc
    LexString(content), ['"', .. s], acc => {
      let content = String::from_iter(content.rev().iter())
      continue LexStart, s, Cons(StringLit(content), acc)
    }
    LexString(content), [c, .. s], acc =>
      continue LexString(Cons(c, content)), s, acc

    // multiline string
    // LexStart, [.. "#|", .. s], acc => continue LexMultiString(Nil), s, acc
    LexStart, ['#' | '$' as c, '|', .. s], acc =>
      continue LexMultiString(Cons('|', Cons(c, Nil))), s, acc
    LexMultiString(content), ['\n', .. s] | ([] as s), acc => {
      let content = content.rev().iter() |> String::from_iter
      continue LexStart, s, Cons(Newline, Cons(StringLit(content), acc))
    }
    LexMultiString(content), [c, .. s], acc =>
      continue LexMultiString(Cons(c, content)), s, acc

    // char
    LexStart, ['\'', c, '\'', .. s], acc =>
      continue LexStart, s, Cons(CharLit(c.to_string()), acc)
    LexStart, [.. "'\\", c, '\'', .. s], acc =>
      continue LexStart,
        s,
        Cons(CharLit("'\\" + String::from_array([c]) + "'"), acc)

    // identifiers
    LexStart, ['A'..='Z' | 'a'..='z' | '_' as c, .. s], acc =>
      continue LexIdent(Cons(c, Nil)), s, acc
    LexIdent(id), ['A'..='Z' | 'a'..='z' | '0'..='9' | '_' as c, .. s], acc =>
      continue LexIdent(Cons(c, id)), s, acc
    LexIdent(id), s, acc => {
      let id = String::from_iter(id.rev().iter())
      let span = match id[0] {
        'a'..='z' =>
          if keywords.contains(id) {
            Keyword(id)
          } else {
            LIdent(id)
          }
        _ => UIdent(id)
      }
      continue LexStart, s, Cons(span, acc)
    }

    // qualified ident
    LexStart, ['@', .. s], acc => continue LexQual(Nil), s, acc
    LexQual(path), ['.', .. s], acc => {
      let path = String::from_iter(path.rev().iter()).split("/").collect()
      continue LexQualIdent(path, Nil), s, acc
    }
    LexQual(path), [c, .. s], acc => continue LexQual(Cons(c, path)), s, acc
    LexQualIdent(path, id),
    ['A'..='Z' | 'a'..='z' | '0'..='9' | '_' as c, .. s],
    acc => continue LexQualIdent(path, Cons(c, id)), s, acc
    LexQualIdent(path, id), s, acc => {
      let id = String::from_iter(id.rev().iter())
      continue LexStart, s, Cons(QualIdent(path, id), acc)
    }

    // operators
    LexStart, [c, .. s], acc if operators.contains(c) =>
      continue LexOp(Cons(c, Nil)), s, acc
    LexOp(op), [c, .. s], acc if operators.contains(c) =>
      continue LexOp(Cons(c, op)), s, acc
    LexOp(op), s, acc => {
      let op = String::from_iter(op.rev().iter())
      if s is [.. "a href=\"", .. s] {
        continue LexLinkHref(Nil),
          s,
          Cons(Symbol(op[:op.length() - 1].to_string()), acc)
      } else {
        continue LexStart, s, Cons(Symbol(op), acc)
      }
    }
    _, [c, .. s], acc => continue LexStart, s, Cons(Unknown(c), acc)
    _, [], acc => acc.rev()
  }
}
