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
fn[M] unsupported(node_type : String, message : String) -> @html.Html[M] {
  @html.p(klass="text-red-500", [
    text("Unsupported markdown syntax: " + node_type + " " + message),
  ])
}

///|
fn[M] inline_text(str : String) -> @html.Html[M] {
  @html.span(klass="inline leading-loose", [text(str)])
}

///|
fn[M] image_render(img : @cmark.Inline) -> @html.Html[M] {
  guard img is Image(img) else {
    println(img)
    abort("not an image")
  }
  match img {
    {
      v: {
        text: Text({ v: alt, .. }),
        reference: Inline({ v: { dest: src, .. }, .. }),
      },
      ..,
    } =>
      match src {
        Some({ v: src, .. }) => @html.img(klass="my-2", src~, alt~, [])
        None => @html.text("Loading image failed: invalid url")
      }
    { v: { reference: Ref(_), .. }, .. } => {
      println("Unsupported image reference")
      @html.nothing()
    }
    { v: { text: _, .. }, .. } => {
      println(
        "Unexpected behavior: If program reaches here, there is a cmark parse error",
      )
      panic()
    }
  }
}

///|
pub fn[M] markdown(
  markdown : String,
  small_heading~ : Bool = false
) -> @html.Html[M] {
  let doc = @cmark.Doc::from_string(markdown, strict=false)
  let link_defs = {}
  doc.defs
  .iter()
  .each(fn(x) {
    if x is (key, LinkDef({ v: { dest: Some({ v: dest, .. }), .. }, .. })) {
      link_defs.set(key, dest)
    }
  })
  fn unwrap_inline_link(x) {
    match x {
      ({
        text: Text({ v: txt, .. }),
        reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
      } : @cmark.InlineLink) =>
        [
          @html.a(
            klass="text-blue-600 underline underline-offset-2",
            href=link,
            [inline_text(txt)],
          ),
        ]
      ({
        text: Image(_) as img,
        reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
      } : @cmark.InlineLink) =>
        [
          @html.a(href=link, style=["display: inline-block"], [
            image_render(img),
          ]),
        ]
      ({
        text: inline,
        reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
      } : @cmark.InlineLink) => [@html.a(href=link, inline2html(inline))]
      ({ text: inline, reference: Inline({ v: { dest: None, .. }, .. }) } : @cmark.InlineLink) =>
        inline2html(inline)
      ({ text: inline, reference: Ref(_, _, { key, .. }) } : @cmark.InlineLink) =>
        if link_defs.get(key) is Some(url) {
          [
            @html.a(
              klass=" text-blue-600 underline underline-offset-2",
              href=url,
              [..inline2html(inline)],
            ),
          ]
        } else {
          inline2html(inline)
        }
    }
  }

  fn inline2html(x) {
    match x {
      @cmark.Inline::Autolink({ v: { link: { v, .. }, .. }, .. }) =>
        [@html.a(href=v, [inline_text(v)])]
      Break(_) => [text("\n")]
      CodeSpan({ v: { code_layout: tight, .. }, .. }) =>
        [
          span(
            klass="font-mono bg-[#f0f0f0] text-sm px-1 py-[1px] rounded",
            tight.map(fn(x) { text(x.node.v) }).to_array(),
          ),
        ]
      Emphasis({ v: { inline, .. }, .. }) => [@html.em(inline2html(inline))]
      Image(_) as img => [image_render(img)]
      Inlines({ v, .. }) => v.map(inline2html).to_array().flatten()
      Link({ v: link, .. }) => unwrap_inline_link(link)
      StrongEmphasis({ v: { inline, .. }, .. }) => {
        let inline = inline2html(inline)
        [@html.strong(inline)]
      }
      Text({ v: str, .. }) => [inline_text(str)]
      RawHtml({ v: str, .. }) => [unsupported("RawHtml", str.to_string())]
      ExtStrikethrough({ v: inline, .. }) =>
        [unsupported("ExtStrikethrough", inline.to_string())]
      ExtMathSpan({ v: math, .. }) =>
        [unsupported("ExtMathSpan", math.to_string())]
    }
  }

  fn block2html(x) {
    match x {
      @cmark.Block::BlankLine(_) => p([])
      BlockQuote({ v: { block, .. }, .. }) =>
        @html.blockquote(
          klass="border-l-4 border-gray-400 bg-gray-50 text-gray-600 py-2 pl-4 my-2",
          [block2html(block)],
        )
      Blocks({ v: xs, .. }) => span(xs.map(block2html).to_array())
      CodeBlock({ v: { code, info_string, .. }, .. }) => {
        let code = code.iter().map(fn(node) { node.v }).join("\n")
        let code = if info_string is Some({ v: lang, .. }) &&
          (lang == "mbt" || lang == "moonbit") {
          let code = code_block(code, collapse_namespace=false)
          @html.code(klass="font-mono", [code])
        } else {
          @html.code(klass="font-mono", [div([text(code)])])
        }
        pre(klass="bg-gray-100 p-4 my-4 text-sm rounded overflow-x-auto", [code])
      }
      Heading({ v: { level, inline, .. }, .. }) => {
        let inline = inline2html(inline)
        if small_heading {
          match level {
            1 => h3(klass="text-gray-900 font-bold mt-1 text-sm", inline)
            2 | 3 => h4(klass="text-gray-900 font-semibold text-sm", inline)
            _ => div(klass="text-gray-900", inline)
          }
        } else {
          match level {
            1 =>
              h1(klass="text-gray-800 font-semibold mt-4 mb-2 text-3xl", inline)
            2 =>
              h2(
                klass="text-gray-800 font-semibold mt-4 mb-2 border-b text-2xl",
                inline,
              )
            3 =>
              h3(klass="text-gray-800 font-semibold text-xl mt-3 mb-2", inline)
            4 => h4(klass="text-gray-800", inline)
            _ => h5(klass="text-gray-800", inline)
          }
        }
      }
      List({ v: { ty: ordered, tight, items }, .. }) => {
        let items = items
          .map(fn {
            { v: { block, ext_task_marker, .. }, .. } =>
              if ext_task_marker is Some({ v: char, .. }) {
                @html.li(klass="list-inside flex gap-1", [
                  @html.input(
                    input_type=Checkbox,
                    read_only=true,
                    checked=char == 'x' || char == 'X',
                  ),
                  block2html(block),
                ])
              } else {
                @html.li(klass="list-inside", [block2html(block)])
              }
          })
          .to_array()
        let klass = "ml-2 list-inside " +
          (if tight { "space-y-0.5" } else { "space-y-1" })
        match ordered {
          @cmark_base.Unordered(_) => ul(klass=klass + " list-disc", items)
          @cmark_base.Ordered(start, _) =>
            ol(start~, klass=klass + " list-decimal", items)
        }
      }
      Paragraph({ v: { inline, .. }, .. }) => @html.span(inline2html(inline))
      ThematicBreak(_) => hr(klass="my-4")
      ExtTable({ v: { rows, .. }, .. }) => {
        let colgroup = []
        let body = rows
          .to_array()
          .mapi(fn(i, row) {
            match row {
              ({ v: Header(cols), .. }, _) => {
                let colgroup = if colgroup.length() > 0 { 1 } else { 0 }
                let klass = if (i - colgroup) % 2 == 0 {
                  "bg-gray-100"
                } else {
                  ""
                }
                let cols = cols
                  .map(fn {
                    (inline, _) =>
                      @html.th(
                        klass="border border-gray-300 p-2 font-semibold",
                        inline2html(inline),
                      )
                  })
                  .to_array()
                @html.tr(klass~, cols)
              }
              ({ v: Data(cols), .. }, _) => {
                let colgroup = if colgroup.length() > 0 { 1 } else { 0 }
                let klass = if (i - colgroup) % 2 == 0 {
                  "bg-gray-100"
                } else {
                  ""
                }
                let cols = cols
                  .map(fn {
                    (inline, _) =>
                      @html.td(
                        klass="border border-gray-300 p-2",
                        inline2html(inline),
                      )
                  })
                  .to_array()
                @html.tr(klass~, cols)
              }
              ({ v: Sep(cols), .. }, _) => {
                cols
                .iter()
                .each(fn {
                  { v: (align, _), .. } =>
                    match align {
                      Some(Left) =>
                        colgroup.push(@html.col(klass="text-left", []))
                      Some(Center) =>
                        colgroup.push(@html.col(klass="text-center", []))
                      Some(Right) =>
                        colgroup.push(@html.col(klass="text-right", []))
                      None => colgroup.push(@html.col(klass="", []))
                    }
                })
                @html.nothing()
              }
            }
          })
        @html.table(
          klass="w-full table-auto my-6 border-2 border-collapse border-gray-300",
          [@html.colgroup(colgroup), @html.tbody(body)],
        )
      }
      LinkRefDefinition(_) => @html.nothing()
      ExtMathBlock({ v: math, .. }) =>
        unsupported("ExtMathBlock", math.to_string())
      HtmlBlock({ v: html, .. }) => unsupported("HtmlBlock", html.to_string())
      ExtFootnoteDefinition({ v: footnote, .. }) =>
        unsupported("ExtFootnoteDefinition", footnote.to_string())
    }
  }

  let folder : @cmark.Folder[Array[@html.Html[M]]] = {
    inline_ext_default: fn(_, acc, _) { acc },
    block_ext_default: fn(_, acc, _) { acc },
    inline: fn(_, acc, inline) {
      @cmark.FolderResult::Fold([..acc, ..inline2html(inline)])
    },
    block: fn(_, acc, block) {
      @cmark.FolderResult::Fold([..acc, block2html(block)])
    },
  }
  try folder.fold_doc([], doc) catch {
    @cmark.FolderError(msg) => text("Failed to render markdown: \{msg}")
  } else {
    htmls => div(klass="w-full text-base text-[#3c3c43]", htmls)
  }
}
