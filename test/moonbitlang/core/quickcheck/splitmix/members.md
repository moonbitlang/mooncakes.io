# Documentation
|Type|description|
|---|---|
|[RandomState](#RandomState)||

## RandomState

```moonbit
:::source,moonbitlang/core/quickcheck/splitmix/random.mbt,16:::type RandomState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,19:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a> with default() -> <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a> with output(<a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### clone
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,38:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::clone(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>
  ```
  > 
  >  Clone a RandomState.
- #### default
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,19:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::default() -> <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,32:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::new(seed~ : UInt64 = ..) -> <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>
  ```
  > 
  >  Create a new RandomState from an optional seed.
- #### next
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,44:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> Unit
  ```
  > 
  >  Skip the next random number.
- #### next\_double
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,101:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_double(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> Double
  ```
  > 
  >  Get the next random number as a double in \[0, 1\]
- #### next\_float
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,94:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_float(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> float
  ```
  > 
  >  Get the next random number as a float in \[0, 1\]
- #### next\_int
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,77:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_int(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> Int
  ```
  > 
  >  Get the next random number as a 32-bit signed integer.
- #### next\_int64
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,64:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_int64(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> Int64
  ```
  > 
  >  Get the next random number as a 64-bit signed integer.
- #### next\_positive\_int
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,83:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_positive_int(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> Int
  ```
  > 
  >  Get the next random number as a positive 32-bit signed integer.
- #### next\_two\_uint
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,70:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_two_uint(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> (UInt, UInt)
  ```
  > 
  >  Get the next two random number as 32-bit signed integers.
- #### next\_uint
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,58:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_uint(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> UInt
  ```
  > 
  >  Get the next random number as a 32-bit unsigned integer.
- #### next\_uint64
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,50:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::next_uint64(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> UInt64
  ```
  > 
  >  Get the next random number as a 64-bit unsigned integer.
- #### output
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,19:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::output(<a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### split
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/random.mbt,108:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::split(self : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>) -> <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>
  ```
  > 
  >  Generates an independent random number generator.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/quickcheck/splitmix/traits.mbt,85:::fn <a href="moonbitlang/core/quickcheck/splitmix#RandomState">RandomState</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
