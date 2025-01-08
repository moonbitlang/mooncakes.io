# Immutable hashmap

This package provides an immutable hash map data structure.

## Basic usage

```mbt
test {
  let map = 
    @hashmap.new()
      .add("a", 1)
      .add("b", 2)
      .add("c", 3)
  println(map.find("a")) // Some(1)
  println(map.find("d")) // None
}
```

---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/immut/hashmap/types.mbt,25:::type T
```

 An immutable hash-map data structure

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,260:::impl[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,260:::fn op_equal[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], other : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,275:::impl[K : <a href="moonbitlang/core/builtin#Hash">Hash</a>, V : <a href="moonbitlang/core/builtin#Hash">Hash</a>] <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,275:::fn hash_combine[K : <a href="moonbitlang/core/builtin#Hash">Hash</a>, V : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,225:::impl[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,225:::fn output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,241:::impl[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,244:::fn arbitrary[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,131:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::add[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], key : K, value : V) -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
  >  Add a key-value pair to the hashmap.
  > 
  >  If a pair with the same key already exists, the old one is replaced
- #### each
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,199:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::each[K, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], f : (K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate through the elements in a hash map
- #### find
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,44:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::find[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], key : K) -> V?
  ```
  > 
  >  Lookup a key from a hash map
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,230:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::from_array[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](arr : <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]) -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,220:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::from_iter[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]) -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,210:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::iter[K, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]
  ```
  > 
  >  Converted to Iter
- #### new
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,38:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::new[K, V]() -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,249:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::of[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(K, V)]) -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,64:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::op_get[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], key : K) -> V?
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,137:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::remove[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V], key : K) -> <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]
  ```
  > 
  >  Remove an element from a map
- #### size
  ```moonbit
  :::source,moonbitlang/core/immut/hashmap/HAMT.mbt,181:::fn <a href="moonbitlang/core/immut/hashmap#T">T</a>::size[K, V](self : <a href="moonbitlang/core/immut/hashmap#T">T</a>[K, V]) -> Int
  ```
  > 
  >  Calculate the size of a map.
  > 
  >  WARNING: this operation is `O(N)` in map size
