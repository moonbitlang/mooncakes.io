This interface defines all of the types and methods for implementing
HTTP Requests and Responses, both incoming and outgoing, as well as
their headers, trailers, and bodies.
---
# Documentation
|Type|description|
|---|---|
|[DnsErrorPayload](#DnsErrorPayload)| Defines the case payload type for \`DNS-error\` above:|
|[ErrorCode](#ErrorCode)| These cases are inspired by the IANA HTTP Proxy Error Types:|
|[FieldSizePayload](#FieldSizePayload)| Defines the case payload type for \`HTTP-response-{header,trailer}-size\` above:|
|[Fields](#Fields)| This following block defines the \`fields\` resource which corresponds to|
|[FutureIncomingResponse](#FutureIncomingResponse)| Represents a future which may eventaully return an incoming HTTP|
|[FutureTrailers](#FutureTrailers)| Represents a future which may eventaully return trailers, or an error.|
|[HeaderError](#HeaderError)| This type enumerates the different kinds of errors that may occur when|
|[IncomingBody](#IncomingBody)| Represents an incoming HTTP Request or Response's Body.|
|[IncomingRequest](#IncomingRequest)| Represents an incoming HTTP Request.|
|[IncomingResponse](#IncomingResponse)| Represents an incoming HTTP Response.|
|[Method](#Method)| This type corresponds to HTTP standard Methods.|
|[OutgoingBody](#OutgoingBody)| Represents an outgoing HTTP Request or Response's Body.|
|[OutgoingRequest](#OutgoingRequest)| Represents an outgoing HTTP Request.|
|[OutgoingResponse](#OutgoingResponse)| Represents an outgoing HTTP Response.|
|[RequestOptions](#RequestOptions)| Parameters for making an HTTP Request. Each of these parameters is|
|[ResponseOutparam](#ResponseOutparam)| Represents the ability to send an HTTP Response.|
|[Scheme](#Scheme)| This type corresponds to HTTP standard Related Schemes.|
|[TlsAlertReceivedPayload](#TlsAlertReceivedPayload)| Defines the case payload type for \`TLS-alert-received\` above:|

|Value|description|
|---|---|
|[http\_error\_code](#http_error_code)| Attempts to extract a http-related \`error\` from the wasi:io \`error\`|

## DnsErrorPayload

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,24:::pub(all) struct DnsErrorPayload {
  rcode : String?
  info_code : UInt?
}
```
 Defines the case payload type for `DNS-error` above:

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,27:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#DnsErrorPayload">DnsErrorPayload</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,27:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#DnsErrorPayload">DnsErrorPayload</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#DnsErrorPayload">DnsErrorPayload</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,27:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#DnsErrorPayload">DnsErrorPayload</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,27:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#DnsErrorPayload">DnsErrorPayload</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## ErrorCode

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,43:::pub(all) enum ErrorCode {
  DnsTimeout
  DnsError(<a href="yamajik/wasi-bindings/interface/wasi/http/types#DnsErrorPayload">DnsErrorPayload</a>)
  DestinationNotFound
  DestinationUnavailable
  DestinationIpProhibited
  DestinationIpUnroutable
  ConnectionRefused
  ConnectionTerminated
  ConnectionTimeout
  ConnectionReadTimeout
  ConnectionWriteTimeout
  ConnectionLimitReached
  TlsProtocolError
  TlsCertificateError
  TlsAlertReceived(<a href="yamajik/wasi-bindings/interface/wasi/http/types#TlsAlertReceivedPayload">TlsAlertReceivedPayload</a>)
  HttpRequestDenied
  HttpRequestLengthRequired
  HttpRequestBodySize(UInt64?)
  HttpRequestMethodInvalid
  HttpRequestUriInvalid
  HttpRequestUriTooLong
  HttpRequestHeaderSectionSize(UInt?)
  HttpRequestHeaderSize(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>?)
  HttpRequestTrailerSectionSize(UInt?)
  HttpRequestTrailerSize(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>)
  HttpResponseIncomplete
  HttpResponseHeaderSectionSize(UInt?)
  HttpResponseHeaderSize(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>)
  HttpResponseBodySize(UInt64?)
  HttpResponseTrailerSectionSize(UInt?)
  HttpResponseTrailerSize(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>)
  HttpResponseTransferCoding(String?)
  HttpResponseContentCoding(String?)
  HttpResponseTimeout
  HttpUpgradeFailed
  HttpProtocolError
  LoopDetected
  ConfigurationError
  InternalError(String?)
}
```
 These cases are inspired by the IANA HTTP Proxy Error Types:
https://www.iana.org/assignments/http-proxy-status/http-proxy-status.xhtml\#table-http-proxy-error-types

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,83:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,83:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,83:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,83:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## FieldSizePayload

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,36:::pub(all) struct FieldSizePayload {
  field_name : String?
  field_size : UInt?
}
```
 Defines the case payload type for `HTTP-response-{header,trailer}-size` above:

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,39:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,39:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,39:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,39:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FieldSizePayload">FieldSizePayload</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Fields

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,103:::pub(all) type Fields Int
```
 This following block defines the `fields` resource which corresponds to
HTTP standard Fields. Fields are a common representation used for both
Headers and Trailers.

 A `fields` may be mutable or immutable. A `fields` created using the
constructor, `from-list`, or `clone` will be mutable, but a `fields`
resource given by other means (including, but not limited to,
`incoming-request.headers`, `outgoing-request.headers`) might be be
immutable. In an immutable fields, the `set`, `append`, and `delete`
operations will fail with `header-error.immutable`.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,103:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,103:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,103:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,103:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### append
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,711:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::append(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, name : String, value : Bytes) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>]
  ```
  >  Append a value for a key. Does not change or delete any existing
  > values for that key.
  > 
  >  Fails with `header-error.immutable` if the `fields` are immutable.
- #### clone
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,772:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::clone(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  >  Make a deep copy of the Fields. Equivelant in behavior to calling the
  > `fields` constructor on the return value of `entries`. The resulting
  > `fields` is mutable.
- #### delete
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,677:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::delete(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, name : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>]
  ```
  >  Delete all values for a key. Does nothing if no values for the key
  > exist.
  > 
  >  Fails with `header-error.immutable` if the `fields` are immutable.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,106:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### entries
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,751:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::entries(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[(String, Bytes)]
  ```
  >  Retrieve the full set of keys and values in the Fields. Like the
  > constructor, the list represents each key-value pair.
  > 
  >  The outer list represents each key-value pair in the Fields. Keys
  > which have multiple values are represented by multiple entries in this
  > list with the same key.
- #### fields
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,526:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::fields() -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  >  Construct an empty HTTP Fields.
  > 
  >  The resulting `fields` is mutable.
- #### from\_list
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,546:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::from_list(entries : <a href="moonbitlang/core/array#Array">Array</a>[(String, Bytes)]) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>]
  ```
  >  Construct an HTTP Fields.
  > 
  >  The resulting `fields` is mutable.
  > 
  >  The list represents each key-value pair in the Fields. Keys
  > which have multiple values are represented by multiple entries in this
  > list with the same key.
  > 
  >  The tuple is a pair of the field key, represented as a string, and
  > Value, represented as a list of bytes. In a valid Fields, all keys
  > and values are valid UTF-8 strings. However, values are not always
  > well-formed, so they are represented as a raw list of bytes.
  > 
  >  An error result will be returned if any header or value was
  > syntactically invalid, or if a header was forbidden.
- #### get
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,588:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::get(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, name : String) -> <a href="moonbitlang/core/array#Array">Array</a>[Bytes]
  ```
  >  Get all of the values corresponding to a key. If the key is not present
  > in this `fields`, an empty list is returned. However, if the key is
  > present but empty, this is represented by a list with one or more
  > empty field-values present.
- #### has
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,612:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::has(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, name : String) -> Bool
  ```
  >  Returns `true` when the key is present in this `fields`. If the key is
  > syntactically invalid, `false` is returned.
- #### set
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,627:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>::set(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>, name : String, value : <a href="moonbitlang/core/array#Array">Array</a>[Bytes]) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>]
  ```
  >  Set all of the values for a key. Clears any existing values for that
  > key, if they have been set.
  > 
  >  Fails with `header-error.immutable` if the `fields` are immutable.

## FutureIncomingResponse

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,232:::pub(all) type FutureIncomingResponse Int
```
 Represents a future which may eventaully return an incoming HTTP
Response, or an error.

 This resource is returned by the `wasi:http/outgoing-handler` interface to
provide the HTTP Response corresponding to the sent Request.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,232:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,232:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,232:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,232:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,235:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### get
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2462:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>::get(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>], Unit]?
  ```
  >  Returns the incoming HTTP Response, or an error, once one is ready.
  > 
  >  The outer `option` represents future readiness. Users can wait on this
  > `option` to become `some` using the `subscribe` method.
  > 
  >  The outer `result` is used to retrieve the response or error at most
  > once. It will be success on the first call in which the outer option
  > is `some`, and error on subsequent calls.
  > 
  >  The inner `result` represents that either the incoming HTTP Response
  > status and headers have recieved successfully, or that an error
  > occured. Errors may also occur while consuming the response body,
  > but those will be reported by the `incoming-body` and its
  > `output-stream` child.
- #### subscribe
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2440:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>::subscribe(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureIncomingResponse">FutureIncomingResponse</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">@yamajik/wasi-bindings/interface/wasi/io/poll.Pollable</a>
  ```
  >  Returns a pollable which becomes ready when either the Response has
  > been received, or an error has occured. When this pollable is ready,
  > the `get` method will return `some`.

## FutureTrailers

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,186:::pub(all) type FutureTrailers Int
```
 Represents a future which may eventaully return trailers, or an error.

 In the case that the incoming HTTP Request or Response did not have any
trailers, this future will resolve to the empty set of trailers once the
complete Request or Response body has been received.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,186:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,186:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,186:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,186:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,189:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### get
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1698:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>::get(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>?, <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>], Unit]?
  ```
  >  Returns the contents of the trailers, or an error which occured,
  > once the future is ready.
  > 
  >  The outer `option` represents future readiness. Users can wait on this
  > `option` to become `some` using the `subscribe` method.
  > 
  >  The outer `result` is used to retrieve the trailers or error at most
  > once. It will be success on the first call in which the outer option
  > is `some`, and error on subsequent calls.
  > 
  >  The inner `result` represents that either the HTTP Request or Response
  > body, as well as any trailers, were received successfully, or that an
  > error occured receiving them. The optional `trailers` indicates whether
  > or not trailers were present in the body.
  > 
  >  When some `trailers` are returned by this method, the `trailers`
  > resource is immutable, and a child. Use of the `set`, `append`, or
  > `delete` methods will return an error, and the resource must be
  > dropped before the parent `future-trailers` is dropped.
- #### subscribe
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1673:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>::subscribe(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">@yamajik/wasi-bindings/interface/wasi/io/poll.Pollable</a>
  ```
  >  Returns a pollable which becomes ready when either the trailers have
  > been received, or an error has occured. When this pollable is ready,
  > the `get` method will return `some`.

## HeaderError

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,87:::pub(all) enum HeaderError {
  InvalidSyntax
  Forbidden
  Immutable
}
```
 This type enumerates the different kinds of errors that may occur when
setting or appending to a `fields` resource.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,91:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,91:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,91:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,91:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#HeaderError">HeaderError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## IncomingBody

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,173:::pub(all) type IncomingBody Int
```
 Represents an incoming HTTP Request or Response's Body.

 A body has both its contents - a stream of bytes - and a (possibly
empty) set of trailers, indicating that the full contents of the
body have been received. This resource represents the contents as
an `input-stream` and the delivery of trailers as a `future-trailers`,
and ensures that the user of this interface may only be consuming either
the body contents or waiting on trailers at any given time.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,173:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,173:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,173:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,173:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,176:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### finish
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1664:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>::finish(this : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#FutureTrailers">FutureTrailers</a>
  ```
  >  Takes ownership of `incoming-body`, and returns a `future-trailers`.
  > This function will trap if the `input-stream` child is still alive.
- #### stream
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1644:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>::stream(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/io/streams#InputStream">@yamajik/wasi-bindings/interface/wasi/io/streams.InputStream</a>, Unit]
  ```
  >  Returns the contents of the body, as a stream of bytes.
  > 
  >  Returns success on first call: the stream representing the contents
  > can be retrieved at most once. Subsequent calls will return error.
  > 
  >  The returned `input-stream` resource is a child: it must be dropped
  > before the parent `incoming-body` is dropped, or consumed by
  > `incoming-body.finish`.
  > 
  >  This invariant ensures that the implementation can determine whether
  > the user is consuming the contents of the body, waiting on the
  > `future-trailers` to be ready, or neither. This allows for network
  > backpressure is to be applied when the user is consuming the body,
  > and for that backpressure to not inhibit delivery of the trailers if
  > the user does not read the entire body.

## IncomingRequest

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,112:::pub(all) type IncomingRequest Int
```
 Represents an incoming HTTP Request.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,112:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,112:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,112:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,112:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### authority
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,849:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::authority(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> String?
  ```
  >  Returns the authority from the request, if it was present.
- #### consume
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,882:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::consume(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>, Unit]
  ```
  >  Gives the `incoming-body` associated with this request. Will only
  > return success at most once, and subsequent calls will return error.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,115:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### headers
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,874:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::headers(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  >  Get the `headers` associated with the request.
  > 
  >  The returned `headers` resource is immutable: `set`, `append`, and
  > `delete` operations will fail with `header-error.immutable`.
  > 
  >  The `headers` returned are a child resource: it must be dropped before
  > the parent `incoming-request` is dropped. Dropping this
  > `incoming-request` before all children are dropped will trap.
- #### method
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,779:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::method(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>
  ```
  >  Returns the method of the incoming request.
- #### path\_with\_query
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,805:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::path_with_query(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> String?
  ```
  >  Returns the path with query parameters from the request, as a string.
- #### scheme
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,823:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>::scheme(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">IncomingRequest</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>?
  ```
  >  Returns the protocol scheme from the request.

## IncomingResponse

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,157:::pub(all) type IncomingResponse Int
```
 Represents an incoming HTTP Response.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,157:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,157:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,157:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,157:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### consume
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1614:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>::consume(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingBody">IncomingBody</a>, Unit]
  ```
  >  Returns the incoming body. May be called at most once. Returns error
  > if called additional times.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,160:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### headers
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1606:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>::headers(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  >  Returns the headers from the incoming response.
  > 
  >  The returned `headers` resource is immutable: `set`, `append`, and
  > `delete` operations will fail with `header-error.immutable`.
  > 
  >  This headers resource is a child: it must be dropped before the parent
  > `incoming-response` is dropped.
- #### status
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1593:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>::status(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingResponse">IncomingResponse</a>) -> UInt
  ```
  >  Returns the status code from the incoming response.

## Method

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,3:::pub(all) enum Method {
  Get
  Head
  Post
  Put
  Delete
  Connect
  Options
  Trace
  Patch
  Other(String)
}
```
 This type corresponds to HTTP standard Methods.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,14:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,14:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,14:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,14:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## OutgoingBody

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,219:::pub(all) type OutgoingBody Int
```
 Represents an outgoing HTTP Request or Response's Body.

 A body has both its contents - a stream of bytes - and a (possibly
empty) set of trailers, inducating the full contents of the body
have been sent. This resource represents the contents as an
`output-stream` child resource, and the completion of the body (with
optional trailers) with a static function that consumes the
`outgoing-body` resource, and ensures that the user of this interface
may not write to the body contents after the body has been finished.

 If the user code drops this resource, as opposed to calling the static
method `finish`, the implementation should treat the body as incomplete,
and that an error has occured. The implementation should propogate this
error to the HTTP protocol by whatever means it has available,
including: corrupting the body on the wire, aborting the associated
Request, or sending a late status code for the Response.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,219:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,219:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,219:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,219:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,222:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### finish
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2155:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>::finish(this : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>, trailers : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>]
  ```
  >  Finalize an outgoing body, optionally providing trailers. This must be
  > called to signal that the response is complete. If the `outgoing-body`
  > is dropped without calling `outgoing-body.finalize`, the implementation
  > should treat the body as corrupted.
  > 
  >  Fails if the body's `outgoing-request` or `outgoing-response` was
  > constructed with a Content-Length header, and the contents written
  > to the body (via `write`) does not match the value given in the
  > Content-Length.
- #### write
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2128:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>::write(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/io/streams#OutputStream">@yamajik/wasi-bindings/interface/wasi/io/streams.OutputStream</a>, Unit]
  ```
  >  Returns a stream for writing the body contents.
  > 
  >  The returned `output-stream` is a child resource: it must be dropped
  > before the parent `outgoing-body` resource is dropped (or finished),
  > otherwise the `outgoing-body` drop or `finish` will trap.
  > 
  >  Returns success on the first call: the `output-stream` resource for
  > this `outgoing-body` may be retrieved at most once. Subsequent calls
  > will return error.

## OutgoingRequest

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,121:::pub(all) type OutgoingRequest Int
```
 Represents an outgoing HTTP Request.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,121:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,121:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,121:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,121:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### authority
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1113:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::authority(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> String?
  ```
  >  Get the HTTP Authority for the Request. A value of `none` may be used
  > with Related Schemes which do not require an Authority. The HTTP and
  > HTTPS schemes always require an authority.
- #### body
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,919:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::body(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>, Unit]
  ```
  >  Returns the resource corresponding to the outgoing Body for this
  > Request.
  > 
  >  Returns success on the first call: the `outgoing-body` resource for
  > this `outgoing-request` can be retrieved at most once. Subsequent
  > calls will return error.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,124:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### headers
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1169:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::headers(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  >  Get the headers associated with the Request.
  > 
  >  The returned `headers` resource is immutable: `set`, `append`, and
  > `delete` operations will fail with `header-error.immutable`.
  > 
  >  This headers resource is a child: it must be dropped before the parent
  > `outgoing-request` is dropped, or its ownership is transfered to
  > another component by e.g. `outgoing-handler.handle`.
- #### method
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,935:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::method(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>
  ```
  >  Get the Method for the Request.
- #### outgoing\_request
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,907:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::outgoing_request(headers : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>
  ```
  >  Construct a new `outgoing-request` with a default `method` of `GET`, and
  > `none` values for `path-with-query`, `scheme`, and `authority`.
  > 
  >  * `headers` is the HTTP Headers for the Request.
  > 
  >  It is possible to construct, or manipulate with the accessor functions
  > below, an `outgoing-request` with an invalid combination of `scheme`
  > and `authority`, or `headers` which are not permitted to be sent.
  > It is the obligation of the `outgoing-handler.handle` implementation
  > to reject invalid constructions of `outgoing-request`.
- #### path\_with\_query
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,999:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::path_with_query(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> String?
  ```
  >  Get the combination of the HTTP Path and Query for the Request.
  > When `none`, this represents an empty Path and empty Query.
- #### scheme
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1048:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::scheme(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>?
  ```
  >  Get the HTTP Related Scheme for the Request. When `none`, the
  > implementation may choose an appropriate default scheme.
- #### set\_authority
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1134:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::set_authority(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>, authority : String?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the HTTP Authority for the Request. A value of `none` may be used
  > with Related Schemes which do not require an Authority. The HTTP and
  > HTTPS schemes always require an authority. Fails if the string given is
  > not a syntactically valid uri authority.
- #### set\_method
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,962:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::set_method(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>, method : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Method">Method</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the Method for the Request. Fails if the string present in a
  > `method.other` argument is not a syntactically valid method.
- #### set\_path\_with\_query
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1019:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::set_path_with_query(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>, path_with_query : String?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the combination of the HTTP Path and Query for the Request.
  > When `none`, this represents an empty Path and empty Query. Fails is the
  > string given is not a syntactically valid path and query uri component.
- #### set\_scheme
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1076:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>::set_scheme(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingRequest">OutgoingRequest</a>, scheme : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the HTTP Related Scheme for the Request. When `none`, the
  > implementation may choose an appropriate default scheme. Fails if the
  > string given is not a syntactically valid uri scheme.

## OutgoingResponse

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,195:::pub(all) type OutgoingResponse Int
```
 Represents an outgoing HTTP Response.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,195:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,195:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,195:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,195:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### body
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2104:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>::body(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingBody">OutgoingBody</a>, Unit]
  ```
  >  Returns the resource corresponding to the outgoing Body for this Response.
  > 
  >  Returns success on the first call: the `outgoing-body` resource for
  > this `outgoing-response` can be retrieved at most once. Subsequent
  > calls will return error.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,198:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### headers
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2093:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>::headers(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>
  ```
  >  Get the headers associated with the Request.
  > 
  >  The returned `headers` resource is immutable: `set`, `append`, and
  > `delete` operations will fail with `header-error.immutable`.
  > 
  >  This headers resource is a child: it must be dropped before the parent
  > `outgoing-request` is dropped, or its ownership is transfered to
  > another component by e.g. `outgoing-handler.handle`.
- #### outgoing\_response
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2051:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>::outgoing_response(headers : <a href="yamajik/wasi-bindings/interface/wasi/http/types#Fields">Fields</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>
  ```
  >  Construct an `outgoing-response`, with a default `status-code` of `200`.
  > If a different `status-code` is needed, it must be set via the
  > `set-status-code` method.
  > 
  >  * `headers` is the HTTP Headers for the Response.
- #### set\_status\_code
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2068:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>::set_status_code(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>, status_code : UInt) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the HTTP Status Code for the Response. Fails if the status-code
  > given is not a valid http status code.
- #### status\_code
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,2060:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>::status_code(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>) -> UInt
  ```
  >  Get the HTTP Status Code for the Response.

## RequestOptions

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,135:::pub(all) type RequestOptions Int
```
 Parameters for making an HTTP Request. Each of these parameters is
currently an optional timeout applicable to the transport layer of the
HTTP protocol.

 These timeouts are separate from any the user may use to bound a
blocking call to `wasi:io/poll.poll`.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,135:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,135:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,135:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,135:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### between\_bytes\_timeout
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1255:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::between_bytes_timeout(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>) -> UInt64?
  ```
  >  The timeout for receiving subsequent chunks of bytes in the Response
  > body stream.
- #### connect\_timeout
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1182:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::connect_timeout(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>) -> UInt64?
  ```
  >  The timeout for the initial connect to the HTTP Server.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,138:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### first\_byte\_timeout
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1218:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::first_byte_timeout(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>) -> UInt64?
  ```
  >  The timeout for receiving the first byte of the Response body.
- #### request\_options
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1176:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::request_options() -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>
  ```
  >  Construct a default `request-options` value.
- #### set\_between\_bytes\_timeout
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1271:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::set_between_bytes_timeout(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>, duration : UInt64?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the timeout for receiving subsequent chunks of bytes in the Response
  > body stream. An error return value indicates that this timeout is not
  > supported.
- #### set\_connect\_timeout
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1197:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::set_connect_timeout(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>, duration : UInt64?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the timeout for the initial connect to the HTTP Server. An error
  > return value indicates that this timeout is not supported.
- #### set\_first\_byte\_timeout
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1233:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>::set_first_byte_timeout(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#RequestOptions">RequestOptions</a>, duration : UInt64?) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Set the timeout for receiving the first byte of the Response body. An
  > error return value indicates that this timeout is not supported.

## ResponseOutparam

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,148:::pub(all) type ResponseOutparam Int
```
 Represents the ability to send an HTTP Response.

 This resource is used by the `wasi:http/incoming-handler` interface to
allow a Response to be sent corresponding to the Request provided as the
other argument to `incoming-handler.handle`.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,148:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,148:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,148:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,148:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,151:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### set
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,1300:::fn <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>::set(param : <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">ResponseOutparam</a>, response : <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/http/types#OutgoingResponse">OutgoingResponse</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>]) -> Unit
  ```
  >  Set the value of the `response-outparam` to either send a response,
  > or indicate an error.
  > 
  >  This method consumes the `response-outparam` to ensure that it is
  > called at most once. If it is never called, the implementation
  > will respond with an error.
  > 
  >  The user may provide an `error` to `response` to allow the
  > implementation determine how to respond with an HTTP error response.

## Scheme

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,17:::pub(all) enum Scheme {
  Http
  Https
  Other(String)
}
```
 This type corresponds to HTTP standard Related Schemes.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,21:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,21:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,21:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#Scheme">Scheme</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## TlsAlertReceivedPayload

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,30:::pub(all) struct TlsAlertReceivedPayload {
  alert_id : Byte?
  alert_message : String?
}
```
 Defines the case payload type for `TLS-alert-received` above:

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,33:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#TlsAlertReceivedPayload">TlsAlertReceivedPayload</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,33:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/http/types#TlsAlertReceivedPayload">TlsAlertReceivedPayload</a>, <a href="yamajik/wasi-bindings/interface/wasi/http/types#TlsAlertReceivedPayload">TlsAlertReceivedPayload</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,33:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/http/types#TlsAlertReceivedPayload">TlsAlertReceivedPayload</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,33:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/http/types#TlsAlertReceivedPayload">TlsAlertReceivedPayload</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## http\_error\_code

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/http/types/top.mbt,251:::fn http_error_code(err : <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">@yamajik/wasi-bindings/interface/wasi/io/error.Error_</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/http/types#ErrorCode">ErrorCode</a>?
```
 Attempts to extract a http-related `error` from the wasi:io `error`
provided.

 Stream operations which return
`wasi:io/stream/stream-error::last-operation-failed` have a payload of
type `wasi:io/error/error` with more information about the operation
that failed. This payload can be passed through to this function to see
if there's http-related information about the error to return.

 Note that this function is fallible because not all io-errors are
http-related errors.
