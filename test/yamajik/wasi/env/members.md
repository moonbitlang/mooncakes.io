# Documentation
|Type|description|
|---|---|
|[Variable](#Variable)||

|Value|description|
|---|---|
|[get](#get)||

## Variable

```moonbit
:::source,yamajik/wasi/env/env.mbt,11:::type Variable
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi/env/env.mbt,11:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi/env#Variable">Variable</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi/env/env.mbt,11:::fn output(<a href="yamajik/wasi/env#Variable">Variable</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### as\_float
  ```moonbit
  :::source,yamajik/wasi/env/env.mbt,27:::fn <a href="yamajik/wasi/env#Variable">Variable</a>::as_float(self : <a href="yamajik/wasi/env#Variable">Variable</a>) -> Double?
  ```
  > 
- #### as\_int
  ```moonbit
  :::source,yamajik/wasi/env/env.mbt,19:::fn <a href="yamajik/wasi/env#Variable">Variable</a>::as_int(self : <a href="yamajik/wasi/env#Variable">Variable</a>) -> Int?
  ```
  > 
- #### as\_json
  ```moonbit
  :::source,yamajik/wasi/env/env.mbt,35:::fn <a href="yamajik/wasi/env#Variable">Variable</a>::as_json(self : <a href="yamajik/wasi/env#Variable">Variable</a>) -> <a href="moonbitlang/core/json#Json">Json</a>?
  ```
  > 
- #### as\_string
  ```moonbit
  :::source,yamajik/wasi/env/env.mbt,14:::fn <a href="yamajik/wasi/env#Variable">Variable</a>::as_string(self : <a href="yamajik/wasi/env#Variable">Variable</a>) -> String?
  ```
  > 

## get

```moonbit
:::source,yamajik/wasi/env/env.mbt,43:::fn get(key : String) -> <a href="yamajik/wasi/env#Variable">Variable</a>
```

