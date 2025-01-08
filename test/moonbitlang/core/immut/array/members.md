# Immutable Array

Immutable array is a persistent data structure that provides random access and update operations. Based on Clojure's [persistent vector](https://hypirion.com/musings/understanding-persistent-vector-pt-1).

# Usage

## Create

You can create an empty array using `new()` or construct it using `of()`, or use `from_iter()` to construct it from an iterator.

```moonbit
let arr2 = @immut/array.new()
let arr1 = @immut/array.of([1, 2, 3, 4, 5])    
let arr3 = @immut/array.from_iter((1).upto(5))
let arr4 = @immut/array.from_array([1, 2, 3])
```

Or use `make()`, `makei()` to create an array with some elements.

```moonbit
let arr1 = @immut/array.make(5, 1)
let arr2 = @immut/array.makei(5, fn(i){i + 1})
println(arr1) // of([1, 1, 1, 1, 1])
println(arr2) // of([1, 2, 3, 4, 5])
```

## Update 

Since the array is immutable, the `set()`, `push()` operation is not in-place. It returns a new array with the updated value.

```moonbit
let arr1 = @immut/array.of([1, 2, 3, 4, 5])
let arr2 = arr1.set(2, 10).push(6)
println(arr1) // of([1, 2, 3, 4, 5])
println(arr2) // of([1, 2, 10, 4, 5, 6])
```

## Query

You can use `op_get()` to get the value at the index, or `length()` to get the length of the array, or `is_empty()` to check whether the array is empty.

```moonbit
let arr = @immut/array.of([1, 2, 3, 4, 5])
println(arr[2]) // 3
println(arr.length()) // 5
println(arr.is_empty()) // false
```

## Iteration

You can use `iter()` to get an iterator of the array, or use `each()` to iterate over the array.

```moonbit
let arr = @immut/array.of([1, 2, 3, 4, 5])
println("iterator: \{arr.iter()}")
println(arr.each(fn(v) { println("element \{v}") }))
println(arr.eachi(fn(i, v) { println("index: \{i}, element: \{v}") }))
```



---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/immut/array/types.mbt,16:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,212:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/array/array.mbt,212:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], other : <a href="moonbitlang/core/immut/array#T">T</a>[A]) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,383:::impl[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>] <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/array/array.mbt,383:::fn hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,22:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/array/array.mbt,22:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,375:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/array#T">T</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/array/array.mbt,375:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/array#T">T</a>[X]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### copy
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,63:::fn <a href="moonbitlang/core/immut/array#T">T</a>::copy[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A]) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
- #### each
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,167:::fn <a href="moonbitlang/core/immut/array#T">T</a>::each[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterate over the array.
  >  
  >  #### Example
  >  ```
  >  let arr = []
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  v.each(fn(e) { arr.push(e) })
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,189:::fn <a href="moonbitlang/core/immut/array#T">T</a>::eachi[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], f : (Int, A) -> Unit) -> Unit
  ```
  > 
  >  Iterate over the array with index.
  >  
  >  #### Example
  >  ```
  >  let arr = []
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  v.eachi(fn(i, e) { arr.push(i * e) })
  >  assert_eq!(arr, [0, 2, 6, 12, 20])
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,224:::fn <a href="moonbitlang/core/immut/array#T">T</a>::fold[A, B](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold the array.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v.fold(fn(a, b) { a + b }, init=0), 15)
  >  ```
- #### fold\_left
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,266:::fn <a href="moonbitlang/core/immut/array#T">T</a>::fold_left[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], f : (A, A) -> A, init~ : A) -> A
  ```
  > 
  >  Fold the array from left to right.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v.fold(fn(a, b) { a + b }, init=0), 15)
  >  ```
  >  @alert deprecated "Use `fold` instead"
  > @coverage.skip
- #### fold\_right
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,280:::fn <a href="moonbitlang/core/immut/array#T">T</a>::fold_right[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], f : (A, A) -> A, init~ : A) -> A
  ```
  > 
  >  Fold the array from right to left.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v.rev_fold(fn(a, b) { a + b }, init=0), 15)
  >  ```
  >  @alert deprecated "Use `rev_fold` instead"
  > @coverage.skip
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,153:::fn <a href="moonbitlang/core/immut/array#T">T</a>::from_array[A](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  >  Create a persistent array from an array.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3])
  >  assert_eq!(v, @array.from_array([1, 2, 3]))
  >  ```
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,53:::fn <a href="moonbitlang/core/immut/array#T">T</a>::from_iter[A](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,27:::fn <a href="moonbitlang/core/immut/array#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A]) -> Bool
  ```
  > 
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,39:::fn <a href="moonbitlang/core/immut/array#T">T</a>::iter[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,58:::fn <a href="moonbitlang/core/immut/array#T">T</a>::length[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A]) -> Int
  ```
  > 
- #### make
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,359:::fn <a href="moonbitlang/core/immut/array#T">T</a>::make[A](len : Int, value : A) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  >  Create a persistent array with a given length and value.
- #### makei
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,365:::fn <a href="moonbitlang/core/immut/array#T">T</a>::makei[A](len : Int, f : (Int) -> A) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  >  Create a persistent array with a given length and a function to generate values.
- #### map
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,292:::fn <a href="moonbitlang/core/immut/array#T">T</a>::map[A, B](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], f : (A) -> B) -> <a href="moonbitlang/core/immut/array#T">T</a>[B]
  ```
  > 
  >  Map a function over the array.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v.map(fn(e) { e * 2 }), @array.of([2, 4, 6, 8, 10]))
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,17:::fn <a href="moonbitlang/core/immut/array#T">T</a>::new[A]() -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  >  Return a new empty array
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,370:::fn <a href="moonbitlang/core/immut/array#T">T</a>::of[A](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,84:::fn <a href="moonbitlang/core/immut/array#T">T</a>::op_get[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], index : Int) -> A
  ```
  > 
  >  Get a value at the given index.
  >  
  >  #### Examples
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v[0], 1)
  >  ```
- #### push
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,129:::fn <a href="moonbitlang/core/immut/array#T">T</a>::push[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], value : A) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  >  Push a value to the end of the array.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3])
  >  assert_eq!(v.push(4), @array.of([1, 2, 3, 4]))
  >  ```
- #### rev\_fold
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,244:::fn <a href="moonbitlang/core/immut/array#T">T</a>::rev_fold[A, B](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold the array in reverse order.
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v.rev_fold(fn(a, b) { a + b }, init=0), 15)
  >  ```
- #### set
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,102:::fn <a href="moonbitlang/core/immut/array#T">T</a>::set[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A], index : Int, value : A) -> <a href="moonbitlang/core/immut/array#T">T</a>[A]
  ```
  > 
  >  Set a value at the given index (immutable).
  >  
  >  #### Example
  >  ```
  >  let v = @array.of([1, 2, 3, 4, 5])
  >  assert_eq!(v.set(1, 10), @array.of([1, 10, 3, 4, 5]))
  >  ```
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/immut/array/array.mbt,32:::fn <a href="moonbitlang/core/immut/array#T">T</a>::to_array[A](self : <a href="moonbitlang/core/immut/array#T">T</a>[A]) -> <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
