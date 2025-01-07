This interface defines a handler of outgoing HTTP Requests. It should be
imported by components which wish to make HTTP Requests.
---
# Documentation
|Value|description|
|---|---|
|[handle](#handle)| This function is invoked with an outgoing HTTP Request, and it returns|

## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/outgoingHandler/top.mbt,13:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#OutgoingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.OutgoingRequest</a>, options : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#RequestOptions">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.RequestOptions</a>?) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#FutureIncomingResponse">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.FutureIncomingResponse</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ErrorCode">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ErrorCode</a>]
```
 This function is invoked with an outgoing HTTP Request, and it returns
a resource `future-incoming-response` which represents an HTTP Response
which may arrive in the future.

 The `options` argument accepts optional parameters for the HTTP
protocol's transport layer.

 This function may return an error if the `outgoing-request` is invalid
or not allowed to be made. Otherwise, protocol errors are reported
through the `future-incoming-response`.
