# Tuple

Tuple is a fixed-size collection of elements of different types. It is a lightweight data structure that can be used to store multiple values in a single variable. This sub-package introduces utils for binary tuples.

# Usage

## Create

Create a new tuple by `pair` or using the tuple literal syntax.

```moonbit
let tuple = @tuple.pair(1, 2)
let tuple2 = (1, 2)
```

## Access

You can access the elements of the tuple using the `fst` and `snd` methods (Shortly use dot access).

```moonbit
let tuple = (1, 2)
@tuple.fst(tuple) // 1
@tuple.snd(tuple) // 2
tuple.0 // 1
tuple.1 // 2
```

## Transformation

You can transform the tuple using the `map_fst` and `map_snd` method, which will apply the function to the first and second element of the tuple respectively.

```moonbit
let tuple = (1, 2)
let tuple2 = @tuple.map_fst(tuple, fn(x) { x + 1 }) // tuple2 = (2, 2)
let tuple3 = @tuple.map_snd(tuple, fn(x) { x + 1 }) // tuple3 = (1, 3)
```

Or you can use the `map_both` method to apply the function to both elements of the tuple.

```moonbit
let tuple = (1, 2)
let mapped = @tuple.map_both(
    fn(x : Int) -> Int { x + 1 },
    fn(x : Int) -> Int { x - 1 },
    tuple
) // mapped = (2, 1)
```

## Conversion
Swap the elements of the tuple using the `swap` method.

```moonbit
let tuple = (1, 2)
let swapped = @tuple.swap(tuple) // swapped = (2, 1)
```

## Currying
Moonbit provides a currying method for the tuple. You can use the `curry` method to convert a function into a curried function.

```moonbit
let add = fn(a, b) { a + b }
let curried_add = @tuple.curry(add)
let result = curried_add(1)(2) // result = 3
```

The dual of the `curry` method is the `uncurry` method, which converts a curried function back to a normal function.

```moonbit
let add = fn(a) { fn(b) { a + b } }
let uncurried_add = @tuple.uncurry(add)
let result = uncurried_add(1, 2) // result = 3
```


---
# Documentation
|Type|description|
|---|---|
|[Tuple2](#Tuple2)||
|[Tuple3](#Tuple3)||
|[Tuple4](#Tuple4)||
|[Tuple5](#Tuple5)||
|[Tuple6](#Tuple6)||
|[Tuple7](#Tuple7)||

|Value|description|
|---|---|
|[curry](#curry)||
|[fst](#fst)||
|[map\_both](#map_both)||
|[map\_fst](#map_fst)||
|[map\_snd](#map_snd)||
|[pair](#pair)||
|[snd](#snd)||
|[swap](#swap)||
|[uncurry](#uncurry)||

## curry

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,118:::fn curry[T, U, V](f : (T, U) -> V) -> ((T) -> ((U) -> V))
```

 Curry a function.
 
 #### Example
 ```
 let add = fn(x : Int, y : Int) -> Int { x + y }
 let curried_add = @tuple.curry(add)
 assert_eq!(curried_add(1)(2), 3)
 ```

## fst

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,36:::fn fst[T, U](tuple : (T, U)) -> T
```

 Get the first element of a tuple.
 
 #### Example
 ```
 let tuple = (1, 2)
 let x = @tuple.fst(tuple)
 assert_eq!(x, 1)
 ```

## map\_both

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,88:::fn map_both[T, U, V, W](f : (T) -> U, g : (V) -> W, tuple : (T, V)) -> (U, W)
```

 Map a function over both elements of a tuple.
 
 #### Example
 ```
 let tuple = (1, 2)
 let mapped = @tuple.map_both(fn(x : Int) -> Int { x + 1 }, fn(x : Int) -> Int { x - 1 }, tuple)
 assert_eq!(mapped, (2, 1))
 ```

## map\_fst

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,62:::fn map_fst[T, U, V](f : (T) -> U, tuple : (T, V)) -> (U, V)
```

 Map a function over the first element of a tuple.
 
 #### Example
 ```
 let tuple = (1, 2)
 let mapped = @tuple.map_fst(fn(x : Int) -> Int { x + 1 }, tuple)
 assert_eq!(mapped, (2, 2))
 ```

## map\_snd

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,75:::fn map_snd[T, U, V](f : (T) -> U, tuple : (V, T)) -> (V, U)
```

 Map a function over the second element of a tuple.
 
 #### Example
 ```
 let tuple = (1, 2)
 let mapped = @tuple.map_snd(fn(x : Int) -> Int { x + 1 }, tuple)
 assert_eq!(mapped, (1, 3))
 ```

## pair

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,23:::fn pair[T, U](x : T, y : U) -> (T, U)
```

 Create a tuple with two elements.
 
 #### Example
 ```
 let tuple = @tuple.pair(1, 2)
 assert_eq!(tuple, (1, 2))
 ```

## snd

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,49:::fn snd[T, U](tuple : (T, U)) -> U
```

 Get the second element of a tuple.
 
 #### Example
 ```
 let tuple = (1, 2)
 let y = @tuple.snd(tuple)
 assert_eq!(y, 2)
 ```

## swap

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,105:::fn swap[T, U](tuple : (T, U)) -> (U, T)
```

 Swap the elements of a tuple.
 
 #### Example
 ```
 let tuple = (1, 2)
 let swapped = @tuple.swap(tuple)
 assert_eq!(swapped, (2, 1))
 ```

## uncurry

```moonbit
:::source,moonbitlang/core/tuple/tuple.mbt,131:::fn uncurry[T, U, V](f : (T) -> ((U) -> V)) -> ((T, U) -> V)
```

 Uncurry a function.
 
 #### Example
 ```
 let add = fn(x : Int) -> (Int) -> Int { fn(y : Int) -> Int { x + y } }
 let uncurried_add = @tuple.uncurry(add)
 assert_eq!(uncurried_add(1, 2), 3)
 ```

## Tuple2


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,19:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a> with arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B)
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,19:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B)
  ```
  > 

## Tuple3


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,32:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a> with arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C)
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,32:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C)
  ```
  > 

## Tuple4


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,44:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a> with arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D)
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,44:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D)
  ```
  > 

## Tuple5


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,57:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a> with arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D, E)
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,57:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D, E)
  ```
  > 

## Tuple6


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,71:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a> with arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, F : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D, E, F)
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,71:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, F : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D, E, F)
  ```
  > 

## Tuple7


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,86:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a> with arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, F : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, G : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D, E, F, G)
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/tuple/tuple_arbitrary.mbt,86:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::arbitrary[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, B : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, C : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, D : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, F : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, G : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, r0 : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> (A, B, C, D, E, F, G)
  ```
  > 
