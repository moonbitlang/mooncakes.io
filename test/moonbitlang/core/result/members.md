# Moonbit/Core Result

## Overview
`Result[T,E]` is a type used for handling computation results and errors in an explicit and declarative manner, similar to Rust (`Result<T,E>`) and OCaml (`('a, 'e) result`). 
It is an enum with two variants: `Ok(T)`, which represents success and contains a value of type `T`, and `Err(E)`, representing error and containing an error value of type `E`. 
```moonbit
enum Result[T, E] {
    Ok(T)
    Err(E)
}
```

## Usage
### Constructing Result
You can create a `Result` value using the `Ok` and `Err` constructors, remember to give proper type annotations.
```moonbit
let result: Result[Int, String] = Ok(42)
let error: Result[Int, String] = Err("Error message")
```

Or use the `ok` and `err` functions to create a `Result` value.
```moonbit
let result : Result[String, Unit] = ok("yes")
let error : Result[Int, String] = err("error")
```

### The question mark operator 
Moonbit provides a way to handle `Result` values in a concise manner using the `?` operator when writing a sequence of computations that may return a `Result`, which hides the boilerplate code of unwrapping the `Result` and propagating the error. 

```moonbit
fn may_fail() -> Result[Int, String] {
    Ok(42)
}

fn print_ok() -> Result[Unit, String] {
    let result = may_fail()
    match result {
        Ok(value) => {
            print(value)
            Ok(())
        }
        Err(error) => Err(error)
    }
}
// The above code can be written as:
fn print_ok() -> Result[Unit, String] {
    let value = may_fail()?
    print(value)
    Ok(())
}
```
Ending expression with `?` will automatically unwrap the `Result`, if the result is `Err`, it will returned early from the function with the error value.

### Querying variant
You can check the variant of a `Result` using the `is_ok` and `is_err` methods.
```moonbit
let result: Result[Int, String] = Ok(42)
let is_ok = result.is_ok() // true
let is_err = result.is_err() // false
```

### Extracting values
You can extract the value from a `Result` using the `match` expression (Pattern Matching).
```moonbit
match result {
    Ok(value) => print(value)
    Err(error) => ()
}
```

Or using the `unwrap` method, which will panic if the result is `Err` and return the value if it is `Ok`.
```moonbit
let result: Result[Int, String] = Ok(42)
let value = result.unwrap() // 42
```

A safe alternative is the `or` method, which returns the value if the result is `Ok` or a default value if it is `Err`.
```moonbit
let result: Result[Int, String] = Err("error")
let value = result.or(0) // 0
```

There is a lazy version of `or` called `or_else`, which takes a function that returns a default value.
```moonbit
let result: Result[Int, String] = Err("error")
let value = result.or_else(fn() { 0 }) // 0
```

### Transforming values
To transform values inside a `Result`, you can use the `map` method, which applies a function to the value if the result is `Ok`,
and remains unchanged if it is `Err`.
```moonbit
let result: Result[Int, String] = Ok(42)
let new_result = result.map(fn(x) { x + 1 }) // Ok(43)
```

A dual method to `map` is `map_err`, which applies a function to the error value if the result is `Err`, and remains unchanged if it is `Ok`.
```moonbit
let result: Result[Int, String] = Err("error")
let new_result = result.map_err(fn(x) { x + "!" }) // Err("error!")
```

You can turn a `Result[T, E]` into a `Option[T]` by using the method `to_option`, which returns `Some(value)` if the result is `Ok`, and `None` if it is `Err`.
```moonbit
let result: Result[Int, String] = Ok(42)
let option = result.to_option() // Some(42)
let result1: Result[Int, String] = Err("error")
let option1 = result1.to_option() // None
```

### Monadic operations
Moonbit provides monadic operations for `Result`, such as `flatten` and `bind`, which allow chaining of computations that return `Result`.
```moonbit
let result: Result[Result[Int, String], String] = Ok(Ok(42))
let flattened = result.flatten() // Ok(42)
```

The `bind` method is similar to `map`, but the function passed to it should return a `Result` value. 
```moonbit
let result: Result[Int, String] = Ok(42)
let new_result = result.bind(fn(x) { Ok(x + 1) }) // Ok(43)
```

---
# Documentation
|Type|description|
|---|---|
|[Result](#Result)||

|Value|description|
|---|---|
|[err](#err)||
|[ok](#ok)||
|[wrap0](#wrap0)||
|[wrap1](#wrap1)||
|[wrap2](#wrap2)||

## err

```moonbit
:::source,moonbitlang/core/result/result.mbt,76:::fn err[T, E](value : E) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
```

 Create an `Err` of type `E`.

 #### Example

 ```
 let x: Result[Int, String] = Err("error")
 assert_eq!(x, Err("error"))
 ```

## ok

```moonbit
:::source,moonbitlang/core/result/result.mbt,94:::fn ok[T, E](value : T) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
```

 Create an `Ok` of type `T`.

 #### Example

 ```
 let x: Result[String, Unit] = Ok("yes")
 assert_true!(x.is_ok())
 ```

## wrap0

```moonbit
:::source,moonbitlang/core/result/result.mbt,381:::fn wrap0[T, E : <a href="moonbitlang/core/error#Error">Error</a>](f~ : () -> T!E) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
```


## wrap1

```moonbit
:::source,moonbitlang/core/result/result.mbt,390:::fn wrap1[T, A, E : <a href="moonbitlang/core/error#Error">Error</a>](f~ : (A) -> T!E, a : A) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
```


## wrap2

```moonbit
:::source,moonbitlang/core/result/result.mbt,399:::fn wrap2[T, A, B, E : <a href="moonbitlang/core/error#Error">Error</a>](f~ : (A, B) -> T!E, a : A, b : B) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
```


## Result


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/result/result.mbt,415:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/result#Result">Result</a> with arbitrary[T : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,415:::fn <a href="moonbitlang/core/result#Result">Result</a>::arbitrary[T : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>, E : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
  ```
  > 
- #### bind
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,226:::fn <a href="moonbitlang/core/result#Result">Result</a>::bind[T, E, U](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], g : (T) -> <a href="moonbitlang/core/result#Result">Result</a>[U, E]) -> <a href="moonbitlang/core/result#Result">Result</a>[U, E]
  ```
  > 
  >  Binds a result to a function that returns another result.
  > 
  >  #### Example
  > 
  >  ```
  >  let x: Result[Int, String] = Ok(6)
  >  let y = x.bind(fn(v : Int) { Ok(v * 7) })
  >  assert_eq!(y, Ok(42))
  >  ```
- #### compare
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,298:::fn <a href="moonbitlang/core/result#Result">Result</a>::compare[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, E : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], other : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> Int
  ```
  > 
- #### flatten
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,200:::fn <a href="moonbitlang/core/result#Result">Result</a>::flatten[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/result#Result">Result</a>[T, E], E]) -> <a href="moonbitlang/core/result#Result">Result</a>[T, E]
  ```
  > 
  >  Flatten a `Result` of `Result` into a single `Result`.
  >  
  >  If the outer `Result` is an `Ok`, the inner `Result` is returned. If the outer `Result` is an `Err`, the inner `Result` is ignored and the `Err` is returned.
  > 
  >  #### Example
  > 
  >  ```
  >  let x: Result[Result[Int, String], String] = Ok(Ok(6))
  >  let y = x.flatten()
  >  assert_eq!(y, Ok(6))
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,253:::fn <a href="moonbitlang/core/result#Result">Result</a>::fold[T, E, V](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], ok : (T) -> V, err : (E) -> V) -> V
  ```
  > 
  >  Folds a `Result` into a single value.
  >  
  >  If the `Result` is an `Ok`, the `ok` function is applied to the value. If the `Result` is an `Err`, the `err` function is applied to the value.
  >  #### Example
  > 
  >  ```
  >  let x = Ok(6)
  >  let y = x.fold(fn(v : Int) -> Int { v * 7 }, fn(_e : String) -> Int { 0 })
  >  assert_eq!(y, 42)
  >  ```
- #### is\_err
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,121:::fn <a href="moonbitlang/core/result#Result">Result</a>::is_err[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> Bool
  ```
  > 
  >  Check if a `Result` is an `Err`.
- #### is\_ok
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,105:::fn <a href="moonbitlang/core/result#Result">Result</a>::is_ok[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> Bool
  ```
  > 
  >  Check if a `Result` is an `Ok`.
- #### map
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,25:::fn <a href="moonbitlang/core/result#Result">Result</a>::map[T, E, U](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], f : (T) -> U) -> <a href="moonbitlang/core/result#Result">Result</a>[U, E]
  ```
  > 
  >  Maps the value of a Result if it is `Ok` into another, otherwise returns the `Err` value unchanged.
  > 
  >  #### Example
  > 
  >  ```
  >  let x: Result[Int, Unit] = Ok(6)
  >  let y = x.map(fn (v : Int) { v * 7 })
  >  assert_eq!(y, Ok(42))
  >  ```
- #### map\_err
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,51:::fn <a href="moonbitlang/core/result#Result">Result</a>::map_err[T, E, F](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], f : (E) -> F) -> <a href="moonbitlang/core/result#Result">Result</a>[T, F]
  ```
  > 
  >  Maps the value of a Result if it is `Err` into another, otherwise returns the `Ok` value unchanged.
  > 
  >  #### Example
  > 
  >  ```
  >  let x: Result[Int, String] = Err("error")
  >  let y = x.map_err(fn (v : String) { v + "!" })
  >  assert_eq!(y, Err("error!"))
  >  ```
- #### or
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,145:::fn <a href="moonbitlang/core/result#Result">Result</a>::or[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], default : T) -> T
  ```
  > 
  >  Return the inner `Ok` value, if it exists, otherwise return the provided default.
  > 
  >  #### Example
  > 
  >  ```
  >  let x: Result[Int, String] = Ok(6)
  >  let y = x.or(0)
  >  assert_eq!(y, 6)
  >  ```
- #### or\_else
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,172:::fn <a href="moonbitlang/core/result#Result">Result</a>::or_else[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], default : () -> T) -> T
  ```
  > 
  >  Return the inner `Ok` value, if it exists, otherwise return the provided default.
  > 
  >  Default is lazily evaluated.
  >  #### Example
  > 
  >  ```
  >  let x: Result[Int, String] = Ok(6)
  >  let y = x.or_else(fn() { 0 })
  >  assert_eq!(y, 6)
  >  ```
- #### to\_option
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,281:::fn <a href="moonbitlang/core/result#Result">Result</a>::to_option[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> T?
  ```
  > 
  >  Converts a `Result` to an `Option`.
  >  
  >  Converts `Ok` to `Some` and `Err` to `None`.
  > 
  >  #### Example
  > 
  >  ```
  >  let x: Result[Int, String] = Ok(6)
  >  let y = x.to_option()
  >  assert_eq!(y, Some(6))
  >  ```
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,334:::fn <a href="moonbitlang/core/result#Result">Result</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> String
  ```
  > 
- #### unwrap
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,326:::fn <a href="moonbitlang/core/result#Result">Result</a>::unwrap[T, E](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> T
  ```
  > 
- #### unwrap\_or\_error
  ```moonbit
  :::source,moonbitlang/core/result/result.mbt,359:::fn <a href="moonbitlang/core/result#Result">Result</a>::unwrap_or_error[T, E : <a href="moonbitlang/core/error#Error">Error</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> T!E
  ```
  > 
