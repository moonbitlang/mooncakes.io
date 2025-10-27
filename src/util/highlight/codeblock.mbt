// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
using @list {type List, cons}

///|
pub(all) enum CodeSpan {
  Unknown(String)
  Keyword(String)
  Symbol(String)
  Link(href~ : String, Array[CodeSpan])
  UIdent(String)
  LIdent(String)
  QualIdent(String, String)
  StringLit(String)
  CharLit(String)
  Number(String)
  Newline
  Space(Int)
  Comment(String)
  Meta(String)
} derive(Show)

///|
fn push_token_spans(token : @tokens.Token, dst : Array[CodeSpan]) -> Unit {
  match token {
    NEWLINE => dst.push(Newline)
    TRY_QUESTION => dst.push(Keyword("try!"))
    NORAISE => dst.push(Keyword("noraise"))
    ENUMVIEW => dst.push(Keyword("enumview"))
    LETREC => dst.push(Keyword("letrec"))
    AND => dst.push(Keyword("and"))
    SUBERROR => dst.push(Keyword("suberror"))
    IS => dst.push(Keyword("is"))
    IN => dst.push(Keyword("in"))
    FOR => dst.push(Keyword("for"))
    DEFER => dst.push(Keyword("defer"))
    GUARD => dst.push(Keyword("guard"))
    LOOP => dst.push(Keyword("loop"))
    TEST => dst.push(Keyword("test"))
    ELLIPSIS => dst.push(Symbol("..."))
    RANGE_EXCLUSIVE => dst.push(Symbol("..<"))
    RANGE_INCLUSIVE => dst.push(Symbol("...="))
    DOTDOT => dst.push(Symbol(".."))
    RETURN => dst.push(Keyword("return"))
    WHILE => dst.push(Keyword("while"))
    THIN_ARROW => dst.push(Symbol("->"))
    FAT_ARROW => dst.push(Symbol("=>"))
    TYPE => dst.push(Keyword("type"))
    MUTABLE => dst.push(Keyword("mut"))
    USING => dst.push(Keyword("using"))
    MATCH => dst.push(Keyword("match"))
    CONST => dst.push(Keyword("const"))
    LET => dst.push(Keyword("let"))
    IF => dst.push(Keyword("if"))
    FN => dst.push(Keyword("fn"))
    ELSE => dst.push(Keyword("else"))
    PIPE => dst.push(Symbol("|>"))
    AS => dst.push(Keyword("as"))
    PACKAGE_NAME(n) => dst.push(LIdent("@\{n}"))
    BARBAR => dst.push(Symbol("||"))
    CARET => dst.push(Symbol("^"))
    AMPER => dst.push(Symbol("&"))
    AMPERAMPER => dst.push(Symbol("&&"))
    RBRACE => dst.push(Symbol("}"))
    LBRACE => dst.push(Symbol("{"))
    BAR => dst.push(Symbol("|"))
    UNDERSCORE => dst.push(Symbol("_"))
    RBRACKET => dst.push(Symbol("]"))
    PLUS => dst.push(Symbol("+"))
    LBRACKET => dst.push(Symbol("["))
    SEMI(faked) => dst.push(if faked { Space(0) } else { Symbol(";") })
    COLON => dst.push(Symbol(":"))
    COLONCOLON => dst.push(Symbol("::"))
    DOT_LPAREN => dst.push(Symbol(".("))
    DOT_INT(n) => dst.push(Number(".\{n}"))
    DOT_UIDENT(n) => dst.push(UIdent(".\{n}"))
    DOT_LIDENT(n) => dst.push(LIdent(".\{n}"))
    EXCLAMATION => dst.push(Symbol("!"))
    QUESTION => dst.push(Symbol("?"))
    MINUS => dst.push(Symbol("-"))
    COMMA => dst.push(Symbol(","))
    RPAREN => dst.push(Symbol(")"))
    LPAREN => dst.push(Symbol("("))
    EQUAL => dst.push(Symbol("="))
    FNALIAS => dst.push(Keyword("fnalias"))
    TRAITALIAS => dst.push(Keyword("traitalias"))
    TYPEALIAS => dst.push(Keyword("typealias"))
    ASYNC => dst.push(Keyword("async"))
    CATCH => dst.push(Keyword("catch"))
    TRY => dst.push(Keyword("try"))
    THROW => dst.push(Keyword("throw"))
    RAISE => dst.push(Keyword("raise"))
    WITH => dst.push(Keyword("with"))
    IMPL => dst.push(Keyword("impl"))
    DERIVE => dst.push(Keyword("derive"))
    TRAIT => dst.push(Keyword("trait"))
    ENUM => dst.push(Keyword("enum"))
    STRUCT => dst.push(Keyword("struct"))
    CONTINUE => dst.push(Keyword("continue"))
    BREAK => dst.push(Keyword("break"))
    EXTERN => dst.push(Keyword("extern"))
    IMPORT => dst.push(Keyword("import"))
    READONLY => dst.push(Keyword("readonly"))
    PRIV => dst.push(Keyword("priv"))
    PUB => dst.push(Keyword("pub"))
    TRUE => dst.push(Keyword("true"))
    FALSE => dst.push(Keyword("false"))
    EOF => dst.push(Space(0))
    AUGMENTED_ASSIGNMENT(op) => dst.push(Symbol(op))
    INFIX4(op) | INFIX3(op) | INFIX2(op) | INFIX1(op) => dst.push(Symbol(op))
    COMMENT(s) => dst.push(Comment(s.content))
    POST_LABEL(label) => dst.push(LIdent(label + "~"))
    UIDENT(s) => dst.push(UIdent(s))
    LIDENT(s) => dst.push(LIdent(s))
    MULTILINE_STRING(s) => dst.push(StringLit("#|\{s}"))
    STRING(s) => dst.push(StringLit("\"\{s}\""))
    DOUBLE(s) => dst.push(Number(s))
    FLOAT(s) => dst.push(Number(s))
    BYTES(s) => dst.push(StringLit("b\"\{s}\""))
    BYTE(s) => dst.push(CharLit("b'\{s}'"))
    INT(s) => dst.push(Number(s))
    CHAR(s) => dst.push(CharLit("'\{s}'"))
    TRY_EXCLAMATION => dst.push(Symbol("try!"))
    ATTRIBUTE((id1, id2, str)) => {
      dst.push(
        match id2 {
          None => Meta("#\{id1}")
          Some(id2) => Meta("#\{id1}\{id2}")
        },
      )
      push_code_to_span(str, dst)
    }
    INTERP(xs) => {
      dst.push(StringLit("\""))
      interp_to_string(xs, dst)
      dst.push(StringLit("\""))
    }
    MULTILINE_INTERP(xs) => {
      dst.push(StringLit("$|"))
      interp_to_string(xs, dst)
    }
  }
}

///|
fn interp_to_string(
  xs : Array[@tokens.InterpElem],
  dst : Array[CodeSpan],
) -> Unit {
  xs.each(x => match x {
    InterpLit(repr~, ..) => dst.push(StringLit(repr))
    InterpSource({ source, .. }) => {
      dst.push(Symbol("\\{"))
      push_code_to_span(source, dst)
      dst.push(Symbol("}"))
    }
  })
}

///|
/// see https://github.com/moonbitlang/parser/issues/77
fn token_to_real_column(triple : @tokens.Triple) -> Int {
  let column = triple.1.column()
  match triple.0 {
    DOT_INT(_) | DOT_LIDENT(_) | DOT_UIDENT(_) => column - 1
    _ => column
  }
}

///|
fn token_to_real_column_end(triple : @tokens.Triple) -> Int {
  triple.2.column()
}

///|
/// A more elegant approach might be to use a `(Source, IntervalTree[Link|Highlight])` 
/// to store the signature, and then merge this pair into HTML during rendering.
/// But currently it's annoying to maintain an IntervalTree module because the 
/// languages breaking change (even the community already have one). 
/// 
/// Using a JavaScript library to insert HTML directly into the DOM is also impossible now,
/// because the implementation of the VDOM behind rabbit-tea relies on the node index.
/// 
/// Another issue is that package paths in Moonbit source code can sometimes be invalid,
/// for example, `@peter-jerry-ye/async` and `@Yoorkin/rabbit-tea`. Such paths may appear 
/// in the generated signature block. The signature block may also contain link information 
/// like `<a href="document">code</a>`, which cannot be rendered directly, nor processed 
/// by moonbitlang/parser/lexer or shiki with existing Moonbit tmLanguage definitions.
/// This issue should be solved by changing the behavior of moondoc.
/// 
fn push_code_to_span(code : String, dst : Array[CodeSpan]) -> Unit {
  let { tokens, errors, .. } = @lexer.tokens_from_string(comment=true, code)
  guard errors is [] else {
    dst.push(Unknown(code))
    return
  }
  let mut previous_column = 1
  loop tokens[:] {
    [(NEWLINE, _, _), .. rest] => {
      previous_column = 1
      dst.push(Newline)
      continue rest
    }
    [
      (PACKAGE_NAME(pkg), _, _) as first,
      (DOT_LIDENT(s) | DOT_UIDENT(s), _, _) as second,
      .. rest,
    ] => {
      let column = token_to_real_column(first)
      if previous_column < column {
        dst.push(Space(column - previous_column))
      }
      dst.push(QualIdent(pkg, s))
      previous_column = token_to_real_column_end(second)
      continue rest
    }
    [triple, .. rest] => {
      let column = token_to_real_column(triple)
      if previous_column < column {
        dst.push(Space(column - previous_column))
      }
      push_token_spans(triple.0, dst)
      previous_column = token_to_real_column_end(triple)
      continue rest
    }
    [] => ()
  }
}

///|
pub fn parse_code(code : String) -> List[CodeSpan] {
  let results = []
  push_code_to_span(code, results)
  @list.from_array(results)
}
