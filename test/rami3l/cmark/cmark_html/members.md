# Documentation
|Type|description|
|---|---|
|[HtmlRenderFootnote](#HtmlRenderFootnote)||
|[State](#State)||

|Value|description|
|---|---|
|[from\_doc](#from_doc)||
|[renderer](#renderer)||
|[safe](#safe)||
|[xhtml\_renderer](#xhtml_renderer)||

## HtmlRenderFootnote

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,11:::type HtmlRenderFootnote
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark_html/html.mbt,16:::fn output(<a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark_html/html.mbt,16:::fn to_json(<a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## State

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,2:::type State
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_html#State">State</a>
  ```
  > 
  * ```moonbit
    :::source,rami3l/cmark/cmark_html/html.mbt,8:::fn output(<a href="rami3l/cmark/cmark_html#State">State</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## from\_doc

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,944:::fn from_doc(backend_blocks~ : Bool = .., safe~ : Bool, doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> String!<a href="moonbitlang/core/error#Error">Error</a>
```


## renderer

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,918:::fn renderer(backend_blocks~ : Bool = .., safe~ : Bool) -> <a href="rami3l/cmark/cmark_renderer#Renderer">@rami3l/cmark/cmark_renderer.Renderer</a>
```


## safe

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,41:::fn safe(c : <a href="rami3l/cmark/cmark_renderer#Context">@rami3l/cmark/cmark_renderer.Context</a>) -> Bool
```


## xhtml\_renderer

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,931:::fn xhtml_renderer(backend_blocks~ : Bool = .., safe~ : Bool) -> <a href="rami3l/cmark/cmark_renderer#Renderer">@rami3l/cmark/cmark_renderer.Renderer</a>
```

