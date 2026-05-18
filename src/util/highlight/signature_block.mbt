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
priv enum State {
  LexStart
  LexSpace(Int)
  LexIdent(List[Char])
  LexQual(List[Char])
  LexQualIdent(Array[String], List[Char])
  LexOp(List[Char])
  LexString(List[Char])
  LexChar(List[Char])
  LexMultiString(List[Char])
  LexNumber(List[Char])
  LexLinkHref(List[Char])
  LexLinkContent(href~ : String, List[Char])
  LexComment(List[Char])
  LexAttr(List[Char])
}

///|
let keywords : Set[String] = Set::from_array([
  "fn", "let", "type", "struct", "enum", "impl", "trait", "derive", "match", "if",
  "else", "typealias", "guard", "for", "in", "while", "loop", "break", "continue",
  "return", "pub", "priv", "mut", "with", "test",
])

///|
let operators : Set[Char] = Set::from_iter("+-*/%&|{}()[]<>!?=,.:;~".iter())

///|
/// The logic for highlighting signature blocks and code blocks cannot currently be shared.
/// For more details, see the docstring of the `push_code_to_span` function.
pub fn parse_signature(signature : String) -> List[CodeSpan] {
  fn go(state : State, s : StringView, acc : List[CodeSpan]) -> List[CodeSpan] {
    match (state, s, acc) {
      (LexStart, ['\n', .. s], acc) =>
        // newline
        // TODO: fix this comment
        go(LexStart, s, acc.add(Newline))

      // spaces
      (LexStart, [' ', .. s], acc) => go(LexSpace(1), s, acc)
      (LexSpace(n), [' ', .. s], acc) => go(LexSpace(n + 1), s, acc)
      (LexSpace(n), s, acc) => go(LexStart, s, acc.add(Space(n)))

      // comment
      (LexStart, [.. "//", .. s], acc) => go(LexComment(@list.empty()), s, acc)
      (LexComment(content), ['\n', .. s] | ([] as s), acc) => {
        let content = String::from_iter(content.rev().iter())
        go(LexStart, s, acc.add(Comment("//\{content}")).add(Newline))
      }
      (LexComment(content), [c, .. s], acc) =>
        go(LexComment(content.add(c)), s, acc)

      // link
      (LexStart, [.. "<a href=\"", .. s], acc) =>
        go(LexLinkHref(@list.empty()), s, acc)
      (LexLinkHref(href), [.. "\">", .. s], acc) => {
        let href = String::from_iter(href.rev().iter())
        go(LexLinkContent(href~, @list.empty()), s, acc)
      }
      (LexLinkHref(href), [c, .. s], acc) =>
        go(LexLinkHref(href.add(c)), s, acc)
      (LexLinkContent(href~, content), [.. "</a>", .. s], acc) => {
        let content = content.rev().iter() |> String::from_iter
        let spans = parse_signature(content)
        go(LexStart, s, acc.add(Link(href~, spans.to_array())))
      }
      (LexLinkContent(href~, content), [c, .. s], acc) =>
        go(LexLinkContent(href~, content.add(c)), s, acc)

      // numbers
      (LexStart, ['0'..='9' as c, .. s], acc) =>
        go(LexNumber(@list.from_array([c])), s, acc)
      // TODO: fix this bad formatting
      (
        LexNumber(nums),
        [
          '0'..='9'
          | '_'
          | 'x'
          | 'b'
          | 'o'
          | '.'
          | 'a'..='f'
          | 'A'..='F' as c,
          .. s,
        ],
        acc,
      ) => go(LexNumber(nums.add(c)), s, acc)
      (LexNumber(nums), s, acc) => {
        let nums = nums.rev().iter() |> String::from_iter
        go(LexStart, s, acc.add(Number(nums)))
      }

      // strings
      (LexStart, ['"', .. s], acc) => go(LexString(@list.empty()), s, acc)
      (LexString(content), [.. "\\\"", .. s], acc) =>
        go(LexString(content.add('\\').add('"')), s, acc)
      (LexString(content), ['"', .. s], acc) => {
        let content = String::from_iter(content.rev().iter())
        go(LexStart, s, acc.add(StringLit("\"\{content}\"")))
      }
      (LexString(content), [c, .. s], acc) =>
        go(LexString(content.add(c)), s, acc)

      // strings
      (LexStart, ['\'', .. s], acc) => go(LexChar(@list.empty()), s, acc)
      (LexChar(content), [.. "\\\'", .. s], acc) =>
        go(LexChar(content.add('\\').add('\'')), s, acc)
      (LexChar(content), ['\'', .. s], acc) => {
        let content = String::from_iter(content.rev().iter())
        go(LexStart, s, acc.add(CharLit("'\{content}'")))
      }
      (LexChar(content), [c, .. s], acc) => go(LexChar(content.add(c)), s, acc)

      // multiline string
      // LexStart, [.. "#|", .. s], acc => continue LexMultiString(Nil), s, acc
      (LexStart, ['#' | '$' as c, '|', .. s], acc) =>
        go(LexMultiString(@list.empty().add(c).add('|')), s, acc)
      (LexMultiString(content), ['\n', .. s] | ([] as s), acc) => {
        let content = content.rev().iter() |> String::from_iter
        go(LexStart, s, acc.add(StringLit(content)).add(Newline))
      }
      (LexMultiString(content), [c, .. s], acc) =>
        go(LexMultiString(content.add(c)), s, acc)

      // attributes: #attribute or #attribute.name
      (LexStart, ['#', 'a'..='z' as c, .. s], acc) =>
        go(LexAttr(@list.from_array([c])), s, acc)
      (
        LexAttr(content),
        ['A'..='Z' | 'a'..='z' | '0'..='9' | '_' | '.' as c, .. s],
        acc,
      ) => go(LexAttr(content.add(c)), s, acc)
      (LexAttr(content), s, acc) => {
        let content = String::from_iter(content.rev().iter())
        go(LexStart, s, acc.add(Attr("#\{content}")))
      }

      // identifiers
      (LexStart, ['A'..='Z' | 'a'..='z' | '_' as c, .. s], acc) =>
        go(LexIdent(@list.from_array([c])), s, acc)
      (LexIdent(id), ['A'..='Z' | 'a'..='z' | '0'..='9' | '_' as c, .. s], acc) =>
        go(LexIdent(id.add(c)), s, acc)
      (LexIdent(id), s, acc) => {
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
        go(LexStart, s, acc.add(span))
      }

      // qualified ident
      (LexStart, ['@', .. s], acc) => go(LexQual(@list.empty()), s, acc)
      (LexQual(path), ['.', .. s], acc) => {
        let path = String::from_iter(path.rev().iter())
          .split("/")
          .map(StringView::to_owned)
          .collect()
        go(LexQualIdent(path, @list.empty()), s, acc)
      }
      (LexQual(path), [c, .. s], acc) => go(LexQual(path.add(c)), s, acc)
      (LexQual(path), [], acc) => {
        let path = String::from_iter(path.rev().iter())
        acc.add(LIdent("@\{path}")).rev()
      }
      (
        LexQualIdent(path, id),
        ['A'..='Z' | 'a'..='z' | '0'..='9' | '_' as c, .. s],
        acc,
      ) => go(LexQualIdent(path, id.add(c)), s, acc)
      (LexQualIdent(path, id), s, acc) => {
        let id = String::from_iter(id.rev().iter())
        go(LexStart, s, acc.add(QualIdent(path.join("/"), id)))
      }

      // operators
      (LexStart, [c, .. s], acc) if operators.contains(c) =>
        go(LexOp(@list.from_array([c])), s, acc)
      (LexOp(op), [c, .. s], acc) if operators.contains(c) =>
        go(LexOp(op.add(c)), s, acc)
      (LexOp(op), s, acc) => {
        let op = String::from_iter(op.rev().iter())
        if s is [.. "a href=\"", .. s] {
          go(
            LexLinkHref(@list.empty()),
            s,
            acc.add(Symbol(op.view(end_offset=op.length() - 1).to_owned())),
          )
        } else {
          go(LexStart, s, acc.add(Symbol(op)))
        }
      }
      (_, [c, .. s], acc) => go(LexStart, s, acc.add(Unknown("\{c}")))
      (_, [], acc) => acc.rev()
    }
  }
  go(LexStart, signature.view(), @list.empty())
}
