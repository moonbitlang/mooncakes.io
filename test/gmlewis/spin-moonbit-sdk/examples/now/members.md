# Spin component in MoonBit

This example is based on this blog post: https://www.moonbitlang.com/blog/component-model
and this GitHub example: https://github.com/moonbitlang/moonbit-docs/tree/464356567270284446244cccecd101c04e9806f8/examples/wasi-http

In one terminal window, start up the app:

```shell
$ spin build --up
```

The application can now receive requests at `http://localhost:3000/`:

```shell
$ curl -i localhost:3000/
HTTP/1.1 200 OK
content-type: text/plain
transfer-encoding: chunked
date: Fri, 16 Aug 2024 23:33:10 GMT

It is now 1723851190 seconds since Unix Epoch.
```

---
# Documentation
|Value|description|
|---|---|
|[cabi\_realloc](#cabi_realloc)||
|[handle](#handle)| \`handle\` returns the current number of seconds since Unix Epoch to any \`GET /\` request.|
|[wasmExportHandle](#wasmExportHandle)||

## cabi\_realloc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/now/external-exports.mbt,2:::fn cabi_realloc(src_offset : Int, src_size : Int, _dst_alignment : Int, dst_size : Int) -> Int
```


## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/now/now.mbt,4:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#IncomingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.IncomingRequest</a>, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 `handle` returns the current number of seconds since Unix Epoch to any `GET /` request.

## wasmExportHandle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/now/external-exports.mbt,12:::fn wasmExportHandle(p0 : Int, p1 : Int) -> Unit
```

