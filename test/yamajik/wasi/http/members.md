# Documentation
|Type|description|
|---|---|
|[Authority](#Authority)||
|[Body](#Body)||
|[Client](#Client)||
|[ContentType](#ContentType)||
|[HTTPError](#HTTPError)||
|[Header](#Header)||
|[Headers](#Headers)||
|[Method](#Method)||
|[Middlewares](#Middlewares)||
|[Path](#Path)||
|[Query](#Query)||
|[Request](#Request)||
|[RequestError](#RequestError)||
|[RequestOptions](#RequestOptions)||
|[Response](#Response)||
|[Router](#Router)||
|[RouterNode](#RouterNode)||
|[RouterTree](#RouterTree)||
|[Scheme](#Scheme)||
|[Server](#Server)||
|[StatusCode](#StatusCode)||
|[URL](#URL)||
|[URLParseError](#URLParseError)||
|[URLParser](#URLParser)||
|[Handler](#Handler)||
|[Middleware](#Middleware)||

## Authority

```moonbit
:::source,yamajik/wasi/http/url.mbt,78:::type Authority
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/url.mbt,78:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Authority">Authority</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/url.mbt,78:::fn output(<a href="yamajik/wasi/http#Authority">Authority</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,81:::fn <a href="yamajik/wasi/http#Authority">Authority</a>::to_string(self : <a href="yamajik/wasi/http#Authority">Authority</a>) -> String
  ```
  > 

## Body

```moonbit
:::source,yamajik/wasi/http/body.mbt,2:::pub struct Body {
  data : String
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/body.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Body">Body</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/body.mbt,4:::fn output(<a href="yamajik/wasi/http#Body">Body</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,yamajik/wasi/http/body.mbt,17:::fn <a href="yamajik/wasi/http#Body">Body</a>::empty() -> <a href="yamajik/wasi/http#Body">Body</a>
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,yamajik/wasi/http/body.mbt,27:::fn <a href="yamajik/wasi/http#Body">Body</a>::from_json(data~ : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="yamajik/wasi/http#Body">Body</a>
  ```
  > 
- #### from\_text
  ```moonbit
  :::source,yamajik/wasi/http/body.mbt,22:::fn <a href="yamajik/wasi/http#Body">Body</a>::from_text(data~ : String) -> <a href="yamajik/wasi/http#Body">Body</a>
  ```
  > 
- #### json
  ```moonbit
  :::source,yamajik/wasi/http/body.mbt,32:::fn <a href="yamajik/wasi/http#Body">Body</a>::json(self : <a href="yamajik/wasi/http#Body">Body</a>) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="moonbitlang/core/json#ParseError">@moonbitlang/core/json.ParseError</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/wasi/http/body.mbt,7:::fn <a href="yamajik/wasi/http#Body">Body</a>::new(data~ : String) -> <a href="yamajik/wasi/http#Body">Body</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/body.mbt,12:::fn <a href="yamajik/wasi/http#Body">Body</a>::to_string(self : <a href="yamajik/wasi/http#Body">Body</a>) -> String
  ```
  > 

## Client

```moonbit
:::source,yamajik/wasi/http/client.mbt,2:::type Client
```


#### mooncakes-io-method-mark-Methods
- #### delete
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,90:::fn <a href="yamajik/wasi/http#Client">Client</a>::delete(self : <a href="yamajik/wasi/http#Client">Client</a>, path~ : String = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### get
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,46:::fn <a href="yamajik/wasi/http#Client">Client</a>::get(self : <a href="yamajik/wasi/http#Client">Client</a>, path~ : String = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,11:::fn <a href="yamajik/wasi/http#Client">Client</a>::new(url~ : String = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = .., middlewares~ : <a href="yamajik/wasi/http#Middlewares">Middlewares</a> = .., logger~ : <a href="yamajik/wasi/log#Logger">@yamajik/wasi/log.Logger</a> = ..) -> <a href="yamajik/wasi/http#Client">Client</a>
  ```
  > 
- #### patch
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,79:::fn <a href="yamajik/wasi/http#Client">Client</a>::patch(self : <a href="yamajik/wasi/http#Client">Client</a>, path~ : String = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### post
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,57:::fn <a href="yamajik/wasi/http#Client">Client</a>::post(self : <a href="yamajik/wasi/http#Client">Client</a>, path~ : String = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### put
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,68:::fn <a href="yamajik/wasi/http#Client">Client</a>::put(self : <a href="yamajik/wasi/http#Client">Client</a>, path~ : String = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### request
  ```moonbit
  :::source,yamajik/wasi/http/client.mbt,22:::fn <a href="yamajik/wasi/http#Client">Client</a>::request(self : <a href="yamajik/wasi/http#Client">Client</a>, path~ : String, method~ : <a href="yamajik/wasi/http#Method">Method</a>, headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 

## ContentType

```moonbit
:::source,yamajik/wasi/http/content_type.mbt,2:::pub(all) enum ContentType {
  TextPlain
  TextHtml
  ApplicationJson
  ApplicationXml
  ApplicationFormUrlEncoded
  MultipartFormData
  Other(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/content_type.mbt,10:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#ContentType">ContentType</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/content_type.mbt,10:::fn output(<a href="yamajik/wasi/http#ContentType">ContentType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/content_type.mbt,13:::fn <a href="yamajik/wasi/http#ContentType">ContentType</a>::to_string(self : <a href="yamajik/wasi/http#ContentType">ContentType</a>) -> String
  ```
  > 

## HTTPError

```moonbit
:::source,yamajik/wasi/http/errors.mbt,2:::pub(all) enum HTTPError {
  BadRequest(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  Unauthorized(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  Forbidden(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  NotFound(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  InternalServerError(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  NotImplemented(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  BadGateway(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  ServiceUnavailable(<a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
  Other(UInt, <a href="moonbitlang/core/builtin#ToJson">ToJson</a>)
}
```


#### mooncakes-io-method-mark-Methods
- #### code
  ```moonbit
  :::source,yamajik/wasi/http/errors.mbt,15:::fn <a href="yamajik/wasi/http#HTTPError">HTTPError</a>::code(self : <a href="yamajik/wasi/http#HTTPError">HTTPError</a>) -> <a href="yamajik/wasi/http#StatusCode">StatusCode</a>
  ```
  > 
- #### from\_error
  ```moonbit
  :::source,yamajik/wasi/http/errors.mbt,67:::fn <a href="yamajik/wasi/http#HTTPError">HTTPError</a>::from_error(err : <a href="moonbitlang/core/error#Error">Error</a>) -> <a href="yamajik/wasi/http#HTTPError">HTTPError</a>
  ```
  > 
- #### from\_response
  ```moonbit
  :::source,yamajik/wasi/http/errors.mbt,50:::fn <a href="yamajik/wasi/http#HTTPError">HTTPError</a>::from_response(resp : <a href="yamajik/wasi/http#Response">Response</a>) -> <a href="yamajik/wasi/http#HTTPError">HTTPError</a>?!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### json
  ```moonbit
  :::source,yamajik/wasi/http/errors.mbt,30:::fn <a href="yamajik/wasi/http#HTTPError">HTTPError</a>::json(self : <a href="yamajik/wasi/http#HTTPError">HTTPError</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_response
  ```moonbit
  :::source,yamajik/wasi/http/errors.mbt,45:::fn <a href="yamajik/wasi/http#HTTPError">HTTPError</a>::to_response(self : <a href="yamajik/wasi/http#HTTPError">HTTPError</a>) -> <a href="yamajik/wasi/http#Response">Response</a>
  ```
  > 

## Header

```moonbit
:::source,yamajik/wasi/http/header.mbt,2:::pub(all) enum Header {
  ContentType
  ContentLength
  Custom(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/header.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi/http#Header">Header</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/header.mbt,6:::fn op_equal(<a href="yamajik/wasi/http#Header">Header</a>, <a href="yamajik/wasi/http#Header">Header</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi/http/header.mbt,6:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="yamajik/wasi/http#Header">Header</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/header.mbt,6:::fn hash_combine(<a href="yamajik/wasi/http#Header">Header</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi/http/header.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Header">Header</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/header.mbt,6:::fn output(<a href="yamajik/wasi/http#Header">Header</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/header.mbt,9:::fn <a href="yamajik/wasi/http#Header">Header</a>::to_string(self : <a href="yamajik/wasi/http#Header">Header</a>) -> String
  ```
  > 

## Headers

```moonbit
:::source,yamajik/wasi/http/header.mbt,27:::type Headers
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/header.mbt,27:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="yamajik/wasi/http#Headers">Headers</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/header.mbt,27:::fn default() -> <a href="yamajik/wasi/http#Headers">Headers</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### merge
  ```moonbit
  :::source,yamajik/wasi/http/header.mbt,64:::fn <a href="yamajik/wasi/http#Headers">Headers</a>::merge(self : <a href="yamajik/wasi/http#Headers">Headers</a>, other : <a href="yamajik/wasi/http#Headers">Headers</a>) -> Unit
  ```
  > 

## Method

```moonbit
:::source,yamajik/wasi/http/method.mbt,2:::pub(all) enum Method {
  Get
  Post
  Put
  Delete
  Patch
  Options
  Head
  Trace
  Connect
  Other(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/method.mbt,13:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi/http#Method">Method</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/method.mbt,13:::fn op_equal(<a href="yamajik/wasi/http#Method">Method</a>, <a href="yamajik/wasi/http#Method">Method</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi/http/method.mbt,13:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="yamajik/wasi/http#Method">Method</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/method.mbt,13:::fn hash_combine(<a href="yamajik/wasi/http#Method">Method</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi/http/method.mbt,13:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Method">Method</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/method.mbt,13:::fn output(<a href="yamajik/wasi/http#Method">Method</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_string
  ```moonbit
  :::source,yamajik/wasi/http/method.mbt,32:::fn <a href="yamajik/wasi/http#Method">Method</a>::from_string(m : String) -> <a href="yamajik/wasi/http#Method">Method</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/method.mbt,16:::fn <a href="yamajik/wasi/http#Method">Method</a>::to_string(self : <a href="yamajik/wasi/http#Method">Method</a>) -> String
  ```
  > 

## Middlewares

```moonbit
:::source,yamajik/wasi/http/middleware.mbt,5:::type Middlewares
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,yamajik/wasi/http/middleware.mbt,8:::fn <a href="yamajik/wasi/http#Middlewares">Middlewares</a>::new(capacity~ : Int = ..) -> <a href="yamajik/wasi/http#Middlewares">Middlewares</a>
  ```
  > 
- #### push
  ```moonbit
  :::source,yamajik/wasi/http/middleware.mbt,13:::fn <a href="yamajik/wasi/http#Middlewares">Middlewares</a>::push(self : <a href="yamajik/wasi/http#Middlewares">Middlewares</a>, m : ((<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>) -> ((<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>)) -> Unit
  ```
  > 
- #### wrap
  ```moonbit
  :::source,yamajik/wasi/http/middleware.mbt,18:::fn <a href="yamajik/wasi/http#Middlewares">Middlewares</a>::wrap(self : <a href="yamajik/wasi/http#Middlewares">Middlewares</a>, h : (<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>) -> ((<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>)
  ```
  > 

## Path

```moonbit
:::source,yamajik/wasi/http/url.mbt,86:::type Path
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/url.mbt,86:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Path">Path</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/url.mbt,86:::fn output(<a href="yamajik/wasi/http#Path">Path</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### parts
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,99:::fn <a href="yamajik/wasi/http#Path">Path</a>::parts(self : <a href="yamajik/wasi/http#Path">Path</a>, skip_prefix~ : String = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
  ```
  > 
- #### starts\_with
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,94:::fn <a href="yamajik/wasi/http#Path">Path</a>::starts_with(self : <a href="yamajik/wasi/http#Path">Path</a>, prefix : String) -> Bool
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,89:::fn <a href="yamajik/wasi/http#Path">Path</a>::to_string(self : <a href="yamajik/wasi/http#Path">Path</a>) -> String
  ```
  > 

## Query

```moonbit
:::source,yamajik/wasi/http/url.mbt,51:::type Query
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/url.mbt,51:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Query">Query</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/url.mbt,51:::fn output(<a href="yamajik/wasi/http#Query">Query</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,59:::fn <a href="yamajik/wasi/http#Query">Query</a>::to_string(self : <a href="yamajik/wasi/http#Query">Query</a>) -> String
  ```
  > 

## Request

```moonbit
:::source,yamajik/wasi/http/request.mbt,23:::pub struct Request {
  url : <a href="yamajik/wasi/http#URL">URL</a>
  method : <a href="yamajik/wasi/http#Method">Method</a>
  headers : <a href="yamajik/wasi/http#Headers">Headers</a>
  body : <a href="yamajik/wasi/http#Body">Body</a>
  options : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,yamajik/wasi/http/request.mbt,32:::fn <a href="yamajik/wasi/http#Request">Request</a>::new(url~ : <a href="yamajik/wasi/http#URL">URL</a>, method~ : <a href="yamajik/wasi/http#Method">Method</a>, headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = .., options~ : <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a> = ..) -> <a href="yamajik/wasi/http#Request">Request</a>
  ```
  > 
- #### send
  ```moonbit
  :::source,yamajik/wasi/http/request.mbt,84:::fn <a href="yamajik/wasi/http#Request">Request</a>::send(self : <a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="yamajik/wasi/http#RequestError">RequestError</a>
  ```
  > 

## RequestError

```moonbit
:::source,yamajik/wasi/http/request.mbt,2:::pub enum RequestError {
  WASIError(<a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">@yamajik/wasi-bindings/interface/wasi/http/types.ErrorCode</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/request.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#RequestError">RequestError</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/request.mbt,4:::fn output(<a href="yamajik/wasi/http#RequestError">RequestError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## RequestOptions

```moonbit
:::source,yamajik/wasi/http/request.mbt,7:::pub type RequestOptions
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/request.mbt,9:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/request.mbt,9:::fn default() -> <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a>
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi/http/request.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#RequestOptions">RequestOptions</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/request.mbt,9:::fn output(<a href="yamajik/wasi/http#RequestOptions">RequestOptions</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Response

```moonbit
:::source,yamajik/wasi/http/response.mbt,2:::pub struct Response {
  status_code : <a href="yamajik/wasi/http#StatusCode">StatusCode</a>
  headers : <a href="yamajik/wasi/http#Headers">Headers</a>
  body : <a href="yamajik/wasi/http#Body">Body</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### json
  ```moonbit
  :::source,yamajik/wasi/http/response.mbt,27:::fn <a href="yamajik/wasi/http#Response">Response</a>::json(status_code~ : <a href="yamajik/wasi/http#StatusCode">StatusCode</a> = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., data~ : <a href="moonbitlang/core/json#Json">Json</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/wasi/http/response.mbt,9:::fn <a href="yamajik/wasi/http#Response">Response</a>::new(status_code~ : <a href="yamajik/wasi/http#StatusCode">StatusCode</a> = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., body~ : <a href="yamajik/wasi/http#Body">Body</a> = ..) -> <a href="yamajik/wasi/http#Response">Response</a>
  ```
  > 
- #### text
  ```moonbit
  :::source,yamajik/wasi/http/response.mbt,18:::fn <a href="yamajik/wasi/http#Response">Response</a>::text(status_code~ : <a href="yamajik/wasi/http#StatusCode">StatusCode</a> = .., headers~ : <a href="yamajik/wasi/http#Headers">Headers</a> = .., data~ : String = ..) -> <a href="yamajik/wasi/http#Response">Response</a>
  ```
  > 

## Router

```moonbit
:::source,yamajik/wasi/http/router.mbt,108:::type Router
```


#### mooncakes-io-method-mark-Methods
- #### on\_handle
  ```moonbit
  :::source,yamajik/wasi/http/router.mbt,123:::fn <a href="yamajik/wasi/http#Router">Router</a>::on_handle(self : <a href="yamajik/wasi/http#Router">Router</a>, path~ : String, method~ : <a href="yamajik/wasi/http#Method">Method</a>, handler~ : (<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>) -> Unit
  ```
  > 

## RouterNode

```moonbit
:::source,yamajik/wasi/http/router.mbt,2:::type RouterNode
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/router.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#RouterNode">RouterNode</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/router.mbt,6:::fn output(<a href="yamajik/wasi/http#RouterNode">RouterNode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### matches
  ```moonbit
  :::source,yamajik/wasi/http/router.mbt,29:::fn <a href="yamajik/wasi/http#RouterNode">RouterNode</a>::matches(self : <a href="yamajik/wasi/http#RouterNode">RouterNode</a>, s : String) -> Bool
  ```
  > 

## RouterTree

```moonbit
:::source,yamajik/wasi/http/router.mbt,38:::type RouterTree
```


## Scheme

```moonbit
:::source,yamajik/wasi/http/url.mbt,8:::type Scheme
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/url.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#Scheme">Scheme</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/url.mbt,12:::fn output(<a href="yamajik/wasi/http#Scheme">Scheme</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,15:::fn <a href="yamajik/wasi/http#Scheme">Scheme</a>::to_string(self : <a href="yamajik/wasi/http#Scheme">Scheme</a>) -> String
  ```
  > 

## Server

```moonbit
:::source,yamajik/wasi/http/server.mbt,2:::type Server
```


#### mooncakes-io-method-mark-Methods
- #### handle
  ```moonbit
  :::source,yamajik/wasi/http/server.mbt,51:::fn <a href="yamajik/wasi/http#Server">Server</a>::handle(self : <a href="yamajik/wasi/http#Server">Server</a>, req : <a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="yamajik/wasi/http#HTTPError">HTTPError</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/wasi/http/server.mbt,9:::fn <a href="yamajik/wasi/http#Server">Server</a>::new(router~ : <a href="yamajik/wasi/http#Router">Router</a> = .., middlewares~ : <a href="yamajik/wasi/http#Middlewares">Middlewares</a> = .., logger~ : <a href="yamajik/wasi/log#Logger">@yamajik/wasi/log.Logger</a> = ..) -> <a href="yamajik/wasi/http#Server">Server</a>
  ```
  > 
- #### on\_handle
  ```moonbit
  :::source,yamajik/wasi/http/server.mbt,18:::fn <a href="yamajik/wasi/http#Server">Server</a>::on_handle(self : <a href="yamajik/wasi/http#Server">Server</a>, path~ : String, method~ : <a href="yamajik/wasi/http#Method">Method</a>, handler~ : (<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>) -> Unit
  ```
  > 
- #### router
  ```moonbit
  :::source,yamajik/wasi/http/server.mbt,28:::fn <a href="yamajik/wasi/http#Server">Server</a>::router(self : <a href="yamajik/wasi/http#Server">Server</a>, prefix : String) -> <a href="yamajik/wasi/http#Router">Router</a>
  ```
  > 
- #### serve
  ```moonbit
  :::source,yamajik/wasi/http/server.mbt,33:::fn <a href="yamajik/wasi/http#Server">Server</a>::serve(self : <a href="yamajik/wasi/http#Server">Server</a>, p0 : Int, p1 : Int) -> Unit
  ```
  > 

## StatusCode

```moonbit
:::source,yamajik/wasi/http/status_code.mbt,2:::pub enum StatusCode {
  Ok
  Created
  Accepted
  NoContent
  MultipleChoices
  MovedPermanently
  Found
  SeeOther
  NotModified
  UseProxy
  TemporaryRedirect
  PermanentRedirect
  BadRequest
  Unauthorized
  Forbidden
  NotFound
  InternalServerError
  NotImplemented
  BadGateway
  ServiceUnavailable
  Other(UInt)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/status_code.mbt,24:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#StatusCode">StatusCode</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/status_code.mbt,24:::fn output(<a href="yamajik/wasi/http#StatusCode">StatusCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### is\_error
  ```moonbit
  :::source,yamajik/wasi/http/status_code.mbt,86:::fn <a href="yamajik/wasi/http#StatusCode">StatusCode</a>::is_error(self : <a href="yamajik/wasi/http#StatusCode">StatusCode</a>) -> Bool
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/status_code.mbt,27:::fn <a href="yamajik/wasi/http#StatusCode">StatusCode</a>::to_string(self : <a href="yamajik/wasi/http#StatusCode">StatusCode</a>) -> String
  ```
  > 

## URL

```moonbit
:::source,yamajik/wasi/http/url.mbt,108:::pub struct URL {
  scheme : <a href="yamajik/wasi/http#Scheme">Scheme</a>
  authority : <a href="yamajik/wasi/http#Authority">Authority</a>
  path : <a href="yamajik/wasi/http#Path">Path</a>
  query : <a href="yamajik/wasi/http#Query">Query</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/url.mbt,113:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#URL">URL</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/url.mbt,113:::fn output(<a href="yamajik/wasi/http#URL">URL</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### parse
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,116:::fn <a href="yamajik/wasi/http#URL">URL</a>::parse(url : String) -> <a href="yamajik/wasi/http#URL">URL</a>!<a href="yamajik/wasi/http#URLParseError">URLParseError</a>
  ```
  > 
- #### parse\_path\_with\_query
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,121:::fn <a href="yamajik/wasi/http#URL">URL</a>::parse_path_with_query(scheme : <a href="yamajik/wasi/http#Scheme">Scheme</a>, authority : String, path_with_query : String) -> <a href="yamajik/wasi/http#URL">URL</a>
  ```
  > 
- #### path\_with\_query
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,136:::fn <a href="yamajik/wasi/http#URL">URL</a>::path_with_query(self : <a href="yamajik/wasi/http#URL">URL</a>) -> String
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi/http/url.mbt,131:::fn <a href="yamajik/wasi/http#URL">URL</a>::to_string(self : <a href="yamajik/wasi/http#URL">URL</a>) -> String
  ```
  > 

## URLParseError

```moonbit
:::source,yamajik/wasi/http/url.mbt,2:::type URLParseError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/http/url.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/http#URLParseError">URLParseError</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/http/url.mbt,5:::fn output(<a href="yamajik/wasi/http#URLParseError">URLParseError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## URLParser

```moonbit
:::source,yamajik/wasi/http/url.mbt,141:::type URLParser
```


## Handler

```moonbit
:::source,yamajik/wasi/http/handler.mbt,2:::type Handler = (<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>
```


## Middleware

```moonbit
:::source,yamajik/wasi/http/middleware.mbt,2:::type Middleware = ((<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>) -> ((<a href="yamajik/wasi/http#Request">Request</a>) -> <a href="yamajik/wasi/http#Response">Response</a>!<a href="moonbitlang/core/error#Error">Error</a>)
```

