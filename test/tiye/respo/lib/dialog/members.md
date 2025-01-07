# Documentation
|Type|description|
|---|---|
|[AlertOptions](#AlertOptions)| The options for alert modal.|
|[AlertPlugin](#AlertPlugin)| abstraction for Alert modal, new with \`AlertOption\`,|
|[AlertPluginState](#AlertPluginState)||
|[ConfirmOptions](#ConfirmOptions)| options for confirm dialog|
|[ConfirmPlugin](#ConfirmPlugin)| Popup a confirmation dialog, confirm to process next task|
|[ConfirmPluginState](#ConfirmPluginState)||
|[DrawerOptions](#DrawerOptions)| The options for custom drawer.|
|[DrawerPlugin](#DrawerPlugin)| a drawer that you can render you down card body|
|[DrawerPluginState](#DrawerPluginState)||
|[DrawerRenderer](#DrawerRenderer)||
|[EffectDrawerFade](#EffectDrawerFade)||
|[EffectFocus](#EffectFocus)||
|[EffectModalClose](#EffectModalClose)||
|[EffectModalFade](#EffectModalFade)||
|[InputState](#InputState)||
|[ModalOptions](#ModalOptions)| The options for custom modal.|
|[ModalPlugin](#ModalPlugin)| a modal that you can render you down card body|
|[ModalPluginState](#ModalPluginState)||
|[ModalRenderer](#ModalRenderer)||
|[PromptOptions](#PromptOptions)| options for prompt dialog|
|[PromptPlugin](#PromptPlugin)| a dialog for prompt, request for some input, and submit|
|[PromptPluginState](#PromptPluginState)||
|[PromptValidator](#PromptValidator)||

|Value|description|
|---|---|
|[button](#button)||
|[comp\_esc\_listener](#comp_esc_listener)| handle global keydown event|
|[declare\_static\_style](#declare_static_style)| Declare a static style in the head of the documentm for example|
|[div](#div)| \<div\> element with children.|
|[input](#input)||
|[respo\_attrs](#respo_attrs)| create attributes for an element|
|[respo\_style](#respo_style)| Create a new RespoStyle object|
|[space](#space)| create a \`\<div/\>\` element to render space.|
|[span](#span)||
|[str\_spaced](#str_spaced)| convert a list of strings to a single string with spaces between them,|
|[ui\_button](#ui_button)||
|[ui\_center](#ui_center)| layout items in column and center them with flexbox|
|[ui\_column](#ui_column)| layout items in column and center them with flexbox|
|[ui\_fullscreen](#ui_fullscreen)| full page with absolute position|
|[ui\_global](#ui_global)||
|[ui\_row\_parted](#ui_row_parted)| layout items in row with flexbox, space between|
|[ui\_textarea](#ui_textarea)||

## AlertOptions

```moonbit
:::source,tiye/respo/lib/dialog/alert.mbt,3:::pub(all) struct AlertOptions {
  backdrop_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  card_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  text : String?
  button_text : String?
}
```
 The options for alert modal.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,12:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a> with default() -> <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,12:::fn <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>::default() -> <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>
  ```
  > automatically derived

## AlertPlugin

```moonbit
:::source,tiye/respo/lib/dialog/alert.mbt,94:::pub(all) struct AlertPlugin {
  state : <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
  options : <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>
  text : String?
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
  on_read : (<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit
}
```
 abstraction for Alert modal, new with `AlertOption`,
just displaying a message, you read it, you close it

#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,166:::fn <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>::close[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,181:::fn <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>::new[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](states : <a href="tiye/respo/lib#RespoStatesTree">@tiye/respo/lib.RespoStatesTree</a>, options : <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>, on_read : (<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit) -> <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>[T]
  ```
  > 
- #### render
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,104:::fn <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>::render[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
  ```
  > 
- #### show
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,157:::fn <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>::show[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#AlertPlugin">AlertPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T], text : String?) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 

## AlertPluginState

```moonbit
:::source,tiye/respo/lib/dialog/alert.mbt,87:::type AlertPluginState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a> with default() -> <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a> with to_json(<a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::fn <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>::default() -> <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::fn <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::fn <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>::to_json(<a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## ConfirmOptions

```moonbit
:::source,tiye/respo/lib/dialog/confirm.mbt,5:::pub(all) struct ConfirmOptions {
  backdrop_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  card_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  text : String?
  button_text : String?
}
```
 options for confirm dialog

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,14:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a> with default() -> <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,14:::fn <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>::default() -> <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>
  ```
  > automatically derived

## ConfirmPlugin

```moonbit
:::source,tiye/respo/lib/dialog/confirm.mbt,109:::pub(all) struct ConfirmPlugin {
  state : <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
  options : <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>
  text : String?
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
  on_confirm : (<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit
}
```
 Popup a confirmation dialog, confirm to process next task

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,175:::fn <a href="tiye/respo/lib/dialog#ConfirmPlugin">ConfirmPlugin</a>::new[T](states : <a href="tiye/respo/lib#RespoStatesTree">@tiye/respo/lib.RespoStatesTree</a>, options : <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>, on_confirm : (<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit) -> <a href="tiye/respo/lib/dialog#ConfirmPlugin">ConfirmPlugin</a>[T]
  ```
  > 
- #### render
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,119:::fn <a href="tiye/respo/lib/dialog#ConfirmPlugin">ConfirmPlugin</a>::render[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#ConfirmPlugin">ConfirmPlugin</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
  ```
  > 
- #### show
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,163:::fn <a href="tiye/respo/lib/dialog#ConfirmPlugin">ConfirmPlugin</a>::show[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#ConfirmPlugin">ConfirmPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T], next_task : () -> Unit) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 

## ConfirmPluginState

```moonbit
:::source,tiye/respo/lib/dialog/confirm.mbt,103:::type ConfirmPluginState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a> with default() -> <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a> with to_json(<a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::fn <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>::default() -> <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::fn <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::fn <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>::to_json(<a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## DrawerOptions

```moonbit
:::source,tiye/respo/lib/dialog/drawer.mbt,3:::pub(all) struct DrawerOptions {
  backdrop_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  card_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  title : String?
  render : <a href="tiye/respo/lib/dialog#DrawerRenderer">DrawerRenderer</a>[T]
}
```
 The options for custom drawer.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,12:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a> with default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>[T]
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,12:::fn <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>::default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>[T]
  ```
  > automatically derived

## DrawerPlugin

```moonbit
:::source,tiye/respo/lib/dialog/drawer.mbt,117:::pub(all) struct DrawerPlugin {
  state : <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
  options : <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>[T]
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
}
```
 a drawer that you can render you down card body

#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,147:::fn <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>::close[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,155:::fn <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>::new[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](states : <a href="tiye/respo/lib#RespoStatesTree">@tiye/respo/lib.RespoStatesTree</a>, options : <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>[T]) -> <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>[T]
  ```
  > 
- #### render
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,125:::fn <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>::render[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 
- #### show
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,139:::fn <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>::show[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#DrawerPlugin">DrawerPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 

## DrawerPluginState

```moonbit
:::source,tiye/respo/lib/dialog/drawer.mbt,111:::type DrawerPluginState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a> with default() -> <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a> with to_json(<a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::fn <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>::default() -> <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::fn <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::fn <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>::to_json(<a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## DrawerRenderer

```moonbit
:::source,tiye/respo/lib/dialog/drawer.mbt,15:::type DrawerRenderer
```


#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,25:::fn <a href="tiye/respo/lib/dialog#DrawerRenderer">DrawerRenderer</a>::default[T]() -> <a href="tiye/respo/lib/dialog#DrawerRenderer">DrawerRenderer</a>[T]
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,30:::fn <a href="tiye/respo/lib/dialog#DrawerRenderer">DrawerRenderer</a>::new[T](renderer : ((<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> <a href="tiye/respo/lib/dialog#DrawerRenderer">DrawerRenderer</a>[T]
  ```
  > 

## EffectDrawerFade

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,74:::type EffectDrawerFade
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a> with op_equal(<a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>, <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a> with to_json(<a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### before\_unmount
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,57:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::before_unmount[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### build\_effect
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,28:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">@tiye/respo/lib/node.RespoEffectBox</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### make\_handler
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,33:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- #### mounted
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,48:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::mounted[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::op_equal(<a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>, <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>) -> Bool
  ```
  > automatically derived
- #### run
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,38:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::run[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::fn <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>::to_json(<a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## EffectFocus

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,2:::type EffectFocus
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a> with op_equal(<a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>, <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a> with to_json(<a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### before\_unmount
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,57:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::before_unmount[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### before\_update
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,51:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::before_update[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### build\_effect
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,28:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">@tiye/respo/lib/node.RespoEffectBox</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### make\_handler
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,33:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- #### mounted
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,48:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::mounted[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::op_equal(<a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>, <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>) -> Bool
  ```
  > automatically derived
- #### run
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,38:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::run[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::fn <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>::to_json(<a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## EffectModalClose

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,126:::type EffectModalClose
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a> with op_equal(<a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>, <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a> with to_json(<a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### before\_update
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,51:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::before_update[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### build\_effect
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,28:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">@tiye/respo/lib/node.RespoEffectBox</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### make\_handler
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,33:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::op_equal(<a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>, <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>) -> Bool
  ```
  > automatically derived
- #### run
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,38:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::run[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::to_json(<a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### updated
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,54:::fn <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>::updated[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty

## EffectModalFade

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,22:::type EffectModalFade
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a> with op_equal(<a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>, <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a> with to_json(<a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### before\_unmount
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,57:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::before_unmount[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### build\_effect
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,28:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">@tiye/respo/lib/node.RespoEffectBox</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### make\_handler
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,33:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- #### mounted
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,48:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::mounted[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::op_equal(<a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>, <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>) -> Bool
  ```
  > automatically derived
- #### run
  ```moonbit
  :::source,tiye/respo/lib/dialog/effect.mbt,38:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::run[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::fn <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>::to_json(<a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## InputState

```moonbit
:::source,tiye/respo/lib/dialog/prompt.mbt,59:::type InputState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#InputState">InputState</a> with default() -> <a href="tiye/respo/lib/dialog#InputState">InputState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#InputState">InputState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#InputState">InputState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#InputState">InputState</a> with to_json(<a href="tiye/respo/lib/dialog#InputState">InputState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::fn <a href="tiye/respo/lib/dialog#InputState">InputState</a>::default() -> <a href="tiye/respo/lib/dialog#InputState">InputState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::fn <a href="tiye/respo/lib/dialog#InputState">InputState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#InputState">InputState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::fn <a href="tiye/respo/lib/dialog#InputState">InputState</a>::to_json(<a href="tiye/respo/lib/dialog#InputState">InputState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## ModalOptions

```moonbit
:::source,tiye/respo/lib/dialog/modal.mbt,3:::pub(all) struct ModalOptions {
  backdrop_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  card_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  title : String?
  render : <a href="tiye/respo/lib/dialog#ModalRenderer">ModalRenderer</a>[T]
}
```
 The options for custom modal.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,12:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a> with default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>[T]
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,12:::fn <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>::default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>[T]
  ```
  > automatically derived

## ModalPlugin

```moonbit
:::source,tiye/respo/lib/dialog/modal.mbt,115:::pub(all) struct ModalPlugin {
  state : <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
  options : <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>[T]
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
}
```
 a modal that you can render you down card body

#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,147:::fn <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>::close[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,155:::fn <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>::new[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](states : <a href="tiye/respo/lib#RespoStatesTree">@tiye/respo/lib.RespoStatesTree</a>, options : <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>[T]) -> <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>[T]
  ```
  > 
- #### render
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,125:::fn <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>::render[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 
- #### show
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,139:::fn <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>::show[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#ModalPlugin">ModalPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 

## ModalPluginState

```moonbit
:::source,tiye/respo/lib/dialog/modal.mbt,109:::type ModalPluginState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a> with default() -> <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a> with to_json(<a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::fn <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>::default() -> <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::fn <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::fn <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>::to_json(<a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## ModalRenderer

```moonbit
:::source,tiye/respo/lib/dialog/modal.mbt,18:::pub(all) type ModalRenderer ((<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
```


#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,21:::fn <a href="tiye/respo/lib/dialog#ModalRenderer">ModalRenderer</a>::default[T]() -> <a href="tiye/respo/lib/dialog#ModalRenderer">ModalRenderer</a>[T]
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,26:::fn <a href="tiye/respo/lib/dialog#ModalRenderer">ModalRenderer</a>::new[T](renderer : ((<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> <a href="tiye/respo/lib/dialog#ModalRenderer">ModalRenderer</a>[T]
  ```
  > 

## PromptOptions

```moonbit
:::source,tiye/respo/lib/dialog/prompt.mbt,6:::pub(all) struct PromptOptions {
  backdrop_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  card_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  text : String?
  button_text : String?
  initial_value : String?
  multilines : Bool
  input_style : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
  validator : <a href="tiye/respo/lib/dialog#PromptValidator">PromptValidator</a>?
}
```
 options for prompt dialog

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,23:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a> with default() -> <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,23:::fn <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>::default() -> <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>
  ```
  > automatically derived

## PromptPlugin

```moonbit
:::source,tiye/respo/lib/dialog/prompt.mbt,240:::pub(all) struct PromptPlugin {
  states : <a href="tiye/respo/lib#RespoStatesTree">@tiye/respo/lib.RespoStatesTree</a>
  state : <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
  options : <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>
  text : String?
  cursor : <a href="moonbitlang/core/array#Array">Array</a>[String]
  on_submit : (String, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
}
```
 a dialog for prompt, request for some input, and submit

#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,304:::fn <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>::close[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,315:::fn <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>::new[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](states : <a href="tiye/respo/lib#RespoStatesTree">@tiye/respo/lib.RespoStatesTree</a>, options : <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>, on_submit : (String, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>) -> <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>[T]
  ```
  > 
- #### render
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,251:::fn <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>::render[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>[T]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
  ```
  > 
- #### show
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,290:::fn <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>::show[T : <a href="tiye/respo/lib/node#RespoAction">@tiye/respo/lib/node.RespoAction</a>](self : <a href="tiye/respo/lib/dialog#PromptPlugin">PromptPlugin</a>[T], dispatch : <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T], next_task : (String) -> Unit) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>
  ```
  > 

## PromptPluginState

```moonbit
:::source,tiye/respo/lib/dialog/prompt.mbt,233:::type PromptPluginState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a> with default() -> <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a> with to_json(<a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::fn <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>::default() -> <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::fn <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::fn <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>::to_json(<a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## PromptValidator

```moonbit
:::source,tiye/respo/lib/dialog/prompt.mbt,29:::pub(all) type PromptValidator (String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, String]
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,42:::fn <a href="tiye/respo/lib/dialog#PromptValidator">PromptValidator</a>::new(f : (String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, String]) -> <a href="tiye/respo/lib/dialog#PromptValidator">PromptValidator</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,32:::fn <a href="tiye/respo/lib/dialog#PromptValidator">PromptValidator</a>::to_string(self : <a href="tiye/respo/lib/dialog#PromptValidator">PromptValidator</a>) -> String
  ```
  > 

## button

```moonbit
:::source,tiye/respo/lib/dialog/alias.mbt,94:::fn button[T](class_name? : String, inner_text~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```


## comp\_esc\_listener

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,166:::fn comp_esc_listener[T](_show : Bool, on_close : (<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 handle global keydown event

## declare\_static\_style

```moonbit
:::source,tiye/respo/lib/dialog/css.mbt,1082:::fn declare_static_style[U : <a href="moonbitlang/core/builtin#Show">Show</a>](rules : <a href="moonbitlang/core/array#Array">Array</a>[(U, <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>)], loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> String
```
 Declare a static style in the head of the documentm for example
 ```moonbit
 let style_demo : String = declare_static_style(
  [("&", respo_style(margin=Px(4), background_color=Hsl(200, 90, 96)))],
 )
 ```

## div

```moonbit
:::source,tiye/respo/lib/dialog/alias.mbt,5:::fn div[T](class_name? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 <div> element with children.

## input

```moonbit
:::source,tiye/respo/lib/dialog/alias.mbt,113:::fn input[T](class_name? : String, autocomplete? : <a href="tiye/respo/lib/node#TextareaElementAutoComplete">@tiye/respo/lib/node.TextareaElementAutoComplete</a>, autofocus? : Bool, disabled? : Bool, name? : String, placeholder? : String, readonly_? : Bool, spellcheck? : Bool, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., value~ : String, event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```


## respo\_attrs

```moonbit
:::source,tiye/respo/lib/dialog/element.mbt,81:::fn respo_attrs(id? : String, class_name? : String, hidden? : Bool, disabled? : Bool, value? : String, src? : String, href? : String, alt? : String, title? : String, placeholder? : String, type_? : String, name? : String, checked? : Bool, selected? : Bool, read_only? : Bool, max_length? : Int, min_length? : Int, tab_index? : Int, content_editable? : Bool, width? : String, height? : String, inner_text? : String, innerHTML? : String) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
```
 create attributes for an element

## respo\_style

```moonbit
:::source,tiye/respo/lib/dialog/css.mbt,42:::fn respo_style(color? : <a href="tiye/respo/lib/node#CssColor">@tiye/respo/lib/node.CssColor</a>, background_color? : <a href="tiye/respo/lib/node#CssColor">@tiye/respo/lib/node.CssColor</a>, font_size? : UInt, font_family? : String, font_weight? : String, text_align? : <a href="tiye/respo/lib/node#CssTextAlign">@tiye/respo/lib/node.CssTextAlign</a>, display? : <a href="tiye/respo/lib/node#CssDisplay">@tiye/respo/lib/node.CssDisplay</a>, margin? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, border? : <a href="tiye/respo/lib/node#CssBorder">@tiye/respo/lib/node.CssBorder</a>, width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, height? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, position? : <a href="tiye/respo/lib/node#CssPosition">@tiye/respo/lib/node.CssPosition</a>, top? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, right? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, bottom? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, left? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, float? : String, clear? : String, overflow? : <a href="tiye/respo/lib/node#CssOverflow">@tiye/respo/lib/node.CssOverflow</a>, z_index? : Int, flex? : float, flex_direction? : <a href="tiye/respo/lib/node#CssFlexDirection">@tiye/respo/lib/node.CssFlexDirection</a>, justify_content? : <a href="tiye/respo/lib/node#CssFlexJustifyContent">@tiye/respo/lib/node.CssFlexJustifyContent</a>, align_items? : <a href="tiye/respo/lib/node#CssFlexAlignItems">@tiye/respo/lib/node.CssFlexAlignItems</a>, align_content? : <a href="tiye/respo/lib/node#CssFlexAlignContent">@tiye/respo/lib/node.CssFlexAlignContent</a>, order? : Int, text_decoration? : <a href="tiye/respo/lib/node#CssTextDecoration">@tiye/respo/lib/node.CssTextDecoration</a>, text_transform? : String, line_height? : <a href="tiye/respo/lib/node#CssLineHeight">@tiye/respo/lib/node.CssLineHeight</a>, letter_spacing? : String, white_space? : String, word_break? : <a href="tiye/respo/lib/node#CssWordBreak">@tiye/respo/lib/node.CssWordBreak</a>, opacity? : Int, visibility? : String, box_shadow? : String, transition? : String, box_sizing? : <a href="tiye/respo/lib/node#CssBoxSizing">@tiye/respo/lib/node.CssBoxSizing</a>, border_radius? : float, padding_top? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding_bottom? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding_left? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding_right? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, min_width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, max_width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, vertical_align? : <a href="tiye/respo/lib/node#CssVerticalAlign">@tiye/respo/lib/node.CssVerticalAlign</a>, border_style? : <a href="tiye/respo/lib/node#CssBorderStyle">@tiye/respo/lib/node.CssBorderStyle</a>, border_color? : <a href="tiye/respo/lib/node#CssColor">@tiye/respo/lib/node.CssColor</a>, border_width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, cursor? : <a href="tiye/respo/lib/node#CssCursor">@tiye/respo/lib/node.CssCursor</a>, transition_duration? : <a href="tiye/respo/lib/node#CssDuration">@tiye/respo/lib/node.CssDuration</a>, transform? : <a href="tiye/respo/lib/node#CssTransform">@tiye/respo/lib/node.CssTransform</a>, outline? : <a href="tiye/respo/lib/node#CssOutline">@tiye/respo/lib/node.CssOutline</a>, user_select? : <a href="tiye/respo/lib/node#CssUserSelect">@tiye/respo/lib/node.CssUserSelect</a>, margin_top? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, margin_bottom? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, margin_left? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, margin_right? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, max_height? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, transform_property? : <a href="moonbitlang/core/array#Array">Array</a>[String], gap? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, content? : String, content_visibility? : <a href="tiye/respo/lib/node#CssContentVisibility">@tiye/respo/lib/node.CssContentVisibility</a>, filter? : <a href="tiye/respo/lib/node#CssFilter">@tiye/respo/lib/node.CssFilter</a>, object_fit? : <a href="tiye/respo/lib/node#CssObjectFit">@tiye/respo/lib/node.CssObjectFit</a>, overscroll_behavior_x? : <a href="tiye/respo/lib/node#CssOverscrollBehavior">@tiye/respo/lib/node.CssOverscrollBehavior</a>, overscroll_behavior_y? : <a href="tiye/respo/lib/node#CssOverscrollBehavior">@tiye/respo/lib/node.CssOverscrollBehavior</a>) -> <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
```
 Create a new RespoStyle object

## space

```moonbit
:::source,tiye/respo/lib/dialog/alias.mbt,538:::fn space[T](width~ : Int = .., height~ : Int = .., class_name? : String) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 create a `<div/>` element to render space.

## span

```moonbit
:::source,tiye/respo/lib/dialog/alias.mbt,49:::fn span[T](class_name? : String, inner_text? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```


## str\_spaced

```moonbit
:::source,tiye/respo/lib/dialog/util.mbt,34:::fn str_spaced(wrap_parens~ : Bool = .., s : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> String
```
 convert a list of strings to a single string with spaces between them,
mainly used for concatenating class names

## ui\_button

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,75:::let ui_button : String
```


## ui\_center

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,166:::let ui_center : String
```
 layout items in column and center them with flexbox
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_column

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,182:::let ui_column : String
```
 layout items in column and center them with flexbox
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_fullscreen

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,238:::let ui_fullscreen : String
```
 full page with absolute position

## ui\_global

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,27:::let ui_global : String
```


## ui\_row\_parted

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,381:::let ui_row_parted : String
```
 layout items in row with flexbox, space between
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_textarea

```moonbit
:::source,tiye/respo/lib/dialog/ui.mbt,272:::let ui_textarea : String
```

