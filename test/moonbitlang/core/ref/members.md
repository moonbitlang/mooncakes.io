# Documentation
|Type|description|
|---|---|
|[Ref](#Ref)||

## Ref


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,116:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/ref#Ref">Ref</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/ref#Ref">Ref</a>[X]
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,116:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/ref#Ref">Ref</a>[X]
  ```
  > 
- #### map
  ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,33:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::map[T, R](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[T], f : (T) -> R) -> <a href="moonbitlang/core/ref#Ref">Ref</a>[R]
  ```
  > 
  >  Maps the value of a `Ref` using a given function.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@ref.new(1).map(fn(a){ a + 1 }).val, 2)
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,17:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::new[T](x : T) -> <a href="moonbitlang/core/ref#Ref">Ref</a>[T]
  ```
  > 
  >  create a reference from value
- #### protect
  ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,60:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::protect[T, R](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[T], a : T, f : () -> R) -> R
  ```
  > 
  >  This function allows you to temporarily replace the value of a reference with a new value,
  > execute a given function, and then restore the original value of the reference.
  > 
  >  #### Arguments
  > 
  >  - `self`: The reference whose value will be temporarily replaced.
  >  - `a`: The new value to assign to the reference.
  >  - `f`: The function to execute while the reference value is replaced.
  > 
  >  #### Returns
  > 
  >  The result of executing the provided function `f`.
  >  
  >  #### Example
  >  
  >  ```
  >  let x = @ref.new(1)
  >  x.protect(2, fn!(){
  >    x.val = 3
  >  })
  >  assert_eq!(x.val, 1)
  >  ```
- #### swap
  ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,80:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::swap[T](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[T], that : <a href="moonbitlang/core/ref#Ref">Ref</a>[T]) -> Unit
  ```
  > 
  >  Swaps the values of two references.
  > 
  >  #### Example
  > 
  >  ```
  >  let x = @ref.new(1)
  >  let y = @ref.new(2)
  >  @ref.swap(x, y)
  >  assert_eq!(x.val, 2)
  >  assert_eq!(y.val, 1)
  >  ```
- #### update
  ```moonbit
  :::source,moonbitlang/core/ref/ref.mbt,95:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::update[T](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[T], f : (T) -> T) -> Unit
  ```
  > 
