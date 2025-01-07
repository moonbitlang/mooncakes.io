# Spin component in MoonBit

This example is based on this blog post: https://www.moonbitlang.com/blog/component-model
and this GitHub example: https://github.com/moonbitlang/moonbit-docs/tree/464356567270284446244cccecd101c04e9806f8/examples/wasi-http

In one terminal window, start up the app:

```shell
$ spin build --up
```

To save a key/value pair:

```shell
$ curl -i -X POST localhost:3000/kv-store/key -d 'value'
HTTP/1.1 200 OK
content-type: text/plain
transfer-encoding: chunked
date: Thu, 15 Aug 2024 13:43:18 GMT

OK
```

To get a value:

```shell
$ curl -i localhost:3000/kv-store/key
HTTP/1.1 200 OK
content-type: application/octet-stream
transfer-encoding: chunked
date: Thu, 15 Aug 2024 13:44:12 GMT

value
```

---
# Documentation
|Value|description|
|---|---|
|[cabi\_realloc](#cabi_realloc)||
|[handle](#handle)| \`handle\` handles all incoming requests.|
|[wasmExportHandle](#wasmExportHandle)||

## cabi\_realloc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/kv-store/external-exports.mbt,2:::fn cabi_realloc(src_offset : Int, src_size : Int, _dst_alignment : Int, dst_size : Int) -> Int
```


## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/kv-store/kv-store.mbt,7:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#IncomingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.IncomingRequest</a>, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 `handle` handles all incoming requests.
`GET /kv-store/:key` returns the value associated with `:key` or `404 Not Found`.
`POST /kv-store/:key` saves the body as the value for `:key` in the kv-store
for later retrieval.

## wasmExportHandle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/kv-store/external-exports.mbt,12:::fn wasmExportHandle(p0 : Int, p1 : Int) -> Unit
```

