# Documentation
|Type|description|
|---|---|
|[Array](#Array)||
|[ArrayView](#ArrayView)||
|[FixedArray](#FixedArray)||

## Array


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/array/array.mbt,136:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/array#Array">Array</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[X]
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,136:::fn <a href="moonbitlang/core/array#Array">Array</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[X]
  ```
  > 
- #### copy
  ```moonbit
  :::source,moonbitlang/core/array/array_nonjs.mbt,16:::fn <a href="moonbitlang/core/array#Array">Array</a>::copy[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,16:::fn <a href="moonbitlang/core/array#Array">Array</a>::from_iter[T](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
- #### last
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,128:::fn <a href="moonbitlang/core/array#Array">Array</a>::last[A](self : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> A?
  ```
  > 
  >  Returns the last element of the array.
- #### makei
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,40:::fn <a href="moonbitlang/core/array#Array">Array</a>::makei[T](length : Int, value : (Int) -> T) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
- #### map\_option
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,114:::fn <a href="moonbitlang/core/array#Array">Array</a>::map_option[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], f : (A) -> B?) -> <a href="moonbitlang/core/array#Array">Array</a>[B]
  ```
  > 
  >  Returns a new array containing the elements of the original array that satisfy the given predicate.
  >  
  >  #### Arguments
  >  
  >  * `self` - The array to filter.
  >  * `f` - The predicate function.
  >  
  >  #### Returns
  >  
- #### push\_iter
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,33:::fn <a href="moonbitlang/core/array#Array">Array</a>::push_iter[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> Unit
  ```
  > 
  >  Adds all elements from an iterator to the end of the array.
  > 
  >  This function iterates over each element in the provided iterator
  > and adds them to the array using the `push` method.
  > 
  >  #### Example
  >  ```
  >  let u = [1, 2, 3]
  >  let v = [4, 5, 6]
  >  u.push_iter(v.iter())
  >  assert_eq!(u, [1, 2, 3, 4, 5, 6])
  >  ```
- #### shuffle
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,98:::fn <a href="moonbitlang/core/array#Array">Array</a>::shuffle[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[T], rand~ : (Int) -> Int) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Shuffle the array using Knuth shuffle
  >  
  >  To use this function, you need to provide a rand function, which takes an integer as it upper bound
  > and returns an integer.
  > *rand n* is expected to returns a uniformly distribution integer between 0 and n - 1
  >  #### Example
  >  
  >  ```
  >  let arr = [1, 2, 3, 4, 5]
  >  fn rand(upper : Int) -> Int {
  >    let rng = @random.new()
  >    rng.int(limit=upper)
  >  }
  >  let _shuffled = Array::shuffle(arr, rand=rand)
  >  ```
- #### shuffle\_in\_place
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,68:::fn <a href="moonbitlang/core/array#Array">Array</a>::shuffle_in_place[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[T], rand~ : (Int) -> Int) -> Unit
  ```
  > 
  >  Shuffle the array using Knuth shuffle
  >  
  >  To use this function, you need to provide a rand function, which takes an integer as it upper bound
  > and returns an integer.
  > *rand n* is expected to returns a uniformly distribution integer between 0 and n - 1
  >  #### Example
  >  
  >  ```
  >  let arr = [1, 2, 3, 4, 5]
  >  fn rand(upper : Int) -> Int {
  >    let rng = @random.new()
  >    rng.int(limit=upper)
  >  }
  >  Array::shuffle_in_place(arr, rand=rand)
  >  ```
- #### sort
  ```moonbit
  :::source,moonbitlang/core/array/sort.mbt,27:::fn <a href="moonbitlang/core/array#Array">Array</a>::sort[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  > 
  >  Sorts the array in place.
  >  
  >  It's an in-place, unstable sort(it will reorder equal elements). The time complexity is O(n log n) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = [5, 4, 3, 2, 1]
  >  arr.sort()
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### sort\_by
  ```moonbit
  :::source,moonbitlang/core/array/sort_by.mbt,48:::fn <a href="moonbitlang/core/array#Array">Array</a>::sort_by[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], cmp : (T, T) -> Int) -> Unit
  ```
  > 
  >  Sorts the array with a custom comparison function.
  >  
  >  It's an in-place, unstable sort(it will reorder equal elements). The time complexity is O(n log n) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = [5, 3, 2, 4, 1]
  >  arr.sort_by(fn (a, b) { a - b })
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### sort\_by\_key
  ```moonbit
  :::source,moonbitlang/core/array/sort_by.mbt,27:::fn <a href="moonbitlang/core/array#Array">Array</a>::sort_by_key[T, K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], map : (T) -> K) -> Unit
  ```
  > 
  >  Sorts the array with a key extraction function.
  >  
  >  It's an in-place, unstable sort(it will reorder equal elements). The time complexity is O(n log n) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = [5, 3, 2, 4, 1]
  >  arr.sort_by_key(fn (x) {-x})
  >  assert_eq!(arr, [5, 4, 3, 2, 1])
  >  ```

## ArrayView


#### mooncakes-io-method-mark-Methods
- #### all
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,58:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::all[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Bool) -> Bool
  ```
  > 
  >  Checks if all elements in the array view match the condition.
  >  
  >  #### Example
  >  
  >  ```
  >  let v = [1, 4, 6, 8, 9]
  >  assert_false!(v[:].all(fn(elem) { elem % 2 == 0 }))
  >  assert_true!(v[1:4].all(fn(elem) { elem % 2 == 0 }))
  >  ```
- #### any
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,77:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::any[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Bool) -> Bool
  ```
  > 
  >  Check if any of the elements in the array view match the condition.
  > 
  >  #### Example
  > 
  >  ```
  >  let v = [1, 2, 3, 4, 5][:]
  >  assert_true!(v.any(fn(ele) { ele < 6 }))
  >  assert_false!(v.any(fn(ele) { ele < 1 }))
  >  ```
- #### contains
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,94:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::contains[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], value : T) -> Bool
  ```
  > 
  >  Checks if the array view contains an element.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5][:]
  >  assert_true!(v.contains(3))
  >  ```
- #### each
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,25:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::each[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,42:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::eachi[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (Int, T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the array view with index.
  > 
  >  #### Example
  >  
  >  ```
  >  let v = [3, 4, 5][:]
  >  let mut sum = 0
  >  v.eachi(fn (i, x) { sum = sum + x + i })
  >  assert_eq!(sum, 15)
  >  ```
- #### rev\_inplace
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,16:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::rev_inplace[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Unit
  ```
  > 

## FixedArray


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,1002:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/array#FixedArray">FixedArray</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### all
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,575:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::all[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> Bool) -> Bool
  ```
  > 
  >  Check if all the elements in the array match the condition.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr: FixedArray[Int] = [1, 2, 3, 4, 5]
  >  assert_true!(arr.all(fn(ele) { ele < 6 }))
  >  assert_false!(arr.all(fn(ele) { ele < 5 }))
  >  ```
- #### any
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,610:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::any[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> Bool) -> Bool
  ```
  > 
  >  Check if any of the elements in the array match the condition.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr: FixedArray[Int] = [1, 2, 3, 4, 5]
  >  assert_true!(arr.any(fn(ele) { ele < 6 }))
  >  assert_true!(arr.any(fn(ele) { ele < 5 }))
  >  ```
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,1002:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]
  ```
  > 
- #### contains
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,694:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::contains[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], value : T) -> Bool
  ```
  > 
  >  Checks if the array contains an element.
  > 
  >  #### Example
  >  ```
  >  let arr: FixedArray[Int] = [3, 4, 5]
  >  assert_true!(arr.contains(3))
  >  ```
- #### copy
  ```moonbit
  :::source,moonbitlang/core/array/blit.mbt,16:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::copy[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
- #### each
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,32:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::each[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over each element.
  > 
  >  #### Arguments
  > 
  >  - `self`: The array to iterate over.
  >  - `f`: The function to apply to each element.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = []
  >  [1, 2, 3, 4, 5].each(fn(x){ arr.push(x) })
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
  >  TODO: change the intrinsic to match the function name
  > @intrinsic %fixedarray.iter
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,82:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::eachi[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the array with index.
  > 
  >  #### Arguments
  > 
  >  - `self`: The array to iterate over.
  >  - `f`: A function that takes an `Int` representing the index and a `T` representing the element of the array, and returns `Unit`.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = []
  >  [1, 2, 3, 4, 5].eachi(fn(index, elem){
  >    arr.push((index, elem))
  >  })
  >  assert_eq!(arr, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5)])
  >  ```
- #### ends\_with
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,776:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::ends_with[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], suffix : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
  >  Check if the array ends with a given suffix.
  > 
  >  #### Example
  >  ```
  >  let v: FixedArray[Int] = [3, 4, 5]
  >  assert_true!(v.ends_with([5]))
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,343:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
- #### fold\_left
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,49:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_left[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
  >  @alert deprecated "Use `fold` instead"
- #### fold\_lefti
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,75:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_lefti[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
  >  @alert deprecated "Use `foldi` instead"
- #### fold\_right
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,62:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_right[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
  >  @alert deprecated "Use `rev_fold` instead"
- #### fold\_righti
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,92:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_righti[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
  >  @alert deprecated "Use `rev_foldi` instead"
- #### foldi
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,399:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::foldi[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,326:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::from_array[T](array : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Create a new array with given values.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,961:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::from_iter[T](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
- #### is\_sorted
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray_sort.mbt,505:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::is_sorted[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
- #### last
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,967:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::last[A](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> A?
  ```
  > 
  >  Returns the last element of the fixed array.
- #### makei
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,300:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::makei[T](length : Int, value : (Int) -> T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Create a new array. Values are built from indexes.
- #### map
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,232:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::map[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> U) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[U]
  ```
  > 
  >  Applies a function to each element of the array and returns a new array with the results.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = [1, 2, 3, 4, 5]
  >  let doubled = arr.map(fn(x){ x * 2 })
  >  assert_eq!(doubled, [2, 4, 6, 8, 10])
  >  ```
- #### mapi
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,263:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::mapi[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, T) -> U) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[U]
  ```
  > 
  >  Maps a function over the elements of the arr with index.
  > 
  >  #### Example
  >  ```
  >  let arr = [3, 4, 5]
  >  let added = arr.mapi(fn (i, x) { x + i })
  >  assert_eq!(added, [3, 5, 7])
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,18:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::new[T](length : Int, value : () -> T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Create a new array. Values are lazily built.
  > @alert deprecated "Use `FixedArray::makei` instead"
- #### new\_with\_index
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,33:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::new_with_index[T](length : Int, value : (Int) -> T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Create a new array. Values are built from indexes.
  > @alert deprecated "Use `FixedArray::makei` instead"
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,894:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::op_add[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], other : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,819:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], that : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
- #### rev
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,468:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
- #### rev\_each
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,130:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_each[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over each element in reversed turn.
  > 
  >  #### Arguments
  > 
  >  - `self`: The array to iterate over.
  >  - `f`: The function to apply to each element.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = []
  >  [1, 2, 3, 4, 5].rev_each(fn(x){ arr.push(x) })
  >  assert_eq!(arr, [5, 4, 3, 2, 1])
  >  ```
- #### rev\_eachi
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,180:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_eachi[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the array with index in reversed turn.
  > 
  >  #### Arguments
  > 
  >  - `self`: The array to iterate over.
  >  - `f`: A function that takes an `Int` representing the index and a `T` representing the element of the array, and returns `Unit`.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = []
  >  [1, 2, 3, 4, 5].rev_eachi(fn(index, elem){
  >    arr.push((index, elem))
  >  })
  >  assert_eq!(arr, [(0, 5), (1, 4), (2, 3), (3, 2), (4, 1)])
  >  ```
- #### rev\_fold
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,370:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_fold[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
- #### rev\_foldi
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,429:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_foldi[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
- #### rev\_inplace
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,457:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_inplace[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Unit
  ```
  > 
- #### search
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,659:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::search[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], value : T) -> Int?
  ```
  > 
  >  Search the array index for a given element.
  > 
  >  #### Example
  >  ```
  >  let arr: FixedArray[Int] = [3, 4, 5]
  >  assert_eq!(arr.search(3), Some(0))
  >  ```
- #### sort
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray_sort.mbt,216:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::sort[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Unit
  ```
  > 
  >  Sorts the array
  >  
  >  It's an in-place, unstable sort(it will reorder equal elements). The time complexity is O(n log n) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = [5, 4, 3, 2, 1]
  >  arr.sort()
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### sort\_by
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray_sort_by.mbt,60:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::sort_by[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], cmp : (T, T) -> Int) -> Unit
  ```
  > 
  >  Sorts the array with a custom comparison function.
  >  
  >  It's an in-place, unstable sort(it will reorder equal elements). The time complexity is O(n log n) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = [5, 3, 2, 4, 1]
  >  arr.sort_by(fn (a, b) { a - b })
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### sort\_by\_key
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray_sort_by.mbt,27:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::sort_by_key[T, K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], map : (T) -> K) -> Unit
  ```
  > 
  >  Sorts the array with a key extraction function.
  >  
  >  It's an in-place, unstable sort(it will reorder equal elements). The time complexity is O(n log n) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr = [5, 3, 2, 4, 1]
  >  arr.sort_by_key(fn (x) {-x})
  >  assert_eq!(arr, [5, 4, 3, 2, 1])
  >  ```
- #### stable\_sort
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray_sort.mbt,27:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::stable_sort[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Unit
  ```
  > 
  >  Sorts the array
  >  
  >  It's an stable sort(it will not reorder equal elements). The time complexity is *O*(*n* \* log(*n*)) in the worst case.
  >  
  >  #### Example
  >  
  >  ```
  >  let arr: FixedArray[Int] = [5, 4, 3, 2, 1]
  >  arr.stable_sort()
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### starts\_with
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,729:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::starts_with[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], prefix : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
  >  Check if the array starts with a given prefix.
  > 
  >  #### Example
  >  ```
  >  let arr: FixedArray[Int] = [3, 4, 5]
  >  assert_true!(arr.starts_with([3, 4]))
  >  ```
