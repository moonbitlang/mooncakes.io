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
pub(all) enum CodeBlockKind {
  Signature
  Code
}

///|
pub fn code_block(moonbit : String, kind~ : CodeBlockKind) -> Html {
  let spans = match kind {
    Code => @highlight.parse_code(moonbit)
    Signature => @highlight.parse_signature(moonbit)
  }
  fn go(x) {
    match x {
      @highlight.Unknown(c) => span([text(c)])
      Keyword(s) => span(class="text-[#0033b3]", [text(s)])
      Symbol(s) => span(class="text-zinc-500 text-nowrap", [text(s)])
      Link(href~, content) =>
        a(
          class="hover:text-gray-700 transition-colors underline underline-offset-4 text-gray-300",
          href="/docs/" + href,
          content.map(go),
        )
      UIdent(s) => span(class="text-gray-800", [text(s)])
      LIdent(s) => span(class="text-[#00627a]", [text(s)])
      Newline => br()
      Space(n) => span([text(" ".repeat(n))])
      CharLit(s) | StringLit(s) | Number(s) =>
        span(class="text-orange-800", [text(s)])
      Comment(s) => span(class="text-green-800", [text(s)])
      Meta(s) => span(class="text-[#AF00DB]", [text(s)])
      QualIdent(path, name) =>
        if kind is Signature {
          span(class="group/ident relative", [
            div(
              class="absolute bottom-[120%] inset-0 flex items-center justify-center ",
              [
                div(
                  class="z-10 -translate-y-2/3 group-hover/ident:inline-block hidden text-gray-700 border-gray-300 border px-2 py-1 bg-white rounded shadow-lg",
                  [
                    text("@" + path + "."),
                    span(class="text-blue-900", [text(name)]),
                  ],
                ),
              ],
            ),
            span(class="text-blue-900", [text(name)]),
          ])
        } else {
          span([
            span(class="text-gray-600", [text("@" + path + ".")]),
            span(class="text-blue-900", [text(name)]),
          ])
        }
    }
  }

  let elems = spans.map(go)
  div(elems.to_array())
}
