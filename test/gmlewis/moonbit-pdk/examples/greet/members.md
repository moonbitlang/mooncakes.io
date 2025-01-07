# examples/greet

The `greet.wasm` plugin can be run from the top-level of the repo by
typing:

```bash
$ ./build.sh
$ ./scripts/python-server.sh
```

Then open your browser window to:
http://localhost:8080/examples/greet

![greet demo](greet-demo.png)

---
# Documentation
|Value|description|
|---|---|
|[greet](#greet)| \`greet\` reads the input string from the host and writes a|

## greet

```moonbit
:::source,gmlewis/moonbit-pdk/examples/greet/greet.mbt,4:::fn greet() -> Int
```
 `greet` reads the input string from the host and writes a
greeting to the host's output string.
It returns 0 to the host on success.
