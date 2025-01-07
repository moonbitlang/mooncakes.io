# Documentation
|Type|description|
|---|---|
|[HtmlRenderFootnote](#HtmlRenderFootnote)||
|[State](#State)||

|Value|description|
|---|---|
|[buffer\_add\_html\_escaped\_char](#buffer_add_html_escaped_char)||
|[buffer\_add\_html\_escaped\_string](#buffer_add_html_escaped_string)||
|[buffer\_add\_pct\_encoded\_string](#buffer_add_pct_encoded_string)||
|[from\_doc](#from_doc)||
|[html\_escaped\_char](#html_escaped_char)||
|[html\_escaped\_string](#html_escaped_string)||
|[pct\_encoded\_string](#pct_encoded_string)||
|[renderer](#renderer)||
|[safe](#safe)||
|[xhtml\_renderer](#xhtml_renderer)||

## HtmlRenderFootnote

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,11:::type HtmlRenderFootnote
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a> with output(<a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a> with to_json(<a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::fn <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::fn <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>::output(<a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,16:::fn <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>::to_json(<a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_html/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_html#HtmlRenderFootnote">HtmlRenderFootnote</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## State

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,2:::type State
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="rami3l/cmark/cmark_html#State">State</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_html#State">State</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_html#State">State</a> with output(<a href="rami3l/cmark/cmark_html#State">State</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="rami3l/cmark/cmark_html#State">State</a> with to_json(<a href="rami3l/cmark/cmark_html#State">State</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::fn <a href="rami3l/cmark/cmark_html#State">State</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="rami3l/cmark/cmark_html#State">State</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::fn <a href="rami3l/cmark/cmark_html#State">State</a>::output(<a href="rami3l/cmark/cmark_html#State">State</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,rami3l/cmark/cmark_html/html.mbt,8:::fn <a href="rami3l/cmark/cmark_html#State">State</a>::to_json(<a href="rami3l/cmark/cmark_html#State">State</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_html/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_html#State">State</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## buffer\_add\_html\_escaped\_char

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,125:::fn buffer_add_html_escaped_char(b : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, ch : Char) -> Unit
```


## buffer\_add\_html\_escaped\_string

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,143:::fn buffer_add_html_escaped_string(b : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, s : String) -> Unit
```


## buffer\_add\_pct\_encoded\_string

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,202:::fn buffer_add_pct_encoded_string(b : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, s : String) -> Unit
```


## from\_doc

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,919:::fn from_doc(backend_blocks~ : Bool = .., safe~ : Bool, doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> String!<a href="moonbitlang/core/error#Error">Error</a>
```


## html\_escaped\_char

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,138:::fn html_escaped_char(c : <a href="rami3l/cmark/cmark_renderer#Context">@rami3l/cmark/cmark_renderer.Context</a>, ch : Char) -> Unit
```


## html\_escaped\_string

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,197:::fn html_escaped_string(c : <a href="rami3l/cmark/cmark_renderer#Context">@rami3l/cmark/cmark_renderer.Context</a>, s : String) -> Unit
```


## pct\_encoded\_string

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,246:::fn pct_encoded_string(c : <a href="rami3l/cmark/cmark_renderer#Context">@rami3l/cmark/cmark_renderer.Context</a>, s : String) -> Unit
```


## renderer

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,893:::fn renderer(backend_blocks~ : Bool = .., safe~ : Bool) -> <a href="rami3l/cmark/cmark_renderer#Renderer">@rami3l/cmark/cmark_renderer.Renderer</a>
```


## safe

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,26:::fn safe(c : <a href="rami3l/cmark/cmark_renderer#Context">@rami3l/cmark/cmark_renderer.Context</a>) -> Bool
```


## xhtml\_renderer

```moonbit
:::source,rami3l/cmark/cmark_html/html.mbt,906:::fn xhtml_renderer(backend_blocks~ : Bool = .., safe~ : Bool) -> <a href="rami3l/cmark/cmark_renderer#Renderer">@rami3l/cmark/cmark_renderer.Renderer</a>
```

