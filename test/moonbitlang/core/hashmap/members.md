# HashMap

A mutable hash map based on a Robin Hood hash table.

# Usage

## Create

You can create an empty map using `new()` or construct it using `from_array()`.

```moonbit
let map1 = @hashmap.of([1, 2, 3, 4, 5])
let map2 : @hashmap.T[String, Int] = @hashmap.new()
```

## Set & Get

You can use `set()` to add a key-value pair to the map, and use `get()` to get a value.

```moonbit
let map : HashMap[String, Int] = HashMap::new()
map.set("a", 1)
println(map.get("a")) // Some(1)
println(map.get_or_default("a", 0)) // 1
println(map.get_or_default("b", 0)) // 0
```

## Remove

You can use `remove()` to remove a key-value pair.

```moonbit
let map = @hashmap.of([("a", 1), ("b", 2), ("c", 3)])
map.remove("a")
println(map) // of([("c", 3), ("b", 2)])
```

## Contains

You can use `contains()` to check whether a key exists.

```moonbit
let map = @hashmap.of([("a", 1), ("b", 2), ("c", 3)])
println(map.contains("a")) // true
println(map.contains("d")) // false
```

## Size & Capacity

You can use `size()` to get the number of key-value pairs in the map, or `capacity()` to get the current capacity.

```moonbit
let map = @hashmap.of([("a", 1), ("b", 2), ("c", 3)])
println(map.size()) // 3
println(map.capacity()) // 8
```

Similarly, you can use `is_empty()` to check whether the map is empty.

```moonbit
let map = @hashmap.new()
println(map.is_empty()) // true
```

## Clear

You can use `clear` to remove all key-value pairs from the map, but the allocated memory will not change.

```moonbit
let map = @hashmap.of([("a", 1), ("b", 2), ("c", 3)])
map.clear()
println(map.is_empty()) // true
```

## Iteration

You can use `each()` or `eachi()` to iterate through all key-value pairs.

```moonbit
let map = @hashmap.of([("a", 1), ("b", 2), ("c", 3)])
map.each(fn(k, v) { println("key: {k}, value:\{v}") })
map.eachi(fn(i, k, v) { println("index:\{i}, key:\{k}, value:\{v}") })
```

Or use `iter()` to get an iterator of hashmap.

```moonbit
let map = @hashmap.of([("a", 1), ("b", 2), ("c", 3)])
println(map.iter())
```

---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/hashmap/types.mbt,41:::type T
```

 Mutable hash map, not thread safe.
  
 #### Example
 
 ```
 let map = @hashmap.of([(3, "three"), (8, "eight"), (1, "one")])
 assert_eq!(map.get(2), None)
 assert_eq!(map.get(3), Some("three"))
 map.set(3, "updated")
 assert_eq!(map.get(3), Some("updated"))
 ```

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,136:::impl[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/hashmap/utils.mbt,136:::fn output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,263:::impl[K : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/hashmap/hashmap.mbt,266:::fn arbitrary[K : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### capacity
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,100:::fn <a href="moonbitlang/core/hashmap#T">T</a>::capacity[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> Int
  ```
  > 
  >  Get the capacity of the map.
- #### clear
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,31:::fn <a href="moonbitlang/core/hashmap#T">T</a>::clear[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> Unit
  ```
  > 
  >  Clears the map, removing all key-value pairs. Keeps the allocated space.
- #### contains
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,187:::fn <a href="moonbitlang/core/hashmap#T">T</a>::contains[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K) -> Bool
  ```
  > 
  >  Check if the hash map contains a key.
- #### each
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,112:::fn <a href="moonbitlang/core/hashmap#T">T</a>::each[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], f : (K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all key-value pairs of the map.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,123:::fn <a href="moonbitlang/core/hashmap#T">T</a>::eachi[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], f : (Int, K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all key-value pairs of the map, with index.
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,48:::fn <a href="moonbitlang/core/hashmap#T">T</a>::from_array[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](arr : <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]) -> <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
  ```
  > 
  >  Create new hash map from array.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,72:::fn <a href="moonbitlang/core/hashmap#T">T</a>::from_iter[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]) -> <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
  ```
  > 
- #### get
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,103:::fn <a href="moonbitlang/core/hashmap#T">T</a>::get[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K) -> V?
  ```
  > 
  >  Get the value associated with a key.
- #### get\_or\_default
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,174:::fn <a href="moonbitlang/core/hashmap#T">T</a>::get_or_default[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K, default : V) -> V
  ```
  > 
  >  Get the value associated with a key,
  > returns the provided default value if the key does not exist.
- #### get\_or\_init
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,155:::fn <a href="moonbitlang/core/hashmap#T">T</a>::get_or_init[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K, init : () -> V) -> V
  ```
  > 
  >  Gets the value associated with the given key. If the key doesn't exist in the
  > map, initializes it with the result of calling the provided initialization
  > function.
  > 
  >  Parameters:
  > 
  >  * `self` : The hash map.
  >  * `key` : The key to look up in the map.
  >  * `init` : A function that takes no arguments and returns a value to be
  >    associated with the key if it doesn't exist.
  > 
  >  Returns the value associated with the key, either existing or newly
  > initialized.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "get_or_init" {
  >    let map : @hashmap.T[String, Int] = @hashmap.new()
  >    let value = map.get_or_init("key", fn() { 42 })
  >    inspect!(value, content="42")
  >    inspect!(map.get("key"), content="Some(42)")
  >  }
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,106:::fn <a href="moonbitlang/core/hashmap#T">T</a>::is_empty[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> Bool
  ```
  > 
  >  Check if the hash map is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,38:::fn <a href="moonbitlang/core/hashmap#T">T</a>::iter[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]
  ```
  > 
  >  Returns an iterator of the map.
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,55:::fn <a href="moonbitlang/core/hashmap#T">T</a>::iter2[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[K, V]
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,41:::fn <a href="moonbitlang/core/hashmap#T">T</a>::new[K, V](capacity~ : Int = ..) -> <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
  ```
  > 
  >  Create new hash map.
- #### of
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,250:::fn <a href="moonbitlang/core/hashmap#T">T</a>::of[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(K, V)]) -> <a href="moonbitlang/core/hashmap#T">T</a>[K, V]
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,126:::fn <a href="moonbitlang/core/hashmap#T">T</a>::op_get[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K) -> V?
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,97:::fn <a href="moonbitlang/core/hashmap#T">T</a>::op_set[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,196:::fn <a href="moonbitlang/core/hashmap#T">T</a>::remove[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K) -> Unit
  ```
  > 
  >  Remove a key-value pair from hash map.
- #### set
  ```moonbit
  :::source,moonbitlang/core/hashmap/hashmap.mbt,57:::fn <a href="moonbitlang/core/hashmap#T">T</a>::set[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
  >  Set a key-value pair into hash map.
  > @alert unsafe "Panic if the hash map is full."
- #### size
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,94:::fn <a href="moonbitlang/core/hashmap#T">T</a>::size[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> Int
  ```
  > 
  >  Get the number of key-value pairs in the map.
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/hashmap/utils.mbt,80:::fn <a href="moonbitlang/core/hashmap#T">T</a>::to_array[K, V](self : <a href="moonbitlang/core/hashmap#T">T</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]
  ```
  > 
  >  Converts the map to an array.
