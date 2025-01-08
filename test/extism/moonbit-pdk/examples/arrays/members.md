# examples/arrays

The `arrays.wasm` plugin can be run from the top-level of the repo by
typing:

```bash
$ ./build.sh
$ ./scripts/python-server.sh
```

Then open your browser window to:
http://localhost:8080/examples/arrays

---
# Documentation
|Type|description|
|---|---|
|[AllThree](#AllThree)| \`AllThree\` represents a JSON object with all three array types.|

|Value|description|
|---|---|
|[all\_three\_object](#all_three_object)| \`all\_three\_object\` tests passing an object of all three arrays.|
|[process\_all\_three](#process_all_three)| \`process\_all\_three\` processes all three array types.|
|[process\_floats](#process_floats)| \`process\_floats\` sums up an array of floats.|
|[process\_ints](#process_ints)| \`process\_ints\` sums up an array of ints.|
|[process\_strings](#process_strings)| \`process\_strings\` concatenates an array of strings.|
|[progressive\_concat\_strings](#progressive_concat_strings)| \`progressive\_concat\_strings\` tests passing arrays of strings.|
|[progressive\_sum\_floats](#progressive_sum_floats)| \`progressive\_sum\_floats\` tests passing arrays of floats.|
|[progressive\_sum\_ints](#progressive_sum_ints)| \`progressive\_sum\_ints\` tests passing arrays of ints.|

## AllThree

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,2:::pub(all) struct AllThree {
  ints : <a href="moonbitlang/core/array#Array">Array</a>[Int]
  floats : <a href="moonbitlang/core/array#Array">Array</a>[Double]
  strings : <a href="moonbitlang/core/array#Array">Array</a>[String]
}
```
 `AllThree` represents a JSON object with all three array types.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>
  ```
  > 
  * ```moonbit
    :::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,6:::fn op_equal(<a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>, <a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>
  ```
  > 
  * ```moonbit
    :::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,6:::fn output(<a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>
  ```
  > 
  * ```moonbit
    :::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,6:::fn to_json(<a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## all\_three\_object

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/plugin-functions.mbt,83:::fn all_three_object() -> Int
```
 `all_three_object` tests passing an object of all three arrays.

## process\_all\_three

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/all-three.mbt,9:::fn process_all_three(all3 : <a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>) -> <a href="extism/moonbit-pdk/examples/arrays#AllThree">AllThree</a>
```
 `process_all_three` processes all three array types.

## process\_floats

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/floats.mbt,2:::fn process_floats(floats : <a href="moonbitlang/core/array#Array">Array</a>[Double]) -> <a href="moonbitlang/core/array#Array">Array</a>[Double]
```
 `process_floats` sums up an array of floats.

## process\_ints

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/ints.mbt,2:::fn process_ints(ints : <a href="moonbitlang/core/array#Array">Array</a>[Int]) -> <a href="moonbitlang/core/array#Array">Array</a>[Int]
```
 `process_ints` sums up an array of ints.

## process\_strings

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/strings.mbt,2:::fn process_strings(strings : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
```
 `process_strings` concatenates an array of strings.

## progressive\_concat\_strings

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/plugin-functions.mbt,56:::fn progressive_concat_strings() -> Int
```
 `progressive_concat_strings` tests passing arrays of strings.

## progressive\_sum\_floats

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/plugin-functions.mbt,29:::fn progressive_sum_floats() -> Int
```
 `progressive_sum_floats` tests passing arrays of floats.

## progressive\_sum\_ints

```moonbit
:::source,extism/moonbit-pdk/examples/arrays/plugin-functions.mbt,2:::fn progressive_sum_ints() -> Int
```
 `progressive_sum_ints` tests passing arrays of ints.
