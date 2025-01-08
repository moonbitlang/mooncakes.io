# examples/add

The `add.wasm` plugin can be run from the top-level of the repo by
typing:

```bash
$ ./build.sh
$ ./scripts/add.sh '{"a": 20, "b": 21}'
# => {"sum":41}
```

---
# Documentation
|Type|description|
|---|---|
|[Add](#Add)||
|[ParseError](#ParseError)||
|[Sum](#Sum)||

|Value|description|
|---|---|
|[add](#add)||

## Add

```moonbit
:::source,extism/moonbit-pdk/examples/add/add.mbt,2:::type Add
```


#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,extism/moonbit-pdk/examples/add/add.mbt,8:::fn <a href="extism/moonbit-pdk/examples/add#Add">Add</a>::from_json(value : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="extism/moonbit-pdk/examples/add#Add">Add</a>?
  ```
  > 
- #### parse
  ```moonbit
  :::source,extism/moonbit-pdk/examples/add/add.mbt,20:::fn <a href="extism/moonbit-pdk/examples/add#Add">Add</a>::parse(s : String) -> <a href="extism/moonbit-pdk/examples/add#Add">Add</a>!<a href="extism/moonbit-pdk/examples/add#ParseError">ParseError</a>
  ```
  > 

## ParseError

```moonbit
:::source,extism/moonbit-pdk/examples/add/add.mbt,17:::type ParseError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,extism/moonbit-pdk/examples/add/add.mbt,17:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="extism/moonbit-pdk/examples/add#ParseError">ParseError</a>
  ```
  > 
  * ```moonbit
    :::source,extism/moonbit-pdk/examples/add/add.mbt,17:::fn output(<a href="extism/moonbit-pdk/examples/add#ParseError">ParseError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Sum

```moonbit
:::source,extism/moonbit-pdk/examples/add/add.mbt,32:::type Sum
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,extism/moonbit-pdk/examples/add/add.mbt,34:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="extism/moonbit-pdk/examples/add#Sum">Sum</a>
  ```
  > 
  * ```moonbit
    :::source,extism/moonbit-pdk/examples/add/add.mbt,34:::fn to_json(<a href="extism/moonbit-pdk/examples/add#Sum">Sum</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## add

```moonbit
:::source,extism/moonbit-pdk/examples/add/add.mbt,37:::fn add() -> Int
```

