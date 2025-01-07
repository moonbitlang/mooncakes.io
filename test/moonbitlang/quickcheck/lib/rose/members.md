# Documentation
|Type|description|
|---|---|
|[Rose](#Rose)||

|Value|description|
|---|---|
|[new](#new)||
|[pure](#pure)||

## Rose

```moonbit
:::source,moonbitlang/quickcheck/lib/rose/rose.mbt,2:::pub(all) struct Rose {
  val : T
  branch : <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/rose.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a> with output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### apply
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/rose.mbt,29:::fn <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>::apply[T](self : <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T], f : (T, <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]
  ```
  > 
- #### bind
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/rose.mbt,25:::fn <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>::bind[T, U](self : <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T], f : (T) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[U]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[U]
  ```
  > 
- #### fmap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/rose.mbt,21:::fn <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>::fmap[T, U](self : <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[U]
  ```
  > 
- #### join
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/rose.mbt,11:::fn <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>::join[T](self : <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/rose.mbt,5:::fn <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/rose/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## new

```moonbit
:::source,moonbitlang/quickcheck/lib/rose/rose.mbt,7:::fn new[T](val : T, branch : <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]
```


## pure

```moonbit
:::source,moonbitlang/quickcheck/lib/rose/rose.mbt,17:::fn pure[T](val : T) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">Rose</a>[T]
```

