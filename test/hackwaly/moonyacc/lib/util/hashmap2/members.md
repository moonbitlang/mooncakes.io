# Documentation
|Type|description|
|---|---|
|[Entry](#Entry)||
|[T](#T)||

|Value|description|
|---|---|
|[new](#new)||

## Entry

```moonbit
:::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,10:::type Entry
```


## T

```moonbit
:::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,2:::type T
```


#### mooncakes-io-method-mark-Methods
- #### get
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,59:::fn <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>::get[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V], key : K) -> V?
  ```
  > 
- #### get\_or\_init
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,92:::fn <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>::get_or_init[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V], key : K, init : (K) -> V) -> V
  ```
  > 
- #### iter
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,31:::fn <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>::iter[K, V](self : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,45:::fn <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>::iter2[K, V](self : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[K, V]
  ```
  > 
- #### set
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,115:::fn <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>::set[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
- #### size
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,26:::fn <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>::size[K, V](self : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V]) -> Int
  ```
  > 

## new

```moonbit
:::source,hackwaly/moonyacc/lib/util/hashmap2/hashmap2.mbt,20:::fn new[K, V](capacity~ : Int) -> <a href="hackwaly/moonyacc/lib/util/hashmap2#T">T</a>[K, V]
```

 Capacity must be a power of 2.
