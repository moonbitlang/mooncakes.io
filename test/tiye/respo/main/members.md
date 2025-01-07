# Documentation
|Type|description|
|---|---|
|[ActionOp](#ActionOp)||
|[MainState](#MainState)||
|[PanelMount](#PanelMount)||
|[PanelState](#PanelState)||
|[Store](#Store)||
|[Task](#Task)||
|[TaskState](#TaskState)||
|[TaskUpdateEffect](#TaskUpdateEffect)||
|[TodolistState](#TodolistState)||

|Value|description|
|---|---|
|[button](#button)||
|[declare\_contained\_style](#declare_contained_style)| Declare a static style in the head of the documentm for example|
|[declare\_static\_style](#declare_static_style)| Declare a static style in the head of the documentm for example|
|[div](#div)| \<div\> element with children.|
|[input](#input)||
|[respo\_style](#respo_style)| Create a new RespoStyle object|
|[space](#space)| create a \`\<div/\>\` element to render space.|
|[span](#span)||
|[str\_spaced](#str_spaced)| convert a list of strings to a single string with spaces between them,|
|[text\_node](#text_node)| internally using span element to render text.|
|[ui\_button](#ui_button)||
|[ui\_center](#ui_center)| layout items in column and center them with flexbox|
|[ui\_input](#ui_input)||
|[ui\_row\_middle](#ui_row_middle)| layout items in row with flexbox, space between|

## ActionOp

```moonbit
:::source,tiye/respo/main/store.mbt,27:::type ActionOp
```


## MainState

```moonbit
:::source,tiye/respo/main/counter.mbt,3:::type MainState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#MainState">MainState</a> with default() -> <a href="tiye/respo/main#MainState">MainState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#MainState">MainState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#MainState">MainState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#MainState">MainState</a> with to_json(<a href="tiye/respo/main#MainState">MainState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::fn <a href="tiye/respo/main#MainState">MainState</a>::default() -> <a href="tiye/respo/main#MainState">MainState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::fn <a href="tiye/respo/main#MainState">MainState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#MainState">MainState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::fn <a href="tiye/respo/main#MainState">MainState</a>::to_json(<a href="tiye/respo/main#MainState">MainState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## PanelMount

```moonbit
:::source,tiye/respo/main/panel.mbt,8:::type PanelMount
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a> with default() -> <a href="tiye/respo/main#PanelMount">PanelMount</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#PanelMount">PanelMount</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a> with op_equal(<a href="tiye/respo/main#PanelMount">PanelMount</a>, <a href="tiye/respo/main#PanelMount">PanelMount</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a> with to_json(<a href="tiye/respo/main#PanelMount">PanelMount</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### before\_unmount
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,57:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::before_unmount[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### build\_effect
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,28:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">@tiye/respo/lib/node.RespoEffectBox</a>
  ```
  > 
- #### default
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::default() -> <a href="tiye/respo/main#PanelMount">PanelMount</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#PanelMount">PanelMount</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### make\_handler
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,33:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- #### mounted
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,48:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::mounted[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::op_equal(<a href="tiye/respo/main#PanelMount">PanelMount</a>, <a href="tiye/respo/main#PanelMount">PanelMount</a>) -> Bool
  ```
  > automatically derived
- #### run
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,38:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::run[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::fn <a href="tiye/respo/main#PanelMount">PanelMount</a>::to_json(<a href="tiye/respo/main#PanelMount">PanelMount</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## PanelState

```moonbit
:::source,tiye/respo/main/panel.mbt,2:::type PanelState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#PanelState">PanelState</a> with default() -> <a href="tiye/respo/main#PanelState">PanelState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#PanelState">PanelState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#PanelState">PanelState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#PanelState">PanelState</a> with to_json(<a href="tiye/respo/main#PanelState">PanelState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::fn <a href="tiye/respo/main#PanelState">PanelState</a>::default() -> <a href="tiye/respo/main#PanelState">PanelState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::fn <a href="tiye/respo/main#PanelState">PanelState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#PanelState">PanelState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::fn <a href="tiye/respo/main#PanelState">PanelState</a>::to_json(<a href="tiye/respo/main#PanelState">PanelState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## Store

```moonbit
:::source,tiye/respo/main/store.mbt,2:::type Store
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/store.mbt,6:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#Store">Store</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#Store">Store</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#Store">Store</a> with to_json(<a href="tiye/respo/main#Store">Store</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/store.mbt,6:::fn <a href="tiye/respo/main#Store">Store</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#Store">Store</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/store.mbt,6:::fn <a href="tiye/respo/main#Store">Store</a>::to_json(<a href="tiye/respo/main#Store">Store</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## Task

```moonbit
:::source,tiye/respo/main/store.mbt,14:::type Task
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#Task">Task</a> with default() -> <a href="tiye/respo/main#Task">Task</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#Task">Task</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#Task">Task</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/main#Task">Task</a> with hash_combine(<a href="tiye/respo/main#Task">Task</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#Task">Task</a> with op_equal(<a href="tiye/respo/main#Task">Task</a>, <a href="tiye/respo/main#Task">Task</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#Task">Task</a> with to_json(<a href="tiye/respo/main#Task">Task</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::fn <a href="tiye/respo/main#Task">Task</a>::default() -> <a href="tiye/respo/main#Task">Task</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::fn <a href="tiye/respo/main#Task">Task</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#Task">Task</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,tiye/respo/main/traits.mbt,40:::fn <a href="tiye/respo/main#Task">Task</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::fn <a href="tiye/respo/main#Task">Task</a>::hash_combine(<a href="tiye/respo/main#Task">Task</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::fn <a href="tiye/respo/main#Task">Task</a>::op_equal(<a href="tiye/respo/main#Task">Task</a>, <a href="tiye/respo/main#Task">Task</a>) -> Bool
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::fn <a href="tiye/respo/main#Task">Task</a>::to_json(<a href="tiye/respo/main#Task">Task</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## TaskState

```moonbit
:::source,tiye/respo/main/task.mbt,2:::type TaskState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#TaskState">TaskState</a> with default() -> <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#TaskState">TaskState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TaskState">TaskState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/main#TaskState">TaskState</a> with hash_combine(<a href="tiye/respo/main#TaskState">TaskState</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#TaskState">TaskState</a> with op_equal(<a href="tiye/respo/main#TaskState">TaskState</a>, <a href="tiye/respo/main#TaskState">TaskState</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#TaskState">TaskState</a> with to_json(<a href="tiye/respo/main#TaskState">TaskState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::fn <a href="tiye/respo/main#TaskState">TaskState</a>::default() -> <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::fn <a href="tiye/respo/main#TaskState">TaskState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TaskState">TaskState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,tiye/respo/main/traits.mbt,40:::fn <a href="tiye/respo/main#TaskState">TaskState</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::fn <a href="tiye/respo/main#TaskState">TaskState</a>::hash_combine(<a href="tiye/respo/main#TaskState">TaskState</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::fn <a href="tiye/respo/main#TaskState">TaskState</a>::op_equal(<a href="tiye/respo/main#TaskState">TaskState</a>, <a href="tiye/respo/main#TaskState">TaskState</a>) -> Bool
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::fn <a href="tiye/respo/main#TaskState">TaskState</a>::to_json(<a href="tiye/respo/main#TaskState">TaskState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## TaskUpdateEffect

```moonbit
:::source,tiye/respo/main/task.mbt,7:::type TaskUpdateEffect
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a> with default() -> <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a> with hash_combine(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a> with op_equal(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>, <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a> with to_json(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### before\_unmount
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,57:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::before_unmount[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### before\_update
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,51:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::before_update[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### build\_effect
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,28:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::build_effect[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> <a href="tiye/respo/lib/node#RespoEffectBox">@tiye/respo/lib/node.RespoEffectBox</a>
  ```
  > 
- #### default
  ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::default() -> <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,tiye/respo/main/traits.mbt,40:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::hash_combine(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### make\_handler
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,33:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::make_handler[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self) -> ((<a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit)
  ```
  > 
- #### mounted
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,48:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::mounted[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](_self : Self, _node : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  >  default handler is empty
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::op_equal(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>, <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>) -> Bool
  ```
  > automatically derived
- #### run
  ```moonbit
  :::source,tiye/respo/main/effect.mbt,38:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::run[Self : <a href="tiye/respo/lib/node#RespoEffect">@tiye/respo/lib/node.RespoEffect</a> + <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : Self, effect_type : <a href="tiye/respo/lib/node#RespoEffectType">@tiye/respo/lib/node.RespoEffectType</a>, el : <a href="tiye/dom-ffi/lib#Node">@tiye/dom-ffi/lib.Node</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::fn <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>::to_json(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## TodolistState

```moonbit
:::source,tiye/respo/main/todolist.mbt,2:::type TodolistState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a> with default() -> <a href="tiye/respo/main#TodolistState">TodolistState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TodolistState">TodolistState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a> with op_equal(<a href="tiye/respo/main#TodolistState">TodolistState</a>, <a href="tiye/respo/main#TodolistState">TodolistState</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a> with to_json(<a href="tiye/respo/main#TodolistState">TodolistState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::fn <a href="tiye/respo/main#TodolistState">TodolistState</a>::default() -> <a href="tiye/respo/main#TodolistState">TodolistState</a>
  ```
  > automatically derived
- #### from\_json
  ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::fn <a href="tiye/respo/main#TodolistState">TodolistState</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TodolistState">TodolistState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::fn <a href="tiye/respo/main#TodolistState">TodolistState</a>::op_equal(<a href="tiye/respo/main#TodolistState">TodolistState</a>, <a href="tiye/respo/main#TodolistState">TodolistState</a>) -> Bool
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::fn <a href="tiye/respo/main#TodolistState">TodolistState</a>::to_json(<a href="tiye/respo/main#TodolistState">TodolistState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## button

```moonbit
:::source,tiye/respo/main/alias.mbt,94:::fn button[T](class_name? : String, inner_text~ : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```


## declare\_contained\_style

```moonbit
:::source,tiye/respo/main/css.mbt,1130:::fn declare_contained_style[U : <a href="moonbitlang/core/builtin#Show">Show</a>](rules : <a href="moonbitlang/core/array#Array">Array</a>[(String?, U, <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>)], loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> String
```
 Declare a static style in the head of the documentm for example
 ```moonbit
 let style_demo : String = declare_contained_style(
  [(Some("@media only screen and (max-width: 600px)"), "&", respo_style(margin=Px(4), background_color=Hsl(200, 90, 96)))],
 )
 ```

## declare\_static\_style

```moonbit
:::source,tiye/respo/main/css.mbt,1082:::fn declare_static_style[U : <a href="moonbitlang/core/builtin#Show">Show</a>](rules : <a href="moonbitlang/core/array#Array">Array</a>[(U, <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>)], loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> String
```
 Declare a static style in the head of the documentm for example
 ```moonbit
 let style_demo : String = declare_static_style(
  [("&", respo_style(margin=Px(4), background_color=Hsl(200, 90, 96)))],
 )
 ```

## div

```moonbit
:::source,tiye/respo/main/alias.mbt,5:::fn div[T](class_name? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 <div> element with children.

## input

```moonbit
:::source,tiye/respo/main/alias.mbt,113:::fn input[T](class_name? : String, autocomplete? : <a href="tiye/respo/lib/node#TextareaElementAutoComplete">@tiye/respo/lib/node.TextareaElementAutoComplete</a>, autofocus? : Bool, disabled? : Bool, name? : String, placeholder? : String, readonly_? : Bool, spellcheck? : Bool, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., value~ : String, event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = ..) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```


## respo\_style

```moonbit
:::source,tiye/respo/main/css.mbt,42:::fn respo_style(color? : <a href="tiye/respo/lib/node#CssColor">@tiye/respo/lib/node.CssColor</a>, background_color? : <a href="tiye/respo/lib/node#CssColor">@tiye/respo/lib/node.CssColor</a>, font_size? : UInt, font_family? : String, font_weight? : String, text_align? : <a href="tiye/respo/lib/node#CssTextAlign">@tiye/respo/lib/node.CssTextAlign</a>, display? : <a href="tiye/respo/lib/node#CssDisplay">@tiye/respo/lib/node.CssDisplay</a>, margin? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, border? : <a href="tiye/respo/lib/node#CssBorder">@tiye/respo/lib/node.CssBorder</a>, width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, height? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, position? : <a href="tiye/respo/lib/node#CssPosition">@tiye/respo/lib/node.CssPosition</a>, top? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, right? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, bottom? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, left? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, float? : String, clear? : String, overflow? : <a href="tiye/respo/lib/node#CssOverflow">@tiye/respo/lib/node.CssOverflow</a>, z_index? : Int, flex? : float, flex_direction? : <a href="tiye/respo/lib/node#CssFlexDirection">@tiye/respo/lib/node.CssFlexDirection</a>, justify_content? : <a href="tiye/respo/lib/node#CssFlexJustifyContent">@tiye/respo/lib/node.CssFlexJustifyContent</a>, align_items? : <a href="tiye/respo/lib/node#CssFlexAlignItems">@tiye/respo/lib/node.CssFlexAlignItems</a>, align_content? : <a href="tiye/respo/lib/node#CssFlexAlignContent">@tiye/respo/lib/node.CssFlexAlignContent</a>, order? : Int, text_decoration? : <a href="tiye/respo/lib/node#CssTextDecoration">@tiye/respo/lib/node.CssTextDecoration</a>, text_transform? : String, line_height? : <a href="tiye/respo/lib/node#CssLineHeight">@tiye/respo/lib/node.CssLineHeight</a>, letter_spacing? : String, white_space? : String, word_break? : <a href="tiye/respo/lib/node#CssWordBreak">@tiye/respo/lib/node.CssWordBreak</a>, opacity? : Int, visibility? : String, box_shadow? : String, transition? : String, box_sizing? : <a href="tiye/respo/lib/node#CssBoxSizing">@tiye/respo/lib/node.CssBoxSizing</a>, border_radius? : float, padding_top? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding_bottom? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding_left? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, padding_right? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, min_width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, max_width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, vertical_align? : <a href="tiye/respo/lib/node#CssVerticalAlign">@tiye/respo/lib/node.CssVerticalAlign</a>, border_style? : <a href="tiye/respo/lib/node#CssBorderStyle">@tiye/respo/lib/node.CssBorderStyle</a>, border_color? : <a href="tiye/respo/lib/node#CssColor">@tiye/respo/lib/node.CssColor</a>, border_width? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, cursor? : <a href="tiye/respo/lib/node#CssCursor">@tiye/respo/lib/node.CssCursor</a>, transition_duration? : <a href="tiye/respo/lib/node#CssDuration">@tiye/respo/lib/node.CssDuration</a>, transform? : <a href="tiye/respo/lib/node#CssTransform">@tiye/respo/lib/node.CssTransform</a>, outline? : <a href="tiye/respo/lib/node#CssOutline">@tiye/respo/lib/node.CssOutline</a>, user_select? : <a href="tiye/respo/lib/node#CssUserSelect">@tiye/respo/lib/node.CssUserSelect</a>, margin_top? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, margin_bottom? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, margin_left? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, margin_right? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, max_height? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, transform_property? : <a href="moonbitlang/core/array#Array">Array</a>[String], gap? : <a href="tiye/respo/lib/node#CssSize">@tiye/respo/lib/node.CssSize</a>, content? : String, content_visibility? : <a href="tiye/respo/lib/node#CssContentVisibility">@tiye/respo/lib/node.CssContentVisibility</a>, filter? : <a href="tiye/respo/lib/node#CssFilter">@tiye/respo/lib/node.CssFilter</a>, object_fit? : <a href="tiye/respo/lib/node#CssObjectFit">@tiye/respo/lib/node.CssObjectFit</a>, overscroll_behavior_x? : <a href="tiye/respo/lib/node#CssOverscrollBehavior">@tiye/respo/lib/node.CssOverscrollBehavior</a>, overscroll_behavior_y? : <a href="tiye/respo/lib/node#CssOverscrollBehavior">@tiye/respo/lib/node.CssOverscrollBehavior</a>) -> <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>
```
 Create a new RespoStyle object

## space

```moonbit
:::source,tiye/respo/main/alias.mbt,538:::fn space[T](width~ : Int = .., height~ : Int = .., class_name? : String) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 create a `<div/>` element to render space.

## span

```moonbit
:::source,tiye/respo/main/alias.mbt,49:::fn span[T](class_name? : String, inner_text? : String, attrs~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., event~ : <a href="moonbitlang/core/builtin#Map">Map</a>[<a href="tiye/respo/lib/node#RespoEventType">@tiye/respo/lib/node.RespoEventType</a>, (<a href="tiye/respo/lib/node#RespoEvent">@tiye/respo/lib/node.RespoEvent</a>, <a href="tiye/respo/lib/node#DispatchFn">@tiye/respo/lib/node.DispatchFn</a>[T]) -> Unit!<a href="tiye/respo/lib/node#RespoCommonError">@tiye/respo/lib/node.RespoCommonError</a>] = .., style~ : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a> = .., children : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]]) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```


## str\_spaced

```moonbit
:::source,tiye/respo/main/util.mbt,34:::fn str_spaced(wrap_parens~ : Bool = .., s : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> String
```
 convert a list of strings to a single string with spaces between them,
mainly used for concatenating class names

## text\_node

```moonbit
:::source,tiye/respo/main/alias.mbt,80:::fn text_node[T](class_name? : String, style? : <a href="tiye/respo/lib/node#RespoStyle">@tiye/respo/lib/node.RespoStyle</a>, text : String) -> <a href="tiye/respo/lib/node#RespoNode">@tiye/respo/lib/node.RespoNode</a>[T]
```
 internally using span element to render text.

## ui\_button

```moonbit
:::source,tiye/respo/main/ui.mbt,75:::let ui_button : String
```


## ui\_center

```moonbit
:::source,tiye/respo/main/ui.mbt,166:::let ui_center : String
```
 layout items in column and center them with flexbox
demos https://ui.respo-mvc.org/\#/layouts.html

## ui\_input

```moonbit
:::source,tiye/respo/main/ui.mbt,43:::let ui_input : String
```


## ui\_row\_middle

```moonbit
:::source,tiye/respo/main/ui.mbt,365:::let ui_row_middle : String
```
 layout items in row with flexbox, space between
demos https://ui.respo-mvc.org/\#/layouts.html
