# Documentation
|Type|description|
|---|---|
|[Protocol](#Protocol)||
|[Url](#Url)| Url|

|Value|description|
|---|---|
|[parse](#parse)||

## Protocol

```moonbit
:::source,Yoorkin/rabbit-tea/url/url.mbt,21:::pub(all) enum Protocol {
  Http
  Https
  Other(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,25:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/url/url.mbt,25:::fn compare(<a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>, <a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,25:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/url/url.mbt,25:::fn op_equal(<a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>, <a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/url/url.mbt,25:::fn output(<a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Url

```moonbit
:::source,Yoorkin/rabbit-tea/url/url.mbt,11:::pub(all) struct Url {
  protocol : <a href="Yoorkin/rabbit-tea/url#Protocol">Protocol</a>
  host : String
  port : Int?
  path : String
  query : String?
  fragment : String?
}
```
 Url
 
 ```text
  https://example.com:8042/over/there?name=ferret#nose
  \___/   \______________/\_________/ \_________/ \__/
    |            |            |            |        |
  scheme     authority       path        query   fragment
 ```
 
 This diagram is from https://package.elm-lang.org/packages/elm/url/latest/Url

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,18:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="Yoorkin/rabbit-tea/url#Url">Url</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/url/url.mbt,18:::fn compare(<a href="Yoorkin/rabbit-tea/url#Url">Url</a>, <a href="Yoorkin/rabbit-tea/url#Url">Url</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,18:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="Yoorkin/rabbit-tea/url#Url">Url</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/url/url.mbt,18:::fn op_equal(<a href="Yoorkin/rabbit-tea/url#Url">Url</a>, <a href="Yoorkin/rabbit-tea/url#Url">Url</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,18:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Yoorkin/rabbit-tea/url#Url">Url</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/rabbit-tea/url/url.mbt,18:::fn output(<a href="Yoorkin/rabbit-tea/url#Url">Url</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,Yoorkin/rabbit-tea/url/url.mbt,28:::fn <a href="Yoorkin/rabbit-tea/url#Url">Url</a>::to_string(self : <a href="Yoorkin/rabbit-tea/url#Url">Url</a>) -> String
  ```
  > 

## parse

```moonbit
:::source,Yoorkin/rabbit-tea/url/url.mbt,49:::fn parse(url : String) -> <a href="Yoorkin/rabbit-tea/url#Url">Url</a>
```

