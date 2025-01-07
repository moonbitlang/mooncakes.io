# Documentation
|Type|description|
|---|---|
|[Array2](#Array2)||

## Array2

```moonbit
:::source,tonyfettes/narray/array2.mbt,1:::type Array2
```


#### mooncakes-io-method-mark-Methods
- #### each
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,116:::fn <a href="tonyfettes/narray#Array2">Array2</a>::each[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], f : (T, T) -> Unit) -> Unit
  ```
  > 
- #### eachi
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,122:::fn <a href="tonyfettes/narray#Array2">Array2</a>::eachi[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], f : (Int, T, T) -> Unit) -> Unit
  ```
  > 
- #### from\_fixed\_array
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,16:::fn <a href="tonyfettes/narray#Array2">Array2</a>::from_fixed_array[T](fixed : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(T, T)]) -> <a href="tonyfettes/narray#Array2">Array2</a>[T]
  ```
  > 
- #### get
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,62:::fn <a href="tonyfettes/narray#Array2">Array2</a>::get[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int) -> (T, T)?
  ```
  > 
- #### get\_0
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,68:::fn <a href="tonyfettes/narray#Array2">Array2</a>::get_0[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int) -> T?
  ```
  > 
- #### get\_1
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,74:::fn <a href="tonyfettes/narray#Array2">Array2</a>::get_1[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int) -> T?
  ```
  > 
- #### iter
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,128:::fn <a href="tonyfettes/narray#Array2">Array2</a>::iter[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(T, T)]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,143:::fn <a href="tonyfettes/narray#Array2">Array2</a>::iter2[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[T, T]
  ```
  > 
- #### length
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,46:::fn <a href="tonyfettes/narray#Array2">Array2</a>::length[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T]) -> Int
  ```
  > 
- #### make
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,7:::fn <a href="tonyfettes/narray#Array2">Array2</a>::make[T](length : Int, element_0 : T, element_1 : T) -> <a href="tonyfettes/narray#Array2">Array2</a>[T]
  ```
  > 
- #### new
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,3:::fn <a href="tonyfettes/narray#Array2">Array2</a>::new[T]() -> <a href="tonyfettes/narray#Array2">Array2</a>[T]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,105:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], other : <a href="tonyfettes/narray#Array2">Array2</a>[T]) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,50:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_get[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int) -> (T, T)
  ```
  > 
- #### op\_get\_0
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,54:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_get_0[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int) -> T
  ```
  > 
- #### op\_get\_1
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,58:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_get_1[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int) -> T
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,80:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_set[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int, element : (T, T)) -> Unit
  ```
  > 
- #### op\_set\_0
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,85:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_set_0[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int, element : T) -> Unit
  ```
  > 
- #### op\_set\_1
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,89:::fn <a href="tonyfettes/narray#Array2">Array2</a>::op_set_1[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int, element : T) -> Unit
  ```
  > 
- #### output
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,31:::fn <a href="tonyfettes/narray#Array2">Array2</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### push
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,158:::fn <a href="tonyfettes/narray#Array2">Array2</a>::push[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], x : T, y : T) -> Unit
  ```
  > 
- #### set
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,93:::fn <a href="tonyfettes/narray#Array2">Array2</a>::set[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T], index : Int, element_0 : T, element_1 : T) -> Unit
  ```
  > 
- #### to\_fixed\_array
  ```moonbit
  :::source,tonyfettes/narray/array2.mbt,27:::fn <a href="tonyfettes/narray#Array2">Array2</a>::to_fixed_array[T](self : <a href="tonyfettes/narray#Array2">Array2</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(T, T)]
  ```
  > 
