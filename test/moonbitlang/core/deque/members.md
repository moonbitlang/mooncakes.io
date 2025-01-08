# Deque

Deque is a double-ended queue implemented as a round-robin queue, supporting O(1) head or tail insertion and querying, just like double-ended queues in other languages(C++ std::deque / Rust VecDeque), here deque also supports random access.

# Usage

## Create

You can create a deque manually via the `new()` or construct it using the `of()`.

```moonbit
let dv : @deque.T[Int] = @deque.new()
let dv = @deque.of([1, 2, 3, 4, 5])
```

If you want to set the length at creation time to minimize expansion consumption, you can add parameter `capacity` to the `new()` function.

```moonbit
let dv = @deque.new(capacity=10)
```

## Length & Capacity

A deque is an indefinite-length, auto-expandable datatype. You can use `length()` to get the number of elements in the current queue, or `capacity()` to get the current capacity.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv.length() // 5
dv.capacity() // 5
```

Similarly, you can use the `is_empty` to determine whether the queue is empty.

```moonbit
let dv : @deque[Int] = @deque.new()
dv.is_empty() // true
```

You can use `reserve_capacity` to reserve capacity, ensures that it can hold at least the number of elements
specified by the `capacity` argument.

```moonbit
let dv = @deque.of([1])
dv.reserve_capacity(10)
println(dv.capacity()) // 10
```

Also, you can use `shrink_to_fit` to shrink the capacity of the deque.

```moonbit
let dv = @deque.new(capacity=10)
dv.push_back(1)
dv.push_back(2)
dv.push_back(3)
println(dv.capacity()) // 10
dv.shrink_to_fit()
println(dv.capacity()) // 3
```

## Front & Back & Get

You can use `front()` and `back()` to get the head and tail elements of the queue, respectively. Since the queue may be empty, their return values are both `Option`, or `None` if the queue is empty.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv.front() // Some(1)
dv.back() // Some(5)
```

You can also use `op_get` to access elements of the queue directly, but be careful not to cross the boundaries!

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv[0] // 1
dv[4] // 5
```

## Push & Set

Since the queue is bi-directional, you can use `push_front()` and `push_back()` to add values to the head or tail of the queue, respectively.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv.push_front(6)
dv.push_front(7)
dv.push_back(8)
dv.push_back(9)
//now: 6 7 1 2 3 4 5 8 9
```

You can also use `op_set` to set elements of the queue directly, but be careful not to cross the boundaries!

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv[0] = 5
dv[0] // 5
```

## Pop

You can use `pop_front()` and `pop_back()` to pop the element at the head or tail of the queue, respectively, and like [Front & Back](#Front & Back & Get), their return values are `Option`, loaded with the value of the element being popped.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
let back = dv.pop_back() // Some(5)
dv.back() // Some(4)
let front = dv.pop_front() //Some(1)
dv.front() // Some(2)
dv.length() // 3
```

If you only want to pop an element without getting the return value, you can use `pop_front_exn()` with `pop_back_exn()`.
These two functions will panic if the queue is empty.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv.pop_front_exn()
dv.front() // Some(2)
dv.pop_back_exn()
dv.back() // Some(3)
```

## Clear

You can use `clear` to clear a deque. But note that the memory it already occupies does not change.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv.clear()
dv.is_empty() // true
```

## Equal

deque supports comparing them directly using `op_equal`.

```moonbit
let dqa = @deque.of([1, 2, 3, 4, 5])
let dqb = @deque.of([1, 2, 3, 4, 5])
dqa == dqb // true
```

## Iter & Map

deque supports vector-like `iter/iteri/map/mapi` functions and their inverse forms.

```moonbit
 let dv = @deque.of([1, 2, 3, 4, 5])
 dv.each(fn(elem) { print(elem) })
 dv.eachi(fn(i, _elem) { print(i) })
 dv.map(fn(elem) { elem + 1 })
 dv.mapi(fn(i, elem) { elem + i })
```

## Search & Contains

You can use `contains()` to find out if a value is in the deque, or `search()` to find its index in the deque.

```moonbit
let dv = @deque.of([1, 2, 3, 4, 5])
dv.contains(1) // true
dv.contains(6) // false
dv.search(1) // Some(0)
dv.search(6) // None
```

---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/deque/types.mbt,17:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,25:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/deque#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/deque/deque.mbt,25:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/deque#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### as\_views
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,403:::fn <a href="moonbitlang/core/deque#T">T</a>::as_views[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> (<a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A], <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A])
  ```
  > 
  >  Returns two array views that together represent all elements in the deque in
  > their correct order. The first view contains elements from the head to the
  > end of the internal buffer, and the second view contains any remaining
  > elements from the start of the buffer.
  > 
  >  If the deque is empty, returns a pair of empty views. If all elements are
  > contiguous in memory, the second view will be empty.
  > 
  >  Parameters:
  > 
  >  * `self` : The deque to be viewed.
  > 
  >  Returns a tuple of two array views that together contain all elements of the
  > deque in order.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "T::as_views" {
  >    let dq = @deque.of([1, 2, 3, 4, 5])
  >    let (v1, v2) = dq.as_views()
  >    inspect!(v1.length(), content="5")
  >    inspect!(v2.length(), content="0")
  >  }
  >  ```
- #### back
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,140:::fn <a href="moonbitlang/core/deque#T">T</a>::back[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> A?
  ```
  > 
  >  Return the back element from a deque, or `None` if it is empty.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  assert_eq!(dv.back(), Some(5))
  >  ```
- #### capacity
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,82:::fn <a href="moonbitlang/core/deque#T">T</a>::capacity[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Int
  ```
  > 
  >  Returns the total number of elements the deque can hold without reallocating.
- #### clear
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,504:::fn <a href="moonbitlang/core/deque#T">T</a>::clear[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Unit
  ```
  > 
  >  Clears the deque, removing all values.
  > 
  >  This method has no effect on the allocated capacity of the deque, only setting the length to 0.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  dv.clear()
  >  assert_eq!(dv.length(), 0)
  >  ```
- #### contains
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,605:::fn <a href="moonbitlang/core/deque#T">T</a>::contains[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/deque#T">T</a>[A], value : A) -> Bool
  ```
  > 
  >  Checks if the array contains an element.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([3, 4, 5])
  >  assert_true!(dv.contains(3))
  >  ```
- #### copy
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,46:::fn <a href="moonbitlang/core/deque#T">T</a>::copy[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> <a href="moonbitlang/core/deque#T">T</a>[A]
  ```
  > 
  >  Creates a new copy of this deque.
- #### each
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,439:::fn <a href="moonbitlang/core/deque#T">T</a>::each[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the deque.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  let mut sum = 0
  >  dv.each(fn (x) {sum = sum + x})
  >  assert_eq!(sum, 15)
  >  ```
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,455:::fn <a href="moonbitlang/core/deque#T">T</a>::eachi[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (Int, A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the deque with index.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  let mut idx_sum = 0
  >  dv.eachi(fn (i, _x) {idx_sum = idx_sum + i})
  >  assert_eq!(idx_sum, 10)
  >  ```
- #### filter\_map\_inplace
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,739:::fn <a href="moonbitlang/core/deque#T">T</a>::filter_map_inplace[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (A) -> A?) -> Unit
  ```
  > 
  >  Filters and maps elements in-place using a provided function. Modifies the
  > deque to retain only elements for which the provided function returns `Some`,
  > and updates those elements with the values inside the `Some` variant.
  > 
  >  Parameters:
  > 
  >  * `self` : The deque to be filtered and mapped.
  >  * `f` : A function that takes an element and returns either `Some` with a new
  >    value to replace the element, or `None` to remove the element.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "filter_map_inplace" {
  >    let dq = @deque.of([1, 2, 3, 4, 5])
  >    dq.filter_map_inplace(fn(x) { if x % 2 == 0 { Some(x * 2) } else { None } })
  >    inspect!(dq, content="@deque.of([4, 8])")
  >  }
  >  ```
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,31:::fn <a href="moonbitlang/core/deque#T">T</a>::from_array[A](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/deque#T">T</a>[A]
  ```
  > 
  >  Creates a new deque from an array.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,938:::fn <a href="moonbitlang/core/deque#T">T</a>::from_iter[A](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/deque#T">T</a>[A]
  ```
  > 
- #### front
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,124:::fn <a href="moonbitlang/core/deque#T">T</a>::front[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> A?
  ```
  > 
  >  Return the front element from a deque, or `None` if it is empty.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  assert_eq!(dv.front(), Some(1))
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,577:::fn <a href="moonbitlang/core/deque#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Bool
  ```
  > 
  >  Test if the deque is empty.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.new()
  >  assert_eq!(dv.is_empty(), true)
  >  dv.push_back(1)
  >  assert_eq!(dv.is_empty(), false)
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,832:::fn <a href="moonbitlang/core/deque#T">T</a>::iter[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,858:::fn <a href="moonbitlang/core/deque#T">T</a>::iter2[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, A]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,76:::fn <a href="moonbitlang/core/deque#T">T</a>::length[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Int
  ```
  > 
  >  Returns the deque of elements in the vector.
- #### map
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,534:::fn <a href="moonbitlang/core/deque#T">T</a>::map[A, U](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (A) -> U) -> <a href="moonbitlang/core/deque#T">T</a>[U]
  ```
  > 
  >  Maps a function over the elements of the deque.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([3, 4, 5])
  >  let dv2 = dv.map(fn (x) {x + 1})
  >  assert_eq!(dv2, @deque.of([4, 5, 6]))
  >  ```
- #### mapi
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,555:::fn <a href="moonbitlang/core/deque#T">T</a>::mapi[A, U](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (Int, A) -> U) -> <a href="moonbitlang/core/deque#T">T</a>[U]
  ```
  > 
  >  Maps a function over the elements of the deque with index.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([3, 4, 5])
  >  let dv2 = dv.mapi(fn (i, x) {x + i}) // @deque.of([3, 5, 7])
  >  assert_eq!(dv2, @deque.of([3, 5, 7]))
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,20:::fn <a href="moonbitlang/core/deque#T">T</a>::new[A](capacity~ : Int = ..) -> <a href="moonbitlang/core/deque#T">T</a>[A]
  ```
  > 
  >  Creates a new, empty deque.
- #### of
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,61:::fn <a href="moonbitlang/core/deque#T">T</a>::of[A](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/deque#T">T</a>[A]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,417:::fn <a href="moonbitlang/core/deque#T">T</a>::op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/deque#T">T</a>[A], other : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Bool
  ```
  > 
  >  Compares two deques for equality.
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,337:::fn <a href="moonbitlang/core/deque#T">T</a>::op_get[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], index : Int) -> A
  ```
  > 
  >  Retrieves the element at the specified index from the deque.
  > 
  >  If you try to access an index which isn’t in the Deque, it will panic.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  assert_eq!(dv[2], 3)
  >  ```
  >  @alert unsafe "Panic if the index is out of bounds."
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,363:::fn <a href="moonbitlang/core/deque#T">T</a>::op_set[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], index : Int, value : A) -> Unit
  ```
  > 
  >  Sets the value of the element at the specified index.
  > 
  >  If you try to access an index which isn’t in the Deque, it will panic.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  dv[2] = 1
  >  assert_eq!(dv[2], 1)
  >  ```
  >  @alert unsafe "Panic if the index is out of bounds."
- #### pop\_back
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,303:::fn <a href="moonbitlang/core/deque#T">T</a>::pop_back[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> A?
  ```
  > 
  >  Removes a back element from a deque and returns it, or `None` if it is empty.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  assert_eq!(dv.pop_back(), Some(5))
  >  ```
- #### pop\_back\_exn
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,260:::fn <a href="moonbitlang/core/deque#T">T</a>::pop_back_exn[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Unit
  ```
  > 
  >  @alert deprecated "Use `unsafe_pop_back` instead"
  > @coverage.skip
- #### pop\_front
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,272:::fn <a href="moonbitlang/core/deque#T">T</a>::pop_front[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> A?
  ```
  > 
  >  Removes a front element from a deque and returns it, or `None` if it is empty.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  assert_eq!(dv.pop_front(), Some(1))
  >  ```
- #### pop\_front\_exn
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,224:::fn <a href="moonbitlang/core/deque#T">T</a>::pop_front_exn[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Unit
  ```
  > 
  >  @alert deprecated "Use `unsafe_pop_front` instead"
  > @coverage.skip
- #### push\_back
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,181:::fn <a href="moonbitlang/core/deque#T">T</a>::push_back[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], value : A) -> Unit
  ```
  > 
  >  Adds an element to the back of the deque.
  > 
  >  If the deque is at capacity, it will be reallocated.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  dv.push_back(6)
  >  assert_eq!(dv.back(), Some(6))
  >  ```
- #### push\_front
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,159:::fn <a href="moonbitlang/core/deque#T">T</a>::push_front[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], value : A) -> Unit
  ```
  > 
  >  Adds an element to the front of the deque.
  > 
  >  If the deque is at capacity, it will be reallocated.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  dv.push_front(0)
  >  assert_eq!(dv.front(), Some(0))
  >  ```
- #### reserve\_capacity
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,620:::fn <a href="moonbitlang/core/deque#T">T</a>::reserve_capacity[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], capacity : Int) -> Unit
  ```
  > 
  >  Reserves capacity to ensure that it can hold at least the number of elements
  > specified by the `capacity` argument.
  > 
  >  #### Example
  > 
  >  ```
  >  let dv = @deque.of([1])
  >  dv.reserve_capacity(10)
  >  assert_eq!(dv.capacity(), 10)
  >  ```
- #### retain
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,798:::fn <a href="moonbitlang/core/deque#T">T</a>::retain[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (A) -> Bool) -> Unit
  ```
  > 
  >  Filters elements in-place by retaining only the elements that satisfy the
  > given predicate. Modifies the deque to keep only the elements for which the
  > predicate function returns `true`.
  > 
  >  Parameters:
  > 
  >  * `self` : The deque to be filtered.
  >  * `predicate` : A function that takes an element and returns `true` if the
  >    element should be kept, `false` if it should be removed.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "retain" {
  >    let dq = @deque.of([1, 2, 3, 4, 5])
  >    dq.retain(fn(x) { x % 2 == 0 })
  >    inspect!(dq, content="@deque.of([2, 4])")
  >  }
  >  ```
- #### rev\_each
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,471:::fn <a href="moonbitlang/core/deque#T">T</a>::rev_each[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the deque in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  let mut sum = 0
  >  dv.rev_each(fn (x) {sum = sum + x})
  >  assert_eq!(sum, 15)
  >  ```
- #### rev\_eachi
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,487:::fn <a href="moonbitlang/core/deque#T">T</a>::rev_eachi[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], f : (Int, A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the deque in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  let mut idx_sum = 0
  >  dv.rev_eachi(fn (i, _x) {idx_sum = idx_sum + i})
  >  assert_eq!(idx_sum, 10)
  >  ```
- #### rev\_iter
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,885:::fn <a href="moonbitlang/core/deque#T">T</a>::rev_iter[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### rev\_iter2
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,911:::fn <a href="moonbitlang/core/deque#T">T</a>::rev_iter2[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, A]
  ```
  > 
- #### search
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,588:::fn <a href="moonbitlang/core/deque#T">T</a>::search[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/deque#T">T</a>[A], value : A) -> Int?
  ```
  > 
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([3, 4, 5])
  >  assert_eq!(dv.search(3), Some(0))
  >  ```
- #### shrink\_to\_fit
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,650:::fn <a href="moonbitlang/core/deque#T">T</a>::shrink_to_fit[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Unit
  ```
  > 
  >  Shrinks the capacity of the deque as much as possible.
  > 
  >  #### Example
  > 
  >  ```
  >  let dv = @deque.new(capacity=10)
  >  dv.push_back(1)
  >  dv.push_back(2)
  >  dv.push_back(3)
  >  assert_eq!(dv.capacity(), 10)
  >  dv.shrink_to_fit()
  >  assert_eq!(dv.capacity(), 3)
  >  ```
- #### truncate
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,685:::fn <a href="moonbitlang/core/deque#T">T</a>::truncate[A](self : <a href="moonbitlang/core/deque#T">T</a>[A], len : Int) -> Unit
  ```
  > 
  >  Shortens the deque in-place, keeping the first `len` elements and dropping
  > the rest.
  > 
  >  If `len` is greater than or equal to the deque's current length, this has no
  > effect.
  > 
  >  Parameters:
  > 
  >  * `self` : The deque to be truncated.
  >  * `len` : The new length of the deque.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "truncate" {
  >    let dq = @deque.of([1, 2, 3, 4, 5])
  >    dq.truncate(3)
  >    inspect!(dq, content="@deque.of([1, 2, 3])")
  >  }
  >  ```
- #### unsafe\_pop\_back
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,238:::fn <a href="moonbitlang/core/deque#T">T</a>::unsafe_pop_back[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Unit
  ```
  > 
  >  Removes a back element from a deque.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  dv.unsafe_pop_back()
  >  assert_eq!(dv.back(), Some(4))
  >  ```
  >  @alert unsafe "Panic if the deque is empty."
- #### unsafe\_pop\_front
  ```moonbit
  :::source,moonbitlang/core/deque/deque.mbt,202:::fn <a href="moonbitlang/core/deque#T">T</a>::unsafe_pop_front[A](self : <a href="moonbitlang/core/deque#T">T</a>[A]) -> Unit
  ```
  > 
  >  Removes a front element from a deque.
  > 
  >  #### Example
  >  ```
  >  let dv = @deque.of([1, 2, 3, 4, 5])
  >  dv.unsafe_pop_front()
  >  assert_eq!(dv.front(), Some(2))
  >  ```
  >  @alert unsafe "Panic if the deque is empty."
