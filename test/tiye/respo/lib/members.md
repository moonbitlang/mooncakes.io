# Documentation
|Type|description|
|---|---|
|[RespoApp](#RespoApp)| get basic App structure|
|[RespoStatesTree](#RespoStatesTree)| Respo maintains states in a tree structure, where the keys are strings,|
|[RespoUpdateState](#RespoUpdateState)| framework defined action for updating states branch|

|Value|description|
|---|---|
|[code\_fonts](#code_fonts)||
|[default\_fonts](#default_fonts)||
|[fancy\_fonts](#fancy_fonts)||
|[mark\_need\_rerender](#mark_need_rerender)||
|[memo\_once1](#memo_once1)| Memoize a function with a single cache slot, taking one argument.|
|[memo\_once2](#memo_once2)| Memoize a function with a single cache slot, taking two arguments.|
|[memo\_once3](#memo_once3)| Memoize a function with a single cache slot, taking three arguments.|
|[memo\_once4](#memo_once4)| Memoize a function with a single cache slot, taking four arguments.|
|[memo\_once5](#memo_once5)| Memoize a function with a single cache slot, taking five arguments.|
|[memoize1](#memoize1)||
|[memoize2](#memoize2)||
|[memoize3](#memoize3)||
|[memoize4](#memoize4)||
|[memoize5](#memoize5)||
|[normal\_fonts](#normal_fonts)||
|[preset](#preset)| common CSS resets for Respo pages|
|[render\_node](#render_node)| render elements|
|[try\_load\_storage](#try_load_storage)||
|[ui\_button](#ui_button)||
|[ui\_button\_danger](#ui_button_danger)||
|[ui\_button\_primary](#ui_button_primary)||
|[ui\_center](#ui_center)| layout items in column and center them with flexbox|
|[ui\_column](#ui_column)| layout items in column and center them with flexbox|
|[ui\_column\_dispersive](#ui_column_dispersive)| layout items in column with flexbox, space around|
|[ui\_column\_evenly](#ui_column_evenly)| layout items in column with flexbox, space evenly|
|[ui\_column\_parted](#ui_column_parted)| layout items in column with flexbox, space between|
|[ui\_expand](#ui_expand)| expand item with flex:1|
|[ui\_font\_code](#ui_font_code)| monospace font for code, Source Code Pro, Menlo, Ubuntu Mono, Consolas|
|[ui\_font\_fancy](#ui_font_fancy)| fancy font for title, Josefin Sans, Helvetica neue, Arial|
|[ui\_font\_normal](#ui_font_normal)| normal font for text, Hind, Helvatica, Arial|
|[ui\_fullscreen](#ui_fullscreen)| full page with absolute position|
|[ui\_global](#ui_global)||
|[ui\_input](#ui_input)||
|[ui\_link](#ui_link)||
|[ui\_row](#ui_row)| layout items in row with flexbox, items are stretched|
|[ui\_row\_center](#ui_row_center)| layout items in row with flexbox, center them|
|[ui\_row\_dispersive](#ui_row_dispersive)| layout items in row with flexbox, space around|
|[ui\_row\_evenly](#ui_row_evenly)| layout items in row with flexbox, space evenly|
|[ui\_row\_middle](#ui_row_middle)| layout items in row with flexbox, space between|
|[ui\_row\_parted](#ui_row_parted)| layout items in row with flexbox, space between|
|[ui\_textarea](#ui_textarea)||

## RespoApp

```moonbit
:::source,tiye/respo/lib/app.mbt,2:::pub(all) struct RespoApp {
  store : <a href="moonbitlang/core/ref#Ref">Ref</a>[Model]
  storage_key : String
  mount_target : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>
}
```
 get basic App structure

#### mooncakes-io-method-mark-Methods
- #### backup\_model\_beforeunload
  ```moonbit
  :::source,tiye/respo/lib/app.mbt,9:::fn <a href="tiye/respo/lib#RespoApp">RespoApp</a>::backup_model_beforeunload[Model : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="tiye/respo/lib#RespoApp">RespoApp</a>[Model]) -> Unit
  ```
  >  backup store to local storage before unload
- #### render\_loop
  ```moonbit
  :::source,tiye/respo/lib/app.mbt,54:::fn <a href="tiye/respo/lib#RespoApp">RespoApp</a>::render_loop[Model, ActionOp](self : <a href="tiye/respo/lib#RespoApp">RespoApp</a>[Model], renderer : () -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[ActionOp]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>, dispatch_action : (ActionOp) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> Unit
  ```
  > 

## RespoStatesTree

```moonbit
:::source,tiye/respo/lib/states-tree.mbt,6:::pub(all) struct RespoStatesTree {
  data : <a href="moonbitlang/core/json#Json">Json</a>?
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
  branches : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>]
}
```
 Respo maintains states in a tree structure, where the keys are strings,
each child component "picks" a key to attach its own state to the tree,
and it dispatches events to global store to update the state.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,16:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/states-tree.mbt,16:::fn op_equal(self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>, other : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>) -> Bool
    ```
    > 
- ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,54:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/states-tree.mbt,54:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### cast\_branch
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,76:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::cast_branch[T : <a href="moonbitlang/core/builtin#Default">Default</a> + <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>) -> T
  ```
  > 
- #### default
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,43:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::default() -> <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>
  ```
  > 
- #### path
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,71:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::path(self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
  ```
  > 
- #### pick
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,106:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::pick(self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>, name : String) -> <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>
  ```
  > 
- #### set\_in\_mut
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,128:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::set_in_mut(self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>, change : <a href="tiye/respo/lib#RespoUpdateState">RespoUpdateState</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,23:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::to_json(self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,33:::fn <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>::to_string(self : <a href="tiye/respo/lib#RespoStatesTree">RespoStatesTree</a>) -> String
  ```
  > 

## RespoUpdateState

```moonbit
:::source,tiye/respo/lib/states-tree.mbt,161:::pub(all) struct RespoUpdateState {
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
  data : <a href="moonbitlang/core/json#Json">Json</a>?
}
```
 framework defined action for updating states branch

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/states-tree.mbt,171:::fn <a href="tiye/respo/lib#RespoUpdateState">RespoUpdateState</a>::to_json(self : <a href="tiye/respo/lib#RespoUpdateState">RespoUpdateState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

## code\_fonts

```moonbit
:::source,tiye/respo/lib/ui.mbt,18:::let code_fonts : String
```


## default\_fonts

```moonbit
:::source,tiye/respo/lib/ui.mbt,15:::let default_fonts : String
```


## fancy\_fonts

```moonbit
:::source,tiye/respo/lib/ui.mbt,21:::let fancy_fonts : String
```


## mark\_need\_rerender

```moonbit
:::source,tiye/respo/lib/renderer.mbt,16:::fn mark_need_rerender() -> Unit
```


## memo\_once1

```moonbit
:::source,tiye/respo/lib/memo_once.mbt,4:::fn memo_once1[K : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K) -> V) -> ((K) -> V)
```
 Memoize a function with a single cache slot, taking one argument.

## memo\_once2

```moonbit
:::source,tiye/respo/lib/memo_once.mbt,26:::fn memo_once2[K1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2) -> V) -> ((K1, K2) -> V)
```
 Memoize a function with a single cache slot, taking two arguments.

## memo\_once3

```moonbit
:::source,tiye/respo/lib/memo_once.mbt,48:::fn memo_once3[K1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2, K3) -> V) -> ((K1, K2, K3) -> V)
```
 Memoize a function with a single cache slot, taking three arguments.

## memo\_once4

```moonbit
:::source,tiye/respo/lib/memo_once.mbt,72:::fn memo_once4[K1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2, K3, K4) -> V) -> ((K1, K2, K3, K4) -> V)
```
 Memoize a function with a single cache slot, taking four arguments.

## memo\_once5

```moonbit
:::source,tiye/respo/lib/memo_once.mbt,96:::fn memo_once5[K1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, K5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2, K3, K4, K5) -> V) -> ((K1, K2, K3, K4, K5) -> V)
```
 Memoize a function with a single cache slot, taking five arguments.

## memoize1

```moonbit
:::source,tiye/respo/lib/memoize.mbt,4:::fn memoize1[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K) -> V) -> ((K) -> V)
```


## memoize2

```moonbit
:::source,tiye/respo/lib/memoize.mbt,19:::fn memoize2[K1 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2) -> V) -> ((K1, K2) -> V)
```


## memoize3

```moonbit
:::source,tiye/respo/lib/memoize.mbt,36:::fn memoize3[K1 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K3 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2, K3) -> V) -> ((K1, K2, K3) -> V)
```


## memoize4

```moonbit
:::source,tiye/respo/lib/memoize.mbt,53:::fn memoize4[K1 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K3 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K4 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2, K3, K4) -> V) -> ((K1, K2, K3, K4) -> V)
```


## memoize5

```moonbit
:::source,tiye/respo/lib/memoize.mbt,70:::fn memoize5[K1 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K2 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K3 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K4 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, K5 : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](f : (K1, K2, K3, K4, K5) -> V) -> ((K1, K2, K3, K4, K5) -> V)
```


## normal\_fonts

```moonbit
:::source,tiye/respo/lib/ui.mbt,24:::let normal_fonts : String
```


## preset

```moonbit
:::source,tiye/respo/lib/ui.mbt,396:::let preset : String
```
 common CSS resets for Respo pages

## render\_node

```moonbit
:::source,tiye/respo/lib/renderer.mbt,25:::fn render_node[T, U](mount_target : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>, store : <a href="moonbitlang/core/ref#Ref">Ref</a>[U], renderer : () -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>, dispatch_action : (T) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>, _interval : Float?) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
```
 render elements

## try\_load\_storage

```moonbit
:::source,tiye/respo/lib/app.mbt,25:::fn try_load_storage[Model : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> + <a href="moonbitlang/core/builtin#Default">Default</a>](key : String) -> Model
```


## ui\_button

```moonbit
:::source,tiye/respo/lib/ui.mbt,75:::let ui_button : String
```


## ui\_button\_danger

```moonbit
:::source,tiye/respo/lib/ui.mbt,134:::let ui_button_danger : String
```


## ui\_button\_primary

```moonbit
:::source,tiye/respo/lib/ui.mbt,99:::let ui_button_primary : String
```


## ui\_center

```moonbit
:::source,tiye/respo/lib/ui.mbt,166:::let ui_center : String
```
 layout items in column and center them with flexbox
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_column

```moonbit
:::source,tiye/respo/lib/ui.mbt,182:::let ui_column : String
```
 layout items in column and center them with flexbox
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_column\_dispersive

```moonbit
:::source,tiye/respo/lib/ui.mbt,188:::let ui_column_dispersive : String
```
 layout items in column with flexbox, space around
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_column\_evenly

```moonbit
:::source,tiye/respo/lib/ui.mbt,204:::let ui_column_evenly : String
```
 layout items in column with flexbox, space evenly
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_column\_parted

```moonbit
:::source,tiye/respo/lib/ui.mbt,220:::let ui_column_parted : String
```
 layout items in column with flexbox, space between
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_expand

```moonbit
:::source,tiye/respo/lib/ui.mbt,235:::let ui_expand : String
```
 expand item with flex:1

## ui\_font\_code

```moonbit
:::source,tiye/respo/lib/ui.mbt,255:::let ui_font_code : String
```
 monospace font for code, Source Code Pro, Menlo, Ubuntu Mono, Consolas

## ui\_font\_fancy

```moonbit
:::source,tiye/respo/lib/ui.mbt,261:::let ui_font_fancy : String
```
 fancy font for title, Josefin Sans, Helvetica neue, Arial
refers to https://fonts.google.com/specimen/Josefin+Sans or https://cdn.tiye.me/favored-fonts/main-fonts.css

## ui\_font\_normal

```moonbit
:::source,tiye/respo/lib/ui.mbt,267:::let ui_font_normal : String
```
 normal font for text, Hind, Helvatica, Arial
refers to https://fonts.google.com/specimen/Hind or https://cdn.tiye.me/favored-fonts/main-fonts.css

## ui\_fullscreen

```moonbit
:::source,tiye/respo/lib/ui.mbt,238:::let ui_fullscreen : String
```
 full page with absolute position

## ui\_global

```moonbit
:::source,tiye/respo/lib/ui.mbt,27:::let ui_global : String
```


## ui\_input

```moonbit
:::source,tiye/respo/lib/ui.mbt,43:::let ui_input : String
```


## ui\_link

```moonbit
:::source,tiye/respo/lib/ui.mbt,291:::let ui_link : String
```


## ui\_row

```moonbit
:::source,tiye/respo/lib/ui.mbt,311:::let ui_row : String
```
 layout items in row with flexbox, items are stretched
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_row\_center

```moonbit
:::source,tiye/respo/lib/ui.mbt,317:::let ui_row_center : String
```
 layout items in row with flexbox, center them
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_row\_dispersive

```moonbit
:::source,tiye/respo/lib/ui.mbt,333:::let ui_row_dispersive : String
```
 layout items in row with flexbox, space around
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_row\_evenly

```moonbit
:::source,tiye/respo/lib/ui.mbt,349:::let ui_row_evenly : String
```
 layout items in row with flexbox, space evenly
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_row\_middle

```moonbit
:::source,tiye/respo/lib/ui.mbt,365:::let ui_row_middle : String
```
 layout items in row with flexbox, space between
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_row\_parted

```moonbit
:::source,tiye/respo/lib/ui.mbt,381:::let ui_row_parted : String
```
 layout items in row with flexbox, space between
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_textarea

```moonbit
:::source,tiye/respo/lib/ui.mbt,272:::let ui_textarea : String
```

