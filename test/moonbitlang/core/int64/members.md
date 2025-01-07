# Documentation
|Type|description|
|---|---|
|[Int64](#Int64)||

|Value|description|
|---|---|
|[max\_value](#max_value)||
|[min\_value](#min_value)||

## max\_value

```moonbit
:::source,moonbitlang/core/int64/int64.mbt,16:::let max_value : Int64
```


## min\_value

```moonbit
:::source,moonbitlang/core/int64/int64.mbt,19:::let min_value : Int64
```


## Int64


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/int64/xxhash.mbt,33:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with hash(self : Int64) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/int64/xxhash.mbt,53:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with hash_combine(self : Int64, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/int64/int64.mbt,27:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::abs(self : Int64) -> Int64
  ```
  > 
- #### from\_int
  ```moonbit
  :::source,moonbitlang/core/int64/int64.mbt,22:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::from_int(i : Int) -> Int64
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/int64/xxhash.mbt,33:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::hash(self : Int64) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/int64/xxhash.mbt,53:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::hash_combine(self : Int64, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
