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
  :::source,tiye/respo/main/counter.mbt,5:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#MainState">MainState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/counter.mbt,5:::fn default() -> <a href="tiye/respo/main#MainState">MainState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#MainState">MainState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/counter.mbt,5:::fn to_json(<a href="tiye/respo/main#MainState">MainState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/counter.mbt,5:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#MainState">MainState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/counter.mbt,5:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#MainState">MainState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## PanelMount

```moonbit
:::source,tiye/respo/main/panel.mbt,8:::type PanelMount
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,8:::fn default() -> <a href="tiye/respo/main#PanelMount">PanelMount</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,8:::fn op_equal(<a href="tiye/respo/main#PanelMount">PanelMount</a>, <a href="tiye/respo/main#PanelMount">PanelMount</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,8:::fn to_json(<a href="tiye/respo/main#PanelMount">PanelMount</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,8:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#PanelMount">PanelMount</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,8:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#PanelMount">PanelMount</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## PanelState

```moonbit
:::source,tiye/respo/main/panel.mbt,2:::type PanelState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#PanelState">PanelState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,4:::fn default() -> <a href="tiye/respo/main#PanelState">PanelState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#PanelState">PanelState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,4:::fn to_json(<a href="tiye/respo/main#PanelState">PanelState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/panel.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#PanelState">PanelState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/panel.mbt,4:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#PanelState">PanelState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## Store

```moonbit
:::source,tiye/respo/main/store.mbt,2:::type Store
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/store.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#Store">Store</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,6:::fn to_json(<a href="tiye/respo/main#Store">Store</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,6:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#Store">Store</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,6:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#Store">Store</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## Task

```moonbit
:::source,tiye/respo/main/store.mbt,14:::type Task
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#Task">Task</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,19:::fn default() -> <a href="tiye/respo/main#Task">Task</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#Task">Task</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,19:::fn op_equal(<a href="tiye/respo/main#Task">Task</a>, <a href="tiye/respo/main#Task">Task</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/main#Task">Task</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,19:::fn hash_combine(<a href="tiye/respo/main#Task">Task</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#Task">Task</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,19:::fn to_json(<a href="tiye/respo/main#Task">Task</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/store.mbt,19:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#Task">Task</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/store.mbt,19:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#Task">Task</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## TaskState

```moonbit
:::source,tiye/respo/main/task.mbt,2:::type TaskState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,4:::fn default() -> <a href="tiye/respo/main#TaskState">TaskState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,4:::fn op_equal(<a href="tiye/respo/main#TaskState">TaskState</a>, <a href="tiye/respo/main#TaskState">TaskState</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,4:::fn hash_combine(<a href="tiye/respo/main#TaskState">TaskState</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,4:::fn to_json(<a href="tiye/respo/main#TaskState">TaskState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#TaskState">TaskState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,4:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TaskState">TaskState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## TaskUpdateEffect

```moonbit
:::source,tiye/respo/main/task.mbt,7:::type TaskUpdateEffect
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,9:::fn default() -> <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,9:::fn op_equal(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>, <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,9:::fn hash_combine(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,9:::fn to_json(<a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/task.mbt,9:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/task.mbt,9:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TaskUpdateEffect">TaskUpdateEffect</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## TodolistState

```moonbit
:::source,tiye/respo/main/todolist.mbt,2:::type TodolistState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/todolist.mbt,4:::fn default() -> <a href="tiye/respo/main#TodolistState">TodolistState</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/todolist.mbt,4:::fn op_equal(<a href="tiye/respo/main#TodolistState">TodolistState</a>, <a href="tiye/respo/main#TodolistState">TodolistState</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/todolist.mbt,4:::fn to_json(<a href="tiye/respo/main#TodolistState">TodolistState</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/respo/main/todolist.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/respo/main#TodolistState">TodolistState</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/respo/main/todolist.mbt,4:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/respo/main#TodolistState">TodolistState</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived
