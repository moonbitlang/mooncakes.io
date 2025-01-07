# Spin component in MoonBit

This example is based on this blog post: https://www.moonbitlang.com/blog/component-model
and this GitHub example: https://github.com/moonbitlang/moonbit-docs/tree/464356567270284446244cccecd101c04e9806f8/examples/wasi-http

In one terminal window, start up a redis server:

```shell
$ redis-server
```

In another terminal window, start up the app:

```shell
$ spin build --up
```

Then in yet another terminal window, get the redis results:

```shell
$ curl -i localhost:3000/redis
HTTP/1.1 200 OK
content-type: text/plain
transfer-encoding: chunked
date: Thu, 15 Aug 2024 19:46:48 GMT

Hello, World!
```

---
# Documentation
|Value|description|
|---|---|
|[cabi\_realloc](#cabi_realloc)||
|[handle](#handle)| \`handle\` handles a \`GET /redis\` request, sets a \`test\` key in Redis|
|[wasmExportHandle](#wasmExportHandle)||

## cabi\_realloc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/redis/external-exports.mbt,2:::fn cabi_realloc(src_offset : Int, src_size : Int, _dst_alignment : Int, dst_size : Int) -> Int
```


## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/redis/redis.mbt,8:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#IncomingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.IncomingRequest</a>, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 `handle` handles a `GET /redis` request, sets a `test` key in Redis
then performs a `get` from Redis and returns the results.

## wasmExportHandle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/redis/external-exports.mbt,12:::fn wasmExportHandle(p0 : Int, p1 : Int) -> Unit
```

