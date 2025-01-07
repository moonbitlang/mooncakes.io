This interface defines a handler of incoming HTTP Requests. It should
be exported by components which can respond to HTTP Requests.
---
# Documentation
|Value|description|
|---|---|
|[handle](#handle)| This function is invoked with an incoming HTTP Request, and a resource|

## handle

```moonbit
:::source,yamajik/wasi-bindings/gen/interface/wasi/http/incomingHandler/stub.mbt,12:::fn handle(_request : <a href="yamajik/wasi-bindings/interface/wasi/http/types#IncomingRequest">@yamajik/wasi-bindings/interface/wasi/http/types.IncomingRequest</a>, _response_out : <a href="yamajik/wasi-bindings/interface/wasi/http/types#ResponseOutparam">@yamajik/wasi-bindings/interface/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 This function is invoked with an incoming HTTP Request, and a resource
`response-outparam` which provides the capability to reply with an HTTP
Response. The response is sent by calling the `response-outparam.set`
method, which allows execution to continue after the response has been
sent. This enables both streaming to the response body, and performing other
work.

 The implementor of this function must write a response to the
`response-outparam` before returning, or else the caller will respond
with an error on its behalf.
