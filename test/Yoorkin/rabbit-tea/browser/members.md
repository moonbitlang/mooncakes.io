# Documentation
|Type|description|
|---|---|
|[Command](#Command)||
|[PredefinedEvent](#PredefinedEvent)||
|[Sandbox](#Sandbox)||
|[UrlRequest](#UrlRequest)||

|Value|description|
|---|---|
|[back](#back)||
|[batch](#batch)||
|[forward](#forward)||
|[load](#load)||
|[none](#none)||
|[push\_url](#push_url)||
|[reload](#reload)||
|[replace\_url](#replace_url)| |
|[scroll\_by\_pos](#scroll_by_pos)||
|[scroll\_to](#scroll_to)||
|[scroll\_to\_bottom](#scroll_to_bottom)||
|[scroll\_to\_pos](#scroll_to_pos)||
|[scroll\_to\_top](#scroll_to_top)||
|[task](#task)||

## Command

```moonbit
:::source,Yoorkin/rabbit-tea/browser/command.mbt,2:::pub(all) type Command (<a href="Yoorkin/rabbit-tea/browser#PredefinedEvent">PredefinedEvent</a>, (M) -> Unit) -> Unit
```


#### mooncakes-io-method-mark-Methods
- #### map
  ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/command.mbt,5:::fn <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>::map[A, B](self : <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[A], f : (A) -> B) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[B]
  ```
  >  Map the messages in the command to another type.

## PredefinedEvent

```moonbit
:::source,Yoorkin/rabbit-tea/browser/sandbox.mbt,12:::pub(all) struct PredefinedEvent {
  on_url_changed : (<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>) -> Unit
  on_url_request : (<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>) -> Unit
}
```


## Sandbox

```moonbit
:::source,Yoorkin/rabbit-tea/browser/sandbox.mbt,2:::type Sandbox
```


#### mooncakes-io-method-mark-Methods
- #### launch
  ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/command.mbt,14:::fn <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>::launch[M, Model, View](self : <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>[M, Model, View], cmd : <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]) -> Unit
  ```
  >  Launch commands. It may trigger the update function.
- #### new
  ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/sandbox.mbt,40:::fn <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>::new[Model, Msg, View](model : Model, update : (Msg, Model) -> (<a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[Msg], Model), view : (Model) -> View, after_update~ : (View) -> Unit, attach_to~ : String = .., url_changed? : (<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>) -> Msg, url_request? : (<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>) -> Msg) -> <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>[Msg, Model, View]
  ```
  > 
- #### refersh
  ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/sandbox.mbt,34:::fn <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>::refersh[Msg, Model, View](self : <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>[Msg, Model, View]) -> Unit
  ```
  >  Refresh the view.
  > This function will call the view function and patch the result to the DOM.
- #### update
  ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/sandbox.mbt,18:::fn <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>::update[Msg, Model, View](self : <a href="Yoorkin/rabbit-tea/browser#Sandbox">Sandbox</a>[Msg, Model, View], message : Msg) -> Unit
  ```
  >  Update the model and launch commands.

## UrlRequest

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,2:::pub(all) enum UrlRequest {
  Internal(<a href="Yoorkin/rabbit-tea/url#Url">@Yoorkin/rabbit-tea/url.Url</a>)
  External(<a href="Yoorkin/rabbit-tea/url#Url">@Yoorkin/rabbit-tea/url.Url</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/navigation.mbt,5:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/browser/navigation.mbt,5:::fn compare(<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>, <a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/navigation.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/browser/navigation.mbt,5:::fn op_equal(<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>, <a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,Yoorkin/rabbit-tea/browser/navigation.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/browser/navigation.mbt,5:::fn output(<a href="Yoorkin/rabbit-tea/browser#UrlRequest">UrlRequest</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## back

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,8:::fn back[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## batch

```moonbit
:::source,Yoorkin/rabbit-tea/browser/command.mbt,29:::fn batch[M](xs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]]) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## forward

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,13:::fn forward[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## load

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,18:::fn load[M](url : String) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## none

```moonbit
:::source,Yoorkin/rabbit-tea/browser/command.mbt,24:::fn none[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## push\_url

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,28:::fn push_url[M](url : String) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## reload

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,23:::fn reload[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## replace\_url

```moonbit
:::source,Yoorkin/rabbit-tea/browser/navigation.mbt,37:::fn replace_url[M](url : String) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```
 

## scroll\_by\_pos

```moonbit
:::source,Yoorkin/rabbit-tea/browser/scroll.mbt,7:::fn scroll_by_pos[M](x : Int, y : Int) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## scroll\_to

```moonbit
:::source,Yoorkin/rabbit-tea/browser/scroll.mbt,12:::fn scroll_to[M](element : String) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## scroll\_to\_bottom

```moonbit
:::source,Yoorkin/rabbit-tea/browser/scroll.mbt,22:::fn scroll_to_bottom[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## scroll\_to\_pos

```moonbit
:::source,Yoorkin/rabbit-tea/browser/scroll.mbt,2:::fn scroll_to_pos[M](x : Int, y : Int) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## scroll\_to\_top

```moonbit
:::source,Yoorkin/rabbit-tea/browser/scroll.mbt,17:::fn scroll_to_top[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```


## task

```moonbit
:::source,Yoorkin/rabbit-tea/browser/command.mbt,34:::fn task[M](message : M) -> <a href="Yoorkin/rabbit-tea/browser#Command">Command</a>[M]
```

