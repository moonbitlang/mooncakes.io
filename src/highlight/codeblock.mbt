///|
pub(all) enum CodeSpan {
  Code(String)
  Keyword(String)
  Symbol(String)
  Link(href~ : String, content~ : String)
  UIdent(String)
  LIdent(String)
  StringLiteral(String)
  NumberLiteral(String)
  Newline
  Space(Int)
} derive(Show)

///|
typealias List[A] = @immut/list.T[A]

///|
enum ParseState {
  ParsingStart(List[Char])
  ParsingLIdent(acc~ : List[Char], List[Char])
  ParsingUIdent(acc~ : List[Char], List[Char])
  ParsingLinkL(acc~ : List[Char], List[Char])
  ParsingLinkM(href~ : String, acc~ : List[Char], List[Char])
  ParsingLinkR(href~ : String, conetnt~ : String, List[Char])
  ParsingSpace(Int, List[Char])
  ParsingCode(acc~ : List[Char], List[Char])
  ParsingString(acc~ : List[Char], List[Char])
  ParsingNumber(acc~ : List[Char], List[Char])
}

///|
let keywords : Set[String] = Set::of([
  "fn", "let", "type", "struct", "enum", "impl", "trait", "derive", "match", "if",
  "else", "typealias", "guard", "for", "in", "while", "loop", "break", "continue",
  "return", "pub", "priv", "mut",
])

///|
pub fn parse(signature : String) -> Array[CodeSpan] {
  let signature = signature.to_array() |> @immut/list.from_array()
  fn parse(state, spans : List[CodeSpan]) {
    match state {
      ParsingStart(Cons('A'..='Z' | '/' as x, xs)) =>
        parse(ParsingUIdent(acc=Cons(x, Nil), xs), spans)
      ParsingStart(Cons('a'..='z' | '/' as x, xs)) =>
        parse(ParsingLIdent(acc=Cons(x, Nil), xs), spans)
      ParsingStart(Cons('.', Cons('.', xs))) =>
        parse(ParsingStart(xs), Cons(Symbol(".."), spans))
      ParsingStart(Cons('-', Cons('>', xs))) =>
        parse(ParsingStart(xs), Cons(Symbol("->"), spans))
      ParsingStart(
        Cons(
          '<',
          Cons(
            'a',
            Cons(
              ' ',
              Cons(
                'h',
                Cons('r', Cons('e', Cons('f', Cons('=', Cons('"', xs)))))
              )
            )
          )
        )
      ) => parse(ParsingLinkL(acc=Nil, xs), spans)
      ParsingStart(
        Cons(
          '('
          | ')'
          | '['
          | ']'
          | '{'
          | '}'
          | ':'
          | ','
          | '?'
          | '!'
          | '~'
          | '@'
          | '.'
          | '|'
          | '>'
          | '<'
          | '=' as x,
          xs
        )
      ) => parse(ParsingStart(xs), Cons(Symbol(String::from_array([x])), spans))
      ParsingStart(Cons('0'..='9' as x, xs)) =>
        parse(ParsingNumber(acc=Cons(x, Nil), xs), spans)
      ParsingStart(Cons('"' as x, xs)) =>
        parse(ParsingString(acc=Nil, xs), spans)
      ParsingNumber(Cons('0'..='9' as x, xs), acc~) =>
        parse(ParsingNumber(acc=Cons(x, acc), xs), spans)
      ParsingNumber(xs, acc~) =>
        parse(
          ParsingStart(xs),
          Cons(NumberLiteral(String::from_array(acc.rev().to_array())), spans),
        )
      ParsingString(Cons('\\', Cons(x, xs)), acc~) =>
        parse(ParsingString(acc=Cons(x, acc), xs), spans)
      ParsingString(Cons('"', xs), acc~) =>
        parse(
          ParsingStart(xs),
          Cons(StringLiteral(String::from_array(acc.rev().to_array())), spans),
        )
      ParsingString(Cons(x, xs), acc~) =>
        parse(ParsingString(acc=Cons(x, acc), xs), spans)
      ParsingStart(Cons('\n' | '\r', xs)) =>
        parse(ParsingStart(xs), Cons(Newline, spans))
      ParsingStart(Cons(' ', xs)) => parse(ParsingSpace(1, xs), spans)
      ParsingSpace(n, Cons(' ', xs)) => parse(ParsingSpace(n + 1, xs), spans)
      ParsingSpace(n, xs) => parse(ParsingStart(xs), Cons(Space(n), spans))
      ParsingUIdent(
        Cons('A'..='Z' | 'a'..='z' | '0'..='9' | '_' as x, xs),
        acc~
      ) => parse(ParsingUIdent(acc=Cons(x, acc), xs), spans)
      ParsingUIdent(xs, acc~) =>
        parse(
          ParsingStart(xs),
          Cons(UIdent(String::from_array(acc.rev().to_array())), spans),
        )
      ParsingLIdent(
        Cons('A'..='Z' | 'a'..='z' | '0'..='9' | '_' as x, xs),
        acc~
      ) => parse(ParsingLIdent(acc=Cons(x, acc), xs), spans)
      ParsingLIdent(xs, acc~) => {
        let ident = String::from_array(acc.rev().to_array())
        let span = if keywords.contains(ident) {
          Keyword(ident)
        } else {
          LIdent(ident)
        }
        parse(ParsingStart(xs), Cons(span, spans))
      }
      ParsingLinkL(Cons('"', Cons('>', xs)), acc~) =>
        parse(
          ParsingLinkM(
            href=String::from_array(acc.rev().to_array()),
            acc=Nil,
            xs,
          ),
          spans,
        )
      ParsingLinkL(Cons(x, xs), acc~) =>
        parse(ParsingLinkL(acc=Cons(x, acc), xs), spans)
      ParsingLinkM(Cons('<', Cons('/', Cons('a', Cons('>', xs)))), href~, acc~) =>
        parse(
          ParsingStart(xs),
          Cons(
            Link(href~, content=String::from_array(acc.rev().to_array())),
            spans,
          ),
        )
      ParsingLinkM(Cons(x, xs), href~, acc~) =>
        parse(ParsingLinkM(href~, acc=Cons(x, acc), xs), spans)
      _ => spans.rev().to_array()
    }
  }

  parse(ParsingStart(signature), Nil)
}
