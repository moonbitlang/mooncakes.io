

# Sexp library in [MoonBit](moonbitlang.com)

---
# Documentation
|Type|description|
|---|---|
|[Sexp](#Sexp)||
|[Sexp\_list](#Sexp_list)||

## Sexp

```moonbit
:::source,bobzhang/sexp/types.mbt,11:::pub enum Sexp {
  Atom(String, Bool)
  List(<a href="bobzhang/sexp#Sexp_list">Sexp_list</a>)
}
```

 sexp types


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,bobzhang/sexp/types.mbt,15:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="bobzhang/sexp#Sexp">Sexp</a>
  ```
  > 
  * ```moonbit
    :::source,bobzhang/sexp/types.mbt,15:::fn output(<a href="bobzhang/sexp#Sexp">Sexp</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Sexp\_list

```moonbit
:::source,bobzhang/sexp/types.mbt,2:::pub enum Sexp_list {
  Nil
  Cons(<a href="bobzhang/sexp#Sexp">Sexp</a>, <a href="bobzhang/sexp#Sexp_list">Sexp_list</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,bobzhang/sexp/types.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="bobzhang/sexp#Sexp_list">Sexp_list</a>
  ```
  > 
  * ```moonbit
    :::source,bobzhang/sexp/types.mbt,6:::fn output(<a href="bobzhang/sexp#Sexp_list">Sexp_list</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
