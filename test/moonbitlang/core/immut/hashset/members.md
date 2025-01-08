# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/immut/hashset/types.mbt,25:::type T
```

 An immutable hash set data structure

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,250:::impl[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashset/HAMT.mbt,250:::fn op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], other : <a href="moonbitlang/core/immut/hashset#T">T</a>[A]) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,245:::impl[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>] <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashset/HAMT.mbt,245:::fn hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,218:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashset/HAMT.mbt,218:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,262:::impl[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/hashset#T">T</a>[K]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/immut/hashset/HAMT.mbt,262:::fn arbitrary[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/hashset#T">T</a>[K]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,115:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::add[A : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], key : A) -> <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
  >  Add a key to the hashset.
- #### contains
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,44:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::contains[A : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], key : A) -> Bool
  ```
  > 
  >  Lookup a value from the hash set
- #### each
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,192:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::each[A](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterate through the elements in a hash set
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,223:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::from_array[A : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,213:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::from_iter[A : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,183:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A]) -> Bool
  ```
  > 
  >  Returns true if the hash set is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,203:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::iter[A](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
  >  Converted to Iter
- #### new
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,38:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::new[A]() -> <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,234:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::of[A : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,121:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::remove[A : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A], key : A) -> <a href="moonbitlang/core/immut/hashset#T">T</a>[A]
  ```
  > 
  >  Remove an element from a set
- #### size
  ```moonbit
  :::source,moonbitlang/core/immut/hashset/HAMT.mbt,165:::fn <a href="moonbitlang/core/immut/hashset#T">T</a>::size[A](self : <a href="moonbitlang/core/immut/hashset#T">T</a>[A]) -> Int
  ```
  > 
  >  Calculate the size of a set.
  > 
  >  WARNING: this operation is `O(N)` in set size
