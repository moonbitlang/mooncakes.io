# Spin component in MoonBit

This example is based on this blog post: https://www.moonbitlang.com/blog/component-model
and this GitHub example: https://github.com/moonbitlang/moonbit-docs/tree/464356567270284446244cccecd101c04e9806f8/examples/wasi-http

In one terminal window, start up the app and provide the "secret" value:

```shell
$ ./run.sh
```

Then in another terminal window, get the "secret" variable value:

```shell
$ curl -i localhost:3000/variables/secret_var_name
HTTP/1.1 200 OK
content-type: text/plain
transfer-encoding: chunked
date: Fri, 16 Aug 2024 13:28:12 GMT

secret_var_name_value
```

---
# Documentation
|Value|description|
|---|---|
|[cabi\_realloc](#cabi_realloc)||
|[handle](#handle)| \`handle\` handles a \`GET /variables/:key\` request, gets the value|
|[wasmExportHandle](#wasmExportHandle)||

## cabi\_realloc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/variables/external-exports.mbt,2:::fn cabi_realloc(src_offset : Int, src_size : Int, _dst_alignment : Int, dst_size : Int) -> Int
```


## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/variables/variables.mbt,5:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#IncomingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.IncomingRequest</a>, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 `handle` handles a `GET /variables/:key` request, gets the value
in Spin variables associated with `:key` and returns the value or `404 Not Found`.

## wasmExportHandle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/variables/external-exports.mbt,12:::fn wasmExportHandle(p0 : Int, p1 : Int) -> Unit
```

