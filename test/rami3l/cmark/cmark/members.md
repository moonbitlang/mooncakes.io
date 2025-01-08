# Documentation
|Type|description|
|---|---|
|[Atx](#Atx)||
|[BState](#BState)||
|[Block](#Block)| A markdown block.|
|[BlockHeading](#BlockHeading)| The type for \[ATX\](https://spec.commonmark.org/0.30/\#atx-headings) |
|[BlockHeadingAtxLayout](#BlockHeadingAtxLayout)||
|[BlockHeadingId](#BlockHeadingId)||
|[BlockHeadingLayout](#BlockHeadingLayout)||
|[BlockHeadingSetextLayout](#BlockHeadingSetextLayout)||
|[BlockLine](#BlockLine)| Block lines.|
|[BlockList](#BlockList)| The type for \[lists\](https://spec.commonmark.org/0.30/\#lists).|
|[BlockParagraph](#BlockParagraph)| The type for \[paragraphs\](https://spec.commonmark.org/0.30/\#paragraphs).|
|[BlockQuote](#BlockQuote)| The type for \[block quotes\](https://spec.commonmark.org/0.30/\#block-quotes).|
|[BlockStruct](#BlockStruct)||
|[BlockThematicBreak](#BlockThematicBreak)| The type for \[thematic breaks\](https://spec.commonmark.org/0.30/\#thematic-break).|
|[Closer](#Closer)| Closer indexes.|
|[CloserIndex](#CloserIndex)||
|[CodeBlock](#CodeBlock)| The type for \[indented\](https://spec.commonmark.org/0.30/\#indented-code-block) and|
|[CodeBlockFencedLayout](#CodeBlockFencedLayout)||
|[CodeBlockLayout](#CodeBlockLayout)||
|[CodeBlockStruct](#CodeBlockStruct)||
|[Doc](#Doc)| The type for CommonMark documents.|
|[Fence](#Fence)||
|[FenceCodeBlockStruct](#FenceCodeBlockStruct)||
|[Folder](#Folder)||
|[FolderError](#FolderError)||
|[FolderResult](#FolderResult)| The type for folder results.|
|[Footnote](#Footnote)||
|[Heading](#Heading)||
|[HtmlBlock](#HtmlBlock)| The type for \[HTML blocks\](https://spec.commonmark.org/0.30/\#html-blocks).|
|[HtmlBlockStruct](#HtmlBlockStruct)||
|[IndentedCodeLine](#IndentedCodeLine)||
|[Inline](#Inline)||
|[InlineAutolink](#InlineAutolink)||
|[InlineBreak](#InlineBreak)||
|[InlineBreakType](#InlineBreakType)||
|[InlineCodeSpan](#InlineCodeSpan)| The type for \[code spans\](https://spec.commonmark.org/0.30/\#code-spans).|
|[InlineEmphasis](#InlineEmphasis)| The type for emphasis and strong emphasis.|
|[InlineLink](#InlineLink)||
|[InlineMathSpan](#InlineMathSpan)||
|[InlineRawHtml](#InlineRawHtml)| The type for \[inline raw HTML\](https://spec.commonmark.org/0.30/\#raw-html) (can span multiple lines).|
|[InlineStrikethrough](#InlineStrikethrough)||
|[Label](#Label)| Labels are used by \[reference links\](https://spec.commonmark.org/0.30/\#reference-link) to|
|[LabelContext](#LabelContext)| \`context\` is:|
|[LabelDef](#LabelDef)||
|[LinkDefinition](#LinkDefinition)||
|[LinkDefinitionLayout](#LinkDefinitionLayout)||
|[LinkKind](#LinkKind)||
|[ListBlockStruct](#ListBlockStruct)||
|[ListItem](#ListItem)||
|[ListItemStruct](#ListItemStruct)||
|[ListTaskStatus](#ListTaskStatus)||
|[Mapper](#Mapper)| Abstract syntax tree mappers.|
|[MapperError](#MapperError)||
|[MapperResult](#MapperResult)| The type for mapper results.|
|[Node](#Node)||
|[Paragraph](#Paragraph)||
|[Parser](#Parser)||
|[ReferenceKind](#ReferenceKind)||
|[ReferenceLayout](#ReferenceLayout)||
|[Seq](#Seq)||
|[Setext](#Setext)||
|[StartColResult](#StartColResult)||
|[Table](#Table)||
|[TableAlign](#TableAlign)||
|[TableRow](#TableRow)||
|[Tight](#Tight)| Tight block lines: a block line with its initial blanks trimmed but kept for layout. |
|[Token](#Token)| Tokens for parsing inlines.|
|[TokenBackticks](#TokenBackticks)||
|[TokenEmphasisMarks](#TokenEmphasisMarks)||
|[TokenInline](#TokenInline)||
|[TokenLinkStart](#TokenLinkStart)||
|[TokenMathSpanMarks](#TokenMathSpanMarks)||
|[TokenNewline](#TokenNewline)||
|[TokenStart](#TokenStart)||
|[TokenStrikethroughMarks](#TokenStrikethroughMarks)||
|[Blanks](#Blanks)||
|[BlanksNode](#BlanksNode)||
|[BlockBlankLine](#BlockBlankLine)| The type for \[blank lines\](https://spec.commonmark.org/0.30/\#blank-lines).|
|[BlockLineBlank](#BlockLineBlank)||
|[Count](#Count)||
|[FilterMap](#FilterMap)||
|[FoldFn](#FoldFn)||
|[FolderFn](#FolderFn)||
|[InlineText](#InlineText)| The type for \[textual content\](https://spec.commonmark.org/0.30/\#textual-content).|
|[LabelDefs](#LabelDefs)||
|[LabelKey](#LabelKey)| The type for label keys. These are|
|[LabelMap](#LabelMap)||
|[LabelResolverFn](#LabelResolverFn)||
|[ListItemBlock](#ListItemBlock)||
|[MapFn](#MapFn)||
|[MapperFn](#MapperFn)||
|[StringNode](#StringNode)||
|[TableCellLayout](#TableCellLayout)||
|[TableSep](#TableSep)||

|Value|description|
|---|---|
|[layout\_empty](#layout_empty)||
|[layout\_of\_string](#layout_of_string)||

## Atx

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,157:::type Atx
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,163:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Atx">Atx</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,163:::fn output(<a href="rami3l/cmark/cmark#Atx">Atx</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,163:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Atx">Atx</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,163:::fn to_json(<a href="rami3l/cmark/cmark#Atx">Atx</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## BState

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,1657:::type BState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,1661:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#BState">BState</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,1661:::fn op_equal(<a href="rami3l/cmark/cmark#BState">BState</a>, <a href="rami3l/cmark/cmark#BState">BState</a>) -> Bool
    ```
    > automatically derived

## Block

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,2:::pub(all) enum Block {
  BlankLine(<a href="rami3l/cmark/cmark#Node">Node</a>[String])
  BlockQuote(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>])
  Blocks(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Block">Block</a>]])
  CodeBlock(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>])
  Heading(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>])
  HtmlBlock(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>])
  LinkRefDefinition(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>])
  List(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#BlockList">BlockList</a>])
  Paragraph(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>])
  ThematicBreak(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>])
  ExtMathBlock(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>])
  ExtTable(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#Table">Table</a>])
  ExtFootnoteDefinition(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#Footnote">Footnote</a>])
}
```
 A markdown block.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Block">Block</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,16:::fn output(<a href="rami3l/cmark/cmark#Block">Block</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Block">Block</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,16:::fn to_json(<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### defs
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,76:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::defs(self : <a href="rami3l/cmark/cmark#Block">Block</a>, init~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>] = ..) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]
  ```
  >  Collects the given `Block`'s link definitions (e.g. `LinkRefDefinition`
  > and `ExtFootnoteDefinition`) and adds them to `init` (defaults to an empty map).
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,19:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::empty() -> <a href="rami3l/cmark/cmark#Block">Block</a>
  ```
  > 
- #### meta
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,24:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::meta(self : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a>
  ```
  > 
- #### normalize
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,49:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::normalize(self : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>
  ```
  >  Normalize a block.
  > 
  >  `b.normalize()` has the same content as `b` but is such that for any
  > occurrence of `Blocks` in `b` the list of blocks `bs`:
  >  - `bs` is not a singleton list.
  >  - Has no `Blocks` case. The meta is dropped and the nested
  >    blocks are spliced in `bs` where the case occurs.

## BlockHeading

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,216:::pub(all) struct BlockHeading {
  layout : <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>
  level : Int
  inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>
  id : <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>?
}
```
 The type for [ATX](https://spec.commonmark.org/0.30/#atx-headings)
and [Setext](https://spec.commonmark.org/0.30/#setext-headings) headings.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,221:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,221:::fn output(<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,221:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,221:::fn to_json(<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,257:::fn <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>::new(id~ : <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>? = .., layout~ : <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a> = .., level~ : Int, inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>
  ```
  > 

## BlockHeadingAtxLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,230:::pub(all) struct BlockHeadingAtxLayout {
  indent : Int
  after_opening : String
  closing : String
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,234:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,234:::fn output(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,234:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,234:::fn to_json(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,234:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,234:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,237:::fn <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>::default() -> <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>
  ```
  > 

## BlockHeadingId

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,251:::pub(all) enum BlockHeadingId {
  Auto(String)
  Id(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,254:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,254:::fn output(<a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,254:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,254:::fn to_json(<a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,254:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,254:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## BlockHeadingLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,224:::pub(all) enum BlockHeadingLayout {
  Atx(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>)
  Setext(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,227:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,227:::fn output(<a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,227:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,227:::fn to_json(<a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## BlockHeadingSetextLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,242:::pub(all) struct BlockHeadingSetextLayout {
  leading_indent : Int
  trailing_blanks : String
  underline_indent : Int
  underline_count : <a href="rami3l/cmark/cmark#Node">Node</a>[Int]
  underline_blanks : String
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,248:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,248:::fn output(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,248:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,248:::fn to_json(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## BlockLine

```moonbit
:::source,rami3l/cmark/cmark/block_line.mbt,8:::pub(all) type BlockLine <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```
 Block lines.

 In CommonMark blocks, a "line" does not necessarily correspond to
a line in the source plain text. For example the lines of a
paragraph in a block quote are the lines stripped from the block
quote markers.  We call the line resulting from stripping the
block structure preceeding a given block a {e block line}.

#### mooncakes-io-method-mark-Methods
- #### list\_text\_loc
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,19:::fn <a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>::list_text_loc(ls : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>]) -> <a href="rami3l/cmark/cmark_base#TextLoc">@rami3l/cmark/cmark_base.TextLoc</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,14:::fn <a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>::to_string(self : <a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>) -> String
  ```
  > 

## BlockList

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,321:::pub(all) struct BlockList {
  ty : <a href="rami3l/cmark/cmark_base#ListType">@rami3l/cmark/cmark_base.ListType</a>
  tight : Bool
  items : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#ListItem">ListItem</a>]]
}
```
 The type for [lists](https://spec.commonmark.org/0.30/#lists).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,325:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockList">BlockList</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,325:::fn output(<a href="rami3l/cmark/cmark#BlockList">BlockList</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,325:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockList">BlockList</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,325:::fn to_json(<a href="rami3l/cmark/cmark#BlockList">BlockList</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### map\_items
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,328:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::map_items(self : <a href="rami3l/cmark/cmark#BlockList">BlockList</a>, f : (<a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="rami3l/cmark/cmark#BlockList">BlockList</a>
  ```
  > 
- #### normalize\_items
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,336:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::normalize_items(self : <a href="rami3l/cmark/cmark#BlockList">BlockList</a>) -> <a href="rami3l/cmark/cmark#BlockList">BlockList</a>
  ```
  > 

## BlockParagraph

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,341:::pub(all) struct BlockParagraph {
  leading_indent : Int
  inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>
  trailing_blanks : String
}
```
 The type for [paragraphs](https://spec.commonmark.org/0.30/#paragraphs).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,345:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,345:::fn output(<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,345:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,345:::fn to_json(<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,348:::fn <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>::new(leading_indent~ : Int = .., trailing_blanks~ : String = .., inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>
  ```
  > 

## BlockQuote

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,99:::pub(all) struct BlockQuote {
  indent : Int
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
}
```
 The type for [block quotes](https://spec.commonmark.org/0.30/#block-quotes).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,104:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,104:::fn output(<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,104:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,104:::fn to_json(<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,112:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::map_block(self : <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>, f : (<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,107:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::new(indent~ : Int = .., block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
- #### normalize\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,120:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::normalize_block(self : <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 

## BlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,192:::type BlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,204:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,204:::fn output(<a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,204:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,204:::fn to_json(<a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## BlockThematicBreak

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,357:::pub(all) struct BlockThematicBreak {
  indent : Int
  layout : String
}
```
 The type for [thematic breaks](https://spec.commonmark.org/0.30/#thematic-break).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,360:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,360:::fn output(<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,360:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,360:::fn to_json(<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,360:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,360:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,363:::fn <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>::new(indent~ : Int = .., layout~ : String = ..) -> <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>
  ```
  > 

## Closer

```moonbit
:::source,rami3l/cmark/cmark/closer.mbt,6:::type Closer
```
 Closer indexes.

 They map closing delimiters to the position where they
start. Shortcuts forward searches in inline parsing. See
`inline_struct`

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,14:::fn compare(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="rami3l/cmark/cmark#Closer">Closer</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,14:::fn op_equal(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="rami3l/cmark/cmark#Closer">Closer</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,14:::fn hash_combine(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,14:::fn output(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,14:::fn to_json(<a href="rami3l/cmark/cmark#Closer">Closer</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## CloserIndex

```moonbit
:::source,rami3l/cmark/cmark/closer.mbt,20:::type CloserIndex
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,20:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,20:::fn output(<a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,20:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/closer.mbt,20:::fn to_json(<a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## CodeBlock

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,126:::pub(all) struct CodeBlock {
  layout : <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>
  info_string : <a href="rami3l/cmark/cmark#Node">Node</a>[String]?
  code : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
}
```
 The type for [indented](https://spec.commonmark.org/0.30/#indented-code-block) and
[fenced](:https://spec.commonmark.org/0.30/#fenced-code-blocks) code blocks.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,130:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,130:::fn output(<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,130:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,130:::fn to_json(<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### language\_of\_info\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,187:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::language_of_info_string(s : String) -> (String, String)?
  ```
  >  \[language\_of\_info\_string s\] extracts a (non-empty) language, the first word of \[s\] and a trimmed remainder.
  > Assumes \[s\] is {!String.trim}ed which is what {!info\_string} gives you.
- #### make\_fence
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,165:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::make_fence(self : <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>) -> (Char, Int)
  ```
  >  \[make\_fence cb\] is a fence character and count suitable for \[cb\].
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,151:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::new(layout~ : <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a> = .., info_string~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String]? = .., code : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]) -> <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>
  ```
  > 

## CodeBlockFencedLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,139:::pub(all) struct CodeBlockFencedLayout {
  indent : Int
  opening_fence : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  closing_fence : <a href="rami3l/cmark/cmark#Node">Node</a>[String]?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,143:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,143:::fn output(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,143:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,143:::fn to_json(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,146:::fn <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>::default() -> <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>
  ```
  > 

## CodeBlockLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,133:::pub(all) enum CodeBlockLayout {
  Indented
  Fenced(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,136:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,136:::fn output(<a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,136:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,136:::fn to_json(<a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## CodeBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,151:::type CodeBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,154:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,154:::fn output(<a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,154:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,154:::fn to_json(<a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Doc

```moonbit
:::source,rami3l/cmark/cmark/doc.mbt,2:::pub(all) struct Doc {
  nl : String
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
  defs : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]
}
```
 The type for CommonMark documents.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/doc.mbt,6:::fn output(<a href="rami3l/cmark/cmark#Doc">Doc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/doc.mbt,6:::fn to_json(<a href="rami3l/cmark/cmark#Doc">Doc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,18:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::empty() -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
- #### from\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,23:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::from_string(defs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>] = .., resolver~ : (<a href="rami3l/cmark/cmark#LabelContext">LabelContext</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>? = .., nested_links~ : Bool = .., heading_auto_ids~ : Bool = .., layout~ : Bool = .., locs~ : Bool = .., file~ : String = .., strict~ : Bool = .., s : String) -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,9:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::new(nl~ : String = .., defs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>] = .., block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 

## Fence

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,136:::type Fence
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,142:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Fence">Fence</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,142:::fn output(<a href="rami3l/cmark/cmark#Fence">Fence</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,142:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Fence">Fence</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,142:::fn to_json(<a href="rami3l/cmark/cmark#Fence">Fence</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## FenceCodeBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,145:::type FenceCodeBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,148:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,148:::fn output(<a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,148:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,148:::fn to_json(<a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Folder

```moonbit
:::source,rami3l/cmark/cmark/folder.mbt,2:::pub(all) struct Folder {
  inline_ext_default : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  block_ext_default : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Block">Block</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  inline : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  block : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
}
```


#### mooncakes-io-method-mark-Methods
- #### block\_ext\_none
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,47:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::block_ext_none[A](self : <a href="rami3l/cmark/cmark#Folder">Folder</a>[A], _a : A, _b : <a href="rami3l/cmark/cmark#Block">Block</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  ```
  > 
- #### fold\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,96:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::fold_block[A](self : <a href="rami3l/cmark/cmark#Folder">Folder</a>[A], acc : A, b : <a href="rami3l/cmark/cmark#Block">Block</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  ```
  > 
- #### fold\_doc
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,145:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::fold_doc[A](self : <a href="rami3l/cmark/cmark#Folder">Folder</a>[A], acc : A, doc : <a href="rami3l/cmark/cmark#Doc">Doc</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  ```
  > 
- #### fold\_inline
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,67:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::fold_inline[A](self : <a href="rami3l/cmark/cmark#Folder">Folder</a>[A], acc : A, i : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  ```
  > 
- #### inline\_ext\_none
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,37:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::inline_ext_none[A](self : <a href="rami3l/cmark/cmark#Folder">Folder</a>[A], _a : A, _b : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,57:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::new[A](inline_ext_default~ : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a> = .., block_ext_default~ : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Block">Block</a>) -> A!<a href="rami3l/cmark/cmark#FolderError">FolderError</a> = .., inline~ : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A] = .., block~ : (<a href="rami3l/cmark/cmark#Folder">Folder</a>[A], A, <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A] = ..) -> <a href="rami3l/cmark/cmark#Folder">Folder</a>[A]
  ```
  > 
- #### none
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,31:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::none[A, B](self : <a href="rami3l/cmark/cmark#Folder">Folder</a>[A], _a : A, _b : B) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
- #### ret
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,26:::fn <a href="rami3l/cmark/cmark#Folder">Folder</a>::ret[A](a : A) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 

## FolderError

```moonbit
:::source,rami3l/cmark/cmark/error.mbt,2:::pub(all) type! FolderError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/error.mbt,2:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#FolderError">FolderError</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/error.mbt,2:::fn output(<a href="rami3l/cmark/cmark#FolderError">FolderError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## FolderResult

```moonbit
:::source,rami3l/cmark/cmark/folder.mbt,17:::pub(all) enum FolderResult {
  Default
  Fold(A)
}
```
 The type for folder results.
`Default` means doing the default fold.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,23:::impl[A] <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/folder.mbt,23:::fn default[A]() -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
    ```
    > 
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/folder.mbt,20:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A], <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/folder.mbt,20:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::impl[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>] <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/folder.mbt,20:::fn to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Footnote

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,373:::pub(all) struct Footnote {
  indent : Int
  label : <a href="rami3l/cmark/cmark#Label">Label</a>
  defined_label : <a href="rami3l/cmark/cmark#Label">Label</a>?
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,378:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,378:::fn output(<a href="rami3l/cmark/cmark#Footnote">Footnote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,378:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,378:::fn to_json(<a href="rami3l/cmark/cmark#Footnote">Footnote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,392:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::map_block(self : <a href="rami3l/cmark/cmark#Footnote">Footnote</a>, f : (<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,381:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::new(indent~ : Int = .., defined_label? : <a href="rami3l/cmark/cmark#Label">Label</a>?, label : <a href="rami3l/cmark/cmark#Label">Label</a>, block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
- #### normalize\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,397:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::normalize_block(self : <a href="rami3l/cmark/cmark#Footnote">Footnote</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 

## Heading

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,174:::type Heading
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,177:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Heading">Heading</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,177:::fn output(<a href="rami3l/cmark/cmark#Heading">Heading</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,177:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Heading">Heading</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,177:::fn to_json(<a href="rami3l/cmark/cmark#Heading">Heading</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## HtmlBlock

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,267:::pub(all) type HtmlBlock <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
```
 The type for [HTML blocks](https://spec.commonmark.org/0.30/#html-blocks).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,267:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,267:::fn output(<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,267:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,267:::fn to_json(<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## HtmlBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,180:::type HtmlBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,183:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,183:::fn output(<a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,183:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,183:::fn to_json(<a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## IndentedCodeLine

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,129:::type IndentedCodeLine
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,133:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,133:::fn output(<a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,133:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,133:::fn to_json(<a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Inline

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,5:::pub(all) enum Inline {
  Autolink(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>])
  Break(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>])
  CodeSpan(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>])
  Emphasis(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>])
  Image(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>])
  Inlines(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Inline">Inline</a>]])
  Link(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>])
  RawHtml(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>])
  StrongEmphasis(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>])
  Text(<a href="rami3l/cmark/cmark#Node">Node</a>[String])
  ExtStrikethrough(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>])
  ExtMathSpan(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,18:::fn op_equal(<a href="rami3l/cmark/cmark#Inline">Inline</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,18:::fn output(<a href="rami3l/cmark/cmark#Inline">Inline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,18:::fn to_json(<a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,21:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::empty() -> <a href="rami3l/cmark/cmark#Inline">Inline</a>
  ```
  > 
- #### id
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,157:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::id(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>, buf~ : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a> = ..) -> String
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,26:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::is_empty(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> Bool
  ```
  > 
- #### meta
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,35:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::meta(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a>
  ```
  >  `meta(i)` is the metadata of `i`.
- #### normalize
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,65:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::normalize(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#Inline">Inline</a>
  ```
  >  `normalize(i)` has the same content as `i` but is such that for any
  > occurence of `Inlines(is, _)` in `i` the list of inlines `is`:
  >  - `is` is not a singleton list.
  >  - Has no two consecutive `Text _` cases. If that occurs the texts are
  >    concatenated, the meta of the first one is kept and its text
  >    location extended to include the second one.
  >  - Has no `Inlines _` case. The meta is dropped and the nested
  >    inlines are spliced in `is` where the case occurs.
- #### to\_plain\_text
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,119:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::to_plain_text(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>, break_on_soft~ : Bool) -> <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Seq">Seq</a>[String]]
  ```
  >  `to_plain_text(i, break_on_soft~, acc~)` has the plain text of `i`
  > as a sequence of lines represented by a list of strings to be
  > concatenated. If `break_on_soft` is `true` soft line breaks
  > are turned into hard line breaks.

## InlineAutolink

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,204:::pub(all) struct InlineAutolink {
  is_email : Bool
  link : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,210:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,210:::fn op_equal(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>, <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,210:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,210:::fn output(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,210:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,210:::fn to_json(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,213:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::new(link : <a href="rami3l/cmark/cmark#Node">Node</a>[String]) -> <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>
  ```
  > 

## InlineBreak

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,219:::pub(all) struct InlineBreak {
  layout_before : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  ty : <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  layout_after : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,223:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,223:::fn op_equal(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>, <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,223:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,223:::fn output(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,223:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,223:::fn to_json(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,226:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::new(layout_before~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String] = .., layout_after~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String] = .., ty : <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>
  ```
  > 

## InlineBreakType

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,235:::pub(all) enum InlineBreakType {
  Hard
  Soft
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,238:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,238:::fn compare(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,238:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,238:::fn op_equal(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,238:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,238:::fn output(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,238:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,238:::fn to_json(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,238:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,238:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## InlineCodeSpan

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,241:::pub(all) struct InlineCodeSpan {
  backticks : Int
  code_layout : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
}
```
 The type for [code spans](https://spec.commonmark.org/0.30/#code-spans).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,244:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,244:::fn op_equal(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>, <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,244:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,244:::fn output(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,244:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,244:::fn to_json(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### code
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,318:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::code(self : <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> String
  ```
  >  https://spec.commonmark.org/0.30/\#code-spans
- #### from\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,274:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::from_string(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = .., s : String) -> <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
  ```
  >  `from_string(s)` is a code span for `s`. `s` can start with or
  > include backticks; the appropriate minimal backtick count and
  > possible needed leading and trailing space are computed
  > accordingly. If `s` contains newlines, blanks after newlines
  > are treated as layout like during parsing. `meta` is used for
  > the lines of the resulting code layout (see `code_layout`).
  > the resulting code layout (see `code_layout`).
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,247:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::new(backticks~ : Int, code_layout : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]) -> <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
  ```
  > 

## InlineEmphasis

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,334:::pub(all) struct InlineEmphasis {
  delim : Char
  inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>
}
```
 The type for emphasis and strong emphasis.
https://spec.commonmark.org/0.30/\#emphasis-and-strong-emphasis

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,337:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,337:::fn op_equal(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>, <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,337:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,337:::fn output(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,337:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,337:::fn to_json(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,340:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::new(delim~ : Char = .., inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>
  ```
  > 

## InlineLink

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,348:::pub(all) struct InlineLink {
  text : <a href="rami3l/cmark/cmark#Inline">Inline</a>
  reference : <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,351:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,351:::fn op_equal(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,351:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,351:::fn output(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,351:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,351:::fn to_json(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### is\_unsafe
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,408:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::is_unsafe(l : String) -> Bool
  ```
  >  `is_unsafe(l)` is `true` if `l` is deemed unsafe.
  > This is the case if `l` starts with a caseless match of
  > `javascript:`, `vbscript:`, `file:` or `data:` except if
  > `data:image/{gif,png,jpeg,webp}`.
  > These rules were taken from the C reference implementation of CommonMark
  > and are likely incomplete. If you are trying to prevent XSS you should
  > post-process rendering outputs with a dedicated HTML sanitizer.
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,374:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::new(text : <a href="rami3l/cmark/cmark#Inline">Inline</a>, reference : <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>
  ```
  > 
- #### reference\_definition
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,391:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::reference_definition(self : <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, defs : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]) -> <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>?
  ```
  >  `reference_definition(defs, l)` is the definition of `l`'s reference.
  > If `l` is an `Inline` reference this returns its link definition
  > wrapped in a `LinkDef`. If `l` is `Ref` this looks up the
  > `referenced_label` in `defs`.
- #### referenced\_label
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,380:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::referenced_label(self : <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>?
  ```
  >  `referenced_label(l)` is the label referenced by the label of `l`.
  > This is the second label of `Ref(_)` or `None` on inline references.

## InlineMathSpan

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,444:::pub(all) struct InlineMathSpan {
  display : Bool
  tex_layout : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,447:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,447:::fn op_equal(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>, <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,447:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,447:::fn output(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,447:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,447:::fn to_json(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### tex
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,450:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::tex(self : <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> String
  ```
  > 

## InlineRawHtml

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,429:::pub(all) type InlineRawHtml <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
```
 The type for [inline raw HTML](https://spec.commonmark.org/0.30/#raw-html) (can span multiple lines).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,429:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,429:::fn op_equal(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>, <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,429:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,429:::fn output(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,429:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,429:::fn to_json(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## InlineStrikethrough

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,441:::pub(all) type InlineStrikethrough <a href="rami3l/cmark/cmark#Inline">Inline</a>
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,441:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,441:::fn op_equal(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>, <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,441:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,441:::fn output(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,441:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,441:::fn to_json(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Label

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,8:::pub(all) struct Label {
  meta : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a>
  key : String
  text : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
}
```
 Labels are used by [reference links](https://spec.commonmark.org/0.30/#reference-link) to
refer to the [definitions](#definitions) of
[link reference definitions](https://spec.commonmark.org/0.30/#link-reference-definitions),
[footnote definitions](#footnote-definitions) and your own
[interpretations](#resolvers).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Label">Label</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/label.mbt,12:::fn output(<a href="rami3l/cmark/cmark#Label">Label</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Label">Label</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/label.mbt,12:::fn to_json(<a href="rami3l/cmark/cmark#Label">Label</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,42:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::compare(self : <a href="rami3l/cmark/cmark#Label">Label</a>, other : <a href="rami3l/cmark/cmark#Label">Label</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,23:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::new(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = .., key~ : String, text : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]) -> <a href="rami3l/cmark/cmark#Label">Label</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,37:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::op_equal(self : <a href="rami3l/cmark/cmark#Label">Label</a>, other : <a href="rami3l/cmark/cmark#Label">Label</a>) -> Bool
  ```
  > 
- #### text\_loc
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,32:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::text_loc(self : <a href="rami3l/cmark/cmark#Label">Label</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">@rami3l/cmark/cmark_base.TextLoc</a>
  ```
  > 

## LabelContext

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,74:::pub(all) enum LabelContext {
  Def(<a href="rami3l/cmark/cmark#Label">Label</a>?, <a href="rami3l/cmark/cmark#Label">Label</a>)
  Ref(<a href="rami3l/cmark/cmark#LinkKind">LinkKind</a>, <a href="rami3l/cmark/cmark#Label">Label</a>, <a href="rami3l/cmark/cmark#Label">Label</a>?)
}
```
 `context` is:
 - `Def (prev, current)` when we just hit a
   [link reference definition](https://spec.commonmark.org/0.30/#link-reference-definitions)
   or footnote definition that defines the label `current`.
   If there is already a definition for `current`'s key it is provided in `prev`
   (whose `meta` has the location of the definition if you parse with locations).
   If `None` is returned the `current` definition is ignored, and definition `prev`
   (if any) is kept for the document.
   If `Some l` is returned `l`'s key will be bound to the parsed definition for `current`
   in `Doc.defs` at the end of parsing.
   The result of the resolver is stored in the abstract syntax tree and
   available via `LinkDefinition.defined_label` and `BlockFootnote.defined_label`.
 - `Ref (kind, ref, def)` when we just hit a link or image
   referencing label `ref`. `def` is the label defining `ref`'s key
   in the document (if any). The result of the resolver is the label
   stored for resolving the reference to its definition in the resulting
   `InlineLink` node;
   `None` means that `label` is undefined and the inline becomes
   `InlineText` like in CommonMark.

#### mooncakes-io-method-mark-Methods
- #### default\_resolver
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,89:::fn <a href="rami3l/cmark/cmark#LabelContext">LabelContext</a>::default_resolver(self : <a href="rami3l/cmark/cmark#LabelContext">LabelContext</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>?
  ```
  > 

## LabelDef

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,47:::pub(all) enum LabelDef {
  LinkDef(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>])
  FootnoteDef(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#Footnote">Footnote</a>])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,50:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/label.mbt,50:::fn output(<a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,50:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/label.mbt,50:::fn to_json(<a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## LinkDefinition

```moonbit
:::source,rami3l/cmark/cmark/link_definition.mbt,6:::pub(all) struct LinkDefinition {
  layout : <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  label : <a href="rami3l/cmark/cmark#Label">Label</a>?
  defined_label : <a href="rami3l/cmark/cmark#Label">Label</a>?
  dest : <a href="rami3l/cmark/cmark#Node">Node</a>[String]?
  title : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn op_equal(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>, <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn output(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn to_json(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,15:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::new(layout~ : <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a> = .., label~ : <a href="rami3l/cmark/cmark#Label">Label</a>? = .., defined_label~ : <a href="rami3l/cmark/cmark#Label">Label</a>? = .., dest~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String]? = .., title~ : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]? = ..) -> <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>
  ```
  > 

## LinkDefinitionLayout

```moonbit
:::source,rami3l/cmark/cmark/link_definition.mbt,26:::pub(all) struct LinkDefinitionLayout {
  indent : Int
  angled_dest : Bool
  before_dest : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
  after_dest : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
  title_open_delim : Char
  after_title : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn op_equal(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>, <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn output(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn to_json(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,36:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::default() -> <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  ```
  > 
- #### for\_dest
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,48:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::for_dest(dest : String) -> <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  ```
  > 

## LinkKind

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,80:::pub(all) enum LinkKind {
  Link
  Image
}
```


## ListBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,216:::type ListBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,222:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,222:::fn output(<a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,222:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,222:::fn to_json(<a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## ListItem

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,270:::pub(all) struct ListItem {
  before_marker : Int
  marker : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  after_marker : Int
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
  ext_task_marker : <a href="rami3l/cmark/cmark#Node">Node</a>[Char]?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,276:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,276:::fn output(<a href="rami3l/cmark/cmark#ListItem">ListItem</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,276:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,276:::fn to_json(<a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,293:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::map_block(self : <a href="rami3l/cmark/cmark#ListItem">ListItem</a>, f : (<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,282:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::new(before_marker~ : Int = .., marker~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String] = .., after_marker~ : Int = .., ext_task_marker~ : <a href="rami3l/cmark/cmark#Node">Node</a>[Char]?, block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
- #### normalize\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,298:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::normalize_block(self : <a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 

## ListItemStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,207:::type ListItemStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,213:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,213:::fn output(<a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,213:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,213:::fn to_json(<a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## ListTaskStatus

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,303:::pub(all) enum ListTaskStatus {
  Cancelled
  Checked
  Unchecked
  Other(Char)
}
```


#### mooncakes-io-method-mark-Methods
- #### from\_marker
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,311:::fn <a href="rami3l/cmark/cmark#ListTaskStatus">ListTaskStatus</a>::from_marker(marker : Char) -> <a href="rami3l/cmark/cmark#ListTaskStatus">ListTaskStatus</a>
  ```
  > 

## Mapper

```moonbit
:::source,rami3l/cmark/cmark/mapper.mbt,13:::pub(all) struct Mapper {
  inline_ext_default : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#Inline">Inline</a>?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a>
  block_ext_default : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a>
  inline : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[<a href="rami3l/cmark/cmark#Inline">Inline</a>]
  block : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[<a href="rami3l/cmark/cmark#Block">Block</a>]
}
```
 Abstract syntax tree mappers.

 Mappers help with pushing abstract syntax tree transformations in every
node with a minimal amount of code by defaulting the cases you
don't handle. The default map maps leaves to themselves and
otherwise propagates the map to all children.

 This map has the form of `List::filter_map`, however it is akin
to `List.concat_map` as it allows:
 - Node deletion by mapping to `None`
 - Node transformation by mapping to `Some _`
 - Node expansion by mapping to `Some (Inlines _)` or `Some (Blocks _)`

#### mooncakes-io-method-mark-Methods
- #### block\_ext\_none
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,65:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::block_ext_none[A](self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, _a : A) -> A?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a>
  ```
  > 
- #### delete
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,40:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::delete[A]() -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
- #### inline\_ext\_none
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,56:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::inline_ext_none[A](self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, _a : A) -> A?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a>
  ```
  > 
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,123:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::map_block(self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, b : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>?
  ```
  > 
- #### map\_doc
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,198:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::map_doc(self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, d : <a href="rami3l/cmark/cmark#Doc">Doc</a>) -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
- #### map\_inline
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,84:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::map_inline(self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, i : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#Inline">Inline</a>?
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,74:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::new(inline_ext_default~ : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#Inline">Inline</a>?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a> = .., block_ext_default~ : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a> = .., inline~ : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[<a href="rami3l/cmark/cmark#Inline">Inline</a>] = .., block~ : (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[<a href="rami3l/cmark/cmark#Block">Block</a>] = ..) -> <a href="rami3l/cmark/cmark#Mapper">Mapper</a>
  ```
  > 
- #### none
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,50:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::none[A](self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, _a : A) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
- #### ret
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,45:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::ret[A](a : A) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 

## MapperError

```moonbit
:::source,rami3l/cmark/cmark/error.mbt,5:::pub(all) type! MapperError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/error.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#MapperError">MapperError</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/error.mbt,5:::fn output(<a href="rami3l/cmark/cmark#MapperError">MapperError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## MapperResult

```moonbit
:::source,rami3l/cmark/cmark/mapper.mbt,28:::pub(all) enum MapperResult {
  Default
  Map(A?)
}
```
 The type for mapper results.
`Default` means doing the default map.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,34:::impl[A] <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/mapper.mbt,34:::fn default[A]() -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
    ```
    > 
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/mapper.mbt,31:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A], <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/mapper.mbt,31:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::impl[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>] <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/mapper.mbt,31:::fn to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Node

```moonbit
:::source,rami3l/cmark/cmark/node.mbt,2:::pub(all) struct Node {
  v : A
  meta : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,5:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Node">Node</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/node.mbt,5:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#Node">Node</a>[A], <a href="rami3l/cmark/cmark#Node">Node</a>[A]) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,18:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Node">Node</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/node.mbt,18:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,29:::impl[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>] <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Node">Node</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/node.mbt,29:::fn to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,44:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::empty(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = ..) -> <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  ```
  > 
- #### map
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,13:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::map[A, B](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A], f : (A) -> B) -> <a href="rami3l/cmark/cmark#Node">Node</a>[B]
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,8:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::new[A](v : A, meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = ..) -> <a href="rami3l/cmark/cmark#Node">Node</a>[A]
  ```
  > 

## Paragraph

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,186:::type Paragraph
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,189:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,189:::fn output(<a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,189:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,189:::fn to_json(<a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Parser

```moonbit
:::source,rami3l/cmark/cmark/parser.mbt,2:::type Parser
```


## ReferenceKind

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,354:::pub(all) enum ReferenceKind {
  Inline(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>])
  Ref(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="rami3l/cmark/cmark#Label">Label</a>, <a href="rami3l/cmark/cmark#Label">Label</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,360:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,360:::fn op_equal(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>, <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,360:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,360:::fn output(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,360:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,360:::fn to_json(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## ReferenceLayout

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,364:::pub(all) enum ReferenceLayout {
  Collapsed
  Full
  Shortcut
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,371:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,371:::fn op_equal(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,371:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,371:::fn output(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,371:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,371:::fn to_json(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,371:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline.mbt,371:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## Seq

```moonbit
:::source,rami3l/cmark/cmark/seq.mbt,2:::type Seq
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,2:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/seq.mbt,2:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#Seq">Seq</a>[A], <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,2:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/seq.mbt,2:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#Seq">Seq</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,5:::impl[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>] <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/seq.mbt,5:::fn to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,11:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::empty[A]() -> <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]
  ```
  > 
  >  @coverage.skip
- #### fold
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,53:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::fold[A, B](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  @coverage.skip
- #### from\_array
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,23:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::from_array[A](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]
  ```
  > 
  >  @coverage.skip
- #### from\_iter
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,17:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::from_iter[A](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]
  ```
  > 
  >  @coverage.skip
- #### get
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,65:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::get[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A], idx : Int) -> A?
  ```
  > 
  >  @coverage.skip
- #### is\_empty
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,83:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::is_empty[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]) -> Bool
  ```
  > 
  >  @coverage.skip
- #### iter
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,35:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::iter[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
  >  @coverage.skip
- #### length
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,41:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::length[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]) -> Int
  ```
  > 
  >  @coverage.skip
- #### map
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,47:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::map[A, B](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A], f : (A) -> B) -> <a href="rami3l/cmark/cmark#Seq">Seq</a>[B]
  ```
  > 
  >  @coverage.skip
- #### op\_get
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,71:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::op_get[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A], idx : Int) -> A
  ```
  > 
  >  @coverage.skip
- #### op\_set
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,77:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::op_set[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A], idx : Int, val : A) -> Unit
  ```
  > 
  >  @coverage.skip
- #### rev\_fold
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,59:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::rev_fold[A, B](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  @coverage.skip
- #### to\_array
  ```moonbit
  :::source,rami3l/cmark/cmark/seq.mbt,29:::fn <a href="rami3l/cmark/cmark#Seq">Seq</a>::to_array[A](self : <a href="rami3l/cmark/cmark#Seq">Seq</a>[A]) -> <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
  >  @coverage.skip

## Setext

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,166:::type Setext
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,171:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Setext">Setext</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,171:::fn output(<a href="rami3l/cmark/cmark#Setext">Setext</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,171:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Setext">Setext</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_struct.mbt,171:::fn to_json(<a href="rami3l/cmark/cmark#Setext">Setext</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## StartColResult

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,1606:::type StartColResult
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1609:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,1609:::fn output(<a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1609:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,1609:::fn to_json(<a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Table

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,409:::pub(all) struct Table {
  indent : Int
  col_count : Int
  rows : <a href="rami3l/cmark/cmark#Seq">Seq</a>[(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#TableRow">TableRow</a>], String)]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,413:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Table">Table</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,413:::fn output(<a href="rami3l/cmark/cmark#Table">Table</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,413:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Table">Table</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,413:::fn to_json(<a href="rami3l/cmark/cmark#Table">Table</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,436:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::new(indent~ : Int = .., rows : <a href="rami3l/cmark/cmark#Seq">Seq</a>[(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#TableRow">TableRow</a>], String)]) -> <a href="rami3l/cmark/cmark#Table">Table</a>
  ```
  > 

## TableAlign

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,416:::pub(all) enum TableAlign {
  Left
  Center
  Right
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,420:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,420:::fn output(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,420:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,420:::fn to_json(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,420:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,420:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## TableRow

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,423:::pub(all) enum TableRow {
  Header(<a href="rami3l/cmark/cmark#Seq">Seq</a>[(<a href="rami3l/cmark/cmark#Inline">Inline</a>, (String, String))])
  Sep(<a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>?, Int)]])
  Data(<a href="rami3l/cmark/cmark#Seq">Seq</a>[(<a href="rami3l/cmark/cmark#Inline">Inline</a>, (String, String))])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,427:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TableRow">TableRow</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,427:::fn output(<a href="rami3l/cmark/cmark#TableRow">TableRow</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,427:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TableRow">TableRow</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block.mbt,427:::fn to_json(<a href="rami3l/cmark/cmark#TableRow">TableRow</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Tight

```moonbit
:::source,rami3l/cmark/cmark/block_line.mbt,28:::pub(all) struct Tight {
  blanks : String
  node : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
}
```
 Tight block lines: a block line with its initial blanks trimmed but kept for layout.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,31:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_line.mbt,31:::fn op_equal(<a href="rami3l/cmark/cmark#Tight">Tight</a>, <a href="rami3l/cmark/cmark#Tight">Tight</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,39:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_line.mbt,39:::fn output(self : <a href="rami3l/cmark/cmark#Tight">Tight</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,31:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/block_line.mbt,31:::fn to_json(<a href="rami3l/cmark/cmark#Tight">Tight</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,34:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::empty(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = ..) -> <a href="rami3l/cmark/cmark#Tight">Tight</a>
  ```
  > 
- #### list\_text\_loc
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,49:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::list_text_loc(ls : <a href="rami3l/cmark/cmark#Seq">Seq</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]) -> <a href="rami3l/cmark/cmark_base#TextLoc">@rami3l/cmark/cmark_base.TextLoc</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,44:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::to_string(self : <a href="rami3l/cmark/cmark#Tight">Tight</a>) -> String
  ```
  > 

## Token

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,14:::type Token
```
 Tokens for parsing inlines.

 The list of tokens of a paragraph are the points to consider to
parse it into inlines. Tokens gradually become `Inline` tokens
containing parsed inlines. Between two tokens there is implicit
textual data. This data gradually becomes part of `Inline` tokens
or, at the end of of the parsing process, becomes `Text` inlines.

 The token list also represents newlines explicitly, either via
the `Newline` token or via the `Inline` token since inlines may
start on a line and up on another one.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Token">Token</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::fn output(<a href="rami3l/cmark/cmark#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Token">Token</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::fn to_json(<a href="rami3l/cmark/cmark#Token">Token</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenBackticks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,33:::type TokenBackticks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::fn output(<a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::fn to_json(<a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenEmphasisMarks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,40:::type TokenEmphasisMarks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::fn output(<a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::fn to_json(<a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenInline

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,49:::type TokenInline
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::fn output(<a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::fn to_json(<a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenLinkStart

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,57:::type TokenLinkStart
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::fn output(<a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::fn to_json(<a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenMathSpanMarks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,78:::type TokenMathSpanMarks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::fn output(<a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::fn to_json(<a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenNewline

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,63:::type TokenNewline
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::fn output(<a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::fn to_json(<a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenStart

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,28:::type TokenStart
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::fn output(<a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::fn to_json(<a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TokenStrikethroughMarks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,71:::type TokenStrikethroughMarks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::fn output(<a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::fn to_json(<a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Blanks

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,10:::type Blanks = String
```


## BlanksNode

```moonbit
:::source,rami3l/cmark/cmark/node.mbt,41:::type BlanksNode = <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## BlockBlankLine

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,96:::type BlockBlankLine = String
```
 The type for [blank lines](https://spec.commonmark.org/0.30/#blank-lines).
These can be ignored during rendering, they are kept for layout.

## BlockLineBlank

```moonbit
:::source,rami3l/cmark/cmark/block_line.mbt,11:::type BlockLineBlank = <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## Count

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,13:::type Count = Int
```


## FilterMap

```moonbit
:::source,rami3l/cmark/cmark/mapper.mbt,37:::type FilterMap = A?
```


## FoldFn

```moonbit
:::source,rami3l/cmark/cmark/folder.mbt,10:::type FoldFn = (<a href="rami3l/cmark/cmark#Folder">Folder</a>[B], B, A) -> B!<a href="rami3l/cmark/cmark#FolderError">FolderError</a>
```


## FolderFn

```moonbit
:::source,rami3l/cmark/cmark/folder.mbt,13:::type FolderFn = (<a href="rami3l/cmark/cmark#Folder">Folder</a>[B], B, A) -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[B]
```


## InlineText

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,436:::type InlineText = String
```
 The type for [textual content](https://spec.commonmark.org/0.30/#textual-content).

 Normally these strings should not contain newlines. This can
however happen if the source had newlines as
[character references](https://spec.commonmark.org/0.30/#entity-and-numeric-character-references).

## LabelDefs

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,53:::type LabelDefs = <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]
```


## LabelKey

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,17:::type LabelKey = String
```
 The type for label keys. These are
[link labels](https://spec.commonmark.org/0.30/#link-label)
normalized for [matches](https://spec.commonmark.org/0.30/#matches).

## LabelMap

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,20:::type LabelMap = <a href="moonbitlang/core/builtin#Map">Map</a>[String, V]
```


## LabelResolverFn

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,86:::type LabelResolverFn = (<a href="rami3l/cmark/cmark#LabelContext">LabelContext</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>?
```


## ListItemBlock

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,279:::type ListItemBlock = <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
```


## MapFn

```moonbit
:::source,rami3l/cmark/cmark/mapper.mbt,21:::type MapFn = (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, A) -> A?!<a href="rami3l/cmark/cmark#MapperError">MapperError</a>
```


## MapperFn

```moonbit
:::source,rami3l/cmark/cmark/mapper.mbt,24:::type MapperFn = (<a href="rami3l/cmark/cmark#Mapper">Mapper</a>, A) -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
```


## StringNode

```moonbit
:::source,rami3l/cmark/cmark/node.mbt,38:::type StringNode = <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## TableCellLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,433:::type TableCellLayout = (String, String)
```


## TableSep

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,430:::type TableSep = (<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>?, Int)
```


## layout\_empty

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,7:::let layout_empty : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## layout\_of\_string

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,2:::fn layout_of_string(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = .., s : String) -> <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```

