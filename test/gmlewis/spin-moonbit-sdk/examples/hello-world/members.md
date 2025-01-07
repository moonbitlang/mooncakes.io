# Spin component in MoonBit

This example is based on this blog post: https://www.moonbitlang.com/blog/component-model
and this GitHub example: https://github.com/moonbitlang/moonbit-docs/tree/464356567270284446244cccecd101c04e9806f8/examples/wasi-http

In one terminal window, start up the app:

```shell
$ spin build --up
```

The application can now receive requests at `http://localhost:3000/hello`:

```shell
$ curl -i localhost:3000/hello
HTTP/1.1 200 OK
content-type: text/plain
foo: bar
content-length: 440
date: Thu, 26 Oct 2023 18:18:19 GMT

== REQUEST ==
URL:     http://localhost:3000/hello
Method:  GET
Headers:
  "Host": "localhost:3000"
  "User-Agent": "curl/8.1.2"
  "Spin-Full-Url": "http://localhost:3000/hello"
  "Spin-Base-Path": "/"
  "Spin-Client-Addr": "127.0.0.1:52164"
  "Accept": "*/*"
  "Spin-Path-Info": ""
  "Spin-Matched-Route": "/hello"
  "Spin-Raw-Component-Route": "/hello"
  "Spin-Component-Route": "/hello"
Body:
== RESPONSE ==
Hello Fermyon!
```

---
# Documentation
|Value|description|
|---|---|
|[cabi\_realloc](#cabi_realloc)||
|[handle](#handle)| \`handle\` returns a simple response to a \`GET /hello\` request.|
|[wasmExportHandle](#wasmExportHandle)||

## cabi\_realloc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/hello-world/external-exports.mbt,2:::fn cabi_realloc(src_offset : Int, src_size : Int, _dst_alignment : Int, dst_size : Int) -> Int
```


## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/hello-world/hello-world.mbt,4:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#IncomingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.IncomingRequest</a>, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 `handle` returns a simple response to a `GET /hello` request.

## wasmExportHandle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/hello-world/external-exports.mbt,12:::fn wasmExportHandle(p0 : Int, p1 : Int) -> Unit
```

