# Documentation
|Type|description|
|---|---|
|[SmallIntSet](#SmallIntSet)||
|[T](#T)||

|Value|description|
|---|---|
|[empty](#empty)||
|[singleton](#singleton)||

## SmallIntSet

```moonbit
:::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,2:::type SmallIntSet
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,2:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,2:::fn compare(<a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,2:::fn op_equal(<a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,30:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,30:::fn hash_combine(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,37:::fn output(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,109:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::add(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, key : Int) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
- #### contains
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,98:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::contains(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, key : Int) -> Bool
  ```
  > 
- #### difference
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,281:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::difference(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
- #### disjoint
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,328:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::disjoint(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> Bool
  ```
  > 
- #### from\_iter
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,81:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::from_iter(iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int]) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
- #### intersection
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,236:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::intersection(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,25:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::is_empty(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> Bool
  ```
  > 
- #### iter
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,52:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::iter(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int]
  ```
  > 
- #### remove
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,137:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::remove(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, key : Int) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 
- #### subset
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,364:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::subset(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> Bool
  ```
  > 
- #### union
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,154:::fn <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>::union(self : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
  ```
  > 

## T

```moonbit
:::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,5:::type T = <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
```


## empty

```moonbit
:::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,11:::fn empty() -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
```


## singleton

```moonbit
:::source,hackwaly/moonyacc/lib/util/small_int_set/small_int_set.mbt,16:::fn singleton(key : Int) -> <a href="hackwaly/moonyacc/lib/util/small_int_set#SmallIntSet">SmallIntSet</a>
```

