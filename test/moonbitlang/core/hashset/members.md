# HashSet

A mutable hash set based on a Robin Hood hash table.

# Usage

## Create

You can create an empty set using `new()` or construct it using `from_array()`.

```moonbit
let set1 = @hashset.of([1, 2, 3, 4, 5])
let set2 : @hashset.T[String] = @hashset.new()
```

## Insert & Contain

You can use `insert()` to add a key to the set, and `contains()` to check whether a key exists.

```moonbit
let set : @hashset.T[String] = @hashset.new()
set.insert("a")
println(set.contains("a")) // true
```

## Remove

You can use `remove()` to remove a key.

```moonbit
let set = @hashset.of([("a"), ("b"), ("c")])
set.remove("a")
println(set.contains("a")) // false
```

## Size & Capacity

You can use `size()` to get the number of keys in the set, or `capacity()` to get the current capacity.

```moonbit
let set = @hashset.of([("a"), ("b"), ("c")])
println(set.size()) // 3
println(set.capacity()) // 8
```

Similarly, you can use `is_empty()` to check whether the set is empty.

```moonbit
let set = @hashset.new()
println(set.is_empty()) // true
```

## Clear

You can use `clear` to remove all keys from the set, but the allocated memory will not change.

```moonbit
let set = @hashset.of([("a"), ("b"), ("c")])
set.clear()
println(set.is_empty()) // true
```

## Iteration

You can use `each()` or `eachi()` to iterate through all keys.

```moonbit
let set = @hashset.of([("a"), ("b"), ("c")])
set.each(fn(k) { println("element: \{k}") })
set.eachi(fn(i, k) { println("index: \{i}, element:\{k}") })
```

## Set Operations

You can use `union()`, `intersection()`, `difference()` and `symmetric_difference()` to perform set operations.

```moonbit
let m1 = @hashset.of(["a", "b", "c"])
let m2 = @hashset.of(["b", "c", "d"])
println(m1.union(m2)) // of(["a", "b", "c", "d"])
println(m1.intersection(m2)) // of(["b", "c"])
println(m1.difference(m2)) // of(["a"])
println(m1.symmetric_difference(m2)) // of(["a", "d"])
```


---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/hashset/types.mbt,38:::type T
```

 Mutable hash set, not thread safe.
  
 #### Example
 
 ```
 let set = @hashset.of([(3, "three"), (8, "eight"), (1, "one")])
 set.add((4, "four"))
 assert_eq!(set.contains((4, "four")), true)
 ```

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,331:::impl[K : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/hashset/hashset.mbt,331:::fn output[K : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,242:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/hashset#T">T</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/hashset/hashset.mbt,242:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/hashset#T">T</a>[X]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,56:::fn <a href="moonbitlang/core/hashset#T">T</a>::add[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], key : K) -> Unit
  ```
  > 
  >  Insert a key into hash set.
- #### capacity
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,145:::fn <a href="moonbitlang/core/hashset#T">T</a>::capacity[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> Int
  ```
  > 
  >  Get the capacity of the set.
- #### clear
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,178:::fn <a href="moonbitlang/core/hashset#T">T</a>::clear[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> Unit
  ```
  > 
  >  Clears the set, removing all keys. Keeps the allocated space.
- #### contains
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,93:::fn <a href="moonbitlang/core/hashset#T">T</a>::contains[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], key : K) -> Bool
  ```
  > 
  >  Check if the hash set contains a key.
- #### difference
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,205:::fn <a href="moonbitlang/core/hashset#T">T</a>::difference[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], other : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  >  Difference of two hash sets.
- #### each
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,157:::fn <a href="moonbitlang/core/hashset#T">T</a>::each[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K], f : (K) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all keys of the set.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,163:::fn <a href="moonbitlang/core/hashset#T">T</a>::eachi[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K], f : (Int, K) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all keys of the set, with index.
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,32:::fn <a href="moonbitlang/core/hashset#T">T</a>::from_array[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#Array">Array</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  >  Create new hash set from array.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,235:::fn <a href="moonbitlang/core/hashset#T">T</a>::from_iter[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
- #### insert
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,50:::fn <a href="moonbitlang/core/hashset#T">T</a>::insert[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], key : K) -> Unit
  ```
  > 
  >  Insert a key into hash set.
  > @alert unsafe "Panic if the hash set is full."
  > @alert deprecated "Use `add` instead."
  > @coverage.skip
- #### intersection
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,197:::fn <a href="moonbitlang/core/hashset#T">T</a>::intersection[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], other : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  >  Intersection of two hash sets.
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,151:::fn <a href="moonbitlang/core/hashset#T">T</a>::is_empty[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> Bool
  ```
  > 
  >  Check if the hash set is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,221:::fn <a href="moonbitlang/core/hashset#T">T</a>::iter[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[K]
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,21:::fn <a href="moonbitlang/core/hashset#T">T</a>::new[K]() -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  >  Create new hash set.
- #### of
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,39:::fn <a href="moonbitlang/core/hashset#T">T</a>::of[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,115:::fn <a href="moonbitlang/core/hashset#T">T</a>::remove[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], key : K) -> Unit
  ```
  > 
  >  Remove a key from hash set.
- #### size
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,139:::fn <a href="moonbitlang/core/hashset#T">T</a>::size[K](self : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> Int
  ```
  > 
  >  Get the number of keys in the set.
- #### symmetric\_difference
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,213:::fn <a href="moonbitlang/core/hashset#T">T</a>::symmetric_difference[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], other : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  >  Symmetric difference of two hash sets.
- #### union
  ```moonbit
  :::source,moonbitlang/core/hashset/hashset.mbt,188:::fn <a href="moonbitlang/core/hashset#T">T</a>::union[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/hashset#T">T</a>[K], other : <a href="moonbitlang/core/hashset#T">T</a>[K]) -> <a href="moonbitlang/core/hashset#T">T</a>[K]
  ```
  > 
  >  Union of two hash sets.
  > @alert unsafe "Panic if the hash set is full."
