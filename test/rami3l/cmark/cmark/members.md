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
|[BlockLine](#BlockLine)||
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
|[Setext](#Setext)||
|[StartColResult](#StartColResult)||
|[Table](#Table)||
|[TableAlign](#TableAlign)||
|[TableRow](#TableRow)||
|[Tight](#Tight)||
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
  :::source,rami3l/cmark/cmark/block_struct.mbt,163:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Atx">Atx</a> with output(<a href="rami3l/cmark/cmark#Atx">Atx</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,163:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Atx">Atx</a> with to_json(<a href="rami3l/cmark/cmark#Atx">Atx</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,163:::fn <a href="rami3l/cmark/cmark#Atx">Atx</a>::output(<a href="rami3l/cmark/cmark#Atx">Atx</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,163:::fn <a href="rami3l/cmark/cmark#Atx">Atx</a>::to_json(<a href="rami3l/cmark/cmark#Atx">Atx</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Atx">Atx</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BState

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,1628:::type BState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,1632:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#BState">BState</a> with op_equal(<a href="rami3l/cmark/cmark#BState">BState</a>, <a href="rami3l/cmark/cmark#BState">BState</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,1632:::fn <a href="rami3l/cmark/cmark#BState">BState</a>::op_equal(<a href="rami3l/cmark/cmark#BState">BState</a>, <a href="rami3l/cmark/cmark#BState">BState</a>) -> Bool
  ```
  > automatically derived

## Block

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,2:::pub(all) enum Block {
  BlankLine(<a href="rami3l/cmark/cmark#Node">Node</a>[String])
  BlockQuote(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>])
  Blocks(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Block">Block</a>]])
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
  :::source,rami3l/cmark/cmark/block.mbt,16:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Block">Block</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Block">Block</a> with output(<a href="rami3l/cmark/cmark#Block">Block</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Block">Block</a> with to_json(<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### defs
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,73:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::defs(self : <a href="rami3l/cmark/cmark#Block">Block</a>, init~ : <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>] = ..) -> <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]
  ```
  >  Collects the given `Block`'s link definitions (e.g. `LinkRefDefinition`
  > and `ExtFootnoteDefinition`) and adds them to `init` (defaults to an empty map).
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,19:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::empty() -> <a href="rami3l/cmark/cmark#Block">Block</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
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
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::output(<a href="rami3l/cmark/cmark#Block">Block</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,16:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::to_json(<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Block">Block</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockHeading

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,215:::pub(all) struct BlockHeading {
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
  :::source,rami3l/cmark/cmark/block.mbt,220:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,220:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a> with output(<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,220:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a> with to_json(<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,220:::fn <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,256:::fn <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>::new(id~ : <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>? = .., layout~ : <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a> = .., level~ : Int, inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,220:::fn <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>::output(<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,220:::fn <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>::to_json(<a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockHeading">BlockHeading</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockHeadingAtxLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,229:::pub(all) struct BlockHeadingAtxLayout {
  indent : Int
  after_opening : String
  closing : String
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,233:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,233:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a> with output(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,233:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a> with to_json(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,236:::fn <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>::default() -> <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,233:::fn <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,233:::fn <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>::output(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,233:::fn <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>::to_json(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockHeadingId

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,250:::pub(all) enum BlockHeadingId {
  Auto(String)
  Id(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,253:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,253:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a> with output(<a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,253:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a> with to_json(<a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,253:::fn <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,253:::fn <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>::output(<a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,253:::fn <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>::to_json(<a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockHeadingId">BlockHeadingId</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockHeadingLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,223:::pub(all) enum BlockHeadingLayout {
  Atx(<a href="rami3l/cmark/cmark#BlockHeadingAtxLayout">BlockHeadingAtxLayout</a>)
  Setext(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,226:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,226:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a> with output(<a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,226:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a> with to_json(<a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,226:::fn <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,226:::fn <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>::output(<a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,226:::fn <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>::to_json(<a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockHeadingLayout">BlockHeadingLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockHeadingSetextLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,241:::pub(all) struct BlockHeadingSetextLayout {
  leading_indent : Int
  trailing_blanks : String
  underline_indent : Int
  underline_count : <a href="rami3l/cmark/cmark#Node">Node</a>[Int]
  underline_blanks : String
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,247:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,247:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a> with output(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,247:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a> with to_json(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,247:::fn <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,247:::fn <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>::output(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,247:::fn <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>::to_json(<a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockHeadingSetextLayout">BlockHeadingSetextLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockLine

```moonbit
:::source,rami3l/cmark/cmark/block_line.mbt,9:::pub(all) type BlockLine <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


#### mooncakes-io-method-mark-Methods
- #### list\_text\_loc
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,20:::fn <a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>::list_text_loc(ls : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>]) -> <a href="rami3l/cmark/cmark_base#TextLoc">@rami3l/cmark/cmark_base.TextLoc</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,15:::fn <a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>::to_string(self : <a href="rami3l/cmark/cmark#BlockLine">BlockLine</a>) -> String
  ```
  > 

## BlockList

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,320:::pub(all) struct BlockList {
  ty : <a href="rami3l/cmark/cmark_base#ListType">@rami3l/cmark/cmark_base.ListType</a>
  tight : Bool
  items : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#ListItem">ListItem</a>]]
}
```
 The type for [lists](https://spec.commonmark.org/0.30/#lists).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,324:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockList">BlockList</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockList">BlockList</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,324:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockList">BlockList</a> with output(<a href="rami3l/cmark/cmark#BlockList">BlockList</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,324:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockList">BlockList</a> with to_json(<a href="rami3l/cmark/cmark#BlockList">BlockList</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,324:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockList">BlockList</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### map\_items
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,327:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::map_items(self : <a href="rami3l/cmark/cmark#BlockList">BlockList</a>, f : (<a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="rami3l/cmark/cmark#BlockList">BlockList</a>
  ```
  > 
- #### normalize\_items
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,335:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::normalize_items(self : <a href="rami3l/cmark/cmark#BlockList">BlockList</a>) -> <a href="rami3l/cmark/cmark#BlockList">BlockList</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,324:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::output(<a href="rami3l/cmark/cmark#BlockList">BlockList</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,324:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::to_json(<a href="rami3l/cmark/cmark#BlockList">BlockList</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockList">BlockList</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockParagraph

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,340:::pub(all) struct BlockParagraph {
  leading_indent : Int
  inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>
  trailing_blanks : String
}
```
 The type for [paragraphs](https://spec.commonmark.org/0.30/#paragraphs).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,344:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,344:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a> with output(<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,344:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a> with to_json(<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,344:::fn <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,347:::fn <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>::new(leading_indent~ : Int = .., trailing_blanks~ : String = .., inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,344:::fn <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>::output(<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,344:::fn <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>::to_json(<a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockParagraph">BlockParagraph</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockQuote

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,97:::pub(all) struct BlockQuote {
  indent : Int
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
}
```
 The type for [block quotes](https://spec.commonmark.org/0.30/#block-quotes).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,102:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,102:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a> with output(<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,102:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a> with to_json(<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,102:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,110:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::map_block(self : <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>, f : (<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,105:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::new(indent~ : Int = .., block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
- #### normalize\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,118:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::normalize_block(self : <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>) -> <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,102:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::output(<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,102:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::to_json(<a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockQuote">BlockQuote</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,192:::type BlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,204:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a> with output(<a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,204:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a> with to_json(<a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,204:::fn <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>::output(<a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,204:::fn <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>::to_json(<a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockStruct">BlockStruct</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BlockThematicBreak

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,356:::pub(all) struct BlockThematicBreak {
  indent : Int
  layout : String
}
```
 The type for [thematic breaks](https://spec.commonmark.org/0.30/#thematic-break).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,359:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,359:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a> with output(<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,359:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a> with to_json(<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,359:::fn <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,362:::fn <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>::new(indent~ : Int = .., layout~ : String = ..) -> <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,359:::fn <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>::output(<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,359:::fn <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>::to_json(<a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#BlockThematicBreak">BlockThematicBreak</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
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
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a> with compare(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="rami3l/cmark/cmark#Closer">Closer</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a> with hash_combine(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a> with op_equal(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="rami3l/cmark/cmark#Closer">Closer</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a> with output(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Closer">Closer</a> with to_json(<a href="rami3l/cmark/cmark#Closer">Closer</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::compare(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="rami3l/cmark/cmark#Closer">Closer</a>) -> Int
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,40:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::hash_combine(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::op_equal(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="rami3l/cmark/cmark#Closer">Closer</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::output(<a href="rami3l/cmark/cmark#Closer">Closer</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,14:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::to_json(<a href="rami3l/cmark/cmark#Closer">Closer</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Closer">Closer</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CloserIndex

```moonbit
:::source,rami3l/cmark/cmark/closer.mbt,20:::type CloserIndex
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,20:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a> with output(<a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,20:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a> with to_json(<a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,20:::fn <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>::output(<a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/closer.mbt,20:::fn <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>::to_json(<a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#CloserIndex">CloserIndex</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CodeBlock

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,124:::pub(all) struct CodeBlock {
  layout : <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>
  info_string : <a href="rami3l/cmark/cmark#Node">Node</a>[String]?
  code : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
}
```
 The type for [indented](https://spec.commonmark.org/0.30/#indented-code-block) and
[fenced](:https://spec.commonmark.org/0.30/#fenced-code-blocks) code blocks.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,128:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,128:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a> with output(<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,128:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a> with to_json(<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,128:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### language\_of\_info\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,186:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::language_of_info_string(s : String) -> (String, String)?
  ```
  > 
- #### make\_fence
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,164:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::make_fence(self : <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>) -> (Char, Int)
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,149:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::new(layout~ : <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a> = .., info_string~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String]? = .., code : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]) -> <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,128:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::output(<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,128:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::to_json(<a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#CodeBlock">CodeBlock</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CodeBlockFencedLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,137:::pub(all) struct CodeBlockFencedLayout {
  indent : Int
  opening_fence : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  closing_fence : <a href="rami3l/cmark/cmark#Node">Node</a>[String]?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,141:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,141:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a> with output(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,141:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a> with to_json(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,144:::fn <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>::default() -> <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,141:::fn <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,141:::fn <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>::output(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,141:::fn <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>::to_json(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CodeBlockLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,131:::pub(all) enum CodeBlockLayout {
  Indented
  Fenced(<a href="rami3l/cmark/cmark#CodeBlockFencedLayout">CodeBlockFencedLayout</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,134:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,134:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a> with output(<a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,134:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a> with to_json(<a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,134:::fn <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,134:::fn <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>::output(<a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,134:::fn <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>::to_json(<a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#CodeBlockLayout">CodeBlockLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CodeBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,151:::type CodeBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,154:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a> with output(<a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,154:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a> with to_json(<a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,154:::fn <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>::output(<a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,154:::fn <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>::to_json(<a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#CodeBlockStruct">CodeBlockStruct</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Doc

```moonbit
:::source,rami3l/cmark/cmark/doc.mbt,2:::pub(all) struct Doc {
  nl : String
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
  defs : <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]
}
```
 The type for CommonMark documents.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Doc">Doc</a> with output(<a href="rami3l/cmark/cmark#Doc">Doc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Doc">Doc</a> with to_json(<a href="rami3l/cmark/cmark#Doc">Doc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
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
  :::source,rami3l/cmark/cmark/doc.mbt,23:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::from_string(defs~ : <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>] = .., resolver~ : (<a href="rami3l/cmark/cmark#LabelContext">LabelContext</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>? = .., nested_links~ : Bool = .., heading_auto_ids~ : Bool = .., layout~ : Bool = .., locs~ : Bool = .., file~ : String = .., strict~ : Bool = .., s : String) -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,9:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::new(nl~ : String = .., defs~ : <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>] = .., block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,6:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::output(<a href="rami3l/cmark/cmark#Doc">Doc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/doc.mbt,6:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::to_json(<a href="rami3l/cmark/cmark#Doc">Doc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Doc">Doc</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Fence

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,136:::type Fence
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,142:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Fence">Fence</a> with output(<a href="rami3l/cmark/cmark#Fence">Fence</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,142:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Fence">Fence</a> with to_json(<a href="rami3l/cmark/cmark#Fence">Fence</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,142:::fn <a href="rami3l/cmark/cmark#Fence">Fence</a>::output(<a href="rami3l/cmark/cmark#Fence">Fence</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,142:::fn <a href="rami3l/cmark/cmark#Fence">Fence</a>::to_json(<a href="rami3l/cmark/cmark#Fence">Fence</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Fence">Fence</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## FenceCodeBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,145:::type FenceCodeBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,148:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a> with output(<a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,148:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a> with to_json(<a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,148:::fn <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>::output(<a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,148:::fn <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>::to_json(<a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#FenceCodeBlockStruct">FenceCodeBlockStruct</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

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
  :::source,rami3l/cmark/cmark/error.mbt,2:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#FolderError">FolderError</a> with output(<a href="rami3l/cmark/cmark#FolderError">FolderError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/error.mbt,2:::fn <a href="rami3l/cmark/cmark#FolderError">FolderError</a>::output(<a href="rami3l/cmark/cmark#FolderError">FolderError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#FolderError">FolderError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

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
  :::source,rami3l/cmark/cmark/folder.mbt,23:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a> with default[A]() -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a> with op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A], <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,23:::fn <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>::default[A]() -> <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::fn <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>::op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A], <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::fn <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/folder.mbt,20:::fn <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#FolderResult">FolderResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Footnote

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,372:::pub(all) struct Footnote {
  indent : Int
  label : <a href="rami3l/cmark/cmark#Label">Label</a>
  defined_label : <a href="rami3l/cmark/cmark#Label">Label</a>?
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,377:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Footnote">Footnote</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,377:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Footnote">Footnote</a> with output(<a href="rami3l/cmark/cmark#Footnote">Footnote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,377:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Footnote">Footnote</a> with to_json(<a href="rami3l/cmark/cmark#Footnote">Footnote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,377:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,391:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::map_block(self : <a href="rami3l/cmark/cmark#Footnote">Footnote</a>, f : (<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,380:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::new(indent~ : Int = .., defined_label? : <a href="rami3l/cmark/cmark#Label">Label</a>?, label : <a href="rami3l/cmark/cmark#Label">Label</a>, block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
- #### normalize\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,396:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::normalize_block(self : <a href="rami3l/cmark/cmark#Footnote">Footnote</a>) -> <a href="rami3l/cmark/cmark#Footnote">Footnote</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,377:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::output(<a href="rami3l/cmark/cmark#Footnote">Footnote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,377:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::to_json(<a href="rami3l/cmark/cmark#Footnote">Footnote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Footnote">Footnote</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Heading

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,174:::type Heading
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,177:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Heading">Heading</a> with output(<a href="rami3l/cmark/cmark#Heading">Heading</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,177:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Heading">Heading</a> with to_json(<a href="rami3l/cmark/cmark#Heading">Heading</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,177:::fn <a href="rami3l/cmark/cmark#Heading">Heading</a>::output(<a href="rami3l/cmark/cmark#Heading">Heading</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,177:::fn <a href="rami3l/cmark/cmark#Heading">Heading</a>::to_json(<a href="rami3l/cmark/cmark#Heading">Heading</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Heading">Heading</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## HtmlBlock

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,266:::pub(all) type HtmlBlock <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
```
 The type for [HTML blocks](https://spec.commonmark.org/0.30/#html-blocks).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,266:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,266:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a> with output(<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,266:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a> with to_json(<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,266:::fn <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,266:::fn <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>::output(<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,266:::fn <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>::to_json(<a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#HtmlBlock">HtmlBlock</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## HtmlBlockStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,180:::type HtmlBlockStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,183:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a> with output(<a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,183:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a> with to_json(<a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,183:::fn <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>::output(<a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,183:::fn <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>::to_json(<a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#HtmlBlockStruct">HtmlBlockStruct</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IndentedCodeLine

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,129:::type IndentedCodeLine
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,133:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a> with output(<a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,133:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a> with to_json(<a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,133:::fn <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>::output(<a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,133:::fn <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>::to_json(<a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#IndentedCodeLine">IndentedCodeLine</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Inline

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,5:::pub(all) enum Inline {
  Autolink(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>])
  Break(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>])
  CodeSpan(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>])
  Emphasis(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>])
  Image(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>])
  Inlines(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Inline">Inline</a>]])
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
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Inline">Inline</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a> with op_equal(<a href="rami3l/cmark/cmark#Inline">Inline</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a> with output(<a href="rami3l/cmark/cmark#Inline">Inline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Inline">Inline</a> with to_json(<a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,21:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::empty() -> <a href="rami3l/cmark/cmark#Inline">Inline</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Inline">Inline</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### id
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,148:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::id(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>, buf~ : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a> = ..) -> String
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
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::op_equal(<a href="rami3l/cmark/cmark#Inline">Inline</a>, <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::output(<a href="rami3l/cmark/cmark#Inline">Inline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,18:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::to_json(<a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_plain\_text
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,114:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::to_plain_text(self : <a href="rami3l/cmark/cmark#Inline">Inline</a>, break_on_soft~ : Bool) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[String]]
  ```
  >  `to_plain_text(i, break_on_soft~, acc~)` has the plain text of `i`
  > as a sequence of lines represented by a list of strings to be
  > concatenated. If `break_on_soft` is `true` soft line breaks
  > are turned into hard line breaks.
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Inline">Inline</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineAutolink

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,195:::pub(all) struct InlineAutolink {
  is_email : Bool
  link : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a> with op_equal(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>, <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a> with output(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a> with to_json(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,204:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::new(link : <a href="rami3l/cmark/cmark#Node">Node</a>[String]) -> <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::op_equal(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>, <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::output(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,201:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::to_json(<a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineAutolink">InlineAutolink</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineBreak

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,210:::pub(all) struct InlineBreak {
  layout_before : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  ty : <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>
  layout_after : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a> with op_equal(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>, <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a> with output(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a> with to_json(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,217:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::new(layout_before~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String] = .., layout_after~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String] = .., ty : <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::op_equal(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>, <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::output(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,214:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::to_json(<a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineBreak">InlineBreak</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineBreakType

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,226:::pub(all) enum InlineBreakType {
  Hard
  Soft
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a> with compare(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a> with op_equal(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a> with output(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a> with to_json(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::fn <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>::compare(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> Int
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::fn <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::fn <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>::op_equal(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::fn <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>::output(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,229:::fn <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>::to_json(<a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineBreakType">InlineBreakType</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineCodeSpan

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,232:::pub(all) struct InlineCodeSpan {
  backticks : Int
  code_layout : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
}
```
 The type for [code spans](https://spec.commonmark.org/0.30/#code-spans).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a> with op_equal(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>, <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a> with output(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a> with to_json(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### code
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,303:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::code(self : <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> String
  ```
  >  https://spec.commonmark.org/0.30/\#code-spans
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### from\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,260:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::from_string(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = .., s : String) -> <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
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
  :::source,rami3l/cmark/cmark/inline.mbt,238:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::new(backticks~ : Int, code_layout : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]) -> <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::op_equal(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>, <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::output(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,235:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::to_json(<a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineCodeSpan">InlineCodeSpan</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineEmphasis

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,319:::pub(all) struct InlineEmphasis {
  delim : Char
  inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>
}
```
 The type for emphasis and strong emphasis.
https://spec.commonmark.org/0.30/\#emphasis-and-strong-emphasis

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a> with op_equal(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>, <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a> with output(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a> with to_json(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,325:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::new(delim~ : Char = .., inline : <a href="rami3l/cmark/cmark#Inline">Inline</a>) -> <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::op_equal(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>, <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::output(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,322:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::to_json(<a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineEmphasis">InlineEmphasis</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineLink

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,333:::pub(all) struct InlineLink {
  text : <a href="rami3l/cmark/cmark#Inline">Inline</a>
  reference : <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a> with op_equal(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a> with output(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a> with to_json(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### is\_unsafe
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,393:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::is_unsafe(l : String) -> Bool
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
  :::source,rami3l/cmark/cmark/inline.mbt,359:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::new(text : <a href="rami3l/cmark/cmark#Inline">Inline</a>, reference : <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::op_equal(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::output(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### reference\_definition
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,376:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::reference_definition(self : <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>, defs : <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]) -> <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>?
  ```
  >  `reference_definition(defs, l)` is the definition of `l`'s reference.
  > If `l` is an `Inline` reference this returns its link definition
  > wrapped in a `LinkDef`. If `l` is `Ref` this looks up the
  > `referenced_label` in `defs`.
- #### referenced\_label
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,365:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::referenced_label(self : <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>?
  ```
  >  `referenced_label(l)` is the label referenced by the label of `l`.
  > This is the second label of `Ref(_)` or `None` on inline references.
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,336:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::to_json(<a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineLink">InlineLink</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineMathSpan

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,429:::pub(all) struct InlineMathSpan {
  display : Bool
  tex_layout : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a> with op_equal(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>, <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a> with output(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a> with to_json(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::op_equal(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>, <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::output(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### tex
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,435:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::tex(self : <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> String
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,432:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::to_json(<a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineMathSpan">InlineMathSpan</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineRawHtml

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,414:::pub(all) type InlineRawHtml <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
```
 The type for [inline raw HTML](https://spec.commonmark.org/0.30/#raw-html) (can span multiple lines).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a> with op_equal(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>, <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a> with output(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a> with to_json(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::fn <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::fn <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>::op_equal(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>, <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::fn <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>::output(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,414:::fn <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>::to_json(<a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineRawHtml">InlineRawHtml</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InlineStrikethrough

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,426:::pub(all) type InlineStrikethrough <a href="rami3l/cmark/cmark#Inline">Inline</a>
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a> with op_equal(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>, <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a> with output(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a> with to_json(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::fn <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::fn <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>::op_equal(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>, <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::fn <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>::output(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,426:::fn <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>::to_json(<a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#InlineStrikethrough">InlineStrikethrough</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Label

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,8:::pub(all) struct Label {
  meta : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a>
  key : String
  text : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]
}
```
 Labels are used by [reference links](https://spec.commonmark.org/0.30/#reference-link) to
refer to the [definitions](#definitions) of
[link reference definitions](https://spec.commonmark.org/0.30/#link-reference-definitions),
[footnote definitions](#footnote-definitions) and your own
[interpretations](#resolvers).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Label">Label</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Label">Label</a> with output(<a href="rami3l/cmark/cmark#Label">Label</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Label">Label</a> with to_json(<a href="rami3l/cmark/cmark#Label">Label</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,42:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::compare(self : <a href="rami3l/cmark/cmark#Label">Label</a>, other : <a href="rami3l/cmark/cmark#Label">Label</a>) -> Int
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,23:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::new(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = .., key~ : String, text : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]) -> <a href="rami3l/cmark/cmark#Label">Label</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,37:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::op_equal(self : <a href="rami3l/cmark/cmark#Label">Label</a>, other : <a href="rami3l/cmark/cmark#Label">Label</a>) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::output(<a href="rami3l/cmark/cmark#Label">Label</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### text\_loc
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,32:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::text_loc(self : <a href="rami3l/cmark/cmark#Label">Label</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">@rami3l/cmark/cmark_base.TextLoc</a>
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,12:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::to_json(<a href="rami3l/cmark/cmark#Label">Label</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Label">Label</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
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
  :::source,rami3l/cmark/cmark/label.mbt,50:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a> with output(<a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,50:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a> with to_json(<a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,50:::fn <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>::output(<a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/label.mbt,50:::fn <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>::to_json(<a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## LinkDefinition

```moonbit
:::source,rami3l/cmark/cmark/link_definition.mbt,6:::pub(all) struct LinkDefinition {
  layout : <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>
  label : <a href="rami3l/cmark/cmark#Label">Label</a>?
  defined_label : <a href="rami3l/cmark/cmark#Label">Label</a>?
  dest : <a href="rami3l/cmark/cmark#Node">Node</a>[String]?
  title : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a> with op_equal(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>, <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a> with output(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a> with to_json(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,15:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::new(layout~ : <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a> = .., label~ : <a href="rami3l/cmark/cmark#Label">Label</a>? = .., defined_label~ : <a href="rami3l/cmark/cmark#Label">Label</a>? = .., dest~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String]? = .., title~ : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]? = ..) -> <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::op_equal(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>, <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::output(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,12:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::to_json(<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## LinkDefinitionLayout

```moonbit
:::source,rami3l/cmark/cmark/link_definition.mbt,26:::pub(all) struct LinkDefinitionLayout {
  indent : Int
  angled_dest : Bool
  before_dest : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
  after_dest : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
  title_open_delim : Char
  after_title : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[String]]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a> with op_equal(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>, <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a> with output(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a> with to_json(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
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
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::op_equal(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>, <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::output(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/link_definition.mbt,33:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::to_json(<a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#LinkDefinitionLayout">LinkDefinitionLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
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
  :::source,rami3l/cmark/cmark/block_struct.mbt,222:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a> with output(<a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,222:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a> with to_json(<a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,222:::fn <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>::output(<a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,222:::fn <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>::to_json(<a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#ListBlockStruct">ListBlockStruct</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ListItem

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,269:::pub(all) struct ListItem {
  before_marker : Int
  marker : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  after_marker : Int
  block : <a href="rami3l/cmark/cmark#Block">Block</a>
  ext_task_marker : <a href="rami3l/cmark/cmark#Node">Node</a>[Char]?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,275:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#ListItem">ListItem</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,275:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ListItem">ListItem</a> with output(<a href="rami3l/cmark/cmark#ListItem">ListItem</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,275:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ListItem">ListItem</a> with to_json(<a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,275:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### map\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,292:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::map_block(self : <a href="rami3l/cmark/cmark#ListItem">ListItem</a>, f : (<a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,281:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::new(before_marker~ : Int = .., marker~ : <a href="rami3l/cmark/cmark#Node">Node</a>[String] = .., after_marker~ : Int = .., ext_task_marker~ : <a href="rami3l/cmark/cmark#Node">Node</a>[Char]?, block : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
- #### normalize\_block
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,297:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::normalize_block(self : <a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,275:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::output(<a href="rami3l/cmark/cmark#ListItem">ListItem</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,275:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::to_json(<a href="rami3l/cmark/cmark#ListItem">ListItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#ListItem">ListItem</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ListItemStruct

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,207:::type ListItemStruct
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,213:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a> with output(<a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,213:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a> with to_json(<a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,213:::fn <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>::output(<a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,213:::fn <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>::to_json(<a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#ListItemStruct">ListItemStruct</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ListTaskStatus

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,302:::pub(all) enum ListTaskStatus {
  Cancelled
  Checked
  Unchecked
  Other(Char)
}
```


#### mooncakes-io-method-mark-Methods
- #### from\_marker
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,310:::fn <a href="rami3l/cmark/cmark#ListTaskStatus">ListTaskStatus</a>::from_marker(marker : Char) -> <a href="rami3l/cmark/cmark#ListTaskStatus">ListTaskStatus</a>
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
  :::source,rami3l/cmark/cmark/mapper.mbt,124:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::map_block(self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, b : <a href="rami3l/cmark/cmark#Block">Block</a>) -> <a href="rami3l/cmark/cmark#Block">Block</a>?
  ```
  > 
- #### map\_doc
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,199:::fn <a href="rami3l/cmark/cmark#Mapper">Mapper</a>::map_doc(self : <a href="rami3l/cmark/cmark#Mapper">Mapper</a>, d : <a href="rami3l/cmark/cmark#Doc">Doc</a>) -> <a href="rami3l/cmark/cmark#Doc">Doc</a>
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
  :::source,rami3l/cmark/cmark/error.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#MapperError">MapperError</a> with output(<a href="rami3l/cmark/cmark#MapperError">MapperError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/error.mbt,5:::fn <a href="rami3l/cmark/cmark#MapperError">MapperError</a>::output(<a href="rami3l/cmark/cmark#MapperError">MapperError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#MapperError">MapperError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

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
  :::source,rami3l/cmark/cmark/mapper.mbt,34:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a> with default[A]() -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a> with op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A], <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,34:::fn <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>::default[A]() -> <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::fn <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>::op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A], <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::fn <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/mapper.mbt,31:::fn <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#MapperResult">MapperResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Node

```moonbit
:::source,rami3l/cmark/cmark/node.mbt,2:::pub(all) struct Node {
  v : A
  meta : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,38:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Node">Node</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Node">Node</a>[A]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Node">Node</a> with op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#Node">Node</a>[A], <a href="rami3l/cmark/cmark#Node">Node</a>[A]) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,18:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Node">Node</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,29:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Node">Node</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,57:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::empty(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = ..) -> <a href="rami3l/cmark/cmark#Node">Node</a>[String]
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,38:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::from_json[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Node">Node</a>[A]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,5:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="rami3l/cmark/cmark#Node">Node</a>[A], <a href="rami3l/cmark/cmark#Node">Node</a>[A]) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,18:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/node.mbt,29:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="rami3l/cmark/cmark#Node">Node</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Node">Node</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Paragraph

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,186:::type Paragraph
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,189:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a> with output(<a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,189:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a> with to_json(<a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,189:::fn <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>::output(<a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,189:::fn <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>::to_json(<a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Paragraph">Paragraph</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Parser

```moonbit
:::source,rami3l/cmark/cmark/parser.mbt,2:::type Parser
```


## ReferenceKind

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,339:::pub(all) enum ReferenceKind {
  Inline(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#LinkDefinition">LinkDefinition</a>])
  Ref(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="rami3l/cmark/cmark#Label">Label</a>, <a href="rami3l/cmark/cmark#Label">Label</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a> with op_equal(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>, <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a> with output(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a> with to_json(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::fn <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::fn <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>::op_equal(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>, <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::fn <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>::output(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,345:::fn <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>::to_json(<a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#ReferenceKind">ReferenceKind</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ReferenceLayout

```moonbit
:::source,rami3l/cmark/cmark/inline.mbt,349:::pub(all) enum ReferenceLayout {
  Collapsed
  Full
  Shortcut
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a> with op_equal(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a> with output(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a> with to_json(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::fn <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::fn <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>::op_equal(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::fn <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>::output(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline.mbt,356:::fn <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>::to_json(<a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#ReferenceLayout">ReferenceLayout</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Setext

```moonbit
:::source,rami3l/cmark/cmark/block_struct.mbt,166:::type Setext
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,171:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Setext">Setext</a> with output(<a href="rami3l/cmark/cmark#Setext">Setext</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,171:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Setext">Setext</a> with to_json(<a href="rami3l/cmark/cmark#Setext">Setext</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,171:::fn <a href="rami3l/cmark/cmark#Setext">Setext</a>::output(<a href="rami3l/cmark/cmark#Setext">Setext</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_struct.mbt,171:::fn <a href="rami3l/cmark/cmark#Setext">Setext</a>::to_json(<a href="rami3l/cmark/cmark#Setext">Setext</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Setext">Setext</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## StartColResult

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,1519:::type StartColResult
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1522:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1522:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a> with output(<a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1522:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a> with to_json(<a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1522:::fn <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1522:::fn <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>::output(<a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,1522:::fn <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>::to_json(<a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#StartColResult">StartColResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Table

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,408:::pub(all) struct Table {
  indent : Int
  col_count : Int
  rows : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#TableRow">TableRow</a>], String)]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,412:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Table">Table</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Table">Table</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,412:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Table">Table</a> with output(<a href="rami3l/cmark/cmark#Table">Table</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,412:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Table">Table</a> with to_json(<a href="rami3l/cmark/cmark#Table">Table</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,412:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Table">Table</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,435:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::new(indent~ : Int = .., rows : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[(<a href="rami3l/cmark/cmark#Node">Node</a>[<a href="rami3l/cmark/cmark#TableRow">TableRow</a>], String)]) -> <a href="rami3l/cmark/cmark#Table">Table</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,412:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::output(<a href="rami3l/cmark/cmark#Table">Table</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### parse\_sep\_row
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,453:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::parse_sep_row(cs : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[(<a href="rami3l/cmark/cmark#Inline">Inline</a>, (String, String))]) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>?, Int)]]?
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,412:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::to_json(<a href="rami3l/cmark/cmark#Table">Table</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Table">Table</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TableAlign

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,415:::pub(all) enum TableAlign {
  Left
  Center
  Right
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,419:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,419:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a> with output(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,419:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a> with to_json(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,419:::fn <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,419:::fn <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>::output(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,419:::fn <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>::to_json(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TableRow

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,422:::pub(all) enum TableRow {
  Header(<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[(<a href="rami3l/cmark/cmark#Inline">Inline</a>, (String, String))])
  Sep(<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Node">Node</a>[(<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>?, Int)]])
  Data(<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[(<a href="rami3l/cmark/cmark#Inline">Inline</a>, (String, String))])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,426:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#TableRow">TableRow</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#TableRow">TableRow</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,426:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TableRow">TableRow</a> with output(<a href="rami3l/cmark/cmark#TableRow">TableRow</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,426:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TableRow">TableRow</a> with to_json(<a href="rami3l/cmark/cmark#TableRow">TableRow</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,426:::fn <a href="rami3l/cmark/cmark#TableRow">TableRow</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#TableRow">TableRow</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,426:::fn <a href="rami3l/cmark/cmark#TableRow">TableRow</a>::output(<a href="rami3l/cmark/cmark#TableRow">TableRow</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block.mbt,426:::fn <a href="rami3l/cmark/cmark#TableRow">TableRow</a>::to_json(<a href="rami3l/cmark/cmark#TableRow">TableRow</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TableRow">TableRow</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tight

```moonbit
:::source,rami3l/cmark/cmark/block_line.mbt,33:::pub(all) struct Tight {
  blanks : String
  node : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,36:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Tight">Tight</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,36:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a> with op_equal(<a href="rami3l/cmark/cmark#Tight">Tight</a>, <a href="rami3l/cmark/cmark#Tight">Tight</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,44:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a> with output(self : <a href="rami3l/cmark/cmark#Tight">Tight</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,36:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Tight">Tight</a> with to_json(<a href="rami3l/cmark/cmark#Tight">Tight</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,39:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::empty(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = ..) -> <a href="rami3l/cmark/cmark#Tight">Tight</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,36:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark#Tight">Tight</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### list\_text\_loc
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,54:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::list_text_loc(ls : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark#Tight">Tight</a>]) -> <a href="rami3l/cmark/cmark_base#TextLoc">@rami3l/cmark/cmark_base.TextLoc</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,36:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::op_equal(<a href="rami3l/cmark/cmark#Tight">Tight</a>, <a href="rami3l/cmark/cmark#Tight">Tight</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,44:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::output(self : <a href="rami3l/cmark/cmark#Tight">Tight</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,36:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::to_json(<a href="rami3l/cmark/cmark#Tight">Tight</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/block_line.mbt,49:::fn <a href="rami3l/cmark/cmark#Tight">Tight</a>::to_string(self : <a href="rami3l/cmark/cmark#Tight">Tight</a>) -> String
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
  :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#Token">Token</a> with output(<a href="rami3l/cmark/cmark#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#Token">Token</a> with to_json(<a href="rami3l/cmark/cmark#Token">Token</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::fn <a href="rami3l/cmark/cmark#Token">Token</a>::output(<a href="rami3l/cmark/cmark#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,25:::fn <a href="rami3l/cmark/cmark#Token">Token</a>::to_json(<a href="rami3l/cmark/cmark#Token">Token</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#Token">Token</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenBackticks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,33:::type TokenBackticks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a> with output(<a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a> with to_json(<a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::fn <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>::output(<a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,37:::fn <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>::to_json(<a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenBackticks">TokenBackticks</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenEmphasisMarks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,40:::type TokenEmphasisMarks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a> with output(<a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a> with to_json(<a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::fn <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>::output(<a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,46:::fn <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>::to_json(<a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenEmphasisMarks">TokenEmphasisMarks</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenInline

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,49:::type TokenInline
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a> with output(<a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a> with to_json(<a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::fn <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>::output(<a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,54:::fn <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>::to_json(<a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenInline">TokenInline</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenLinkStart

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,57:::type TokenLinkStart
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a> with output(<a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a> with to_json(<a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::fn <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>::output(<a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,60:::fn <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>::to_json(<a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenLinkStart">TokenLinkStart</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenMathSpanMarks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,78:::type TokenMathSpanMarks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a> with output(<a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a> with to_json(<a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::fn <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>::output(<a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,83:::fn <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>::to_json(<a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenMathSpanMarks">TokenMathSpanMarks</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenNewline

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,63:::type TokenNewline
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a> with output(<a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a> with to_json(<a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::fn <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>::output(<a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,68:::fn <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>::to_json(<a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenNewline">TokenNewline</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenStart

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,28:::type TokenStart
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a> with output(<a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a> with to_json(<a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::fn <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>::output(<a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,30:::fn <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>::to_json(<a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenStart">TokenStart</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenStrikethroughMarks

```moonbit
:::source,rami3l/cmark/cmark/inline_struct.mbt,71:::type TokenStrikethroughMarks
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a> with output(<a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a> with to_json(<a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::fn <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>::output(<a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark/inline_struct.mbt,75:::fn <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>::to_json(<a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark/traits.mbt,85:::fn <a href="rami3l/cmark/cmark#TokenStrikethroughMarks">TokenStrikethroughMarks</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Blanks

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,10:::type Blanks = String
```


## BlanksNode

```moonbit
:::source,rami3l/cmark/cmark/node.mbt,54:::type BlanksNode = <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## BlockBlankLine

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,94:::type BlockBlankLine = String
```
 The type for [blank lines](https://spec.commonmark.org/0.30/#blank-lines).
These can be ignored during rendering, they are kept for layout.

## BlockLineBlank

```moonbit
:::source,rami3l/cmark/cmark/block_line.mbt,12:::type BlockLineBlank = <a href="rami3l/cmark/cmark#Node">Node</a>[String]
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
:::source,rami3l/cmark/cmark/inline.mbt,421:::type InlineText = String
```
 The type for [textual content](https://spec.commonmark.org/0.30/#textual-content).

 Normally these strings should not contain newlines. This can
however happen if the source had newlines as
[character references](https://spec.commonmark.org/0.30/#entity-and-numeric-character-references).

## LabelDefs

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,53:::type LabelDefs = <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, <a href="rami3l/cmark/cmark#LabelDef">LabelDef</a>]
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
:::source,rami3l/cmark/cmark/label.mbt,20:::type LabelMap = <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[String, V]
```


## LabelResolverFn

```moonbit
:::source,rami3l/cmark/cmark/label.mbt,86:::type LabelResolverFn = (<a href="rami3l/cmark/cmark#LabelContext">LabelContext</a>) -> <a href="rami3l/cmark/cmark#Label">Label</a>?
```


## ListItemBlock

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,278:::type ListItemBlock = <a href="rami3l/cmark/cmark#ListItem">ListItem</a>
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
:::source,rami3l/cmark/cmark/node.mbt,51:::type StringNode = <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## TableCellLayout

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,432:::type TableCellLayout = (String, String)
```


## TableSep

```moonbit
:::source,rami3l/cmark/cmark/block.mbt,429:::type TableSep = (<a href="rami3l/cmark/cmark#TableAlign">TableAlign</a>?, Int)
```


## layout\_empty

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,7:::let layout_empty : <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```


## layout\_of\_string

```moonbit
:::source,rami3l/cmark/cmark/layout.mbt,2:::fn layout_of_string(meta~ : <a href="rami3l/cmark/cmark_base#Meta">@rami3l/cmark/cmark_base.Meta</a> = .., s : String) -> <a href="rami3l/cmark/cmark#Node">Node</a>[String]
```

