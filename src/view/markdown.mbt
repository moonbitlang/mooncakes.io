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
fn unsupported(node_type : String, message : String) -> @html.Html {
  println("Unsupported markdown syntax: \{node_type} \{message}")
  nothing
}

///|
fn inline_text(str : String) -> @html.Html {
  @html.span(class="inline", str)
}

///|
fn inline_plain_text(inline : @cmark.Inline) -> String {
  let lines = inline.to_plain_text(break_on_soft=false)
  lines.iter().map(fn(line) { line.iter().join("") }).join("\n")
}

///|
fn image_render(
  img : @cmark.Inline,
  transform_link? : (String) -> String,
) -> @html.Html {
  guard img is Image(img) else {
    println(repr(img))
    abort("not an image")
  }
  match img {
    {
      v: {
        text: alt,
        reference: Inline({ v: { dest: Some({ v: src, .. }), .. }, .. }),
      },
      ..,
    } => {
      let alt = inline_plain_text(alt)
      let src = match transform_link {
        Some(f) => f(src)
        None => src
      }
      @html.img(class="my-2", src~, alt~)
    }
    { v: { reference: Inline({ v: { dest: None, .. }, .. }), .. }, .. } =>
      @html.text("Loading image failed: invalid url")
    { v: { reference: Ref(_), .. }, .. } => {
      println("Unsupported image reference")
      @html.nothing
    }
  }
}

///|
fn inline2html(
  x : @cmark.Inline,
  link_defs~ : Map[String, String],
  transform_link? : (String) -> String,
) -> Array[@html.Html] {
  match x {
    Autolink({ v: { link: { v, .. }, .. }, .. }) =>
      [@html.a(href=v, inline_text(v))]
    Break(_) => [text("\n")]
    CodeSpan({ v: { code_layout: tight, .. }, .. }) =>
      [
        span(
          class="font-mono bg-zinc-200 dark:bg-gray-900 text-gray-800 dark:text-slate-200 text-[0.9em] px-[5px] py-[2px] rounded",
          tight.map(fn(x) { text(x.node.v) }).to_array(),
        ),
      ]
    Emphasis({ v: { inline, .. }, .. }) =>
      [@html.em(inline2html(inline, link_defs~, transform_link?))]
    Image(_) as img => [image_render(img, transform_link?)]
    Inlines({ v, .. }) =>
      v
      .map(x => inline2html(x, link_defs~, transform_link?))
      .to_array()
      .flatten()
    Link({ v: link, .. }) =>
      unwrap_inline_link(link, link_defs~, transform_link?)
    StrongEmphasis({ v: { inline, .. }, .. }) => {
      let inline = inline2html(inline, link_defs~, transform_link?)
      [@html.strong(inline)]
    }
    Text({ v: str, .. }) => [inline_text(str)]
    RawHtml({ v: str, .. }) => [unsupported("RawHtml", repr(str))]
    ExtStrikethrough({ v: inline, .. }) =>
      [unsupported("ExtStrikethrough", repr(inline))]
    ExtMathSpan({ v: math, .. }) => [unsupported("ExtMathSpan", repr(math))]
  }
}

///|
fn is_moonbit(lang : String) -> Bool {
  let lang = lang.to_lower()
  lang.has_prefix("mbt") || lang.has_prefix("moonbit")
}

///|
fn unique_heading_id(
  inline : @cmark.Inline,
  used_heading_ids : Map[String, Unit],
) -> String {
  let generated = inline.id()
  let base = if generated.is_empty() { "section" } else { generated }
  let mut id = base
  let mut suffix = 1
  while used_heading_ids.contains(id) {
    id = "\{base}-\{suffix}"
    suffix += 1
  }
  used_heading_ids.set(id, ())
  id
}

///|
fn heading_content(
  id : String,
  inline : Array[@html.Html],
) -> Array[@html.Html] {
  let anchor = a(
    href="#\{id}",
    class="absolute -left-5 text-gray-300 dark:text-gray-500 hover:text-gray-500 dark:hover:text-slate-400 opacity-0 group-hover/markdown-heading:opacity-100 focus:opacity-100 transition-opacity no-underline",
    title="Link to this section",
    "#",
  )
  [anchor, ..inline]
}

///|
fn block2html(
  x : @cmark.Block,
  small_heading~ : Bool,
  heading_anchors~ : Bool,
  link_defs~ : Map[String, String],
  used_heading_ids~ : Map[String, Unit],
  transform_link? : (String) -> String,
  paragraph_margin? : Bool = false,
) -> @html.Html {
  match x {
    BlankLine(_) => p(nothing)
    BlockQuote({ v: { block, .. }, .. }) =>
      @html.blockquote(
        class="border-l-4 border-gray-400 dark:border-zinc-600 bg-gray-50 dark:bg-zinc-950 text-gray-600 dark:text-slate-400 py-2 pl-4 my-2",
        block2html(
          block,
          small_heading~,
          heading_anchors~,
          link_defs~,
          used_heading_ids~,
          transform_link?,
          paragraph_margin=true,
        ),
      )
    Blocks({ v: xs, .. }) =>
      span(
        xs
        .map(x => {
          block2html(
            x,
            small_heading~,
            heading_anchors~,
            link_defs~,
            used_heading_ids~,
            transform_link?,
            paragraph_margin~,
          )
        })
        .to_array(),
      )
    CodeBlock({ v: { code, info_string, .. }, .. }) => {
      let code = code.iter().map(fn(node) { node.v }).join("\n")
      let code = if info_string is Some({ v: lang, .. }) && is_moonbit(lang) {
        let code = code_block(code, kind=Code)
        @html.code(class="font-mono", code)
      } else {
        @html.code(class="font-mono", div(code))
      }
      pre(
        class="bg-gray-100 dark:bg-zinc-900 p-4 my-4 text-sm rounded overflow-x-auto",
        code,
      )
    }
    Heading({ v: { level, inline, .. }, .. }) =>
      if small_heading {
        let inline = inline2html(inline, link_defs~, transform_link?)
        match level {
          1 =>
            h3(
              class="text-gray-900 dark:text-slate-50 font-bold mt-1 text-sm",
              inline,
            )
          2 | 3 =>
            h4(
              class="text-gray-900 dark:text-slate-50 font-semibold text-sm",
              inline,
            )
          _ => div(class="text-gray-900 dark:text-slate-50", inline)
        }
      } else {
        let id = if heading_anchors {
          Some(unique_heading_id(inline, used_heading_ids))
        } else {
          None
        }
        let inline = if id is Some(id) {
          heading_content(id, inline2html(inline, link_defs~, transform_link?))
        } else {
          inline2html(inline, link_defs~, transform_link?)
        }
        let anchor_class = if heading_anchors {
          " relative scroll-mt-header group/markdown-heading"
        } else {
          ""
        }
        match level {
          1 =>
            h1(
              id?,
              class="text-gray-800 dark:text-slate-200 font-semibold mb-4 pb-2 text-2xl md:text-4xl\{anchor_class}",
              inline,
            )
          2 =>
            h2(
              id?,
              class="text-gray-800 dark:text-slate-200 font-semibold mt-6 mb-4 pb-2 border-b text-xl md:text-2xl\{anchor_class}",
              inline,
            )
          3 =>
            h3(
              id?,
              class="text-gray-800 dark:text-slate-200 font-semibold text-lg md:text-xl mt-6 mb-4\{anchor_class}",
              inline,
            )
          4 =>
            h4(
              id?,
              class="text-gray-800 dark:text-slate-200\{anchor_class}",
              inline,
            )
          _ =>
            h5(
              id?,
              class="text-gray-800 dark:text-slate-200\{anchor_class}",
              inline,
            )
        }
      }
    List({ v: { ty: ordered, tight, items }, .. }) => {
      let has_task = items.iter().any(fn(x) { x.v.ext_task_marker is Some(_) })
      let items = items
        .map(x => {
          let { v: { block, ext_task_marker, .. }, .. } = x
          if ext_task_marker is Some({ v: char, .. }) {
            @html.li(class="list-none") <| [
              @html.label(class="flex items-baseline gap-2 pointer-events-none") <| [
                @html.input(
                  input_type=Checkbox,
                  read_only=true,
                  checked=char == 'x' || char == 'X',
                  class="shrink-0 pointer-events-none",
                ),
                span(
                  block2html(
                    block,
                    small_heading~,
                    heading_anchors~,
                    link_defs~,
                    used_heading_ids~,
                    transform_link?,
                  ),
                ),
              ],
            ]
          } else {
            @html.li(
              block2html(
                block,
                small_heading~,
                heading_anchors~,
                link_defs~,
                used_heading_ids~,
                transform_link?,
              ),
            )
          }
        })
        .to_array()
      let spacing = if tight || has_task { "space-y-1" } else { "space-y-2" }
      let class = if has_task {
        "pl-4 mb-4 \{spacing}"
      } else {
        "pl-8 mb-4 \{spacing}"
      }
      match ordered {
        Unordered(_) => {
          let list_prefix = if has_task { "" } else { "list-disc " }
          ul(class="\{list_prefix}\{class}", items)
        }
        Ordered(start, _) => ol(start~, class="list-decimal \{class}", items)
      }
    }
    Paragraph({ v: { inline, .. }, .. }) => {
      let child = @html.span(inline2html(inline, link_defs~, transform_link?))
      if paragraph_margin {
        div(class="mb-4 md:pr-8", child)
      } else {
        child
      }
    }
    ThematicBreak(_) => hr(class="my-6 border-2")
    ExtTable({ v: { rows, .. }, .. }) => {
      let colgroup = []
      let body = rows
        .to_array()
        .mapi(fn(i, row) {
          match row {
            ({ v: Header(cols), .. }, _) => {
              let colgroup = if colgroup.length() > 0 { 1 } else { 0 }
              let class = if (i - colgroup) % 2 == 0 {
                "bg-gray-100 dark:bg-zinc-900"
              } else {
                ""
              }
              let cols = cols
                .map(x => {
                  @html.th(
                    class="border border-gray-300 dark:border-zinc-700 p-2 font-semibold",
                    inline2html(x.0, link_defs~, transform_link?),
                  )
                })
                .to_array()
              @html.tr(class~, cols)
            }
            ({ v: Data(cols), .. }, _) => {
              let colgroup = if colgroup.length() > 0 { 1 } else { 0 }
              let class = if (i - colgroup) % 2 == 0 {
                "bg-gray-100 dark:bg-zinc-900"
              } else {
                ""
              }
              let cols = cols
                .map(x => {
                  @html.td(
                    class="border border-gray-300 dark:border-zinc-700 p-2",
                    inline2html(x.0, link_defs~, transform_link?),
                  )
                })
                .to_array()
              @html.tr(class~, cols)
            }
            ({ v: Sep(cols), .. }, _) => {
              cols
              .iter()
              .each(x => {
                match x {
                  { v: TableSep((align, _)), .. } =>
                    match align {
                      Some(Left) => colgroup.push(@html.col(class="text-left"))
                      Some(Center) =>
                        colgroup.push(@html.col(class="text-center"))
                      Some(Right) =>
                        colgroup.push(@html.col(class="text-right"))
                      None => colgroup.push(@html.col(class=""))
                    }
                }
              })
              @html.nothing
            }
          }
        })
      @html.div(class="w-full overflow-x-auto") <| [
        @html.table(
          class="max-width-full my-6 border-collapse border-gray-300 dark:border-zinc-700",
        ) <| [
          @html.colgroup(colgroup),
          @html.tbody(body),
        ],
      ]
    }
    LinkRefDefinition(_) => @html.nothing
    ExtMathBlock({ v: math, .. }) => unsupported("ExtMathBlock", repr(math))
    HtmlBlock({ v: html, .. }) => unsupported("HtmlBlock", repr(html))
    ExtFootnoteDefinition({ v: footnote, .. }) =>
      unsupported("ExtFootnoteDefinition", repr(footnote))
  }
}

///|
fn unwrap_inline_link(
  x : @cmark.InlineLink,
  link_defs~ : Map[String, String],
  transform_link? : (String) -> String,
) -> Array[@html.Html] {
  match x {
    ({
      text: Text({ v: txt, .. }),
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [
        @html.a(
          class="text-blue-600 dark:text-blue-300 underline underline-offset-2",
          href=match transform_link {
            Some(f) => f(link)
            None => link
          },
          inline_text(txt),
        ),
      ]
    ({
      text: Image(_) as img,
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [
        @html.a(
          href=match transform_link {
            Some(f) => f(link)
            None => link
          },
          style=["display: inline-block"],
          image_render(img, transform_link?),
        ),
      ]
    ({
      text: inline,
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [
        @html.a(
          href=match transform_link {
            Some(f) => f(link)
            None => link
          },
          inline2html(inline, link_defs~, transform_link?),
        ),
      ]
    ({ text: inline, reference: Inline({ v: { dest: None, .. }, .. }) } : @cmark.InlineLink) =>
      inline2html(inline, link_defs~, transform_link?)
    ({ text: inline, reference: Ref(_, _, { key, .. }) } : @cmark.InlineLink) =>
      if link_defs.get(key) is Some(url) {
        [
          @html.a(
            class=" text-blue-600 dark:text-blue-300 underline underline-offset-2",
            href=match transform_link {
              Some(f) => f(url)
              None => url
            },
            inline2html(inline, link_defs~, transform_link?),
          ),
        ]
      } else {
        inline2html(inline, link_defs~, transform_link?)
      }
  }
}

///|
pub fn markdown(
  markdown : String,
  small_heading? : Bool = false,
  heading_anchors? : Bool = false,
  transform_link? : (String) -> String,
) -> @html.Html {
  let doc = @cmark.Doc::from_string(markdown, strict=false)
  let link_defs = Map([])
  doc.defs
  .iter()
  .each(fn(x) {
    if x is (key, LinkDef({ v: { dest: Some({ v: dest, .. }), .. }, .. })) {
      link_defs.set(key, dest)
    }
  })
  let used_heading_ids : Map[String, Unit] = Map([])
  let folder : @cmark.Folder[Array[@html.Html]] = {
    inline_ext_default: fn(_, acc, _) { acc },
    block_ext_default: fn(_, acc, _) { acc },
    inline: fn(_, acc, inline) {
      Fold([..acc, ..inline2html(inline, link_defs~, transform_link?)])
    },
    block: fn(_, acc, block) {
      Fold(
        [
          ..acc,
          block2html(
            block,
            link_defs~,
            small_heading~,
            heading_anchors~,
            used_heading_ids~,
            transform_link?,
            paragraph_margin=true,
          ),
        ],
      )
    },
  }
  try folder.fold_doc([], doc) catch {
    FolderError(msg) => text("Failed to render markdown: \{msg}")
  } noraise {
    htmls =>
      div(
        class="text-sm md:text-base leading-relaxed text-gray-800 dark:text-slate-200",
        htmls,
      )
  }
}

///|
test "markdown renders empty image alt without panic" {
  ignore(markdown("![](down-start.png)"))
}
