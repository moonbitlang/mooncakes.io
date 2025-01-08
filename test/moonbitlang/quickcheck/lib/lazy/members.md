# Documentation
|Trait|description|
|---|---|
|[@moonbitlang/quickcheck/lib/lazy.Monoid](#@moonbitlang/quickcheck/lib/lazy.Monoid)||

|Type|description|
|---|---|
|[LazyList](#LazyList)||
|[LazyRef](#LazyRef)||

|Value|description|
|---|---|
|[default](#default)||
|[infinite\_stream](#infinite_stream)||
|[repeat](#repeat)||
|[sum](#sum)||
|[to\_lazy](#to_lazy)||
|[zip\_lazy\_normal](#zip_lazy_normal)||
|[zip\_plus](#zip_plus)||
|[zip\_with](#zip_with)||

## @moonbitlang/quickcheck/lib/lazy.Monoid

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,6:::pub(open) trait @moonbitlang/quickcheck/lib/lazy.Monoid {
  op_add(Self, Self) -> Self
}
```


## LazyList

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,1:::pub(all) enum LazyList {
  Nil
  Cons(T, <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>[<a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]])
}
```


#### mooncakes-io-method-mark-Methods
- #### concat
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,54:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::concat[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], other : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
  ```
  > 
- #### drop\_while
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,147:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::drop_while[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], p : (T) -> Bool) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
  ```
  > 
- #### fold\_left
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,87:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::fold_left[T, U](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], f : (U, T) -> U, init~ : U) -> U
  ```
  > 
- #### fold\_right
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,94:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::fold_right[T, U](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], f : (T, U) -> U, init~ : U) -> U
  ```
  > 
- #### head
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,101:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::head[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> T
  ```
  > 
- #### index
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,25:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::index[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], i : Int) -> T
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,115:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::length[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> Int
  ```
  > 
- #### map
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,69:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::map[T, U](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[U]
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,61:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::op_add[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], other : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,21:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### split\_at
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,76:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::split_at[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], i : Int) -> (<a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T])
  ```
  > 
- #### tail
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,108:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::tail[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
  ```
  > 
- #### tails
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,40:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::tails[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[<a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]]
  ```
  > 
- #### take\_while
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,135:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::take_while[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], p : (T) -> Bool) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,14:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> String
  ```
  > 
- #### unfold
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,182:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>::unfold[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], f : (<a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> (T, <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T])?) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
  ```
  > 

## LazyRef

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy.mbt,6:::type LazyRef
```


#### mooncakes-io-method-mark-Methods
- #### force
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy.mbt,18:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>::force[T](self : <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>[T]) -> T
  ```
  > 
- #### from\_thunk
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy.mbt,14:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>::from_thunk[T](f : () -> T) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>[T]
  ```
  > 
- #### from\_value
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/lazy/lazy.mbt,10:::fn <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>::from_value[T](val : T) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyRef">LazyRef</a>[T]
  ```
  > 

## default

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,10:::fn default[X : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[X]
```


## infinite\_stream

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,154:::fn infinite_stream[X : <a href="moonbitlang/quickcheck/lib/lazy#Monoid">Monoid</a>](start : X, step : X) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[X]
```


## repeat

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,65:::fn repeat[T](val : T) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
```


## sum

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,119:::fn sum[X : <a href="moonbitlang/quickcheck/lib/lazy#Monoid">Monoid</a>](l : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[X], init~ : X) -> X
```


## to\_lazy

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,33:::fn to_lazy[T](ls : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
```


## zip\_lazy\_normal

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,158:::fn zip_lazy_normal[A, B, C](f : (A, B) -> C, xs : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[A], ys : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[B]) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[C]
```


## zip\_plus

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,170:::fn zip_plus[T](f : (T, T) -> T, ls1 : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T], ls2 : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[T]
```


## zip\_with

```moonbit
:::source,moonbitlang/quickcheck/lib/lazy/lazy_list.mbt,123:::fn zip_with[A, B, C](f : (A, B) -> C, xs : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[A], ys : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[B]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">LazyList</a>[C]
```

