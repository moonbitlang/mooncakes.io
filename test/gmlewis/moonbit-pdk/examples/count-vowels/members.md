# examples/count-vowels

The `count-vowels.wasm` plugin can be run from the top-level of the repo by
typing:

```bash
$ ./build.sh
$ ./scripts/python-server.sh
```

Then open your browser window to:
http://localhost:8080/examples/count-vowels

![count-vowels demo](count-vowels-demo.png)

---
# Documentation
|Type|description|
|---|---|
|[VowelReport](#VowelReport)| \`VowelReport\` represents the JSON struct returned to the host.|

|Value|description|
|---|---|
|[count\_vowels](#count_vowels)| \`count\_vowels\` reads the input string from the host, reads the "vowels"|

## VowelReport

```moonbit
:::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,6:::pub(all) struct VowelReport {
  count : Int
  total : Int
  vowels : String
}
```
 `VowelReport` represents the JSON struct returned to the host.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,10:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a> with op_equal(<a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>, <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,10:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a> with output(<a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,10:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a> with to_json(<a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,10:::fn <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>::op_equal(<a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>, <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,10:::fn <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>::output(<a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,10:::fn <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>::to_json(<a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/moonbit-pdk/examples/count-vowels/traits.mbt,85:::fn <a href="gmlewis/moonbit-pdk/examples/count-vowels#VowelReport">VowelReport</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## count\_vowels

```moonbit
:::source,gmlewis/moonbit-pdk/examples/count-vowels/count-vowels.mbt,33:::fn count_vowels() -> Int
```
 `count_vowels` reads the input string from the host, reads the "vowels"
config from the host, then counts the number of vowels in the input
string and keeps a running total (over multiple iterations)
in the host's "total" var.
It sends the JSON `VowelReport` to the host via its output data channel.
It returns 0 to the host on success.
