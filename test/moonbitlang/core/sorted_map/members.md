# Documentation
|Type|description|
|---|---|
|[T](#T)||

|Value|description|
|---|---|
|[new](#new)||
|[of](#of)||

## T

```moonbit
:::source,moonbitlang/core/sorted_map/types.mbt,25:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,240:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/sorted_map#T">T</a> with arbitrary[K : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/sorted_map/utils.mbt,64:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/sorted_map#T">T</a> with output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,46:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::add[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
  >  Inserts a key-value pair.
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,240:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::arbitrary[K : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]
  ```
  > 
- #### clear
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,114:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::clear[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> Unit
  ```
  > 
  >  Clears the map.
- #### contains
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,93:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::contains[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], key : K) -> Bool
  ```
  > 
  >  Checks if map contains a key-value pair.
- #### each
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,121:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::each[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], f : (K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterates the map.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,139:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::eachi[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], f : (Int, K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterates the map with index.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,230:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::from_iter[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]) -> <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]
  ```
  > 
- #### get
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,75:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::get[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], key : K) -> V?
  ```
  > 
  >  Gets a value by a key.
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,102:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::is_empty[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> Bool
  ```
  > 
  >  Returns true if map is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,182:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::iter[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,206:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::iter2[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[K, V]
  ```
  > 
- #### keys
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,159:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::keys[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[K]
  ```
  > 
  >  Returns all keys in the map.
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,26:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::op_equal[K : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], other : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,21:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::op_get[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], key : K) -> V?
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,16:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::op_set[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/sorted_map/utils.mbt,64:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,58:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::remove[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V], key : K) -> Unit
  ```
  > 
  >  Removes a key-value pair.
- #### size
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,108:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::size[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> Int
  ```
  > 
  >  Returns the count of key-value pairs in the map.
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,175:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::to_array[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]
  ```
  > 
  >  Converts the map to an array.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/sorted_map/traits.mbt,85:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### values
  ```moonbit
  :::source,moonbitlang/core/sorted_map/map.mbt,167:::fn <a href="moonbitlang/core/sorted_map#T">T</a>::values[K, V](self : <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[V]
  ```
  > 
  >  Returns all values in the map.

## new

```moonbit
:::source,moonbitlang/core/sorted_map/map.mbt,32:::fn new[K, V]() -> <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]
```

 Returns a new sorted map.

## of

```moonbit
:::source,moonbitlang/core/sorted_map/map.mbt,38:::fn of[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](entries : <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]) -> <a href="moonbitlang/core/sorted_map#T">T</a>[K, V]
```

 Creates a sorted map from given entries.
