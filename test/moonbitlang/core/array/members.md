# Documentation
|Type|description|
|---|---|
|[ArrayView](#ArrayView)||
|[Array](#Array)||
|[FixedArray](#FixedArray)||

## ArrayView


#### mooncakes-io-method-mark-Methods
- #### all
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,91:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::all[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Bool) -> Bool
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
  :::source,moonbitlang/core/array/view.mbt,110:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::any[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Bool) -> Bool
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
  :::source,moonbitlang/core/array/view.mbt,140:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::contains[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], value : T) -> Bool
  ```
  > 
  >  Checks whether the array view contains a specific element by comparing each
  > element with the target value using the equality operator.
  > 
  >  Parameters:
  > 
  >  * `view` : The array view to search in.
  >  * `target` : The value to search for in the array view.
  > 
  >  Returns a boolean value indicating whether the target value exists in the
  > array view.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "array_view/contains" {
  >    let arr = [1, 2, 3, 4, 5][:]
  >    inspect!(arr.contains(3), content="true")
  >    inspect!(arr.contains(6), content="false")
  >  }
  >  ```
- #### each
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,58:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::each[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over each element in the array view and applies a function to it.
  > 
  >  Parameters:
  > 
  >  * `self` : The array view to iterate over.
  >  * `function` : A function that takes an element of type `T` and returns
  >    nothing. This function will be applied to each element in the array view.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "array_view/each" {
  >    let arr = [1, 2, 3][:]
  >    let mut sum = 0
  >    arr.each(fn(x) { sum = sum + x })
  >    inspect!(sum, content="6")
  >  }
  >  ```
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/array/view.mbt,75:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::eachi[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (Int, T) -> Unit) -> Unit
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
  :::source,moonbitlang/core/array/view.mbt,31:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::rev_inplace[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Unit
  ```
  > 
  >  Reverses the elements in the array view in place.
  > 
  >  Parameters:
  > 
  >  * `self` : The array view whose elements are to be reversed.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "rev_inplace" {
  >    let arr = [1, 2, 3, 4, 5]
  >    arr[:].rev_inplace()
  >    inspect!(arr, content="[5, 4, 3, 2, 1]")
  >  }
  >  ```

## Array


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/array/array.mbt,210:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/array#Array">Array</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/array/array.mbt,210:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[X]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### copy
  ```moonbit
  :::source,moonbitlang/core/array/array_nonjs.mbt,35:::fn <a href="moonbitlang/core/array#Array">Array</a>::copy[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Creates and returns a new array with a copy of all elements from the input
  > array.
  > 
  >  Parameters:
  > 
  >  * `array` : The array to be copied.
  > 
  >  Returns a new array containing all elements from the original array.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "copy" {
  >    let original = [1, 2, 3]
  >    let copied = original.copy()
  >    inspect!(copied, content="[1, 2, 3]")
  >    inspect!(physical_equal(original, copied), content="false")
  >  }
  >  ```
- #### filter\_map
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,154:::fn <a href="moonbitlang/core/array#Array">Array</a>::filter_map[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], f : (A) -> B?) -> <a href="moonbitlang/core/array#Array">Array</a>[B]
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
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,34:::fn <a href="moonbitlang/core/array#Array">Array</a>::from_iter[T](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Creates a new array containing all elements from an iterator.
  > 
  >  Parameters:
  > 
  >  * `iterator` : An iterator containing elements of type `T`.
  > 
  >  Returns a new array containing all elements from the iterator in the same
  > order.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Array::from_iter" {
  >    let iter = Iter::singleton(42)
  >    let arr = Array::from_iter(iter)
  >    inspect!(arr, content="[42]")
  >  }
  >  ```
- #### last
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,202:::fn <a href="moonbitlang/core/array#Array">Array</a>::last[A](self : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> A?
  ```
  > 
  >  Returns the last element of the array, or `None` if the array is empty.
  > 
  >  Parameters:
  > 
  >  * `array` : The array to get the last element from.
  > 
  >  Returns an optional value containing the last element of the array. The
  > result is `None` if the array is empty, or `Some(x)` where `x` is the last
  > element of the array.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "last" {
  >    let arr = [1, 2, 3]
  >    inspect!(arr.last(), content="Some(3)")
  >    let empty : Array[Int] = []
  >    inspect!(empty.last(), content="None")
  >  }
  >  ```
- #### makei
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,80:::fn <a href="moonbitlang/core/array#Array">Array</a>::makei[T](length : Int, value : (Int) -> T) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Creates a new array of the specified length, where each element is
  > initialized using an index-based initialization function.
  > 
  >  Parameters:
  > 
  >  * `length` : The length of the new array. If `length` is less than or equal
  >    to 0, returns an empty array.
  >  * `initializer` : A function that takes an index (starting from 0) and
  >    returns a value of type `T`. This function is called for each index to
  >    initialize the corresponding element.
  > 
  >  Returns a new array of type `Array[T]` with the specified length, where each
  > element is initialized using the provided function.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Array::makei" {
  >    let arr = Array::makei(3, fn(i) { i * 2 })
  >    inspect!(arr, content="[0, 2, 4]")
  >  }
  >  ```
- #### map\_option
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,177:::fn <a href="moonbitlang/core/array#Array">Array</a>::map_option[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], f : (A) -> B?) -> <a href="moonbitlang/core/array#Array">Array</a>[B]
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
  >  @alert deprecated "Use `Array::filter_map` instead"
- #### push\_iter
  ```moonbit
  :::source,moonbitlang/core/array/array.mbt,51:::fn <a href="moonbitlang/core/array#Array">Array</a>::push_iter[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> Unit
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
  :::source,moonbitlang/core/array/array.mbt,138:::fn <a href="moonbitlang/core/array#Array">Array</a>::shuffle[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[T], rand~ : (Int) -> Int) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
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
  :::source,moonbitlang/core/array/array.mbt,108:::fn <a href="moonbitlang/core/array#Array">Array</a>::shuffle_in_place[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[T], rand~ : (Int) -> Int) -> Unit
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

## FixedArray


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,1156:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/array/fixedarray.mbt,1156:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### all
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,648:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::all[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> Bool) -> Bool
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
  :::source,moonbitlang/core/array/fixedarray.mbt,683:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::any[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (T) -> Bool) -> Bool
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
- #### contains
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,767:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::contains[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], value : T) -> Bool
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
  :::source,moonbitlang/core/array/blit.mbt,36:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::copy[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Creates a new array that is a copy of the original array.
  > 
  >  Parameters:
  > 
  >  * `self` : The array to be copied. The type of elements in the array must be
  >    `T`.
  > 
  >  Returns a new array containing all elements from the original array in the
  > same order.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "copy" {
  >    let original = [1, 2, 3]
  >    let copied = original.copy()
  >    inspect!(copied, content="[1, 2, 3]")
  >    inspect!(physical_equal(original, copied), content="false")
  >  }
  >  ```
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
  :::source,moonbitlang/core/array/fixedarray.mbt,849:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::ends_with[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], suffix : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
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
  :::source,moonbitlang/core/array/fixedarray.mbt,381:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (B, A) -> B) -> B
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
  :::source,moonbitlang/core/array/deprecated.mbt,97:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_left[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (U, T) -> U, init~ : U) -> U
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
  > @coverage.skip
- #### fold\_lefti
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,125:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_lefti[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, U, T) -> U, init~ : U) -> U
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
  > @coverage.skip
- #### fold\_right
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,111:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_right[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (U, T) -> U, init~ : U) -> U
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
  > @coverage.skip
- #### fold\_righti
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,143:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fold_righti[T, U](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], f : (Int, U, T) -> U, init~ : U) -> U
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
  > @coverage.skip
- #### foldi
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,437:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::foldi[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
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
  :::source,moonbitlang/core/array/fixedarray.mbt,364:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::from_array[T](array : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Creates a new fixed-size array from a dynamic array. The resulting fixed
  > array will have the same length and elements as the input array.
  > 
  >  Parameters:
  > 
  >  * `array` : A dynamic array containing elements of type `T` that will be
  >    converted to a fixed array.
  > 
  >  Returns a new fixed array containing the same elements as the input array.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::from_array" {
  >    let dynamic_array = [1, 2, 3, 4, 5]
  >    let fixed_array = FixedArray::from_array(dynamic_array)
  >    inspect!(fixed_array, content="[1, 2, 3, 4, 5]")
  >  }
  >  ```
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,1097:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::from_iter[T](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Creates a new fixed array from an iterator.
  > 
  >  Parameters:
  > 
  >  * `iterator` : An iterator of type `Iter[T]` from which elements will be
  >    collected into a fixed array.
  > 
  >  Returns a new fixed array containing all elements from the iterator.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::from_iter" {
  >    let arr = [1, 2, 3]
  >    let fixed_arr = FixedArray::from_iter(arr.iter())
  >    inspect!(fixed_arr, content="[1, 2, 3]")
  >  }
  >  ```
- #### is\_sorted
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray_sort.mbt,526:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::is_sorted[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
  >  Checks if the elements in the array are sorted in ascending order according
  > to their natural ordering.
  > 
  >  Parameters:
  > 
  >  * `array` : A fixed array of type `T`, where `T` must implement the `Compare`
  >    trait.
  > 
  >  Returns `true` if the array is sorted in ascending order, `false` otherwise.
  > An empty array or an array with a single element is considered sorted.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::is_sorted" {
  >    let sorted : FixedArray[Int] = [1, 2, 3, 4, 5]
  >    let unsorted : FixedArray[Int] = [5, 4, 3, 2, 1]
  >    inspect!(FixedArray::is_sorted(sorted), content="true")
  >    inspect!(FixedArray::is_sorted(unsorted), content="false")
  >  }
  >  ```
- #### last
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,1121:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::last[A](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> A?
  ```
  > 
  >  Returns the last element of a fixed array if it exists.
  > 
  >  Parameters:
  > 
  >  * `self` : The fixed array to get the last element from.
  > 
  >  Returns `Some(element)` containing the last element if the array is not
  > empty, or `None` if the array is empty.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::last" {
  >    let array : FixedArray[Int] = [1, 2, 3]
  >    inspect!(array.last(), content="Some(3)")
  >    let empty : FixedArray[Int] = []
  >    inspect!(empty.last(), content="None")
  >  }
  >  ```
- #### makei
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,320:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::makei[T](length : Int, value : (Int) -> T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Creates a new fixed-size array of the specified length, where each element is
  > initialized using a function that maps indices to values.
  > 
  >  Parameters:
  > 
  >  * `length` : The length of the array to create. If `length` is less than or
  >    equal to 0, returns an empty array.
  >  * `initializer` : A function that takes an index (from 0 to `length - 1`) and
  >    returns a value of type `T` for that position.
  > 
  >  Returns a new fixed array containing the values produced by applying the
  > initializer function to each index.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::makei" {
  >    let arr = FixedArray::makei(3, fn(i) { i * 2 })
  >    inspect!(arr, content="[0, 2, 4]")
  >  }
  >  ```
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
  :::source,moonbitlang/core/array/deprecated.mbt,44:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::new[T](length : Int, value : () -> T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Creates a new fixed array of specified length where each element is generated
  > lazily by calling the given function.
  > 
  >  Parameters:
  > 
  >  * `length` : The size of the array to create. If negative or zero, returns an
  >    empty array.
  >  * `generator` : A function that takes no parameters and returns a value of
  >    type `T`. This function is called once for each element in the array.
  > 
  >  Returns a new fixed array of type `T` with the specified length, where each
  > element is generated by calling the `generator` function.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::new" {
  >    let mut i = 0
  >    let arr = FixedArray::makei(3, fn(_) {
  >      i = i + 1
  >      i
  >    })
  >    inspect!(arr, content="[1, 2, 3]")
  >  }
  >  ```
  > 
  >  @alert deprecated "Use `FixedArray::makei` instead"
  > @coverage.skip
- #### new\_with\_index
  ```moonbit
  :::source,moonbitlang/core/array/deprecated.mbt,80:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::new_with_index[T](length : Int, value : (Int) -> T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Creates a new array with values built from indices. Each value in the array
  > is computed by applying a function to its index.
  > 
  >  Parameters:
  > 
  >  * `length` : The length of the new array.
  >  * `function` : A function that takes an index as input and returns a value of
  >    type `T`. This function is called for each index from 0 to `length - 1` to
  >    generate the array elements.
  > 
  >  Returns a new array of type `FixedArray[T]` containing the computed values.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::makei" {
  >    let arr = FixedArray::makei(3, fn(i) { i * 2 })
  >    inspect!(arr, content="[0, 2, 4]")
  >  }
  >  ```
  > 
  >  @alert deprecated "Use `FixedArray::makei` instead"
  > @coverage.skip
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,1012:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::op_add[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], other : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Concatenates two arrays and returns a new array containing all elements from
  > both arrays in order.
  > 
  >  Parameters:
  > 
  >  * `self` : The first array to concatenate.
  >  * `other` : The second array to concatenate.
  > 
  >  Returns a new array that contains all elements from the first array followed
  > by all elements from the second array. The returned array is independent of
  > both input arrays.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "op_add" {
  >    let arr1 : FixedArray[Int] = [1, 2, 3]
  >    let arr2 : FixedArray[Int] = [4, 5, 6]
  >    inspect!(arr1 + arr2, content="[1, 2, 3, 4, 5, 6]")
  >  }
  >  ```
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,916:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], that : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
  >  Checks if two fixed arrays are equal.
  > 
  >  Two arrays are considered equal if they have the same length and all
  > corresponding elements are equal. The elements in the arrays must implement
  > the `Eq` trait.
  > 
  >  Parameters:
  > 
  >  * `self` : The first fixed array to compare.
  >  * `other` : The second fixed array to compare.
  > 
  >  Returns `true` if the arrays are equal, `false` otherwise.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::op_equal" {
  >    let arr1 : FixedArray[Int] = [1, 2, 3]
  >    let arr2 : FixedArray[Int] = [1, 2, 3]
  >    let arr3 : FixedArray[Int] = [1, 2, 4]
  >    inspect!(arr1 == arr2, content="true")
  >    inspect!(arr1 == arr3, content="false")
  >  }
  >  ```
- #### rev
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,541:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
  >  Returns a new array containing all elements in reverse order. The original
  > array remains unchanged.
  > 
  >  Parameters:
  > 
  >  * `self` : The array to be reversed.
  > 
  >  Returns a new array with the same elements but in reverse order.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "FixedArray::rev" {
  >    let arr : FixedArray[Int] = [1, 2, 3, 4, 5]
  >    inspect!(arr.rev(), content="[5, 4, 3, 2, 1]")
  >    // Original array remains unchanged
  >    inspect!(arr, content="[1, 2, 3, 4, 5]")
  >  }
  >  ```
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
  :::source,moonbitlang/core/array/fixedarray.mbt,408:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_fold[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (B, A) -> B) -> B
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
  :::source,moonbitlang/core/array/fixedarray.mbt,467:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_foldi[A, B](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
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
  :::source,moonbitlang/core/array/fixedarray.mbt,511:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::rev_inplace[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Unit
  ```
  > 
  >  Reverses the array in place by swapping elements from both ends until
  > reaching the middle.
  > 
  >  Parameters:
  > 
  >  * `array` : The array to be reversed. The array will be modified in place.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "rev_inplace" {
  >    let arr : FixedArray[_] = [1, 2, 3, 4, 5]
  >    arr.rev_inplace()
  >    inspect!(arr, content="[5, 4, 3, 2, 1]")
  >  }
  >  ```
- #### search
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,732:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::search[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], value : T) -> Int?
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
  :::source,moonbitlang/core/array/fixedarray.mbt,802:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::starts_with[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], prefix : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Bool
  ```
  > 
  >  Check if the array starts with a given prefix.
  > 
  >  #### Example
  >  ```
  >  let arr: FixedArray[Int] = [3, 4, 5]
  >  assert_true!(arr.starts_with([3, 4]))
  >  ```
- #### swap
  ```moonbit
  :::source,moonbitlang/core/array/fixedarray.mbt,612:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::swap[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], i : Int, j : Int) -> Unit
  ```
  > 
  >  Swap two elements in the array.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = [1, 2, 3, 4, 5]
  >  arr.swap(0, 1)
  >  assert_eq!(arr, [2, 1, 3, 4, 5])
  >  ```
