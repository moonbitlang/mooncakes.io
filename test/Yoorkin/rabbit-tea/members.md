# Documentation
|Type|description|
|---|---|
|[Command](#Command)||

|Value|description|
|---|---|
|[batch](#batch)||
|[none](#none)||
|[startup](#startup)| Start the application.|
|[task](#task)||

## Command

```moonbit
:::source,Yoorkin/rabbit-tea/top.mbt,2:::type Command = <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```


## batch

```moonbit
:::source,Yoorkin/rabbit-tea/top.mbt,10:::fn batch[M](xs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]]) -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```


## none

```moonbit
:::source,Yoorkin/rabbit-tea/top.mbt,5:::fn none[M]() -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```


## startup

```moonbit
:::source,Yoorkin/rabbit-tea/top.mbt,20:::fn startup[Model, Message](model~ : Model, update~ : (Message, Model) -> (<a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[Message], Model), view~ : (Model) -> <a href="Yoorkin/rabbit-tea/html#Html">@Yoorkin/rabbit-tea/html.Html</a>[Message], initialize? : Message, url_changed? : (<a href="Yoorkin/rabbit-tea/browser#UrlRequest">@Yoorkin/rabbit-tea/browser.UrlRequest</a>) -> Message, url_request? : (<a href="Yoorkin/rabbit-tea/browser#UrlRequest">@Yoorkin/rabbit-tea/browser.UrlRequest</a>) -> Message) -> Unit
```
 Start the application.

## task

```moonbit
:::source,Yoorkin/rabbit-tea/top.mbt,15:::fn task[M](message : M) -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```

