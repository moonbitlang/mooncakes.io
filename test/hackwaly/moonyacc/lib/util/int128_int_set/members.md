# Documentation
|Type|description|
|---|---|
|[Int128IntSet](#Int128IntSet)||
|[T](#T)||

|Value|description|
|---|---|
|[empty](#empty)||
|[from\_iter](#from_iter)||
|[singleton](#singleton)||

## Int128IntSet

```moonbit
:::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,2:::type Int128IntSet
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,5:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a> with compare(<a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,5:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a> with hash_combine(<a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a> with op_equal(<a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a> with output(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,99:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::add(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, key : Int) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
  ```
  > 
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,5:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::compare(<a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Int
  ```
  > automatically derived
- #### contains
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,90:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::contains(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, key : Int) -> Bool
  ```
  > 
- #### difference
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,127:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::difference(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
  ```
  > 
- #### disjoint
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,132:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::disjoint(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Bool
  ```
  > 
- #### hash
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/traits.mbt,40:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,5:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::hash_combine(<a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### intersection
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,122:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::intersection(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,85:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::is_empty(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Bool
  ```
  > 
- #### iter
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,31:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::iter(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,5:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::op_equal(<a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,16:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::output(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,108:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::remove(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, key : Int) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
  ```
  > 
- #### subset
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,137:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::subset(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> Bool
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### union
  ```moonbit
  :::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,117:::fn <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>::union(self : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>, other : <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
  ```
  > 

## T

```moonbit
:::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,8:::type T = <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
```


## empty

```moonbit
:::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,11:::fn empty() -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
```


## from\_iter

```moonbit
:::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,62:::fn from_iter(iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int]) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
```


## singleton

```moonbit
:::source,hackwaly/moonyacc/lib/util/int128_int_set/int128_int_set_nonjs.mbt,76:::fn singleton(key : Int) -> <a href="hackwaly/moonyacc/lib/util/int128_int_set#Int128IntSet">Int128IntSet</a>
```

