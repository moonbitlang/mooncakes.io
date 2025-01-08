# Documentation
|Type|description|
|---|---|
|[Header](#Header)| \`Header\` represents an HTTP Request header.|
|[Method](#Method)| \`Method\` represents an HTTP method.|
|[Request](#Request)| \`Request\` represents an HTTP request made by the Extism host.|
|[Response](#Response)| \`Response\` represents an HTTP response from the Extism host.|

|Value|description|
|---|---|
|[new\_request](#new_request)| \`new\_request\` returns a new \`Request\` using the provided|

## Header

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::pub(all) type Header <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
```
 `Header` represents an HTTP Request header.
Multiple values for a single key are not deduped.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::fn op_equal(<a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>, <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::fn output(<a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,3:::fn to_json(<a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,12:::fn <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>::add(self : <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>, key : String, value : String) -> Unit
  ```
  >  `add` adds a value to a named (by `key`) header field.
  > If the header key already exists, the value is appended after a comma.
- #### new
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,6:::fn <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>::new() -> <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>
  ```
  >  `Header::new` returns a new Header.
- #### set
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/header.mbt,20:::fn <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>::set(self : <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>, key : String, value : String) -> Unit
  ```
  >  `set` overwrites a value to a named (by `key`) header field.

## Method

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/http/method.mbt,3:::pub(all) enum Method {
  GET
  HEAD
  POST
  PUT
  DELETE
  CONNECT
  OPTIONS
  TRACE
  PATCH
}
```
 `Method` represents an HTTP method.
Descriptions are from: https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/method.mbt,22:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/moonbit-pdk/pdk/http#Method">Method</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/http/method.mbt,22:::fn output(<a href="gmlewis/moonbit-pdk/pdk/http#Method">Method</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/method.mbt,25:::fn <a href="gmlewis/moonbit-pdk/pdk/http#Method">Method</a>::to_json(self : <a href="gmlewis/moonbit-pdk/pdk/http#Method">Method</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  >  `Method::to_json` is required because `derive(ToJson)` generates `{"$tag":"GET"}` here instead of `"GET"`.

## Request

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,2:::pub(all) struct Request {
  http_method : <a href="gmlewis/moonbit-pdk/pdk/http#Method">Method</a>
  header : <a href="gmlewis/moonbit-pdk/pdk/http#Header">Header</a>
  url : String
}
```
 `Request` represents an HTTP request made by the Extism host.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/moonbit-pdk/pdk/http#Request">Request</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,6:::fn to_json(<a href="gmlewis/moonbit-pdk/pdk/http#Request">Request</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### send
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,24:::fn <a href="gmlewis/moonbit-pdk/pdk/http#Request">Request</a>::send(self : <a href="gmlewis/moonbit-pdk/pdk/http#Request">Request</a>, body~ : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">@gmlewis/moonbit-pdk/pdk/host.Memory</a>? = ..) -> <a href="gmlewis/moonbit-pdk/pdk/http#Response">Response</a>
  ```
  >  `send` sends the `Request` to the host, waits for a response,
  > and returns it to the caller.
  > Note that the (optional) `body` is freed by this call.

## Response

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,9:::pub(all) struct Response {
  status_code : Int
  body : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">@gmlewis/moonbit-pdk/pdk/host.Memory</a>
}
```
 `Response` represents an HTTP response from the Extism host.

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,52:::fn <a href="gmlewis/moonbit-pdk/pdk/http#Response">Response</a>::output(self : <a href="gmlewis/moonbit-pdk/pdk/http#Response">Response</a>) -> Unit
  ```
  >  `output` sends the (unprocessed) `Response` body to the Extism host "output".

## new\_request

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/http/http.mbt,16:::fn new_request(http_method : <a href="gmlewis/moonbit-pdk/pdk/http#Method">Method</a>, url : String) -> <a href="gmlewis/moonbit-pdk/pdk/http#Request">Request</a>
```
 `new_request` returns a new `Request` using the provided
`method` and `url`.
