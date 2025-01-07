# examples/http-get

The `http-get.wasm` plugin can be run from the top-level of the repo by
typing:

```bash
$ ./build.sh
$ ./scripts/http-get.sh
```

---
# Documentation
|Value|description|
|---|---|
|[http\_get](#http_get)| \`http\_get\` makes a GET HTTP request through the Extism host, gets|

## http\_get

```moonbit
:::source,gmlewis/moonbit-pdk/examples/http-get/http-get.mbt,4:::fn http_get() -> Int
```
 `http_get` makes a GET HTTP request through the Extism host, gets
the response back, then sends it (unmodified) to the Extism host output.
It returns 0 to the host on success.
