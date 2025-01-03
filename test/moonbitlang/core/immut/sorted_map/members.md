# Immutable Map

An immutable tree map based on size balanced tree.

# Usage

## Create

You can create an empty map using `new()` or construct it with a single key-value pair using `singleton()`.

```moonbit
let map1 : @immut/sorted_map.T[String, Int] = @immut/sorted_map.new()
let map2 = @immut/sorted_map.singleton("a", 1)
```

Also, you can construct it from an array using `of()` or `from_array()`.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
```

## Insert & Lookup

You can use `insert()` to add a key-value pair to the map and create a new map. Or use `lookup()` to get the value associated with a key.

```moonbit
let map : @immut/sorted_map.T[String,Int] = @immut/sorted_map.new()
let map = map.insert("a", 1)
println(map.lookup("a")) // Some(1)
```

## Remove

You can use `remove()` to remove a key-value pair from the map.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
let map = map.remove("a")
```

## Contains

You can use `contains()` to check whether a key exists.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
println(map.contains("a")) // true
println(map.contains("d")) // false
```

## Size

You can use `size()` to get the number of key-value pairs in the map.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
println(map.size()) // 3
```

Similarly, you can use `is_empty()` to check whether the map is empty.

```moonbit
let map : @immut/sorted_map.T[String, Int] = @immut/sorted_map.new()
println(map.is_empty()) // true
```

## Traversal

Use `each()` or `eachi()` to iterate through all key-value pairs.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
map.each(fn(k, v) { println("key:\{k}, value:\{v}") })
map.eachi(fn(i, k, v) { println("index:\{i}, key:\{k}, value:\{v}") })
```

Use `map()` or `map_with_key()` to map a function over all values.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
let map = map.map(fn(v) { v + 1 })
let map = map.map_with_key(fn(_k, v) { v + 1 })
```

Use `fold()` or `foldl_with_key()` to fold the values in the map. The default order of fold is Pre-order.
Similarly, you can use `foldr_with_key()` to do a Post-order fold.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
map.fold(fn (acc, v) { acc + v }, ~init=0) // 6
map.foldl_with_key(fn (acc, k, v) { acc + k + v.to_string() }, ~init="") // "a1b2c3"
map.foldr_with_key(fn (acc, k, v) { acc + k + v.to_string() }, ~init="") // "c3b2a1"
```

Use `filter()` or `filter_with_key()` to filter all keys/values that satisfy the predicate.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
let map = map.filter(fn (v) { v > 1 })
let map = map.filter_with_key(fn (k, v) { k > "a" && v > 1 })
```

## Conversion

Use `elems()` to get all values in ascending order of their keys.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
let elems = map.elems() // [1, 2, 3]
```

Use `keys()` to get all keys of the map in ascending order.

```moonbit
let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
let keys = map.keys() // ["a", "b", "c"]
```


---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/immut/sorted_map/types.mbt,35:::type T
```

 Immuatable map, consists of key-value pairs.

 #### Example

 ```
 let map1 = @sorted_map.of([(3, "three"), (8, "eight"), (1, "one")])
 let map2 = map1.add(2, "two").remove(3)
 assert_eq!(map2.lookup(2), Some("two"))
 let map3 = map2.add(2, "updated")
 assert_eq!(map2.lookup(3), None)
 assert_eq!(map3.lookup(3), None)
 assert_eq!(map3.lookup(2), Some("updated"))
 ```

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,52:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with arbitrary[K : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,33:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with compare[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], other : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,16:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with default[K, V]() -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,78:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with from_json[V : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[String, V]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,57:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with hash_combine[K : <a href="moonbitlang/core/builtin#Hash">Hash</a>, V : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with op_equal[K : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], other : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> Bool
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,64:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,69:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/immut/sorted_map#T">T</a> with to_json[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/map.mbt,19:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::add[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], key : K, value : V) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Create a new map with a key-value pair inserted.
  > O(log n).
  >  
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,52:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::arbitrary[K : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
- #### compare
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,33:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::compare[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], other : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> Int
  ```
  > 
- #### contains
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,35:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::contains[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], key : K) -> Bool
  ```
  > 
  >  Check if the map contains a key.
  > O(log n).
- #### default
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,16:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::default[K, V]() -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
- #### each
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,97:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::each[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], f : (K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate over the key-value pairs in the map.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,110:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::eachi[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], f : (Int, K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate over the key-value pairs with index.
- #### elems
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,263:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::elems[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[V]
  ```
  > 
  >  Return all elements of the map in the ascending order of their keys.
- #### empty
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,17:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::empty[K, V]() -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  >  Create an empty map.
  > @alert deprecated "Use `new()` instead"
- #### filter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/map.mbt,92:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::filter[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], pred : (V) -> Bool) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Filter values that satisfy the predicate
- #### filter\_with\_key
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/map.mbt,98:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::filter_with_key[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], pred : (K, V) -> Bool) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Filter key-value pairs that satisfy the predicate
- #### fold
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,148:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::fold[K, V, A](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], init~ : A, f : (A, V) -> A) -> A
  ```
  > 
  >  Fold the values in the map.
  > O(n).
- #### foldl\_with\_key
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,173:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::foldl_with_key[K, V, A](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], f : (A, K, V) -> A, init~ : A) -> A
  ```
  > 
  >  Pre-order fold.
  > O(n).
- #### foldr\_with\_key
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,155:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::foldr_with_key[K, V, A](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], f : (A, K, V) -> A, init~ : A) -> A
  ```
  > 
  >  Post-order fold.
  > O(n).
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,203:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::from_array[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](array : <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Build a map from an array of key-value pairs.
  > O(n\*log n).
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,251:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::from_iter[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,283:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::from_json[V : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[String, V]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits.mbt,40:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,57:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::hash_combine[K : <a href="moonbitlang/core/builtin#Hash">Hash</a>, V : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### insert
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/depercated.mbt,20:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::insert[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], key : K, value : V) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Create a new map with a key-value pair inserted.
  > O(log n).
  >  
  >  @alert deprecated "Use `add` instead"
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,61:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::is_empty[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> Bool
  ```
  > 
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,213:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::iter[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,232:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::iter2[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[K, V]
  ```
  > 
- #### keys
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,257:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::keys[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[K]
  ```
  > 
  >  Return all keys of the map in ascending order.
- #### lookup
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,74:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::lookup[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], key : K) -> V?
  ```
  > 
  >  Get the value associated with a key.
  > O(log n).
- #### map
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,127:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::map[K, X, Y](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, X], f : (X) -> Y) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, Y]
  ```
  > 
  >  Ts over the values in the map.
- #### map\_with\_key
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,137:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::map_with_key[K, X, Y](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, X], f : (K, X) -> Y) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, Y]
  ```
  > 
  >  Maps over the key-value pairs in the map.
- #### new
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,22:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::new[K, V]() -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  >  Create an empty map.
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,268:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::of[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(K, V)]) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,19:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::op_equal[K : <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], other : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,91:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::op_get[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], key : K) -> V?
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits_impl.mbt,64:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/map.mbt,74:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::remove[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V], key : K) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Create a new map with a key-value pair removed. O(log n).
  > If the key is not a member or map, the original map is returned.
- #### singleton
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,28:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::singleton[K, V](key : K, value : V) -> <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]
  ```
  > 
  >  Create a map with a single key-value pair.
- #### size
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,53:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::size[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> Int
  ```
  > 
  >  Get the number of key-value pairs in the map.
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/map.mbt,115:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::to_array[K, V](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]
  ```
  > 
  >  Convert to an array of key-value pairs.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/utils.mbt,278:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::to_json[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/immut/sorted_map#T">T</a>[K, V]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_map/traits.mbt,85:::fn <a href="moonbitlang/core/immut/sorted_map#T">T</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
