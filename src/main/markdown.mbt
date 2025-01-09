///|
fn markdown_view[M](markdown : String) -> @html.Html[M] {
  fn unwrap_inline_link {
    ({
      text: Text({ v: txt, .. }),
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [@html.a(class=" text-blue-400", href=link, [text(txt)])]
    ({
      text: Image(
        {
          v: {
            text: Text({ v: alt, .. }),
            reference: Inline({ v: { dest: Some({ v: src, .. }), .. }, .. }),
          },
          ..,
        }
      ),
      reference: Inline({ v: { dest: Some({ v: link, .. }), .. }, .. }),
    } : @cmark.InlineLink) =>
      [
        @html.a(
          href=link,
          style=["display: inline-block"],
          [@html.img(src~, alt~, [])],
        ),
      ]
    _ => abort("not an inline link")
  }

  fn inline2html {
    @cmark.Inline::Autolink({ v: { link: { v, .. }, .. }, .. }) =>
      [@html.a(href=v, [text(v)])]
    Break(_) => [@html.br()]
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
    Image({ v: _, .. }) =>
      // Todo: Find out why this place is unreachable
      abort("Unreachable")
    Inlines({ v, .. }) => v.map(inline2html).to_array().flatten()
    Link({ v: link, .. }) => unwrap_inline_link(link)
    StrongEmphasis({ v: { inline, .. }, .. }) => {
      let inline = inline2html(inline)
      [@html.strong(inline)]
    }
    Text({ v: str, .. }) => [text(str)]
    RawHtml(_) => ...
    ExtMathSpan(_) => ...
    ExtStrikethrough({ v: _, .. }) => ...
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
        |> hightlight()
      @html.pre(
        class="bg-gray-100 p-4 my-4 text-sm rounded",
        [@html.code(class="font-roboto", [code])],
      )
    }
    Heading({ v: { level, inline, .. }, .. }) => {
      let inline = inline2html(inline)
      match level {
        _..<1 => abort("Heading level <1")
        1 =>
          h4(
            class="text-gray-900 font-semibold text-3xl mt-4 mb-2",
            inline,
          )
        2 =>
          h5(
            class="text-gray-900 text-2xl mt-4 mb-2 pb-2 border-b",
            inline,
          )
        3 => h6(class="text-gray-900 text-xl", inline)
        4..<_ => div(class="text-gray-900 text-xl", inline)
      }
    }
    List({ v, .. }) => div([text("markdown List")])
    Paragraph({ v: { inline, .. }, .. }) => div(inline2html(inline))
    ThematicBreak(_) => hr()
    ExtTable({ v, .. }) => div([text("markdown Table")])
    LinkRefDefinition({ v, .. }) => {
      println(1)
      div([text("LinkRefDefinition")])
    }
    ExtMathBlock({ v, .. }) => {
      println(2)
      div([text("ExtMathBlock")])
    }
    HtmlBlock({ v, .. }) => {
      println(3)
      div([text("HTML Block")])
    }
    ExtFootnoteDefinition({ v, .. }) => div([text("markdown Footnote")])
  }

  let folder : @cmark.Folder[Array[@html.Html[M]]] = {
    inline_ext_default: fn(folder, acc, inline) { acc },
    block_ext_default: fn(folder, acc, block) { acc },
    inline: fn(folder, acc, inline) {
      @cmark.FolderResult::Fold([..acc, ..inline2html(inline)])
    },
    block: fn(folder, acc, block) {
      @cmark.FolderResult::Fold([..acc, block2html(block)])
    },
  }
  let doc = @cmark.Doc::from_string(markdown)
  try {
    folder.fold_doc!([], doc)
  } catch {
    @cmark.FolderError(msg) => text("Failed to render markdown: \{msg}")
  } else {
    htmls => div(htmls)
  }
}
