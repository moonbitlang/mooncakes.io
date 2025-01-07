# Documentation
|Type|description|
|---|---|
|[ShrinkTree](#ShrinkTree)||

|Value|description|
|---|---|
|[join](#join)||

## ShrinkTree

```moonbit
:::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,1:::type ShrinkTree
```


#### mooncakes-io-method-mark-Methods
- #### bind
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,88:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::bind[T, U](self : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T], f : (T) -> <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[U]) -> <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[U]
  ```
  > 
- #### draw
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,14:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::draw[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T], depth : Int) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[String]
  ```
  > 
- #### from\_shinker
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,61:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::from_shinker[T](shrink : (T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], x : T) -> <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]
  ```
  > 
- #### from\_value
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,57:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::from_value[T](x : T) -> <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]
  ```
  > 
- #### get\_value
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,95:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::get_value[T](self : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]) -> (T, <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]])
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,10:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### smap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,72:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::smap[T, U](self : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[U]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,6:::fn <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]) -> String
  ```
  > 

## join

```moonbit
:::source,moonbitlang/quickcheck/lib/internal_shrinking/shrink_tree.mbt,76:::fn join[T](tr : <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[<a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]]) -> <a href="moonbitlang/quickcheck/lib/internal_shrinking#ShrinkTree">ShrinkTree</a>[T]
```

