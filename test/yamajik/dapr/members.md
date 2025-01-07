# Documentation
|Type|description|
|---|---|
|[DaprError](#DaprError)||
|[HTTPClient](#HTTPClient)||
|[HTTPServer](#HTTPServer)||

## DaprError

```moonbit
:::source,yamajik/dapr/errors.mbt,1:::pub(all) enum DaprError {
  InvalidArgument(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
}
```


## HTTPClient

```moonbit
:::source,yamajik/dapr/client.mbt,2:::type HTTPClient
```


#### mooncakes-io-method-mark-Methods
- #### invoke
  ```moonbit
  :::source,yamajik/dapr/client.mbt,24:::fn <a href="yamajik/dapr#HTTPClient">HTTPClient</a>::invoke[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](self : <a href="yamajik/dapr#HTTPClient">HTTPClient</a>, app~ : String, method~ : String, data~ : A) -> B!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/dapr/client.mbt,8:::fn <a href="yamajik/dapr#HTTPClient">HTTPClient</a>::new(url~ : String = .., runtime_version~ : String = ..) -> <a href="yamajik/dapr#HTTPClient">HTTPClient</a>
  ```
  > 

## HTTPServer

```moonbit
:::source,yamajik/dapr/server.mbt,2:::pub struct HTTPServer {
  server : <a href="yamajik/wasi/http#Server">@yamajik/wasi/http.Server</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,yamajik/dapr/server.mbt,7:::fn <a href="yamajik/dapr#HTTPServer">HTTPServer</a>::new(server~ : <a href="yamajik/wasi/http#Server">@yamajik/wasi/http.Server</a> = ..) -> <a href="yamajik/dapr#HTTPServer">HTTPServer</a>
  ```
  > 
- #### on\_binding
  ```moonbit
  :::source,yamajik/dapr/server.mbt,29:::fn <a href="yamajik/dapr#HTTPServer">HTTPServer</a>::on_binding[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="yamajik/dapr#HTTPServer">HTTPServer</a>, name~ : String, method~ : <a href="yamajik/wasi/http#Method">@yamajik/wasi/http.Method</a> = .., handler~ : (A) -> B!<a href="moonbitlang/core/error#Error">Error</a>) -> Unit
  ```
  > 
- #### on\_invoke
  ```moonbit
  :::source,yamajik/dapr/server.mbt,14:::fn <a href="yamajik/dapr#HTTPServer">HTTPServer</a>::on_invoke[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="yamajik/dapr#HTTPServer">HTTPServer</a>, name~ : String, method~ : <a href="yamajik/wasi/http#Method">@yamajik/wasi/http.Method</a> = .., handler~ : (A) -> B!<a href="moonbitlang/core/error#Error">Error</a>) -> Unit
  ```
  > 
- #### serve
  ```moonbit
  :::source,yamajik/dapr/server.mbt,44:::fn <a href="yamajik/dapr#HTTPServer">HTTPServer</a>::serve(self : <a href="yamajik/dapr#HTTPServer">HTTPServer</a>, p0 : Int, p1 : Int) -> Unit
  ```
  > 
