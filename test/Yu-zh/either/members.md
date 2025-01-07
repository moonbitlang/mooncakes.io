# Documentation
|Type|description|
|---|---|
|[Either](#Either)||

## Either

```moonbit
:::source,Yu-zh/either/either.mbt,1:::pub enum Either {
  Left(L)
  Right(R)
}
```


#### mooncakes-io-method-mark-Methods
- #### either
  ```moonbit
  :::source,Yu-zh/either/either.mbt,62:::fn <a href="Yu-zh/either#Either">Either</a>::either[L, R, T](self : <a href="Yu-zh/either#Either">Either</a>[L, R], f : (L) -> T, g : (R) -> T) -> T
  ```
  > 
- #### flip
  ```moonbit
  :::source,Yu-zh/either/either.mbt,34:::fn <a href="Yu-zh/either#Either">Either</a>::flip[L, R](self : <a href="Yu-zh/either#Either">Either</a>[L, R]) -> <a href="Yu-zh/either#Either">Either</a>[R, L]
  ```
  > 
- #### is\_left
  ```moonbit
  :::source,Yu-zh/either/either.mbt,6:::fn <a href="Yu-zh/either#Either">Either</a>::is_left[L, R](self : <a href="Yu-zh/either#Either">Either</a>[L, R]) -> Bool
  ```
  > 
- #### is\_right
  ```moonbit
  :::source,Yu-zh/either/either.mbt,13:::fn <a href="Yu-zh/either#Either">Either</a>::is_right[L, R](self : <a href="Yu-zh/either#Either">Either</a>[L, R]) -> Bool
  ```
  > 
- #### left
  ```moonbit
  :::source,Yu-zh/either/either.mbt,20:::fn <a href="Yu-zh/either#Either">Either</a>::left[L, R](self : <a href="Yu-zh/either#Either">Either</a>[L, R]) -> L?
  ```
  > 
- #### map\_either
  ```moonbit
  :::source,Yu-zh/either/either.mbt,55:::fn <a href="Yu-zh/either#Either">Either</a>::map_either[L, R, L2, R2](self : <a href="Yu-zh/either#Either">Either</a>[L, R], f : (L) -> L2, g : (R) -> R2) -> <a href="Yu-zh/either#Either">Either</a>[L2, R2]
  ```
  > 
- #### map\_left
  ```moonbit
  :::source,Yu-zh/either/either.mbt,41:::fn <a href="Yu-zh/either#Either">Either</a>::map_left[L, R, L2](self : <a href="Yu-zh/either#Either">Either</a>[L, R], f : (L) -> L2) -> <a href="Yu-zh/either#Either">Either</a>[L2, R]
  ```
  > 
- #### map\_right
  ```moonbit
  :::source,Yu-zh/either/either.mbt,48:::fn <a href="Yu-zh/either#Either">Either</a>::map_right[L, R, R2](self : <a href="Yu-zh/either#Either">Either</a>[L, R], f : (R) -> R2) -> <a href="Yu-zh/either#Either">Either</a>[L, R2]
  ```
  > 
- #### right
  ```moonbit
  :::source,Yu-zh/either/either.mbt,27:::fn <a href="Yu-zh/either#Either">Either</a>::right[L, R](self : <a href="Yu-zh/either#Either">Either</a>[L, R]) -> R?
  ```
  > 
