# Documentation
|Type|description|
|---|---|
|[Body](#Body)||
|[Expecting](#Expecting)||

|Value|description|
|---|---|
|[delete](#delete)||
|[get](#get)||
|[patch](#patch)||
|[post](#post)||

## Body

```moonbit
:::source,Yoorkin/rabbit-tea/http/http.mbt,8:::pub(all) enum Body {
  Json(<a href="moonbitlang/core/json#Json">Json</a>)
  Text(String)
  Empty
}
```


## Expecting

```moonbit
:::source,Yoorkin/rabbit-tea/http/http.mbt,2:::pub(all) enum Expecting {
  Json((<a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/json#Json">Json</a>, String]) -> Msg)
  Text((<a href="moonbitlang/core/result#Result">Result</a>[String, String]) -> Msg)
}
```


## delete

```moonbit
:::source,Yoorkin/rabbit-tea/http/http.mbt,108:::fn delete[M](url : String, expect~ : <a href="Yoorkin/rabbit-tea/http#Expecting">Expecting</a>[M]) -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```


## get

```moonbit
:::source,Yoorkin/rabbit-tea/http/http.mbt,103:::fn get[M](url : String, expect~ : <a href="Yoorkin/rabbit-tea/http#Expecting">Expecting</a>[M]) -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```


## patch

```moonbit
:::source,Yoorkin/rabbit-tea/http/http.mbt,122:::fn patch[M](url : String, body : <a href="Yoorkin/rabbit-tea/http#Body">Body</a>, expect~ : <a href="Yoorkin/rabbit-tea/http#Expecting">Expecting</a>[M]) -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```


## post

```moonbit
:::source,Yoorkin/rabbit-tea/http/http.mbt,113:::fn post[M](url : String, body : <a href="Yoorkin/rabbit-tea/http#Body">Body</a>, expect~ : <a href="Yoorkin/rabbit-tea/http#Expecting">Expecting</a>[M]) -> <a href="Yoorkin/rabbit-tea/browser#Command">@Yoorkin/rabbit-tea/browser.Command</a>[M]
```

