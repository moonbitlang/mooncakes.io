# Documentation
|Trait|description|
|---|---|
|[RespoAction](#RespoAction)||
|[RespoEffect](#RespoEffect)| implement this on data which creates effect|

|Type|description|
|---|---|
|[AnchorElementTarget](#AnchorElementTarget)||
|[ChildDomOp](#ChildDomOp)||
|[CssBackgroundSize](#CssBackgroundSize)||
|[CssBorder](#CssBorder)||
|[CssBorderStyle](#CssBorderStyle)||
|[CssBoxSizing](#CssBoxSizing)||
|[CssColor](#CssColor)||
|[CssContentVisibility](#CssContentVisibility)||
|[CssCursor](#CssCursor)||
|[CssDisplay](#CssDisplay)||
|[CssDuration](#CssDuration)||
|[CssFilter](#CssFilter)| https://developer.mozilla.org/en-US/docs/Web/CSS/filter|
|[CssFlexAlignContent](#CssFlexAlignContent)||
|[CssFlexAlignItems](#CssFlexAlignItems)||
|[CssFlexDirection](#CssFlexDirection)||
|[CssFlexJustifyContent](#CssFlexJustifyContent)||
|[CssFlexWrap](#CssFlexWrap)||
|[CssFontWeight](#CssFontWeight)||
|[CssLineHeight](#CssLineHeight)||
|[CssObjectFit](#CssObjectFit)||
|[CssOutline](#CssOutline)||
|[CssOverflow](#CssOverflow)||
|[CssOverscrollBehavior](#CssOverscrollBehavior)||
|[CssPosition](#CssPosition)||
|[CssSize](#CssSize)||
|[CssTextAlign](#CssTextAlign)||
|[CssTextDecoration](#CssTextDecoration)||
|[CssTextOverflow](#CssTextOverflow)||
|[CssTimingFunction](#CssTimingFunction)||
|[CssTransform](#CssTransform)||
|[CssUserSelect](#CssUserSelect)||
|[CssVerticalAlign](#CssVerticalAlign)||
|[CssWordBreak](#CssWordBreak)||
|[DispatchFn](#DispatchFn)||
|[DomChange](#DomChange)| Diff/patch for virtual DOM, note that children are not included in this type|
|[IframeElementLoading](#IframeElementLoading)||
|[ImgElementLoading](#ImgElementLoading)||
|[RespoCommonError](#RespoCommonError)| currently it's commonly used for all errors in Respo|
|[RespoComponent](#RespoComponent)||
|[RespoCoord](#RespoCoord)| coord of on virtual dom|
|[RespoEffectBox](#RespoEffectBox)||
|[RespoEffectType](#RespoEffectType)| currently only support \`Mounted\`, \`BeforeUpdate\`, \`Updated\`, \`BeforeUnmount\`|
|[RespoElement](#RespoElement)| internal abstraction for an element|
|[RespoEvent](#RespoEvent)| wraps some basic event types|
|[RespoEventMark](#RespoEventMark)||
|[RespoEventType](#RespoEventType)||
|[RespoIndexKey](#RespoIndexKey)||
|[RespoNode](#RespoNode)||
|[RespoStyle](#RespoStyle)||
|[TextareaElementAutoComplete](#TextareaElementAutoComplete)||
|[VideoElementPreload](#VideoElementPreload)||

|Value|description|
|---|---|
|[a](#a)| anchor element|
|[attach\_event](#attach_event)||
|[br](#br)||
|[build\_dom\_tree](#build_dom_tree)| creates a DOM tree from virtual DOM with proxied event handler attached|
|[button](#button)||
|[canvas](#canvas)||
|[code](#code)||
|[collect\_effects\_inside\_out\_as](#collect_effects_inside_out_as)||
|[collect\_effects\_outside\_in\_as](#collect_effects_outside_in_as)||
|[coord\_path\_to\_cirru](#coord_path_to_cirru)||
|[create\_element](#create_element)| create element with a custom name|
|[declare\_contained\_style](#declare_contained_style)| Declare a static style in the head of the documentm for example|
|[declare\_static\_style](#declare_static_style)| Declare a static style in the head of the documentm for example|
|[diff\_tree](#diff_tree)| Diffing algorithm for RespoNode|
|[div](#div)| \<div\> element with children.|
|[div\_listed](#div_listed)| create a list of \`\<div/\>\` elements with children. \`IndexKey\` is used in children for quick diffing.|
|[dom\_path\_to\_cirru](#dom_path_to_cirru)||
|[iframe](#iframe)||
|[img](#img)||
|[indexes\_to\_cirru](#indexes_to_cirru)||
|[input](#input)||
|[load\_coord\_target\_tree](#load_coord_target_tree)||
|[p](#p)||
|[patch\_tree](#patch_tree)||
|[pre](#pre)||
|[raf\_loop](#raf_loop)||
|[respo\_attrs](#respo_attrs)| create attributes for an element|
|[respo\_style](#respo_style)| Create a new RespoStyle object|
|[space](#space)| create a \`\<div/\>\` element to render space.|
|[span](#span)||
|[str\_spaced](#str_spaced)| convert a list of strings to a single string with spaces between them,|
|[text\_node](#text_node)| internally using span element to render text.|
|[textarea](#textarea)||
|[video](#video)||

## RespoAction

```moonbit
:::source,tiye/respo/lib/node/node.mbt,174:::pub(open) trait RespoAction {
  build_states_action(<a href="moonbitlang/core/array#Array">Array</a>[String], <a href="moonbitlang/core/builtin#ToJson">ToJson</a>?) -> Self
}
```


## RespoEffect

```moonbit
:::source,tiye/respo/lib/node/effect.mbt,15:::pub(open) trait RespoEffect : <a href="moonbitlang/core/builtin#ToJson">ToJson</a> {
  build_effect(Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">RespoEffectBox</a>
  make_handler(Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  run(Self, <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  mounted(Self, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  before_update(Self, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  updated(Self, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  before_unmount(Self, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
}
```
 implement this on data which creates effect

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,57:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with before_unmount[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,51:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with before_update[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,28:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">RespoEffectBox</a>
  ```
  > 
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,33:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,48:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with mounted[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,38:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with run[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,54:::impl <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> for <a href="#$default_impl">$default_impl</a> with updated[Self : <a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty

## AnchorElementTarget

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,249:::pub(all) enum AnchorElementTarget {
  Blank
  Parent
  Self
  Top
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/alias.mbt,257:::fn <a href="tiye/respo/lib/node#AnchorElementTarget">AnchorElementTarget</a>::to_string(self : <a href="tiye/respo/lib/node#AnchorElementTarget">AnchorElementTarget</a>) -> String
  ```
  > 

## ChildDomOp

```moonbit
:::source,tiye/respo/lib/node/dom-change.mbt,191:::type ChildDomOp
```


#### mooncakes-io-method-mark-Methods
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/dom-change.mbt,234:::fn <a href="tiye/respo/lib/node#ChildDomOp">ChildDomOp</a>::to_cirru[T](self : <a href="tiye/respo/lib/node#ChildDomOp">ChildDomOp</a>[T]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/traits.mbt,85:::fn <a href="tiye/respo/lib/node#ChildDomOp">ChildDomOp</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CssBackgroundSize

```moonbit
:::source,tiye/respo/lib/node/css.mbt,723:::pub(all) enum CssBackgroundSize {
  Cover
  Contain
  Wh(UInt, UInt)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,727:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a> with op_equal(<a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>, <a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,727:::fn <a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>::op_equal(<a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>, <a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,730:::fn <a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>::to_string(self : <a href="tiye/respo/lib/node#CssBackgroundSize">CssBackgroundSize</a>) -> String
  ```
  > 

## CssBorder

```moonbit
:::source,tiye/respo/lib/node/css.mbt,705:::pub(all) type CssBorder (float, <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>, <a href="tiye/respo/lib/node#CssColor">CssColor</a>)
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,714:::fn <a href="tiye/respo/lib/node#CssBorder">CssBorder</a>::new(width~ : float = .., style~ : <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a> = .., color~ : <a href="tiye/respo/lib/node#CssColor">CssColor</a> = ..) -> <a href="tiye/respo/lib/node#CssBorder">CssBorder</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,708:::fn <a href="tiye/respo/lib/node#CssBorder">CssBorder</a>::to_string(self : <a href="tiye/respo/lib/node#CssBorder">CssBorder</a>) -> String
  ```
  > 

## CssBorderStyle

```moonbit
:::source,tiye/respo/lib/node/css.mbt,689:::pub(all) enum CssBorderStyle {
  Solid
  Dashed
  Dotted
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,693:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a> with op_equal(<a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>, <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,693:::fn <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>::op_equal(<a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>, <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,696:::fn <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>::to_string(self : <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>) -> String
  ```
  > 

## CssBoxSizing

```moonbit
:::source,tiye/respo/lib/node/css.mbt,819:::pub(all) enum CssBoxSizing {
  BorderBox
  ContentBox
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,822:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a> with op_equal(<a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>, <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,822:::fn <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>::op_equal(<a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>, <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,825:::fn <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>::to_string(self : <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>) -> String
  ```
  > 

## CssColor

```moonbit
:::source,tiye/respo/lib/node/css.mbt,463:::pub(all) enum CssColor {
  Hsla(UInt, UInt, UInt, float)
  Hsl(UInt, UInt, UInt)
  Hsluva(UInt, UInt, UInt, float)
  Hsluv(UInt, UInt, UInt)
  Rgba(UInt, UInt, UInt, float)
  Rgb(UInt, UInt, UInt)
  Hex(UInt, UInt, UInt)
  Red
  Green
  Blue
  White
  Black
  Gray
  Yellow
  Purple
  Cyan
  Orange
  Pink
  RawString(String)
  Transparent
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,484:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssColor">CssColor</a> with op_equal(<a href="tiye/respo/lib/node#CssColor">CssColor</a>, <a href="tiye/respo/lib/node#CssColor">CssColor</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,484:::fn <a href="tiye/respo/lib/node#CssColor">CssColor</a>::op_equal(<a href="tiye/respo/lib/node#CssColor">CssColor</a>, <a href="tiye/respo/lib/node#CssColor">CssColor</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,487:::fn <a href="tiye/respo/lib/node#CssColor">CssColor</a>::to_string(self : <a href="tiye/respo/lib/node#CssColor">CssColor</a>) -> String
  ```
  > 

## CssContentVisibility

```moonbit
:::source,tiye/respo/lib/node/css.mbt,971:::pub(all) enum CssContentVisibility {
  Visible
  Hidden
  Auto
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,975:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a> with op_equal(<a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>, <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,975:::fn <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>::op_equal(<a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>, <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,978:::fn <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>::to_string(self : <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>) -> String
  ```
  > 

## CssCursor

```moonbit
:::source,tiye/respo/lib/node/css.mbt,889:::pub(all) enum CssCursor {
  Auto
  Default
  None
  Pointer
  ContextMenu
  Help
  Progress
  Wait
  Cell
  Crosshair
  Text
  VerticalText
  Alias
  Copy
  Move
  NoDrop
  NotAllowed
  Grab
  Grabbing
  AllScroll
  ColResize
  RowResize
  NResize
  EResize
  SResize
  WResize
  NeResize
  NwResize
  SeResize
  SwResize
  EwResize
  NsResize
  NeswResize
  NwseResize
  ZoomIn
  ZoomOut
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,926:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssCursor">CssCursor</a> with op_equal(<a href="tiye/respo/lib/node#CssCursor">CssCursor</a>, <a href="tiye/respo/lib/node#CssCursor">CssCursor</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,926:::fn <a href="tiye/respo/lib/node#CssCursor">CssCursor</a>::op_equal(<a href="tiye/respo/lib/node#CssCursor">CssCursor</a>, <a href="tiye/respo/lib/node#CssCursor">CssCursor</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,929:::fn <a href="tiye/respo/lib/node#CssCursor">CssCursor</a>::to_string(self : <a href="tiye/respo/lib/node#CssCursor">CssCursor</a>) -> String
  ```
  > 

## CssDisplay

```moonbit
:::source,tiye/respo/lib/node/css.mbt,549:::pub(all) enum CssDisplay {
  Block
  Inline
  InlineBlock
  Flex
  InlineFlex
  Grid
  InlineGrid
  None
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,558:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a> with op_equal(<a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>, <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,558:::fn <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>::op_equal(<a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>, <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,561:::fn <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>::to_string(self : <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>) -> String
  ```
  > 

## CssDuration

```moonbit
:::source,tiye/respo/lib/node/css.mbt,411:::pub(all) enum CssDuration {
  Ms(Int)
  S(float)
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,417:::fn <a href="tiye/respo/lib/node#CssDuration">CssDuration</a>::to_string(self : <a href="tiye/respo/lib/node#CssDuration">CssDuration</a>) -> String
  ```
  > 

## CssFilter

```moonbit
:::source,tiye/respo/lib/node/css.mbt,987:::pub(all) enum CssFilter {
  None
  Blur(float)
  Brightness(float)
  Contrast(float)
  Grayscale(float)
  HueRotate(float)
  Invert(float)
  Opacity(float)
  Saturate(float)
  Sepia(float)
  DropShadow(float, float, float, <a href="tiye/respo/lib/node#CssColor">CssColor</a>)
  Url(String)
  Revert
  RevertLayer
}
```
 https://developer.mozilla.org/en-US/docs/Web/CSS/filter

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,1005:::fn <a href="tiye/respo/lib/node#CssFilter">CssFilter</a>::to_string(self : <a href="tiye/respo/lib/node#CssFilter">CssFilter</a>) -> String
  ```
  > 

## CssFlexAlignContent

```moonbit
:::source,tiye/respo/lib/node/css.mbt,667:::pub(all) enum CssFlexAlignContent {
  FlexStart
  FlexEnd
  Center
  SpaceBetween
  SpaceAround
  Stretch
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,674:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a> with op_equal(<a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>, <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,674:::fn <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>::op_equal(<a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>, <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,677:::fn <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>::to_string(self : <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>) -> String
  ```
  > 

## CssFlexAlignItems

```moonbit
:::source,tiye/respo/lib/node/css.mbt,647:::pub(all) enum CssFlexAlignItems {
  FlexStart
  FlexEnd
  Center
  Baseline
  Stretch
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,653:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a> with op_equal(<a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>, <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,653:::fn <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>::op_equal(<a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>, <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,656:::fn <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>::to_string(self : <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>) -> String
  ```
  > 

## CssFlexDirection

```moonbit
:::source,tiye/respo/lib/node/css.mbt,591:::pub(all) enum CssFlexDirection {
  Row
  RowReverse
  Column
  ColumnReverse
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,596:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a> with op_equal(<a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>, <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,596:::fn <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>::op_equal(<a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>, <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,599:::fn <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>::to_string(self : <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>) -> String
  ```
  > 

## CssFlexJustifyContent

```moonbit
:::source,tiye/respo/lib/node/css.mbt,625:::pub(all) enum CssFlexJustifyContent {
  FlexStart
  FlexEnd
  Center
  SpaceBetween
  SpaceAround
  SpaceEvenly
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,632:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a> with op_equal(<a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>, <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,632:::fn <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>::op_equal(<a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>, <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,635:::fn <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>::to_string(self : <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>) -> String
  ```
  > 

## CssFlexWrap

```moonbit
:::source,tiye/respo/lib/node/css.mbt,575:::pub(all) enum CssFlexWrap {
  Wrap
  Nowrap
  WrapReverse
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,579:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a> with op_equal(<a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>, <a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,579:::fn <a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>::op_equal(<a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>, <a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,582:::fn <a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>::to_string(self : <a href="tiye/respo/lib/node#CssFlexWrap">CssFlexWrap</a>) -> String
  ```
  > 

## CssFontWeight

```moonbit
:::source,tiye/respo/lib/node/css.mbt,851:::pub(all) enum CssFontWeight {
  Normal
  Bold
  Bolder
  Lighter
  Weight(Int)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,857:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a> with op_equal(<a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>, <a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,857:::fn <a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>::op_equal(<a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>, <a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,860:::fn <a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>::to_string(self : <a href="tiye/respo/lib/node#CssFontWeight">CssFontWeight</a>) -> String
  ```
  > 

## CssLineHeight

```moonbit
:::source,tiye/respo/lib/node/css.mbt,513:::pub(all) enum CssLineHeight {
  Em(float)
  Px(float)
  Percent(float)
  Normal
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,518:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a> with op_equal(<a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>, <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,518:::fn <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>::op_equal(<a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>, <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,521:::fn <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>::to_string(self : <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>) -> String
  ```
  > 

## CssObjectFit

```moonbit
:::source,tiye/respo/lib/node/css.mbt,1026:::pub(all) enum CssObjectFit {
  Fill
  Contain
  Cover
  None
  ScaleDown
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,1032:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a> with op_equal(<a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>, <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,1032:::fn <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>::op_equal(<a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>, <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,1035:::fn <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>::to_string(self : <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>) -> String
  ```
  > 

## CssOutline

```moonbit
:::source,tiye/respo/lib/node/css.mbt,396:::pub(all) enum CssOutline {
  None
  Outline(<a href="tiye/respo/lib/node#CssSize">CssSize</a>, <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>, <a href="tiye/respo/lib/node#CssColor">CssColor</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,399:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssOutline">CssOutline</a> with op_equal(<a href="tiye/respo/lib/node#CssOutline">CssOutline</a>, <a href="tiye/respo/lib/node#CssOutline">CssOutline</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,399:::fn <a href="tiye/respo/lib/node#CssOutline">CssOutline</a>::op_equal(<a href="tiye/respo/lib/node#CssOutline">CssOutline</a>, <a href="tiye/respo/lib/node#CssOutline">CssOutline</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,402:::fn <a href="tiye/respo/lib/node#CssOutline">CssOutline</a>::to_string(self : <a href="tiye/respo/lib/node#CssOutline">CssOutline</a>) -> String
  ```
  > 

## CssOverflow

```moonbit
:::source,tiye/respo/lib/node/css.mbt,739:::pub(all) enum CssOverflow {
  Visible
  Hidden
  Scroll
  Auto
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,744:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a> with op_equal(<a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>, <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,744:::fn <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>::op_equal(<a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>, <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,747:::fn <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>::to_string(self : <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>) -> String
  ```
  > 

## CssOverscrollBehavior

```moonbit
:::source,tiye/respo/lib/node/css.mbt,1046:::pub(all) enum CssOverscrollBehavior {
  Auto
  Contain
  None
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,1053:::fn <a href="tiye/respo/lib/node#CssOverscrollBehavior">CssOverscrollBehavior</a>::to_string(self : <a href="tiye/respo/lib/node#CssOverscrollBehavior">CssOverscrollBehavior</a>) -> String
  ```
  > 

## CssPosition

```moonbit
:::source,tiye/respo/lib/node/css.mbt,443:::pub(all) enum CssPosition {
  Static
  Relative
  Absolute
  Fixed
  Sticky
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,449:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssPosition">CssPosition</a> with op_equal(<a href="tiye/respo/lib/node#CssPosition">CssPosition</a>, <a href="tiye/respo/lib/node#CssPosition">CssPosition</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,449:::fn <a href="tiye/respo/lib/node#CssPosition">CssPosition</a>::op_equal(<a href="tiye/respo/lib/node#CssPosition">CssPosition</a>, <a href="tiye/respo/lib/node#CssPosition">CssPosition</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,452:::fn <a href="tiye/respo/lib/node#CssPosition">CssPosition</a>::to_string(self : <a href="tiye/respo/lib/node#CssPosition">CssPosition</a>) -> String
  ```
  > 

## CssSize

```moonbit
:::source,tiye/respo/lib/node/css-size.mbt,2:::pub(all) enum CssSize {
  Auto
  Px(Int)
  Percent(Int)
  Em(Int)
  Rem(Int)
  Vw(Int)
  Vh(Int)
  Custom(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css-size.mbt,11:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssSize">CssSize</a> with op_equal(<a href="tiye/respo/lib/node#CssSize">CssSize</a>, <a href="tiye/respo/lib/node#CssSize">CssSize</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css-size.mbt,11:::fn <a href="tiye/respo/lib/node#CssSize">CssSize</a>::op_equal(<a href="tiye/respo/lib/node#CssSize">CssSize</a>, <a href="tiye/respo/lib/node#CssSize">CssSize</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css-size.mbt,14:::fn <a href="tiye/respo/lib/node#CssSize">CssSize</a>::to_string(self : <a href="tiye/respo/lib/node#CssSize">CssSize</a>) -> String
  ```
  > 

## CssTextAlign

```moonbit
:::source,tiye/respo/lib/node/css.mbt,833:::pub(all) enum CssTextAlign {
  Left
  Right
  Center
  Justify
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,838:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a> with op_equal(<a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>, <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,838:::fn <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>::op_equal(<a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>, <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,841:::fn <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>::to_string(self : <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>) -> String
  ```
  > 

## CssTextDecoration

```moonbit
:::source,tiye/respo/lib/node/css.mbt,871:::pub(all) enum CssTextDecoration {
  None
  Underline
  Overline
  LineThrough
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,876:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a> with op_equal(<a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>, <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,876:::fn <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>::op_equal(<a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>, <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,879:::fn <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>::to_string(self : <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>) -> String
  ```
  > 

## CssTextOverflow

```moonbit
:::source,tiye/respo/lib/node/css.mbt,805:::pub(all) enum CssTextOverflow {
  Clip
  Ellipsis
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,808:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a> with op_equal(<a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>, <a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,808:::fn <a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>::op_equal(<a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>, <a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,811:::fn <a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>::to_string(self : <a href="tiye/respo/lib/node#CssTextOverflow">CssTextOverflow</a>) -> String
  ```
  > 

## CssTimingFunction

```moonbit
:::source,tiye/respo/lib/node/css.mbt,781:::pub(all) enum CssTimingFunction {
  Ease
  Linear
  EaseIn
  EaseOut
  EaseInOut
  StepStart
  StepEnd
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,789:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a> with op_equal(<a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>, <a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,789:::fn <a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>::op_equal(<a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>, <a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,792:::fn <a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>::to_string(self : <a href="tiye/respo/lib/node#CssTimingFunction">CssTimingFunction</a>) -> String
  ```
  > 

## CssTransform

```moonbit
:::source,tiye/respo/lib/node/css.mbt,757:::pub(all) enum CssTransform {
  Translate(Int, Int)
  TranslateX(Int)
  TranslateY(Int)
  Scale(float)
  Rotate(Int)
  Skew(Int, Int)
  Matrix(float, float, float, float, float, float)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,765:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#CssTransform">CssTransform</a> with op_equal(<a href="tiye/respo/lib/node#CssTransform">CssTransform</a>, <a href="tiye/respo/lib/node#CssTransform">CssTransform</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,765:::fn <a href="tiye/respo/lib/node#CssTransform">CssTransform</a>::op_equal(<a href="tiye/respo/lib/node#CssTransform">CssTransform</a>, <a href="tiye/respo/lib/node#CssTransform">CssTransform</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,768:::fn <a href="tiye/respo/lib/node#CssTransform">CssTransform</a>::to_string(self : <a href="tiye/respo/lib/node#CssTransform">CssTransform</a>) -> String
  ```
  > 

## CssUserSelect

```moonbit
:::source,tiye/respo/lib/node/css.mbt,425:::pub(all) enum CssUserSelect {
  None
  Text
  All
  Auto
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,433:::fn <a href="tiye/respo/lib/node#CssUserSelect">CssUserSelect</a>::to_string(self : <a href="tiye/respo/lib/node#CssUserSelect">CssUserSelect</a>) -> String
  ```
  > 

## CssVerticalAlign

```moonbit
:::source,tiye/respo/lib/node/css.mbt,609:::pub(all) enum CssVerticalAlign {
  Top
  Middle
  Bottom
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,616:::fn <a href="tiye/respo/lib/node#CssVerticalAlign">CssVerticalAlign</a>::to_string(self : <a href="tiye/respo/lib/node#CssVerticalAlign">CssVerticalAlign</a>) -> String
  ```
  > 

## CssWordBreak

```moonbit
:::source,tiye/respo/lib/node/css.mbt,531:::pub(all) enum CssWordBreak {
  Normal
  BreakAll
  KeepAll
  BreakWord
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,539:::fn <a href="tiye/respo/lib/node#CssWordBreak">CssWordBreak</a>::to_string(self : <a href="tiye/respo/lib/node#CssWordBreak">CssWordBreak</a>) -> String
  ```
  > 

## DispatchFn

```moonbit
:::source,tiye/respo/lib/node/node.mbt,166:::pub(all) type DispatchFn (T) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,218:::fn <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>::new[T](f : (T) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>) -> <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]
  ```
  > 
- #### run
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,182:::fn <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>::run[T : <a href="tiye/respo/lib/node#RespoAction">RespoAction</a>](self : <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T], op : T) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
  ```
  > 
- #### run\_empty\_state
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,209:::fn <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>::run_empty_state[T : <a href="tiye/respo/lib/node#RespoAction">RespoAction</a>](self : <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T], cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
  ```
  > 
- #### run\_state
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,191:::fn <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>::run_state[T : <a href="tiye/respo/lib/node#RespoAction">RespoAction</a>](self : <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T], cursor : <a href="moonbitlang/core/array#Array">Array</a>[String], state : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,169:::fn <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>::to_string[T](self : <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> String
  ```
  > 

## DomChange

```moonbit
:::source,tiye/respo/lib/node/dom-change.mbt,24:::type DomChange
```
 Diff/patch for virtual DOM, note that children are not included in this type

#### mooncakes-io-method-mark-Methods
- #### get\_dom\_path
  ```moonbit
  :::source,tiye/respo/lib/node/dom-change.mbt,261:::fn <a href="tiye/respo/lib/node#DomChange">DomChange</a>::get_dom_path[T](self : <a href="tiye/respo/lib/node#DomChange">DomChange</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[UInt]
  ```
  > 
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/dom-change.mbt,113:::fn <a href="tiye/respo/lib/node#DomChange">DomChange</a>::to_cirru[T](self : <a href="tiye/respo/lib/node#DomChange">DomChange</a>[T]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/traits.mbt,85:::fn <a href="tiye/respo/lib/node#DomChange">DomChange</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IframeElementLoading

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,323:::pub(all) enum IframeElementLoading {
  Eager
  Lazy
}
```


## ImgElementLoading

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,444:::pub(all) enum ImgElementLoading {
  Eager
  Lazy
}
```


## RespoCommonError

```moonbit
:::source,tiye/respo/lib/node/node.mbt,33:::pub(all) type! RespoCommonError String

```
 currently it's commonly used for all errors in Respo

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,36:::fn <a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>::to_string(self : <a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>) -> String
  ```
  > 

## RespoComponent

```moonbit
:::source,tiye/respo/lib/node/component.mbt,2:::pub(all) struct RespoComponent {
  name : String
  effects : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoEffectBox">RespoEffectBox</a>]
  tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
}
```


#### mooncakes-io-method-mark-Methods
- #### named
  ```moonbit
  :::source,tiye/respo/lib/node/component.mbt,28:::fn <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>::named[T](name : String, tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], effects~ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoEffect">RespoEffect</a>] = ..) -> <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>[T]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/component.mbt,9:::fn <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>::op_equal[T](self : <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>[T], other : <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>[T]) -> Bool
  ```
  > 
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/component.mbt,42:::fn <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>::to_cirru[T](self : <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>[T]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_node
  ```moonbit
  :::source,tiye/respo/lib/node/component.mbt,37:::fn <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>::to_node[T](self : <a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
  ```
  > 

## RespoCoord

```moonbit
:::source,tiye/respo/lib/node/dom-change.mbt,2:::pub(all) enum RespoCoord {
  Key(<a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>)
  Comp(String)
}
```
 coord of on virtual dom

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,tiye/respo/lib/node/dom-change.mbt,16:::fn <a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>::output(self : <a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/dom-change.mbt,273:::fn <a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>::to_cirru(self : <a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/dom-change.mbt,8:::fn <a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>::to_string(self : <a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>) -> String
  ```
  > 

## RespoEffectBox

```moonbit
:::source,tiye/respo/lib/node/effect.mbt,8:::pub(all) struct RespoEffectBox {
  args : <a href="moonbitlang/core/json#Json">Json</a>
  handler : (<a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
}
```


#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,60:::fn <a href="tiye/respo/lib/node#RespoEffectBox">RespoEffectBox</a>::op_equal(self : <a href="tiye/respo/lib/node#RespoEffectBox">RespoEffectBox</a>, b : <a href="tiye/respo/lib/node#RespoEffectBox">RespoEffectBox</a>) -> Bool
  ```
  > 

## RespoEffectType

```moonbit
:::source,tiye/respo/lib/node/effect.mbt,65:::pub(all) enum RespoEffectType {
  Mounted
  BeforeUpdate
  Updated
  BeforeUnmount
}
```
 currently only support `Mounted`, `BeforeUpdate`, `Updated`, `BeforeUnmount`

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,70:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a> with op_equal(<a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,70:::fn <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>::op_equal(<a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>) -> Bool
  ```
  > automatically derived
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,83:::fn <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>::to_cirru(self : <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/effect.mbt,73:::fn <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>::to_string(self : <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>) -> String
  ```
  > 

## RespoElement

```moonbit
:::source,tiye/respo/lib/node/element.mbt,15:::pub(all) struct RespoElement {
  name : String
  attrs : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
  event : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>]
  style : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>
  children : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>, <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T])]
}
```
 internal abstraction for an element

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,37:::fn <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>::op_equal[T](self : <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T], other : <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T]) -> Bool
  ```
  > 
- #### set\_attribute
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,70:::fn <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>::set_attribute[T](self : <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T], key : String, value : String) -> Unit
  ```
  > 
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,210:::fn <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>::to_cirru[T](self : <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_node
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,32:::fn <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>::to_node[T](self : <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,65:::fn <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>::to_string[T](self : <a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T]) -> String
  ```
  > 

## RespoEvent

```moonbit
:::source,tiye/respo/lib/node/listener.mbt,2:::pub(all) enum RespoEvent {
  Click(float, float, <a href="tiye/dom-ffi/lib#MouseEvent">@tiye/dom-ffi/lib.MouseEvent</a>)
  Keyboard(String, UInt, Bool, Bool, Bool, Bool, Bool, <a href="tiye/dom-ffi/lib#KeyboardEvent">@tiye/dom-ffi/lib.KeyboardEvent</a>)
  Input(String, <a href="tiye/dom-ffi/lib#InputEvent">@tiye/dom-ffi/lib.InputEvent</a>)
  Focus(<a href="tiye/dom-ffi/lib#FocusEvent">@tiye/dom-ffi/lib.FocusEvent</a>)
  Blur(<a href="tiye/dom-ffi/lib#BlurEvent">@tiye/dom-ffi/lib.BlurEvent</a>)
}
```
 wraps some basic event types

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,24:::fn <a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>::to_string(self : <a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>) -> String
  ```
  > 

## RespoEventMark

```moonbit
:::source,tiye/respo/lib/node/listener.mbt,35:::pub(all) struct RespoEventMark {
  coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>]
  name : <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>
  event_info : <a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>
}
```


## RespoEventType

```moonbit
:::source,tiye/respo/lib/node/listener.mbt,42:::pub(all) enum RespoEventType {
  Click
  DblClick
  Changle
  Keydown
  Keyup
  Keypress
  Input
  Focus
  Blur
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,52:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a> with hash_combine(<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,52:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a> with op_equal(<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### hash
  ```moonbit
  :::source,tiye/respo/lib/node/traits.mbt,40:::fn <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,52:::fn <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>::hash_combine(<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,52:::fn <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>::op_equal(<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>) -> Bool
  ```
  > automatically derived
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,75:::fn <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>::to_cirru(self : <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/listener.mbt,55:::fn <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>::to_string(self : <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>) -> String
  ```
  > 

## RespoIndexKey

```moonbit
:::source,tiye/respo/lib/node/element.mbt,2:::pub(all) type RespoIndexKey String
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a> with op_equal(<a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>, <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,2:::fn <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>::op_equal(<a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>, <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>) -> Bool
  ```
  > automatically derived
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,5:::fn <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>::to_cirru(self : <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/element.mbt,10:::fn <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>::to_string(self : <a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>) -> String
  ```
  > 

## RespoNode

```moonbit
:::source,tiye/respo/lib/node/node.mbt,2:::pub(all) enum RespoNode {
  Component(<a href="tiye/respo/lib/node#RespoComponent">RespoComponent</a>[T])
  Element(<a href="tiye/respo/lib/node#RespoElement">RespoElement</a>[T])
}
```


#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,8:::fn <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>::op_equal[T](self : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], other : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]) -> Bool
  ```
  > 
- #### to\_cirru
  ```moonbit
  :::source,tiye/respo/lib/node/node.mbt,25:::fn <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>::to_cirru[T](self : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
  ```
  > 

## RespoStyle

```moonbit
:::source,tiye/respo/lib/node/css.mbt,2:::pub(all) type RespoStyle <a href="moonbitlang/core/array#Array">Array</a>[(String, String)]
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,2:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> with default() -> <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> with op_equal(<a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>, <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,21:::fn <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>::add(self : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>, property : String, value : String) -> <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>
  ```
  >  for custom styles not defined with enum, use this function to add
- #### default
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,2:::fn <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>::default() -> <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>
  ```
  > automatically derived
- #### is\_empty
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,6:::fn <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>::is_empty(self : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>) -> Bool
  ```
  > 
- #### merge
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,27:::fn <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>::merge(self : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>, other : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>) -> <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,2:::fn <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>::op_equal(<a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>, <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/node/css.mbt,11:::fn <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>::to_string(self : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>) -> String
  ```
  > 

## TextareaElementAutoComplete

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,178:::pub(all) enum TextareaElementAutoComplete {
  On
  Off
}
```


## VideoElementPreload

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,488:::pub(all) enum VideoElementPreload {
  Auto
  Metadata
  None
}
```


## a

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,268:::fn a[T](inner_text~ : String, class_name? : String, href~ : String, download? : String, target? : <a href="tiye/respo/lib/node#AnchorElementTarget">AnchorElementTarget</a>, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., type_? : String, event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```
 anchor element
https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a

## attach\_event

```moonbit
:::source,tiye/respo/lib/node/patch.mbt,275:::fn attach_event(element : <a href="tiye/dom-ffi/lib#Element">@tiye/dom-ffi/lib.Element</a>, key : <a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>], handle_event : (<a href="tiye/respo/lib/node#RespoEventMark">RespoEventMark</a>) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```


## br

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,311:::fn br[T](attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## build\_dom\_tree

```moonbit
:::source,tiye/respo/lib/node/node.mbt,92:::fn build_dom_tree[T](tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>], handle_event : (<a href="tiye/respo/lib/node#RespoEventMark">RespoEventMark</a>) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>) -> <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```
 creates a DOM tree from virtual DOM with proxied event handler attached

## button

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,94:::fn button[T](class_name? : String, inner_text~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## canvas

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,365:::fn canvas[T](height? : Int, width? : Int, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## code

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,387:::fn code[T](class_name? : String, inner_text~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## collect\_effects\_inside\_out\_as

```moonbit
:::source,tiye/respo/lib/node/diff.mbt,413:::fn collect_effects_inside_out_as[T](tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>], dom_path : <a href="moonbitlang/core/array#Array">Array</a>[UInt], effect_type : <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, changes : <a href="moonbitlang/core/ref#Ref">Ref</a>[<a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#DomChange">DomChange</a>[T]]]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```


## collect\_effects\_outside\_in\_as

```moonbit
:::source,tiye/respo/lib/node/diff.mbt,374:::fn collect_effects_outside_in_as[T](tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>], dom_path : <a href="moonbitlang/core/array#Array">Array</a>[UInt], effect_type : <a href="tiye/respo/lib/node#RespoEffectType">RespoEffectType</a>, changes : <a href="moonbitlang/core/ref#Ref">Ref</a>[<a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#DomChange">DomChange</a>[T]]]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```


## coord\_path\_to\_cirru

```moonbit
:::source,tiye/respo/lib/node/dom-change.mbt,281:::fn coord_path_to_cirru(coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
```


## create\_element

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,560:::fn create_element[T](name : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```
 create element with a custom name

## declare\_contained\_style

```moonbit
:::source,tiye/respo/lib/node/css.mbt,1130:::fn declare_contained_style[U : <a href="moonbitlang/core/builtin#Show">Show</a>](rules : <a href="moonbitlang/core/array#Array">Array</a>[(String?, U, <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>)], loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> String
```
 Declare a static style in the head of the documentm for example
 ```moonbit
 let style_demo : String = declare_contained_style(
  [(Some("@media only screen and (max-width: 600px)"), "&", respo_style(margin=Px(4), background_color=Hsl(200, 90, 96)))],
 )
 ```

## declare\_static\_style

```moonbit
:::source,tiye/respo/lib/node/css.mbt,1082:::fn declare_static_style[U : <a href="moonbitlang/core/builtin#Show">Show</a>](rules : <a href="moonbitlang/core/array#Array">Array</a>[(U, <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>)], loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> String
```
 Declare a static style in the head of the documentm for example
 ```moonbit
 let style_demo : String = declare_static_style(
  [("&", respo_style(margin=Px(4), background_color=Hsl(200, 90, 96)))],
 )
 ```

## diff\_tree

```moonbit
:::source,tiye/respo/lib/node/diff.mbt,2:::fn diff_tree[T](new_tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], old_tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], coord : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>], dom_path : <a href="moonbitlang/core/array#Array">Array</a>[UInt], changes : <a href="moonbitlang/core/ref#Ref">Ref</a>[<a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#DomChange">DomChange</a>[T]]]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```
 Diffing algorithm for RespoNode

## div

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,5:::fn div[T](class_name? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```
 <div> element with children.

## div\_listed

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,31:::fn div_listed[T](class_name? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="tiye/respo/lib/node#RespoIndexKey">RespoIndexKey</a>, <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T])]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```
 create a list of `<div/>` elements with children. `IndexKey` is used in children for quick diffing.

## dom\_path\_to\_cirru

```moonbit
:::source,tiye/respo/lib/node/dom-change.mbt,287:::fn dom_path_to_cirru(dom_path : <a href="moonbitlang/core/array#Array">Array</a>[UInt]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
```


## iframe

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,329:::fn iframe[T](height? : Int, width? : Int, loading? : <a href="tiye/respo/lib/node#IframeElementLoading">IframeElementLoading</a>, src~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## img

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,450:::fn img[T](alt~ : String, height? : Int, src~ : String, width? : Int, loading? : <a href="tiye/respo/lib/node#ImgElementLoading">ImgElementLoading</a>, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## indexes\_to\_cirru

```moonbit
:::source,tiye/respo/lib/node/dom-change.mbt,294:::fn indexes_to_cirru(xs : <a href="moonbitlang/core/hashset#T">@moonbitlang/core/hashset.T</a>[Int]) -> <a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>
```


## input

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,113:::fn input[T](class_name? : String, autocomplete? : <a href="tiye/respo/lib/node#TextareaElementAutoComplete">TextareaElementAutoComplete</a>, autofocus? : Bool, disabled? : Bool, name? : String, placeholder? : String, readonly_? : Bool, spellcheck? : Bool, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., value~ : String, event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## load\_coord\_target\_tree

```moonbit
:::source,tiye/respo/lib/node/node.mbt,43:::fn load_coord_target_tree[T](tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], coord : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[<a href="tiye/respo/lib/node#RespoCoord">RespoCoord</a>]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```


## p

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,425:::fn p[T](class_name? : String, inner_text~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## patch\_tree

```moonbit
:::source,tiye/respo/lib/node/patch.mbt,2:::fn patch_tree[T](tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], old_tree : <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T], mount_target : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>, changes : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#DomChange">DomChange</a>[T]], handle_event : (<a href="tiye/respo/lib/node#RespoEventMark">RespoEventMark</a>) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>
```


## pre

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,406:::fn pre[T](class_name? : String, inner_text~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## raf\_loop

```moonbit
:::source,tiye/respo/lib/node/util.mbt,16:::fn raf_loop(f : (float) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>) -> Unit
```


## respo\_attrs

```moonbit
:::source,tiye/respo/lib/node/element.mbt,81:::fn respo_attrs(id? : String, class_name? : String, hidden? : Bool, disabled? : Bool, value? : String, src? : String, href? : String, alt? : String, title? : String, placeholder? : String, type_? : String, name? : String, checked? : Bool, selected? : Bool, read_only? : Bool, max_length? : Int, min_length? : Int, tab_index? : Int, content_editable? : Bool, width? : String, height? : String, inner_text? : String, innerHTML? : String) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
```
 create attributes for an element

## respo\_style

```moonbit
:::source,tiye/respo/lib/node/css.mbt,42:::fn respo_style(color? : <a href="tiye/respo/lib/node#CssColor">CssColor</a>, background_color? : <a href="tiye/respo/lib/node#CssColor">CssColor</a>, font_size? : UInt, font_family? : String, font_weight? : String, text_align? : <a href="tiye/respo/lib/node#CssTextAlign">CssTextAlign</a>, display? : <a href="tiye/respo/lib/node#CssDisplay">CssDisplay</a>, margin? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, padding? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, border? : <a href="tiye/respo/lib/node#CssBorder">CssBorder</a>, width? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, height? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, position? : <a href="tiye/respo/lib/node#CssPosition">CssPosition</a>, top? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, right? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, bottom? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, left? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, float? : String, clear? : String, overflow? : <a href="tiye/respo/lib/node#CssOverflow">CssOverflow</a>, z_index? : Int, flex? : float, flex_direction? : <a href="tiye/respo/lib/node#CssFlexDirection">CssFlexDirection</a>, justify_content? : <a href="tiye/respo/lib/node#CssFlexJustifyContent">CssFlexJustifyContent</a>, align_items? : <a href="tiye/respo/lib/node#CssFlexAlignItems">CssFlexAlignItems</a>, align_content? : <a href="tiye/respo/lib/node#CssFlexAlignContent">CssFlexAlignContent</a>, order? : Int, text_decoration? : <a href="tiye/respo/lib/node#CssTextDecoration">CssTextDecoration</a>, text_transform? : String, line_height? : <a href="tiye/respo/lib/node#CssLineHeight">CssLineHeight</a>, letter_spacing? : String, white_space? : String, word_break? : <a href="tiye/respo/lib/node#CssWordBreak">CssWordBreak</a>, opacity? : Int, visibility? : String, box_shadow? : String, transition? : String, box_sizing? : <a href="tiye/respo/lib/node#CssBoxSizing">CssBoxSizing</a>, border_radius? : float, padding_top? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, padding_bottom? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, padding_left? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, padding_right? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, min_width? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, max_width? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, vertical_align? : <a href="tiye/respo/lib/node#CssVerticalAlign">CssVerticalAlign</a>, border_style? : <a href="tiye/respo/lib/node#CssBorderStyle">CssBorderStyle</a>, border_color? : <a href="tiye/respo/lib/node#CssColor">CssColor</a>, border_width? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, cursor? : <a href="tiye/respo/lib/node#CssCursor">CssCursor</a>, transition_duration? : <a href="tiye/respo/lib/node#CssDuration">CssDuration</a>, transform? : <a href="tiye/respo/lib/node#CssTransform">CssTransform</a>, outline? : <a href="tiye/respo/lib/node#CssOutline">CssOutline</a>, user_select? : <a href="tiye/respo/lib/node#CssUserSelect">CssUserSelect</a>, margin_top? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, margin_bottom? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, margin_left? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, margin_right? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, max_height? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, transform_property? : <a href="moonbitlang/core/array#Array">Array</a>[String], gap? : <a href="tiye/respo/lib/node#CssSize">CssSize</a>, content? : String, content_visibility? : <a href="tiye/respo/lib/node#CssContentVisibility">CssContentVisibility</a>, filter? : <a href="tiye/respo/lib/node#CssFilter">CssFilter</a>, object_fit? : <a href="tiye/respo/lib/node#CssObjectFit">CssObjectFit</a>, overscroll_behavior_x? : <a href="tiye/respo/lib/node#CssOverscrollBehavior">CssOverscrollBehavior</a>, overscroll_behavior_y? : <a href="tiye/respo/lib/node#CssOverscrollBehavior">CssOverscrollBehavior</a>) -> <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>
```
 Create a new RespoStyle object

## space

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,538:::fn space[T](width~ : Int = .., height~ : Int = .., class_name? : String) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```
 create a `<div/>` element to render space.

## span

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,49:::fn span[T](class_name? : String, inner_text? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## str\_spaced

```moonbit
:::source,tiye/respo/lib/node/util.mbt,34:::fn str_spaced(wrap_parens~ : Bool = .., s : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> String
```
 convert a list of strings to a single string with spaces between them,
mainly used for concatenating class names

## text\_node

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,80:::fn text_node[T](class_name? : String, style? : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a>, text : String) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```
 internally using span element to render text.

## textarea

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,184:::fn textarea[T](class_name? : String, value~ : String, autocomplete? : <a href="tiye/respo/lib/node#TextareaElementAutoComplete">TextareaElementAutoComplete</a>, autofocus? : Bool, disabled? : Bool, name? : String, placeholder? : String, readonly_? : Bool, spellcheck? : Bool, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```


## video

```moonbit
:::source,tiye/respo/lib/node/alias.mbt,495:::fn video[T](height? : Int, width? : Int, src~ : String, controls? : Bool, preload? : <a href="tiye/respo/lib/node#VideoElementPreload">VideoElementPreload</a>, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">RespoNode</a>[T]
```

