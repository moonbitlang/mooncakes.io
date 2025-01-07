# Documentation
|Type|description|
|---|---|
|[Context](#Context)||
|[RenderError](#RenderError)||
|[Renderer](#Renderer)| Renderer abstraction.|
|[BlockFn](#BlockFn)||
|[DocFn](#DocFn)||
|[InitContextFn](#InitContextFn)||
|[InlineFn](#InlineFn)||

## Context

```moonbit
:::source,rami3l/cmark/cmark_renderer/renderer.mbt,34:::pub(all) struct Context {
  renderer : <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>
  state : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/json#Json">Json</a>]
  b : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>
  doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### block
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,88:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::block(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, block : <a href="rami3l/cmark/cmark#Block">@rami3l/cmark/cmark.Block</a>) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### byte
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,64:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::byte(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, byte : Byte) -> Unit
  ```
  > 
- #### char
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,69:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::char(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, ch : Char) -> Unit
  ```
  > 
- #### doc
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,97:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::doc(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### init
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,47:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::init(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Unit
  ```
  > 
- #### inline
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,79:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::inline(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, inline : <a href="rami3l/cmark/cmark#Inline">@rami3l/cmark/cmark.Inline</a>) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,42:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::new(renderer : <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>, b : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>) -> <a href="rami3l/cmark/cmark_renderer#Context">Context</a>
  ```
  > 
- #### string
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,74:::fn <a href="rami3l/cmark/cmark_renderer#Context">Context</a>::string(self : <a href="rami3l/cmark/cmark_renderer#Context">Context</a>, str : String) -> Unit
  ```
  > 

## RenderError

```moonbit
:::source,rami3l/cmark/cmark_renderer/error.mbt,2:::pub(all) type! RenderError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,rami3l/cmark/cmark_renderer/error.mbt,2:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="rami3l/cmark/cmark_renderer#RenderError">RenderError</a> with output(<a href="rami3l/cmark/cmark_renderer#RenderError">RenderError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/error.mbt,2:::fn <a href="rami3l/cmark/cmark_renderer#RenderError">RenderError</a>::output(<a href="rami3l/cmark/cmark_renderer#RenderError">RenderError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/traits.mbt,85:::fn <a href="rami3l/cmark/cmark_renderer#RenderError">RenderError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Renderer

```moonbit
:::source,rami3l/cmark/cmark_renderer/renderer.mbt,4:::pub(all) struct Renderer {
  init_context : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Unit
  inline : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Inline">@rami3l/cmark/cmark.Inline</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
  block : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Block">@rami3l/cmark/cmark.Block</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
  doc : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
}
```
 Renderer abstraction.

 Stateful renderer abstraction to render documents in memory.

#### mooncakes-io-method-mark-Methods
- #### buffer\_add\_doc
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,115:::fn <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>::buffer_add_doc(self : <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>, buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### compose
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,22:::fn <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>::compose(self : <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>, other : <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>) -> <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>
  ```
  > 
- #### doc\_to\_string
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,108:::fn <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>::doc_to_string(self : <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>, doc : <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> String!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,rami3l/cmark/cmark_renderer/renderer.mbt,12:::fn <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>::new(init_context~ : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Unit = .., inline~ : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Inline">@rami3l/cmark/cmark.Inline</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a> = .., block~ : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Block">@rami3l/cmark/cmark.Block</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a> = .., doc~ : (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a> = ..) -> <a href="rami3l/cmark/cmark_renderer#Renderer">Renderer</a>
  ```
  > 

## BlockFn

```moonbit
:::source,rami3l/cmark/cmark_renderer/renderer.mbt,58:::type BlockFn = (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Block">@rami3l/cmark/cmark.Block</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
```


## DocFn

```moonbit
:::source,rami3l/cmark/cmark_renderer/renderer.mbt,61:::type DocFn = (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
```


## InitContextFn

```moonbit
:::source,rami3l/cmark/cmark_renderer/renderer.mbt,52:::type InitContextFn = (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Doc">@rami3l/cmark/cmark.Doc</a>) -> Unit
```


## InlineFn

```moonbit
:::source,rami3l/cmark/cmark_renderer/renderer.mbt,55:::type InlineFn = (<a href="rami3l/cmark/cmark_renderer#Context">Context</a>, <a href="rami3l/cmark/cmark#Inline">@rami3l/cmark/cmark.Inline</a>) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
```

