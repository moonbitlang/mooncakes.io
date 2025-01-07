# Sorted Set

A mutable set backed by a red-black tree.

# Usage

## Create

You can create an empty MutableSet or a MutableSet from other containers.

```moonbit
let set1 : @sorted_set.T[Int] = @sorted_set.new()
let set2 = @sorted_set.singleton(1)
let set5 = @sorted_set.of([1])
let set4 = @sorted_set.from_array([1])
```
### Container Operations

Add an element to the MutableSet in place.

```moonbit
let set = @sorted_set.of([1, 2, 3, 4])
set.add(5) // ()
set.to_string() // of([1, 2, 3, 4, 5])
```

Remove an element from the MutableSet in place.

```moonbit
let set = @sorted_set.of([3, 8, 1]) 
set.remove(8) // () 
set.to_string() // of([1, 3])
```

Whether an element is in the set.

```moonbit
let set = @sorted_set.of([1, 2, 3, 4])
set.contains(1) // true
set.contains(5) // false
```

Iterates over the elements in the set.

```moonbit
@sorted_set.of([1, 2, 3, 4]).each(print) // output: 1234
```

Delete all elements of the set that filter returns false. It is done in place.

```moonbit
let set = @sorted_set.of([1, 2, 3, 4, 5, 6])
set.filter(fn(v) { v % 2 == 0}) // ()
set.to_string() // of([2, 4, 6])
```

Get the size of the set.

```moonbit
@sorted_set.of([1, 2, 3, 4]).size() // 4
```

Whether the set is empty.

```moonbit
@sorted_set.new().is_empty() // true
```

### Set Operations

Union, intersection and difference of two sets. They return a new set that does not overlap with the original sets in memory.

```moonbit
let set1 = @sorted_set.of([3, 4, 5])
let set2 = @sorted_set.of([4, 5, 6])
set1.union(set2) // of([3, 4, 5, 6])
set1.inter(set2) // of([4, 5])
set1.diff(set2) // of([3])
```

Determine the inclusion and separation relationship between two sets.

```moonbit
@sorted_set.of([1, 2, 3]).subset(of([7, 2, 9, 4, 5, 6, 3, 8, 1])) // true
@sorted_set.of([1, 2, 3]).disjoint(of([4, 5, 6])) // true
```

### Stringify

MutableSet implements to_string (i.e. Show trait), which allows you to directly output it.

```moonbit
println(@sorted_set.of([1, 2, 3])) // output of([1, 2, 3]))
@sorted_set.of([1, 2, 3]).to_string() // "MutableSet::[1, 2, 3]"
```


---
# Documentation
|Type|description|
|---|---|
|[T](#T)||
|[Node](#Node)||

|Value|description|
|---|---|
|[new](#new)||
|[of](#of)||
|[singleton](#singleton)||

## T

```moonbit
:::source,moonbitlang/core/sorted_set/types.mbt,20:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,429:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/sorted_set#T">T</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/sorted_set#T">T</a>[X]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,421:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/sorted_set#T">T</a> with output[V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
  >  Converts the set to string.

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,86:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::add[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], value : V) -> Unit
  ```
  > 
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,429:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/sorted_set#T">T</a>[X]
  ```
  > 
- #### contains
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,119:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::contains[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], value : V) -> Bool
  ```
  > 
  >  Return if a value is contained in the set.
- #### deep\_clone
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,44:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::deep_clone[V](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
  >  Returns a deep clone of the MutableSet.
  >  
  >  FIXME: it is just copying the tree structure, not the values.
  > It requires a Clone trait on T, which we don't have yet.
- #### diff
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,251:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::diff[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
  >  Returns the difference of two sets.
  >  
  >  @alert deprecated "Use `difference` instead"
- #### difference
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,259:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::difference[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
  >  Returns the difference of two sets.
- #### disjoint
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,290:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::disjoint[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> Bool
  ```
  > 
  >  Returns if two sets are disjoint.
- #### each
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,320:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::each[V](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], f : (V) -> Unit) -> Unit
  ```
  > 
  >  Iterates the set.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,346:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::eachi[V](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], f : (Int, V) -> Unit) -> Unit
  ```
  > 
  >  Iterates the set with index.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,413:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::from_iter[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
- #### intersect
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,268:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::intersect[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
  >  Returns the intersection of two sets.
  > @alert deprecated "Use `intersection` instead"
- #### intersection
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,274:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::intersection[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
  >  Returns the intersection of two sets.
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,305:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::is_empty[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> Bool
  ```
  > 
  >  Returns if MutableSet is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,382:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::iter[V](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[V]
  ```
  > 
  >  Returns a iterator.
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,299:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::op_equal[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], other : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,421:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::output[V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
  >  Converts the set to string.
- #### remove
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,97:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::remove[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], value : V) -> Unit
  ```
  > 
- #### size
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,314:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::size[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> Int64
  ```
  > 
  >  Returns the number of elements in the MutableSet.
- #### subset
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,282:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::subset[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> Bool
  ```
  > 
  >  Returns if a set is a subset of another set.
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,374:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::to_array[V](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/array#Array">Array</a>[V]
  ```
  > 
  >  Converts the set to an array.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/sorted_set/traits.mbt,85:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### union
  ```moonbit
  :::source,moonbitlang/core/sorted_set/set.mbt,137:::fn <a href="moonbitlang/core/sorted_set#T">T</a>::union[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/sorted_set#T">T</a>[V], src : <a href="moonbitlang/core/sorted_set#T">T</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
  ```
  > 
  >  Returns the union of two sets.

## new

```moonbit
:::source,moonbitlang/core/sorted_set/set.mbt,19:::fn new[V]() -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
```

 Construct a empty set.

## of

```moonbit
:::source,moonbitlang/core/sorted_set/set.mbt,31:::fn of[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](array : <a href="moonbitlang/core/array#Array">Array</a>[V]) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
```

 Initialize an set from an array.

## singleton

```moonbit
:::source,moonbitlang/core/sorted_set/set.mbt,25:::fn singleton[V : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](value : V) -> <a href="moonbitlang/core/sorted_set#T">T</a>[V]
```

 Returns the one-value set containing only `value`.

## Node


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/sorted_set/traits.mbt,85:::fn <a href="moonbitlang/core/sorted_set#Node">Node</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
