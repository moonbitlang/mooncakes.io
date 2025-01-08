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
|[comp\_esc\_listener](#comp_esc_listener)| handle global keydown event|

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
  :::source,tiye/respo/lib/dialog/alert.mbt,12:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/alert.mbt,12:::fn default() -> <a href="tiye/respo/lib/dialog#AlertOptions">AlertOptions</a>
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
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/alert.mbt,90:::fn default() -> <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/alert.mbt,90:::fn to_json(<a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/alert.mbt,90:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/alert.mbt,90:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#AlertPluginState">AlertPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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
  :::source,tiye/respo/lib/dialog/confirm.mbt,14:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/confirm.mbt,14:::fn default() -> <a href="tiye/respo/lib/dialog#ConfirmOptions">ConfirmOptions</a>
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
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/confirm.mbt,106:::fn default() -> <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/confirm.mbt,106:::fn to_json(<a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/confirm.mbt,106:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/confirm.mbt,106:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#ConfirmPluginState">ConfirmPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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
  :::source,tiye/respo/lib/dialog/drawer.mbt,12:::impl[T : <a href="moonbitlang/core/builtin#Default">Default</a>] <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>[T]
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/drawer.mbt,12:::fn default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="tiye/respo/lib/dialog#DrawerOptions">DrawerOptions</a>[T]
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
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/drawer.mbt,113:::fn default() -> <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/drawer.mbt,113:::fn to_json(<a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/drawer.mbt,113:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/drawer.mbt,113:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#DrawerPluginState">DrawerPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::fn op_equal(<a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>, <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::fn to_json(<a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,76:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectDrawerFade">EffectDrawerFade</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## EffectFocus

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,2:::type EffectFocus
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::fn op_equal(<a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>, <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::fn to_json(<a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,4:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectFocus">EffectFocus</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## EffectModalClose

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,126:::type EffectModalClose
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::fn op_equal(<a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>, <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::fn to_json(<a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,126:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectModalClose">EffectModalClose</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## EffectModalFade

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,22:::type EffectModalFade
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::fn op_equal(<a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>, <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::fn to_json(<a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/dialogs.mbt,24:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#EffectModalFade">EffectModalFade</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## InputState

```moonbit
:::source,tiye/respo/lib/dialog/prompt.mbt,59:::type InputState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#InputState">InputState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,62:::fn default() -> <a href="tiye/respo/lib/dialog#InputState">InputState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#InputState">InputState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,62:::fn to_json(<a href="tiye/respo/lib/dialog#InputState">InputState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,62:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#InputState">InputState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,62:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#InputState">InputState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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
  :::source,tiye/respo/lib/dialog/modal.mbt,12:::impl[T : <a href="moonbitlang/core/builtin#Default">Default</a>] <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>[T]
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/modal.mbt,12:::fn default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="tiye/respo/lib/dialog#ModalOptions">ModalOptions</a>[T]
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
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/modal.mbt,111:::fn default() -> <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/modal.mbt,111:::fn to_json(<a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/modal.mbt,111:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/modal.mbt,111:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#ModalPluginState">ModalPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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
  :::source,tiye/respo/lib/dialog/prompt.mbt,23:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,23:::fn default() -> <a href="tiye/respo/lib/dialog#PromptOptions">PromptOptions</a>
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
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,236:::fn default() -> <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,236:::fn to_json(<a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/lib/dialog/prompt.mbt,236:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/lib/dialog/prompt.mbt,236:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/lib/dialog#PromptPluginState">PromptPluginState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
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

## comp\_esc\_listener

```moonbit
:::source,tiye/respo/lib/dialog/dialogs.mbt,166:::fn comp_esc_listener[T](_show : Bool, on_close : (<a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 handle global keydown event
