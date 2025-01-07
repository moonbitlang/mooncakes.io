# Spin component in MoonBit

This example is based on this blog post: https://www.moonbitlang.com/blog/component-model
and this GitHub example: https://github.com/moonbitlang/moonbit-docs/tree/464356567270284446244cccecd101c04e9806f8/examples/wasi-http

In one terminal window, start up the app:

```shell
$ spin build --up
```

Then in another terminal window, get the results:

```shell
$ curl -i localhost:3000/outbound-http
HTTP/1.1 200 OK
content-type: application/json
transfer-encoding: chunked
date: Fri, 16 Aug 2024 21:42:38 GMT

{"timestamp":1723844558854,"fact":"Water slows down light"}
```

To test the `consume` and `stream` endpoints, start up a python server in
another terminal window in the root directory of this repo:

```shell
$ python3 -m http.server 8080
```

Then use `curl` to test the endpoint:

```shell
$ curl -X POST http://localhost:3000/consume -d 'http/localhost:8080/LICENSE'
OK

$ curl -X POST http://localhost:3000/consume?md5sum -d 'http://localhost:8080/LICENSE'
86d3f3a95c324c9479bd8986968f4327

$ curl -X POST http://localhost:3000/consume?sha256sum -d 'http://localhost:8080/LICENSE'
c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4

$ curl -X POST http://localhost:3000/stream -d 'http://localhost:8080/LICENSE' | wc
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11386  100 11357  100    29  2555k   6682 --:--:-- --:--:-- --:--:-- 2779k
     201    1581   11357

$ curl -X POST http://localhost:3000/stream?md5sum -d 'http://localhost:8080/LICENSE' | wc
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11386  100 11357  100    29  2578k   6741 --:--:-- --:--:-- --:--:-- 2223k
     201    1581   11357

$ curl -X POST http://localhost:3000/stream?sha256sum -d 'http://localhost:8080/LICENSE' | wc
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11386  100 11357  100    29  1388k   3629 --:--:-- --:--:-- --:--:-- 1588k
     201    1581   11357
```

View the `spin` stderr output:

```shell
Serving http://127.0.0.1:3000
Available Routes:
  outbound-http: http://127.0.0.1:3000 (wildcard)

INFO: Performing GET 'http://localhost:8080/LICENSE'
INFO: Status code = 200
INFO: Header['server'] = 'SimpleHTTP/0.6 Python/3.9.6'
INFO: Header['date'] = 'Sun, 18 Aug 2024 14:02:52 GMT'
INFO: Header['content-type'] = 'application/octet-stream'
INFO: Header['content-length'] = '11357'
INFO: Header['last-modified'] = 'Tue, 04 Jun 2024 20:58:42 GMT'
INFO: Consumed 11357 bytes from 'GET http://localhost:8080/LICENSE'

INFO: Performing GET 'http://localhost:8080/LICENSE'
INFO: Status code = 200
INFO: Header['server'] = 'SimpleHTTP/0.6 Python/3.9.6'
INFO: Header['date'] = 'Sun, 18 Aug 2024 14:03:01 GMT'
INFO: Header['content-type'] = 'application/octet-stream'
INFO: Header['content-length'] = '11357'
INFO: Header['last-modified'] = 'Tue, 04 Jun 2024 20:58:42 GMT'
INFO: Consumed 11357 bytes from 'GET http://localhost:8080/LICENSE', md5sum = 86d3f3a95c324c9479bd8986968f4327

INFO: Performing GET 'http://localhost:8080/LICENSE'
INFO: Status code = 200
INFO: Header['server'] = 'SimpleHTTP/0.6 Python/3.9.6'
INFO: Header['date'] = 'Sun, 18 Aug 2024 14:03:17 GMT'
INFO: Header['content-type'] = 'application/octet-stream'
INFO: Header['content-length'] = '11357'
INFO: Header['last-modified'] = 'Tue, 04 Jun 2024 20:58:42 GMT'
INFO: Consumed 11357 bytes from 'GET http://localhost:8080/LICENSE', sha256sum = c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4

INFO: Performing GET 'http://localhost:8080/LICENSE'
INFO: Status code = 200
INFO: Header['server'] = 'SimpleHTTP/0.6 Python/3.9.6'
INFO: Header['date'] = 'Sun, 18 Aug 2024 14:03:35 GMT'
INFO: Header['content-type'] = 'application/octet-stream'
INFO: Header['content-length'] = '11357'
INFO: Header['last-modified'] = 'Tue, 04 Jun 2024 20:58:42 GMT'
INFO: Streamed 11357 bytes from 'GET http://localhost:8080/LICENSE'

INFO: Performing GET 'http://localhost:8080/LICENSE'
INFO: Status code = 200
INFO: Header['server'] = 'SimpleHTTP/0.6 Python/3.9.6'
INFO: Header['date'] = 'Sun, 18 Aug 2024 14:03:56 GMT'
INFO: Header['content-type'] = 'application/octet-stream'
INFO: Header['content-length'] = '11357'
INFO: Header['last-modified'] = 'Tue, 04 Jun 2024 20:58:42 GMT'
INFO: Streamed 11357 bytes from 'GET http://localhost:8080/LICENSE', md5sum = 86d3f3a95c324c9479bd8986968f4327

INFO: Performing GET 'http://localhost:8080/LICENSE'
INFO: Status code = 200
INFO: Header['server'] = 'SimpleHTTP/0.6 Python/3.9.6'
INFO: Header['date'] = 'Sun, 18 Aug 2024 14:04:04 GMT'
INFO: Header['content-type'] = 'application/octet-stream'
INFO: Header['content-length'] = '11357'
INFO: Header['last-modified'] = 'Tue, 04 Jun 2024 20:58:42 GMT'
INFO: Streamed 11357 bytes from 'GET http://localhost:8080/LICENSE', sha256sum = c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4
```

---
# Documentation
|Value|description|
|---|---|
|[cabi\_realloc](#cabi_realloc)||
|[handle](#handle)| \`handle\` handles a \`GET /outbound-http\` request and makes an outbound|
|[wasmExportHandle](#wasmExportHandle)||

## cabi\_realloc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/outbound-http/external-exports.mbt,2:::fn cabi_realloc(src_offset : Int, src_size : Int, _dst_alignment : Int, dst_size : Int) -> Int
```


## handle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/outbound-http/outbound-http.mbt,11:::fn handle(request : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#IncomingRequest">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.IncomingRequest</a>, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>) -> Unit
```
 `handle` handles a `GET /outbound-http` request and makes an outbound
GET request to `url` and returns its JSON response. It also handles
a `POST /md5sum` where the body is another URL to GET from. It will
stream the response of that endpoint to its `response_out` and calculate
that stream's md5sum, reporting it to stderr when the stream ends.

## wasmExportHandle

```moonbit
:::source,gmlewis/spin-moonbit-sdk/examples/outbound-http/external-exports.mbt,12:::fn wasmExportHandle(p0 : Int, p1 : Int) -> Unit
```

