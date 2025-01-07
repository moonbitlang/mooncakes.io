# Documentation
|Value|description|
|---|---|
|[apply\_while](#apply_while)||
|[const\_](#const_)||
|[curry3](#curry3)||
|[curry4](#curry4)||
|[flip](#flip)||
|[fresh\_name](#fresh_name)||
|[id](#id)||
|[pair\_function](#pair_function)||
|[removes](#removes)||

## apply\_while

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,40:::fn apply_while[T](x : T, f : (T) -> T, cond : (T) -> Bool) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]
```


## const\_

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,59:::fn const_[T, U](t : T) -> ((U) -> T)
```


## curry3

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,11:::fn curry3[A, B, C, D](f : (A, B, C) -> D) -> ((A) -> ((B) -> ((C) -> D)))
```


## curry4

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,16:::fn curry4[A, B, C, D, E](f : (A, B, C, D) -> E) -> ((A) -> ((B) -> ((C) -> ((D) -> E))))
```


## flip

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,67:::fn flip[M, N, Z](f : (M, N) -> Z) -> ((N, M) -> Z)
```


## fresh\_name

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,4:::fn fresh_name() -> String
```


## id

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,57:::fn id[T](x : T) -> T
```


## pair\_function

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,63:::fn pair_function[A, B, C](f : (A, B) -> C) -> (((A, B)) -> C)
```


## removes

```moonbit
:::source,moonbitlang/quickcheck/lib/utils/common.mbt,22:::fn removes[T](k : Int, n : Int, xs : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```

