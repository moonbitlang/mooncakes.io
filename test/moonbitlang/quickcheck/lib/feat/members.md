# Documentation
|Trait|description|
|---|---|
|[Enumerable](#Enumerable)||

|Type|description|
|---|---|
|[Enumerate](#Enumerate)||
|[Finite](#Finite)||
|[LazyList](#LazyList)||

|Value|description|
|---|---|
|[app](#app)||
|[consts](#consts)||
|[default](#default)||
|[empty](#empty)||
|[fin\_app](#fin_app)||
|[fin\_bind](#fin_bind)||
|[fin\_cart](#fin_cart)||
|[fin\_concat](#fin_concat)||
|[fin\_empty](#fin_empty)||
|[fin\_finite](#fin_finite)||
|[fin\_fmap](#fin_fmap)||
|[fin\_mconcat](#fin_mconcat)||
|[fin\_pure](#fin_pure)||
|[fin\_union](#fin_union)||
|[pay](#pay)||
|[product](#product)||
|[singleton](#singleton)||
|[unary](#unary)||
|[union](#union)||

## Enumerable

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,1:::pub(open) trait Enumerable {
  enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[Self]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,5:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/bool#Bool">Bool</a> with enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[Bool]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,37:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a> with enumerate[E : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>]() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[E]]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,45:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a> with enumerate[A : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>, B : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>]() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[(A, B)]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,29:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/uint#UInt">UInt</a> with enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[UInt]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,9:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/int#Int">Int</a> with enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[Int]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,49:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/option#Option">Option</a> with enumerate[E : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>]() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[E?]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,61:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/unit#Unit">Unit</a> with enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[Unit]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,33:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/uint64#UInt64">UInt64</a> with enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[UInt64]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,53:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/result#Result">Result</a> with enumerate[T : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>, E : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>]() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[<a href="moonbitlang/core/result#Result">Result</a>[T, E]]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerable.mbt,19:::impl <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with enumerate() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[Int64]
  ```
  > 

## Enumerate

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,1:::pub(all) struct Enumerate {
  parts : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]]
}
```


#### mooncakes-io-method-mark-Methods
- #### en\_index
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,21:::fn <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>::en_index[T](self : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T], idx : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> T
  ```
  > 
- #### eval
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,5:::fn <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>::eval[T](self : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]]
  ```
  > 
- #### fmap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,42:::fn <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>::fmap[T, U](self : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[U]
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,38:::fn <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>::op_add[T](self : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T], other : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
  ```
  > 

## Finite

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,1:::pub(all) struct Finite {
  fCard : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  fIndex : (<a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> T
}
```


#### mooncakes-io-method-mark-Methods
- #### op\_add
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/finite.mbt,29:::fn <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>::op_add[T](self : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T], other : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/finite.mbt,103:::fn <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_array
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/finite.mbt,88:::fn <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>::to_array[T](self : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]) -> (<a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[T])
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/feat/finite.mbt,99:::fn <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]) -> String
  ```
  > 

## LazyList

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/utils.mbt,1:::type LazyList = <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[T]
```


## app

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,61:::fn app[T, U](f : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[(T) -> U], e : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[U]
```


## consts

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,65:::fn consts[T](ls : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]]) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
```


## default

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,13:::fn default[T]() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
```


## empty

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,9:::fn empty[T]() -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
```


## fin\_app

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,55:::fn fin_app[M, N](f : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[(M) -> N], e : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[M]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[N]
```


## fin\_bind

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,59:::fn fin_bind[M, N](m : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[M], f : (M) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[N]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[N]
```


## fin\_cart

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,44:::fn fin_cart[T, U](f1 : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T], f2 : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[U]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[(T, U)]
```


## fin\_concat

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,77:::fn fin_concat[M](m : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[M]]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[M]
```


## fin\_empty

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,6:::fn fin_empty[T]() -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]
```


## fin\_finite

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,107:::fn fin_finite(i : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[<a href="moonbitlang/core/bigint#BigInt">BigInt</a>]
```


## fin\_fmap

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,33:::fn fin_fmap[T, U](f : (T) -> U, f1 : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[U]
```


## fin\_mconcat

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,84:::fn fin_mconcat[M](val : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[M]]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[M]
```


## fin\_pure

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,37:::fn fin_pure[T](x : T) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]
```


## fin\_union

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/finite.mbt,10:::fn fin_union[T](f1 : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T], f2 : <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Finite">Finite</a>[T]
```


## pay

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,46:::fn pay[T](f : () -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
```


## product

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,50:::fn product[T, U](e1 : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T], e2 : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[U]) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[(T, U)]
```


## singleton

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,17:::fn singleton[T](val : T) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
```


## unary

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,69:::fn unary[T : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">Enumerable</a>, U](f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[U]
```


## union

```moonbit
:::source,moonbitlang/quickcheck/lib/feat/enumerate.mbt,34:::fn union[T](e1 : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T], e2 : <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]) -> <a href="moonbitlang/quickcheck/lib/feat#Enumerate">Enumerate</a>[T]
```

