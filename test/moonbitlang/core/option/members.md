# Option

The `Option` type is a built-in type in MoonBit that represents an optional value. The type annotation `Option[A]` can also be written as `A?`.

It is an enum with two variants: `Some(T)`, which represents a value of type `T`, and `None`, representing no value.

Note that some methods of the Option are defined in the `core/builtin` package.

# Usage

## Create
You can create an `Option` value using the `Some` and `None` constructors, remember to give proper type annotations.

```moonbit
let some: Int? = Some(42)
let none: String? = None
```

For conditional expressions, you can use the `when` function, which returns `Some` if the condition is true, otherwise `None`. Note that the value is lazily evaluated.

```moonbit
let some = @option.when(1 > 0, fn () { 42 }) // Some(42)
let none = @option.when(1 < 0, fn () { 42 }) // None
```

The dual version of `when` is the `unless` function, which returns `Some` if the condition is false, otherwise `None`.

```moonbit
let some = @option.unless(1 < 0, fn () { 42 }) // Some(42)
let none = @option.unless(1 > 0, fn () { 42 }) // None
```

## Extracting values

You can extract the value from an `Option` using the `match` expression (Pattern Matching).

```moonbit
match some {
    Some(value) => print(value)
    None => print("None")
}
```

Or using the `unwrap` method, which will panic if the result is `None` and return the value if it is `Some`.

```moonbit
let some: Int? = Some(42)
let value = some.unwrap() // 42
```

A safer alternative to `unwrap` is the `or` method, which returns the value if it is `Some`, otherwise, it returns the default value.

```moonbit
let none: Int? = None
let value = none.or(0) // 0
```

There is also the `or_else` method, which returns the value if it is `Some`, otherwise, it returns the result of the provided function.

```moonbit
let none: Int? = None
let value = none.or_else(fn() -> Int { 0 }) // 0
```

## Transforming values

You can transform the value of an `Option` using the `map` method. It applies the provided function to the value if it is `Some`, otherwise, it returns `None`.

```moonbit
let some: Int? = Some(42)
let new_some = some.map(fn(value: Int) { value + 1 }) // Some(43)
```

There is a `filter` method that applies a predicate to the value if it is `Some`, otherwise, it returns `None`.

```moonbit
let some: Int? = Some(42)
let new_some = some.filter(fn(value: Int) { value > 40 }) // Some(42)
let none = some.filter(fn(value: Int) { value > 50 }) // None
```

## Monadic operations
You can chain multiple operations that return `Option` using the `bind` method, which applies a function to the value if it is `Some`, otherwise, it returns `None`. Different from `map`, the function in argument returns an `Option`.

```moonbit
let some: Int? = Some(42)
let new_some = some.bind(fn(value: Int) -> Int? { Some(value + 1) }) // Some(43)
```

Sometimes we want to reduce the nested `Option` values into a single `Option`, you can use the `flatten` method to achieve this. It transforms `Some(Some(value))` into `Some(value)`, and `None` otherwise.

```moonbit
let some: Option[Option[Int]] = Some(Some(42))
let new_some = some.flatten() // Some(42)
let none: Int?? = Some(None)
let new_none = none.flatten() // None
```

---
# Documentation
|Type|description|
|---|---|
|[Option](#Option)||

|Value|description|
|---|---|
|[empty](#empty)||
|[some](#some)||
|[unless](#unless)||
|[when](#when)||

## empty

```moonbit
:::source,moonbitlang/core/option/option.mbt,75:::fn empty[T]() -> T?
```

 Creates an empty `Option` of type `T`.

## some

```moonbit
:::source,moonbitlang/core/option/option.mbt,87:::fn some[T](value : T) -> T?
```

 Creates an `Option` that contains a value.

## unless

```moonbit
:::source,moonbitlang/core/option/option.mbt,62:::fn unless[T](condition : Bool, value : () -> T) -> T?
```

 The `unless` function returns an `Option` value based on a condition.

 `unless(condition, value)` is equivalent to `when(not(condition), value)`.

 #### Arguments

 * `condition`: A boolean value indicating whether the condition is true or false.
 * `value`: A function that returns a value of type `T`.

 #### Returns

 An `Option` value that is `Some(value())` if the condition is false, otherwise `None`.


## when

```moonbit
:::source,moonbitlang/core/option/option.mbt,33:::fn when[T](condition : Bool, value : () -> T) -> T?
```

 Creates an `Option` containing a value if the given condition is true, otherwise returns `None`.

 #### Arguments

 * `condition`: A boolean value indicating whether the option should contain a value.
 * `value`: A function that returns the value to be contained in the option.

 #### Returns

 An `Option` containing the value if the condition is true, otherwise `None`.

 #### Example

 ```
 let result = @option.when(true, fn(){ "Hello, World!" })
 assert_eq!(result, Some("Hello, World!"))
 ```

## Option


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/option/option.mbt,410:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/option#Option">Option</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> X?
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,410:::fn <a href="moonbitlang/core/option#Option">Option</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> X?
  ```
  > 
- #### bind
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,184:::fn <a href="moonbitlang/core/option#Option">Option</a>::bind[T, U](self : T?, f : (T) -> U?) -> U?
  ```
  > 
  >  Binds an option to a function that returns another option.
  > 
  >  #### Example
  > 
  >  ```
  >  let a = Option::Some(5)
  >  let r1 = a.bind(fn(x){ Some(x * 2) })
  >  assert_eq!(r1, Some(10))
  >  let b : Option[Int] = None
  >  let r2 = b.bind(fn(x){ Some(x * 2) })
  >  assert_eq!(r2, None)
  >  ```
- #### compare
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,314:::fn <a href="moonbitlang/core/option#Option">Option</a>::compare[X : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : X?, other : X?) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,343:::fn <a href="moonbitlang/core/option#Option">Option</a>::default[X]() -> X?
  ```
  > 
  >  `None`
- #### filter
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,253:::fn <a href="moonbitlang/core/option#Option">Option</a>::filter[T](self : T?, f : (T) -> Bool) -> T?
  ```
  > 
  >  Filters the option by applying the given predicate function `f`.
  > 
  >  If the predicate function `f` returns `true` for the value contained in the option,
  > the same option is returned. Otherwise, `None` is returned.
  > 
  >  #### Example
  >  ```
  >  let x = Some(3)
  >  assert_eq!(x.filter(fn(x){ x > 5 }), None)
  >  assert_eq!(x.filter(fn(x){ x < 5 }), Some(3))
  >  ```
- #### flatten
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,211:::fn <a href="moonbitlang/core/option#Option">Option</a>::flatten[T](self : T??) -> T?
  ```
  > 
  >  Flattens an `Option` of `Option` into a single `Option`.
  > 
  >  If the input `Option` is `Some(Some(value))`, the function returns `Some(value)`.
  > 
  >  #### Example
  > 
  >  ```
  >  let a = Some(Some(42));
  >  assert_eq!(@option.flatten(a), Some(42))
  >  let b : Int?? = Some(None)
  >  assert_eq!(@option.flatten(b), None)
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,227:::fn <a href="moonbitlang/core/option#Option">Option</a>::is_empty[T](self : T?) -> Bool
  ```
  > 
  >  Checks if the option is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,348:::fn <a href="moonbitlang/core/option#Option">Option</a>::iter[T](self : T?) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
- #### map
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,109:::fn <a href="moonbitlang/core/option#Option">Option</a>::map[T, U](self : T?, f : (T) -> U) -> U?
  ```
  > 
  >  Maps the value of an `Option` using a provided function.
  > 
  >  #### Example
  > 
  >  ```
  >  let a = Some(5)
  >  assert_eq!(a.map(fn(x){ x * 2 }), Some(10))
  >  
  >  let b = None
  >  assert_eq!(b.map(fn(x){ x * 2 }), None)
  >  ```
- #### map\_or
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,133:::fn <a href="moonbitlang/core/option#Option">Option</a>::map_or[T, U](self : T?, default : U, f : (T) -> U) -> U
  ```
  > 
  >  Returns the provided default result (if none), or applies a function to the contained value (if any).
  > Arguments passed to map\_or are eagerly evaluated; if you are passing the result of a function call, it is recommended to use `map_or_else`, which is lazily evaluated.
  > 
  >  #### Example
  > 
  >  ```
  >  let a = Some(5)
  >  assert_eq!(a.map_or(3, fn(x){ x * 2 }), 10)
  >  ```
- #### map\_or\_else
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,156:::fn <a href="moonbitlang/core/option#Option">Option</a>::map_or_else[T, U](self : T?, default : () -> U, f : (T) -> U) -> U
  ```
  > 
  >  Computes a default function result (if none), or applies a different function to the contained value (if any).
  >  
  >  #### Example
  > 
  >  ```
  >  let a = Some(5)
  >  assert_eq!(a.map_or_else(fn(){ 3 }, fn(x){ x * 2 }), 10)
  >  ```
- #### or
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,268:::fn <a href="moonbitlang/core/option#Option">Option</a>::or[T](self : T?, default : T) -> T
  ```
  > 
  >  Return the contained `Some` value or the provided default.
- #### or\_default
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,300:::fn <a href="moonbitlang/core/option#Option">Option</a>::or_default[T : <a href="moonbitlang/core/builtin#Default">Default</a>](self : T?) -> T
  ```
  > 
  >  Return the contained `Some` value or the result of the `T::default()`.
- #### or\_else
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,285:::fn <a href="moonbitlang/core/option#Option">Option</a>::or_else[T](self : T?, default : () -> T) -> T
  ```
  > 
  >  Return the contained `Some` value or the provided default.
  > 
  >  Default is lazily evaluated
- #### or\_error
  ```moonbit
  :::source,moonbitlang/core/option/option.mbt,383:::fn <a href="moonbitlang/core/option#Option">Option</a>::or_error[T, Err : <a href="moonbitlang/core/error#Error">Error</a>](self : T?, err : Err) -> T!Err
  ```
  > 
