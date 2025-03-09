///|
fn inline_text[M](str : String) -> @html.Html[M] {
  @html.span(class="inline leading-loose", [text(str)])
}

///|
fn image_render[M](img : @cmark.Inline) -> @html.Html[M] {
  guard img is Image(img)
  match img {
    {
      v: {
        text: Text({ v: alt, .. }),
        reference: Inline({ v: { dest: src, .. }, .. }),
      },
      ..,
    } =>
      match src {
        Some({ v: src, .. }) => @html.img(class="my-2", src~, alt~, [])
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
pub fn markdown[M](markdown : String) -> @html.Html[M] {
  fn unwrap_inline_link {
    ({
      text: Text({ v: txt, .. }),
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [@html.a(class=" text-blue-400", href=link, [inline_text(txt)])]
    ({
      text: img,
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [@html.a(href=link, style=["display: inline-block"], [image_render(img)])]
    _ => abort("not an inline link")
  }

  fn inline2html {
    @cmark.Inline::Autolink({ v: { link: { v, .. }, .. }, .. }) =>
      [@html.a(href=v, [inline_text(v)])]
    Break(_) => [text("\n")]
    CodeSpan({ v: { code_layout: tight, .. }, .. }) => {
      let tight = tight.map(fn(x) { text(x.node.v) }).to_array()
      [
        @html.code(
          class="font-roboto bg-gray-100 px-1 py-[1px] text-sm border border-gray-200 rounded",
          tight,
        ),
      ]
    }
    Emphasis({ v: { inline, .. }, .. }) => [@html.em(inline2html(inline))]
    Image(_) as img => [image_render(img)]
    Inlines({ v, .. }) => v.map(inline2html).to_array().flatten()
    Link({ v: link, .. }) => unwrap_inline_link(link)
    StrongEmphasis({ v: { inline, .. }, .. }) => {
      let inline = inline2html(inline)
      [@html.strong(inline)]
    }
    Text({ v: str, .. }) => [inline_text(str)]
    RawHtml(_) | ExtMathSpan(_) | ExtStrikethrough({ v: _, .. }) => panic() // FIXME
  }

  fn block2html {
    @cmark.Block::BlankLine(_) => p([])
    BlockQuote({ v: { block, .. }, .. }) =>
      @html.blockquote(
        class="border-l-2 border-rose-600 bg-gray-50 py-2 pl-4 my-2",
        [block2html(block)],
      )
    Blocks({ v: xs, .. }) => div(xs.map(block2html).to_array())
    CodeBlock({ v: { code, .. }, .. }) => {
      let code = String::concat(
          code.map(fn(node) { node.v }).to_array(),
          separator="\n",
        )
        |> code_block()
      @html.pre(class="bg-gray-100 p-4 my-4 text-sm rounded", [
        @html.code(class="font-roboto", [code]),
      ])
    }
    Heading({ v: { level, inline, .. }, .. }) => {
      let inline = inline2html(inline)
      match level {
        _..<1 => abort("Heading level <1")
        1 => h3(class="text-gray-900 font-semibold mt-4 mb-2 text-3xl", inline)
        2 => h4(class="text-gray-900 mt-4 mb-2 pb-2 border-b text-2xl", inline)
        3 => h5(class="text-gray-900 text-xl", inline)
        4..<_ => div(class="text-gray-900", inline)
      }
    }
    List({ v: { ty: ordered, tight, items, .. }, .. }) => {
      let items = items
        .map(fn {
          { v: { block, ext_task_marker, .. }, .. } =>
            if ext_task_marker is Some({ v: char, .. }) {
              @html.li(class="list-inside flex items-center gap-2", [
                @html.input(
                  input_type=Checkbox,
                  read_only=true,
                  checked=char == 'x' || char == 'X',
                  childrens=[block2html(block)],
                ),
                block2html(block),
              ])
            } else {
              @html.li(class="list-inside", [block2html(block)])
            }
        })
        .to_array()
      let class = "ml-4 list-inside " +
        (if tight { "space-y-0.5" } else { "space-y-1" })
      match ordered {
        @cmark_base.Unordered(_) => @html.ul(class=class + " list-disc", items)
        @cmark_base.Ordered(start, _) =>
          @html.ol(start~, class=class + " list-decimal", items)
      }
    }
    Paragraph({ v: { inline, .. }, .. }) => @html.span(inline2html(inline))
    ThematicBreak(_) => hr(class="my-4")
    ExtTable({ v: { rows, .. }, .. }) => {
      let colgroup = []
      let body = rows
        .to_array()
        .mapi(fn(i, row) {
          match row {
            ({ v: Header(cols), .. }, _) =>
              @html.tr(
                class=if (i - (if colgroup.length() > 0 { 1 } else { 0 })) % 2 ==
                  0 {
                  "bg-gray-100"
                } else {
                  ""
                },
                cols
                .map(fn {
                  (inline, _) =>
                    @html.th(
                      class="border border-gray-300 p-2 font-semibold",
                      inline2html(inline),
                    )
                })
                .to_array(),
              )
            ({ v: Data(cols), .. }, _) =>
              @html.tr(
                class=if (i - (if colgroup.length() > 0 { 1 } else { 0 })) % 2 ==
                  0 {
                  "bg-gray-100"
                } else {
                  ""
                },
                cols
                .map(fn {
                  (inline, _) =>
                    @html.td(
                      class="border border-gray-300 p-2",
                      inline2html(inline),
                    )
                })
                .to_array(),
              )
            ({ v: Sep(cols), .. }, _) => {
              cols
              .iter()
              .each(fn {
                { v: (align, _), .. } =>
                  match align {
                    Some(Left) =>
                      colgroup.push(@html.col(class="text-left", []))
                    Some(Center) =>
                      colgroup.push(@html.col(class="text-center", []))
                    Some(Right) =>
                      colgroup.push(@html.col(class="text-right", []))
                    None => colgroup.push(@html.col(class="", []))
                  }
              })
              @html.nothing()
            }
          }
        })
      @html.table(
        class="w-full table-auto my-6 border-2 border-collapse border-gray-300",
        [@html.colgroup(colgroup), @html.tbody(body)],
      )
    }
    LinkRefDefinition(_) => {
      println("Warning: Unsupported link reference definition")
      @html.nothing()
    }
    ExtMathBlock(_) => {
      println("Warning: Unsupported inline Math Block")
      @html.nothing()
    }
    HtmlBlock(_) => {
      println("Warning: Unsupported inline Html block")
      @html.nothing()
    }
    ExtFootnoteDefinition(_) => {
      println("Warning: Unsupported footnote definition")
      @html.nothing()
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
  let doc = @cmark.Doc::from_string(markdown, strict=false)
  try {
    folder.fold_doc!([], doc)
  } catch {
    @cmark.FolderError(msg) => text("Failed to render markdown: \{msg}")
  } else {
    htmls => div(htmls)
  }
}
