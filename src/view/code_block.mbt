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
pub fn code_block(
  moonbit : String,
  kind~ : CodeBlockKind,
  transform_link? : (String) -> String,
) -> Html {
  let spans = match kind {
    Code => @highlight.parse_code(moonbit)
    Signature => @highlight.parse_signature(moonbit)
  }
  fn go(x) {
    match x {
      @highlight.Unknown(c) => span(c)
      Keyword(s) => span(class="text-blue-800 dark:text-blue-300", s)
      Symbol(s) => span(class="text-zinc-500 dark:text-gray-400 text-nowrap", s)
      Link(href~, content) => {
        let href = match transform_link {
          Some(f) => f(href)
          None => href
        }
        a(
          class="hover:text-gray-700 dark:hover:text-slate-200 transition-colors underline underline-offset-4 text-gray-300 dark:text-gray-500",
          href="/docs/\{href}",
          content.map(go),
        )
      }
      UIdent(s) => span(class="text-gray-800 dark:text-slate-200", s)
      LIdent(s) => span(class="text-cyan-800 dark:text-sky-300", s)
      Newline => br()
      Space(n) => span(" ".repeat(n))
      CharLit(s) | StringLit(s) | Number(s) =>
        span(class="text-orange-800 dark:text-orange-300", s)
      Comment(s) => span(class="text-green-800 dark:text-emerald-400", s)
      Attr(s) => span(class="text-fuchsia-600 dark:text-fuchsia-300", s)
      QualIdent(path, name) =>
        if kind is Signature {
          span(class="group/ident relative") <| [
            div(
              class="absolute bottom-[120%] inset-0 flex items-center justify-center ",
            ) <| [
              div(
                class="z-10 -translate-y-2/3 group-hover/ident:inline-block hidden text-gray-700 dark:text-slate-300 border-gray-300 dark:border-zinc-700 border px-2 py-1 bg-white dark:bg-zinc-900 rounded shadow-lg",
              ) <| [
                text("@\{path}."),
                span(class="text-blue-900 dark:text-indigo-300", name),
              ],
            ],
            span(class="text-blue-900 dark:text-indigo-300", name),
          ]
        } else {
          span() <| [
            span(class="text-gray-600 dark:text-slate-400", "@\{path}."),
            span(class="text-blue-900 dark:text-indigo-300", name),
          ]
        }
    }
  }

  let elems = spans.map(go)
  div(elems.to_array())
}
