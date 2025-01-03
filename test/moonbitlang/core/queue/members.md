# Queue

Queue is a first in first out (FIFO) data structure, allowing to process their elements in the order they come.

# Usage

## Create and Clear
You can create a queue manually by using the `new` or construct it using the `from_array`.
```moonbit
let queue = @queue.new()
let queue2 = of([1,2,3])
let queue3 = of([1,1,4])
```

To clear the queue, you can use the `clear` method.
```moonbit
let queue = @queue.of([1,2,3])
queue.clear()
```

## Length
You can get the length of the queue by using the `length` method. The `is_empty` method can be used to check if the queue is empty.
```moonbit
let queue = @queue.of([1,2,3])
queue.length() // 3
queue.is_empty() // false
```

## Pop and Push
You can add elements to the queue using the `push` method and remove them using the `pop` method.
```moonbit
let queue = @queue.new()
queue.push(1)
queue.push(2)
queue.pop() // Some(1)
queue.pop() // Some(2)
```

## Peek
You can get the first element of the queue without removing it using the `peek` method.
```moonbit
let queue = @queue.of([1,2,3])
queue.peek() // Some(1)
```

## Traverse

You can traverse the queue using the `each` method.

```moonbit
let queue = @queue.of([1,2,3])
let mut sum = 0
queue.each(fn(x) { sum += x }) // sum = 6
```

You can fold the queue using the `fold` method.
```moonbit
let queue = @queue.of([1,2,3])
let sum = queue.fold(~init = 0, fn(acc, x) { acc + x }) // sum = 6
```

## Copy and Transfer
You can copy a queue using the `copy` method.
```moonbit
let queue = @queue.of([1,2,3])
let queue2 = queue.copy()
```

Transfer the elements from one queue to another using the `transfer` method.
```moonbit
let dst : @queue.T[Int] = @queue.new()
let src : @queue.T[Int] = @queue.of([5, 6, 7, 8])
src.transfer(dst)
```
---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/queue/types.mbt,28:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,456:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/queue#T">T</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/queue#T">T</a>[X]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,51:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/queue#T">T</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/queue#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,456:::fn <a href="moonbitlang/core/queue#T">T</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/queue#T">T</a>[X]
  ```
  > 
- #### clear
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,84:::fn <a href="moonbitlang/core/queue#T">T</a>::clear[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> Unit
  ```
  > 
  >  Clears the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  queue.clear()
  >  ```
- #### copy
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,284:::fn <a href="moonbitlang/core/queue#T">T</a>::copy[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> <a href="moonbitlang/core/queue#T">T</a>[A]
  ```
  > 
  >  Returns a copy of the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  let queue2 : @queue.T[Int] = queue.copy()
  >  assert_eq!(queue2.length(), 4)
  >  ```
- #### each
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,230:::fn <a href="moonbitlang/core/queue#T">T</a>::each[A](self : <a href="moonbitlang/core/queue#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  let mut sum = 0
  >  queue.each(fn(x) { sum = sum + x })
  >  ```
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,249:::fn <a href="moonbitlang/core/queue#T">T</a>::eachi[A](self : <a href="moonbitlang/core/queue#T">T</a>[A], f : (Int, A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the queue with index.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  let mut sum = 0
  >  queue.eachi(fn(x, i) { sum = sum + x * i })
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,268:::fn <a href="moonbitlang/core/queue#T">T</a>::fold[A, B](self : <a href="moonbitlang/core/queue#T">T</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Folds over the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.new()
  >  let sum = queue.fold(init=0, fn(acc, x) { acc + x })
  >  assert_eq!(sum, 0)
  >  ```
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,36:::fn <a href="moonbitlang/core/queue#T">T</a>::from_array[A](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/queue#T">T</a>[A]
  ```
  > 
  >  Creates a new queue from an array.
  > 
  >  #### Example
  >  ```
  >  let array = Array::makei(3, fn(idx) { idx + 1 })
  >  let queue : @queue.T[Int] = @queue.from_array(array)
  >  assert_eq!(queue.length(), 3)
  >  ```
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,368:::fn <a href="moonbitlang/core/queue#T">T</a>::from_iter[A](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/queue#T">T</a>[A]
  ```
  > 
  >  Creates a new queue from an iter.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.T::from_iter(Iter::empty())
  >  assert_eq!(queue.length(), 0)
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,110:::fn <a href="moonbitlang/core/queue#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> Bool
  ```
  > 
  >  Checks if the queue is empty.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.new()
  >  assert_true!(queue.is_empty())
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,346:::fn <a href="moonbitlang/core/queue#T">T</a>::iter[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
  >  Creates an iter from the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([5, 6, 7, 8])
  >  let sum = queue.iter().fold(fn(x, y) { x + y }, init=0)
  >  assert_eq!(sum, 26)
  >  ```
- #### length
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,98:::fn <a href="moonbitlang/core/queue#T">T</a>::length[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> Int
  ```
  > 
  >  Get the length of the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.new()
  >  assert_eq!(queue.length(), 0)
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,23:::fn <a href="moonbitlang/core/queue#T">T</a>::new[A]() -> <a href="moonbitlang/core/queue#T">T</a>[A]
  ```
  > 
  >  Creates a new empty queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.new()
  >  assert_eq!(queue.length(), 0)
  >  ```
- #### of
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,382:::fn <a href="moonbitlang/core/queue#T">T</a>::of[A](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/queue#T">T</a>[A]
  ```
  > 
  >  Creates a new queue from a FixedArray.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  assert_eq!(queue.length(), 4)
  >  ```
- #### output
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,51:::fn <a href="moonbitlang/core/queue#T">T</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/queue#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### peek
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,168:::fn <a href="moonbitlang/core/queue#T">T</a>::peek[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> A?
  ```
  > 
  >  Peeks at the first value in the queue, which returns None if the queue is empty.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  assert_eq!(queue.peek(), Some(1))
  >  ```
- #### peek\_exn
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,156:::fn <a href="moonbitlang/core/queue#T">T</a>::peek_exn[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> A
  ```
  > 
  >  @alert deprecated "Use `unsafe_peek` instead"
- #### pop
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,213:::fn <a href="moonbitlang/core/queue#T">T</a>::pop[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> A?
  ```
  > 
  >  Pops the first value from the queue, which returns None if the queue is empty.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  assert_eq!(queue.pop(), Some(1))
  >  ```
- #### pop\_exn
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,201:::fn <a href="moonbitlang/core/queue#T">T</a>::pop_exn[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> A
  ```
  > 
  >  @alert deprecated "Use `unsafe_pop` instead"
- #### push
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,122:::fn <a href="moonbitlang/core/queue#T">T</a>::push[A](self : <a href="moonbitlang/core/queue#T">T</a>[A], x : A) -> Unit
  ```
  > 
  >  Adds a value to the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.new()
  >  queue.push(1)
  >  ```
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/queue/traits.mbt,85:::fn <a href="moonbitlang/core/queue#T">T</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transfer
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,318:::fn <a href="moonbitlang/core/queue#T">T</a>::transfer[A](self : <a href="moonbitlang/core/queue#T">T</a>[A], dst : <a href="moonbitlang/core/queue#T">T</a>[A]) -> Unit
  ```
  > 
  >  Transfers all elements from one queue to another.
  > 
  >  Adds all of the elements of source to the end of destination, then clears source.
  > 
  >  #### Example
  >  ```
  >  let dst : @queue.T[Int] = @queue.new()
  >  let src : @queue.T[Int] = @queue.of([5, 6, 7, 8])
  >  src.transfer(dst)
  >  ```
- #### unsafe\_peek
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,147:::fn <a href="moonbitlang/core/queue#T">T</a>::unsafe_peek[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> A
  ```
  > 
  >  Peeks at the first value in the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  assert_eq!(queue.unsafe_peek(), 1)
  >  ```
  >  @alert unsafe "Panics if the queue is empty."
- #### unsafe\_pop
  ```moonbit
  :::source,moonbitlang/core/queue/queue.mbt,184:::fn <a href="moonbitlang/core/queue#T">T</a>::unsafe_pop[A](self : <a href="moonbitlang/core/queue#T">T</a>[A]) -> A
  ```
  > 
  >  Pops the first value from the queue.
  > 
  >  #### Example
  >  ```
  >  let queue : @queue.T[Int] = @queue.of([1, 2, 3, 4])
  >  assert_eq!(queue.unsafe_pop(), 1)
  >  ```
  >  @alert unsafe "Panics if the queue is empty."
