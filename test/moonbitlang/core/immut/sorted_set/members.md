# Immutable Set

ImmutableSet is an immutable, persistent implementation of the set structure (each operation returns a new ImmutableSet), implemented here using a balance tree.

# Usage

## Create

Since set is based on comparison, the type used to construct ImmutableSet needs to implement Compare trait.

You can create an empty ImmutableSet with a value separately through the following methods, or create it directly from the Array.

```moonbit
let set1 : @immut/sorted_set.T[Int] = @immut/sorted_set.new()
let set2 = @immut/sorted_set.singleton(1)
let set4 = @immut/sorted_set.from_array([1])
let set5= @immut/sorted_set.of([1])
```

## Convertion

You can convert an immutable set to an array, which will be sorted.

```moonbit
let set = @immut/sorted_set.of([3, 2, 1])
println(set.to_array()) // [1, 2, 3]
```

## Add & Remove

You can use `add` to add an element to the ImmutableSet.

```moonbit
let set = @immut/sorted_set.of([1, 2, 3, 4])
println(set.add(5)) // of([1, 2, 3, 4, 5])
```

You can use `remove` to remove a specific value.

```moonbit
@immut/sorted_set.of([3, 8, 1]).remove(8) // of([1, 3]))
```

## Max & Min & Contains

You can use `contains` to query whether an element is in the set.

```moonbit
let set = @immut/sorted_set.of([1, 2, 3, 4])
println(set.contains(1)) // true
println(set.contains(5)) // false
```

You can also use `min` and `max` to obtain the minimum or maximum value in the set. When the set is empty, an error will be reported, and they have corresponding Option versions to handle this.

```moonbit
let set = @immut/sorted_set.of([1, 2, 3, 4])
println(set.min()) // 1
println(set.max()) // 4
println(set.min_option()) // Some(1)
println(set.max_option()) // Some(4)
```

## Split & Union & Inter & Diff & Filter

You can provide an intermediate value to divide a set into two sets by `split`, and whether the intermediate value is in the set will also be returned as the return value.

```moonbit
let (left, present, right) = @immut/sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1]).split(5)
/// present // true
/// left // of([1, 2, 3, 4])
/// right // of([6, 7, 8, 9])
```

At the same time, you can use union and inter to take the union or intersection of two sets.

```moonbit
let set1 = @immut/sorted_set.of([3, 4, 5])
let set2 = @immut/sorted_set.of([4, 5, 6])
println(set1.union(set2)) // of([3, 4, 5, 6])
println(set1.inter(set2)) // of([4, 5])
```

You can also use the `diff` function to obtain the difference between two sets.

```moonbit
let set1 = @immut/sorted_set.of([1, 2, 3])
let set2 = @immut/sorted_set.of([4, 5, 1])
println(set1.diff(set2)) // of([2, 3])
```

You can use `filter` to filter the elements in the set.

```moonbit
let set = @immut/sorted_set.of([1, 2, 3, 4, 5, 6])
println(set.filter(fn(v) { v % 2 == 0})) // of([2, 4, 6]))
```

## Subset & Disjoint

You can use `subsets` and `disjoint` to determine the inclusion and separation relationship between two sets

```moonbit
@immut/sorted_set.of([1, 2, 3]).subset(of(@immut/sorted_set.[7, 2, 9, 4, 5, 6, 3, 8, 1])) |> println // true
@immut/sorted_set.of([1, 2, 3]).disjoint(@immut/sorted_set.of([4, 5, 6])) |> println // true
```

## Iter & Fold & Map

Like other sequential containers, set also has iterative methods such as `iter`, `fold`, and `map`, and their order is based on the comparison being less than the order.

```moonbit
@immut/sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1]).each(println)
@immut/sorted_set.of([1, 2, 3, 4, 5]).fold(init=0, fn(acc, x) { acc + x }) // 15
@immut/sorted_set.of([1, 2, 3].map(fn(x){ x * 2})) |> println// of([2, 4, 6]))
```

## All & Any

`all` and `any` can detect whether all elements in the set match or if there are elements that match.

```moonbit
@immut/sorted_set.of([2, 4, 6]).all(fn(v) { v % 2 == 0}) |> println // true
@immut/sorted_set.of([1, 4, 3]).any(fn(v) { v % 2 == 0}) |> println // true
```

## Empty

`is_empty` can determine whether a set is empty.

```moonbit
@immut/sorted_set.of([]).is_empty() // true
@immut/sorted_set.of([1]).is_empty() // false
```

---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/immut/sorted_set/types.mbt,21:::type T
```

 ImmutableSets are represented by balanced binary trees (the heights of the children differ by at most 2).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/generic.mbt,64:::impl[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/generic.mbt,64:::fn compare[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> Int
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,26:::impl[A] <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,26:::fn default[A]() -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/generic.mbt,48:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/generic.mbt,48:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,764:::impl[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>] <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,764:::fn hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,531:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,531:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,536:::impl[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>] <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,536:::fn to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,550:::impl[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,550:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,577:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/sorted_set#T">T</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,577:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[X]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,92:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::add[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], value : A) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Insert a value into the ImmutableSet.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([6, 3, 8, 1]).add(5), @sorted_set.of([1, 3, 5, 6, 8]))
  >  ```
- #### all
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,480:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::all[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], f : (A) -> Bool) -> Bool
  ```
  > 
  >  Test if all values of the ImmutableSet satisfy the predicate.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([2, 4, 6]).all(fn(v) { v % 2 == 0}), true)
  >  ```
- #### any
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,495:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::any[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], f : (A) -> Bool) -> Bool
  ```
  > 
  >  Checks if at least one element of the set satisfies the predicate.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 4, 3]).any(fn(v) { v % 2 == 0}), true)
  >  ```
- #### contains
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,262:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::contains[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], value : A) -> Bool
  ```
  > 
  >  Return true if value contain in sorted\_set
- #### diff
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,342:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::diff[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Returns the difference between self and other.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3]).difference(@sorted_set.of([4, 5, 1])), @sorted_set.of([2, 3]))
  >  ```
  >  
  >  @alert deprecated "Use `difference` instead"
  > @coverage.skip
- #### difference
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,354:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::difference[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Returns the difference between self and other.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3]).difference(@sorted_set.of([4, 5, 1])), @sorted_set.of([2, 3]))
  >  ```
- #### disjoint
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,404:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::disjoint[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> Bool
  ```
  > 
  >  Returns true if the two sets do not intersect.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3]).disjoint(@sorted_set.of([4, 5, 6])), true)
  >  ```
- #### each
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,429:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::each[A](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the ImmutableSet.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = []
  >  @sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1]).each(fn(x) { arr.push(x) })
  >  assert_eq!(arr, [1, 2, 3, 4, 5, 6, 7, 8, 9])
  >  ```
- #### filter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,510:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::filter[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], f : (A) -> Bool) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Filter the ImmutableSet.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3, 4, 5, 6]).filter(fn(v) { v % 2 == 0}), @sorted_set.of([2, 4, 6]))
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,448:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::fold[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold the ImmutableSet.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3, 4, 5]).fold(init=0, fn(acc, x) { acc + x }), 15)
  >  ```
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,36:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::from_array[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](array : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Initialize an ImmutableSet\[T\] from a Array\[T\]
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/generic.mbt,39:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::from_iter[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,570:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::from_json[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- #### inter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,308:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::inter[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  @alert deprecated "Use `intersection` instead"
  > @coverage.skip
- #### intersection
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,320:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::intersection[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Returns the intersection of self with other.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([3, 4, 5]).intersection(@sorted_set.of([4, 5, 6])), @sorted_set.of([4, 5]))
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,253:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::is_empty[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> Bool
  ```
  > 
  >  Returns true if sorted\_set is empty
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/generic.mbt,20:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::iter[A](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### map
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,464:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::map[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], f : (A) -> B) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[B]
  ```
  > 
  >  Maps the ImmutableSet.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3]).map(fn(x){ x * 2}), @sorted_set.of([2, 4, 6]))
  >  ```
- #### max
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,195:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::max[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> A
  ```
  > 
  >  Returns the largest value in the sorted\_set.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1]).max(), 9)
  >  ```
  >  @alert unsafe "Panic if the sorted\_set is empty."
- #### max\_option
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,209:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::max_option[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> A?
  ```
  > 
  >  Returns the largest value in the ImmutableSet.
  > But returns None when the value does not exist.
- #### min
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,161:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::min[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> A
  ```
  > 
  >  Returns the smallest value in the sorted\_set.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1]).min(), 1)
  >  ```
  >  @alert unsafe "Panic if the sorted\_set is empty."
- #### min\_option
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,175:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::min_option[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> A?
  ```
  > 
  >  Returns the smallest value in the sorted\_set.
  > But returns None when the value does not exist.
- #### new
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,21:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::new[A]() -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,755:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::of[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,126:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::remove[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], value : A) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Remove n value from the ImmutableSet.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([3, 8, 1]).remove(8), @sorted_set.of([1, 3]))
  >  ```
- #### remove\_min
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,73:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::remove_min[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Remove the smallest value,
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([3, 4, 5]).remove_min(), @sorted_set.of([4, 5]))
  >  ```
  >  @alert unsafe "Panic if the ImmutableSet is empty."
- #### singleton
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,30:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::singleton[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](value : A) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Returns the one-value ImmutableSet containing only `value`.
- #### size
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,632:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::size[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> Int
  ```
  > 
  >  Get the height of set.
- #### split
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,233:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::split[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], divide : A) -> (<a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], Bool, <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A])
  ```
  > 
  >  Returns a triple (left, present, right), where left \< divide \< right.
  > present == false if self contains no value equal to divide,
  > present == true  if self contains an value equal to divide.
  >  
  >  #### Example
  >  
  >  ```
  >  let (left, present, right) = @sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1]).split(5)
  >  assert_eq!(present, true)
  >  assert_eq!(left, @sorted_set.of([1, 2, 3, 4]))
  >  assert_eq!(right, @sorted_set.of([6, 7, 8, 9]))
  >  ```
- #### subset
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,374:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::subset[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> Bool
  ```
  > 
  >  Returns true if self is a subset of other.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([1, 2, 3]).subset(@sorted_set.of([7, 2, 9, 4, 5, 6, 3, 8, 1])), true)
  >  ```
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,46:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::to_array[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
  >  Convert ImmutableSet\[T\] to Array\[T\], the result must be ordered.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,545:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### union
  ```moonbit
  :::source,moonbitlang/core/immut/sorted_set/immutable_set.mbt,281:::fn <a href="moonbitlang/core/immut/sorted_set#T">T</a>::union[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A], other : <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]) -> <a href="moonbitlang/core/immut/sorted_set#T">T</a>[A]
  ```
  > 
  >  Returns the union of self and other.
  >  
  >  #### Example
  >  
  >  ```
  >  assert_eq!(@sorted_set.of([3, 4, 5]).union(@sorted_set.of([4, 5, 6])), @sorted_set.of([3, 4, 5, 6]))
  >  ```
