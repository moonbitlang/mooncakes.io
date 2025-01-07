# Documentation
|Type|description|
|---|---|
|[Exit](#Exit)||
|[FencedCodeBlockContinue](#FencedCodeBlockContinue)||
|[HtmlBlockEndCond](#HtmlBlockEndCond)||
|[LineSpan](#LineSpan)||
|[LineType](#LineType)||
|[ListType](#ListType)||
|[Meta](#Meta)||
|[NextLineResult](#NextLineResult)||
|[Span](#Span)||
|[TextLoc](#TextLoc)||
|[BytePos](#BytePos)||
|[Dict](#Dict)||
|[FilePath](#FilePath)||
|[First](#First)||
|[HeadingLevel](#HeadingLevel)||
|[Indent](#Indent)||
|[Last](#Last)||
|[LineNum](#LineNum)||
|[LinePos](#LinePos)||
|[Next](#Next)||
|[NextLineFn](#NextLineFn)||
|[RevSpans](#RevSpans)||

|Value|description|
|---|---|
|[autolink\_email](#autolink_email)| \`autolink\_email(s, last, start)\` matches an email autolink starting at|
|[autolink\_uri](#autolink_uri)| \`autolink\_uri(s, last, start)\` matches an URI autolink starting at|
|[byte\_pos\_none](#byte_pos_none)||
|[could\_be\_link\_ref\_definition](#could_be_link_ref_definition)||
|[ext\_task\_marker](#ext_task_marker)||
|[file\_path\_none](#file_path_none)||
|[first\_non\_blank](#first_non_blank)| \`first\_non\_blank(s, last, start)\` is the first position in the range \`\[start, last\]\`|
|[first\_non\_blank\_in\_span](#first_non_blank_in_span)| \`first\_non\_blank\_in\_span(s, span)\` is \`first\_non\_blank(s, last=span.last, start=span.first)\`.|
|[first\_non\_blank\_over\_nl](#first_non_blank_over_nl)| \`first\_non\_blank\_over\_nl(next\_line, s, lines, line, start)\` is the first byte position starting with \`start\`|
|[first\_non\_escaped\_char](#first_non_escaped_char)| \`first\_non\_escaped\_char(c, s, last, start)\` is the first \`BytePos\`|
|[last\_non\_blank](#last_non_blank)| \`last\_non\_blank(s, first, start)\` is the last position in the range \`\[first, start\]\`|
|[line\_num\_none](#line_num_none)||
|[line\_pos\_none](#line_pos_none)||
|[link\_destination](#link_destination)| \`link\_destination(s, last, start)\` matches a link destination|
|[link\_label](#link_label)| Matches a link label on \`line\` starting at \`start\`.|
|[link\_title](#link_title)| \`link\_title(next\_line, s, lines, line, last)\` is a link title on line \`line\` starting at \`start\`. |
|[raw\_html](#raw_html)| https://spec.commonmark.org/current/\#html-tag|
|[rev\_drop\_spaces](#rev_drop_spaces)| \`rev\_drop\_spaces(s, first, start)\` is the last position in the range \`\[first, start\]\`|
|[run\_of](#run_of)| \`run\_of(char, s, last, start)\` is the last position of a consecutive run of \`char\`|

## Exit

```moonbit
:::source,rami3l/cmark/cmark_base/error.mbt,2:::pub(all) type! Exit

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/error.mbt,2:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#Exit">Exit</a> with output(<a href="rami3l/cmark/cmark_base#Exit">Exit</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/error.mbt,2:::fn <a href="rami3l/cmark/cmark_base#Exit">Exit</a>::output(<a href="rami3l/cmark/cmark_base#Exit">Exit</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#Exit">Exit</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## FencedCodeBlockContinue

```moonbit
:::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,258:::pub(all) enum FencedCodeBlockContinue {
  Close(Int, Int)
  Code
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,261:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a> with output(<a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,261:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a> with to_json(<a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,267:::fn <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>::new(s : String, fence~ : (Char, Int), last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>
  ```
  >  `fenced_code_block_continue(fence, s, last, start)` indicates
  > whether the fence code continues or closes in the the range
  > \[start;last\] given the opening `open` which indicates the
  > indent, fence char and number of fence chars.
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,261:::fn <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>::output(<a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,261:::fn <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>::to_json(<a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#FencedCodeBlockContinue">FencedCodeBlockContinue</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## HtmlBlockEndCond

```moonbit
:::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,5:::pub(all) enum HtmlBlockEndCond {
  EndStr(String)
  EndCond1
  EndBlank
  EndBlank7
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,10:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a> with op_equal(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>, <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,10:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a> with output(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,10:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a> with to_json(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,10:::fn <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>::op_equal(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>, <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,10:::fn <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>::output(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,10:::fn <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>::to_json(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## LineSpan

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,104:::pub(all) struct LineSpan {
  pos : (Int, Int)
  first : Int
  last : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a> with compare(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a> with op_equal(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a> with output(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a> with to_json(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::fn <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>::compare(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::fn <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>::op_equal(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::fn <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>::output(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,108:::fn <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>::to_json(<a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## LineType

```moonbit
:::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,30:::pub(all) enum LineType {
  AtxHeadingLine(Int, Int, Int, Int)
  BlankLine
  BlockQuoteLine
  FencedCodeBlockLine(Int, Int, (Int, Int)?)
  HtmlBlockLine(<a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>)
  IndentedCodeBlockLine
  ListMarkerLine(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>, Int)
  ParagraphLine
  SetextUnderlineLine(Int, Int)
  ThematicBreakLine(Int)
  ExtTableRow(Int)
  ExtFootnoteLabel(<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark_base#Span">Span</a>], Int, String)
  Nomatch
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,44:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark_base#LineType">LineType</a> with op_equal(<a href="rami3l/cmark/cmark_base#LineType">LineType</a>, <a href="rami3l/cmark/cmark_base#LineType">LineType</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,44:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#LineType">LineType</a> with output(<a href="rami3l/cmark/cmark_base#LineType">LineType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,44:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#LineType">LineType</a> with to_json(<a href="rami3l/cmark/cmark_base#LineType">LineType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### atx\_heading
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,78:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::atx_heading(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  >  https://spec.commonmark.org/current/\#atx-headings
- #### ext\_footnote\_label
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,540:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::ext_footnote_label(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, s : String, line_pos~ : (Int, Int), last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  > 
- #### ext\_table\_row
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,525:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::ext_table_row(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  > 
- #### fenced\_code\_block\_start
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,192:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::fenced_code_block_start(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  > 
- #### html\_block\_end
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,511:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::html_block_end(s : String, end_cond~ : <a href="rami3l/cmark/cmark_base#HtmlBlockEndCond">HtmlBlockEndCond</a>, last~ : Int, start~ : Int) -> Bool
  ```
  > 
- #### html\_block\_start
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,407:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::html_block_start(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  >  https://spec.commonmark.org/current/\#html-blocks
- #### list\_marker
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,595:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::list_marker(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,44:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::op_equal(<a href="rami3l/cmark/cmark_base#LineType">LineType</a>, <a href="rami3l/cmark/cmark_base#LineType">LineType</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,44:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::output(<a href="rami3l/cmark/cmark_base#LineType">LineType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### setext\_heading\_underline
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,159:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::setext_heading_underline(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  >  https://spec.commonmark.org/current/\#setext-heading
- #### thematic\_break
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,47:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::thematic_break(s : String, last~ : Int, start~ : Int) -> <a href="rami3l/cmark/cmark_base#LineType">LineType</a>
  ```
  >  https://spec.commonmark.org/current/\#thematic-breaks
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,44:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::to_json(<a href="rami3l/cmark/cmark_base#LineType">LineType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#LineType">LineType</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ListType

```moonbit
:::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,13:::pub(all) enum ListType {
  Unordered(Char)
  Ordered(Int, Char)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark_base#ListType">ListType</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_base#ListType">ListType</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark_base#ListType">ListType</a> with op_equal(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>, <a href="rami3l/cmark/cmark_base#ListType">ListType</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#ListType">ListType</a> with output(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#ListType">ListType</a> with to_json(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::fn <a href="rami3l/cmark/cmark_base#ListType">ListType</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_base#ListType">ListType</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### is\_same\_type
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,21:::fn <a href="rami3l/cmark/cmark_base#ListType">ListType</a>::is_same_type(self : <a href="rami3l/cmark/cmark_base#ListType">ListType</a>, other : <a href="rami3l/cmark/cmark_base#ListType">ListType</a>) -> Bool
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::fn <a href="rami3l/cmark/cmark_base#ListType">ListType</a>::op_equal(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>, <a href="rami3l/cmark/cmark_base#ListType">ListType</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::fn <a href="rami3l/cmark/cmark_base#ListType">ListType</a>::output(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,18:::fn <a href="rami3l/cmark/cmark_base#ListType">ListType</a>::to_json(<a href="rami3l/cmark/cmark_base#ListType">ListType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#ListType">ListType</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Meta

```moonbit
:::source,rami3l/cmark/cmark_base/meta.mbt,2:::pub(all) struct Meta {
  id : Int
  loc : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  dict : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/json#Json">Json</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,82:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark_base#Meta">Meta</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_base#Meta">Meta</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,48:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#Meta">Meta</a> with output(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,63:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#Meta">Meta</a> with to_json(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,38:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::compare(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>, other : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>) -> Int
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,82:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_base#Meta">Meta</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- #### is\_none
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,43:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::is_none(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>) -> Bool
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,18:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::new(loc~ : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a> = ..) -> <a href="rami3l/cmark/cmark_base#Meta">Meta</a>
  ```
  > 
- #### none
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,28:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::none() -> <a href="rami3l/cmark/cmark_base#Meta">Meta</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,33:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::op_equal(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>, other : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,48:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::output(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/meta.mbt,77:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::to_json(self : <a href="rami3l/cmark/cmark_base#Meta">Meta</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#Meta">Meta</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## NextLineResult

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,121:::pub(all) enum NextLineResult {
  ThisLine(Int)
  NextLine(A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, Int)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,124:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,124:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,124:::fn <a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>[A], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,124:::fn <a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](<a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Span

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,112:::pub(all) struct Span {
  start : Int
  span : <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark_base#Span">Span</a> with compare(<a href="rami3l/cmark/cmark_base#Span">Span</a>, <a href="rami3l/cmark/cmark_base#Span">Span</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark_base#Span">Span</a> with op_equal(<a href="rami3l/cmark/cmark_base#Span">Span</a>, <a href="rami3l/cmark/cmark_base#Span">Span</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#Span">Span</a> with output(<a href="rami3l/cmark/cmark_base#Span">Span</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#Span">Span</a> with to_json(<a href="rami3l/cmark/cmark_base#Span">Span</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::fn <a href="rami3l/cmark/cmark_base#Span">Span</a>::compare(<a href="rami3l/cmark/cmark_base#Span">Span</a>, <a href="rami3l/cmark/cmark_base#Span">Span</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::fn <a href="rami3l/cmark/cmark_base#Span">Span</a>::op_equal(<a href="rami3l/cmark/cmark_base#Span">Span</a>, <a href="rami3l/cmark/cmark_base#Span">Span</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::fn <a href="rami3l/cmark/cmark_base#Span">Span</a>::output(<a href="rami3l/cmark/cmark_base#Span">Span</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,115:::fn <a href="rami3l/cmark/cmark_base#Span">Span</a>::to_json(<a href="rami3l/cmark/cmark_base#Span">Span</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#Span">Span</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TextLoc

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,2:::pub(all) struct TextLoc {
  file : String
  first_byte : Int
  last_byte : Int
  first_line : (Int, Int)
  last_line : (Int, Int)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a> with compare(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a> with op_equal(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a> with output(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a> with to_json(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### after
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,45:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::after(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  ```
  > 
- #### compare
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::compare(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> Int
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### is\_empty
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,30:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::is_empty(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> Bool
  ```
  > 
- #### is\_none
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,25:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::is_none(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> Bool
  ```
  > 
- #### none
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,20:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::none() -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::op_equal(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::output(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### reloc
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,71:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::reloc(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, other : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  ```
  > 
- #### span
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,56:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::span(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>, other : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  ```
  > 
- #### to\_first
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,35:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::to_first(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,8:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::to_json(<a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_last
  ```moonbit
  :::source,rami3l/cmark/cmark_base/text_loc.mbt,40:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::to_last(self : <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>) -> <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_base/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_base#TextLoc">TextLoc</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BytePos

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,86:::type BytePos = Int
```


## Dict

```moonbit
:::source,rami3l/cmark/cmark_base/meta.mbt,9:::type Dict = <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/json#Json">Json</a>]
```


## FilePath

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,80:::type FilePath = String
```


## First

```moonbit
:::source,rami3l/cmark/cmark_base/result_type.mbt,7:::type First = Int
```


## HeadingLevel

```moonbit
:::source,rami3l/cmark/cmark_base/result_type.mbt,20:::type HeadingLevel = Int
```


## Indent

```moonbit
:::source,rami3l/cmark/cmark_base/result_type.mbt,3:::type Indent = Int
```


## Last

```moonbit
:::source,rami3l/cmark/cmark_base/result_type.mbt,11:::type Last = Int
```


## LineNum

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,92:::type LineNum = Int
```


## LinePos

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,98:::type LinePos = (Int, Int)
```


## Next

```moonbit
:::source,rami3l/cmark/cmark_base/result_type.mbt,16:::type Next = Int
```


## NextLineFn

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,118:::type NextLineFn = (A) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>)?
```


## RevSpans

```moonbit
:::source,rami3l/cmark/cmark_base/alias.mbt,8:::type RevSpans = <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark_base#Span">Span</a>]
```


## autolink\_email

```moonbit
:::source,rami3l/cmark/cmark_base/autolink.mbt,3:::fn autolink_email(s : String, last~ : Int = .., start~ : Int = ..) -> Int?
```
 `autolink_email(s, last, start)` matches an email autolink starting at
`start` in the range `[start;last]` (assumed on the same line).

## autolink\_uri

```moonbit
:::source,rami3l/cmark/cmark_base/autolink.mbt,57:::fn autolink_uri(s : String, last~ : Int = .., start~ : Int = ..) -> Int?
```
 `autolink_uri(s, last, start)` matches an URI autolink starting at
`start` in the range `[start;last]` (assumed on the same line).

## byte\_pos\_none

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,89:::let byte_pos_none : Int
```


## could\_be\_link\_ref\_definition

```moonbit
:::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,570:::fn could_be_link_ref_definition(s : String, last~ : Int, start~ : Int) -> Bool
```


## ext\_task\_marker

```moonbit
:::source,rami3l/cmark/cmark_base/leaf_blocks.mbt,642:::fn ext_task_marker(s : String, last~ : Int, start~ : Int) -> (Char, Int)?
```


## file\_path\_none

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,83:::let file_path_none : String
```


## first\_non\_blank

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,17:::fn first_non_blank(s : String, last~ : Int, start~ : Int) -> Int
```
 `first_non_blank(s, last, start)` is the first position in the range `[start, last]`
that is not blank and `last + 1` if there is none.

## first\_non\_blank\_in\_span

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,32:::fn first_non_blank_in_span(s : String, span : <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>) -> Int
```
 `first_non_blank_in_span(s, span)` is `first_non_blank(s, last=span.last, start=span.first)`.

## first\_non\_blank\_over\_nl

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,155:::fn first_non_blank_over_nl[A](next_line~ : (A) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>)?, s : String, lines : A, line~ : <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, start~ : Int) -> <a href="rami3l/cmark/cmark_base#NextLineResult">NextLineResult</a>[A]?
```
 `first_non_blank_over_nl(next_line, s, lines, line, start)` is the first byte position starting with `start`
that is not blank in `line` or on the next line as determined by `next_line`.
Returns `None` if there is no such position.

## first\_non\_escaped\_char

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,200:::fn first_non_escaped_char(c : Char, s : String, last~ : Int, start~ : Int) -> Int
```
 `first_non_escaped_char(c, s, last, start)` is the first `BytePos`
in the range `[start, last]` that has `c` unescaped and `last + 1` if there is none.

## last\_non\_blank

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,38:::fn last_non_blank(s : String, first~ : Int, start~ : Int) -> Int
```
 `last_non_blank(s, first, start)` is the last position in the range `[first, start]`
that is not blank and `first - 1` if there is none.

## line\_num\_none

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,95:::let line_num_none : Int
```


## line\_pos\_none

```moonbit
:::source,rami3l/cmark/cmark_base/text_loc.mbt,101:::let line_pos_none : (Int, Int)
```


## link\_destination

```moonbit
:::source,rami3l/cmark/cmark_base/link.mbt,8:::fn link_destination(s : String, last~ : Int, start~ : Int) -> (Bool, Int, Int)?
```
 `link_destination(s, last, start)` matches a link destination
starting at `start` in the range `start..=last` (assumed on
the same line). This is `Some((delimited, first, last))` with the
data in \[first..=last\] the destination data. `delimited` is
`true` if `first-1` is '\<' and `last + 1` is '\>'.

 See: https://spec.commonmark.org/current/\#link-destination

## link\_label

```moonbit
:::source,rami3l/cmark/cmark_base/link.mbt,132:::fn link_label[A](buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, next_line~ : (A) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>)?, s : String, lines : A, line~ : <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, start~ : Int) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark_base#Span">Span</a>], Int, String)?
```
 Matches a link label on `line` starting at `start`.
The byte ranges have the label's content, the string is the normalized label.
`buf` is used as scratch space.

 See: https://spec.commonmark.org/current/\#link-label

## link\_title

```moonbit
:::source,rami3l/cmark/cmark_base/link.mbt,79:::fn link_title[A](next_line~ : (A) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>)?, s : String, lines : A, line~ : <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, start~ : Int) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark_base#Span">Span</a>], Int)?
```
 `link_title(next_line, s, lines, line, last)` is a link title on line `line` starting at `start`.
Returns `Some((lines, last_line, spans, last))` with `lines` the lines after consuming the title,
`last_line` the line where it stops, `spans` the byte ranges of `s` that make up the title in reverse
order, `last` is on the closing delimiter and guaranteed to be on `last_line`.

 See: https://spec.commonmark.org/current/\#link-title

## raw\_html

```moonbit
:::source,rami3l/cmark/cmark_base/raw_html.mbt,341:::fn raw_html[A : <a href="moonbitlang/core/builtin#Show">Show</a>](next_line~ : (A) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>)?, s : String, lines : A, line~ : <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, start~ : Int) -> (A, <a href="rami3l/cmark/cmark_base#LineSpan">LineSpan</a>, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="rami3l/cmark/cmark_base#Span">Span</a>], Int)?
```
 https://spec.commonmark.org/current/\#html-tag

## rev\_drop\_spaces

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,54:::fn rev_drop_spaces(s : String, first~ : Int, start~ : Int) -> Int
```
 `rev_drop_spaces(s, first, start)` is the last position in the range `[first, start]`
that is not U+0020 and `first - 1` if there is none.

## run\_of

```moonbit
:::source,rami3l/cmark/cmark_base/runs.mbt,3:::fn run_of(char~ : Char, s : String, last~ : Int, start~ : Int) -> Int
```
 `run_of(char, s, last, start)` is the last position of a consecutive run of `char`
in the range `[start, last]` or `start - 1` if `start` is not `char`.
