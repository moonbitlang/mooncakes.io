# Priority Queue

A priority queue is a data structure capable of maintaining maximum/minimum values at front of the queue, which may have other names in other programming languages (C++ std::priority_queue / Rust BinaryHeap ). The priority queue here is implemented as a pairing heap and has excellent performance.

# Usage

## Create

You can use `new()` or `of()` to create a priority queue.

```moonbit
let queue1 : @priority_queue.T[Int] = @priority_queue.new()
let queue2 = @priority_queue.of([1, 2, 3])
```

Note, however, that the default priority queue created is greater-first; if you need to create a less-first queue, you can write a struct belongs to Compare trait to implement it.

## Length

You can use `length()` to get the number of elements in the current priority queue.

```moonbit
let pq = @priority_queue.of([1, 2, 3, 4, 5])
println(pq.length()) // 5
```

Similarly, you can use the `is_empty` to determine whether the priority queue is empty.

```moonbit
let pq = @priority_queue.PrioriryQueue::new()
println(pq.is_empty()) // true
```

## Peek

You can use `peek()` to look at the head element of a queue, which must be either the maximum or minimum value of an element in the queue, depending on the nature of the specification. The return value of `peek()` is an Option, which means that the result will be `None` when the queue is empty.

```moonbit
let pq = @priority_queue.of([1, 2, 3, 4, 5])
println(pq.peek()) // Some(5)
```

## Push

You can use `push()` to add elements to the priority queue.

```moonbit
let pq : @priority_queue.T[Int] = @priority_queue.new()
println(pq.push(1))
println(pq.push(2))
println(pq.peek()) // Some(2)
```

## Pop

You can use `pop()` to pop the element at the front of the priority queue, respectively, and like [Peek](#Peek), its return values are `Option`, loaded with the value of the element being popped.

```moonbit
let pq = @priority_queue.of([5, 4, 3, 2, 1])
println(pq.pop()) // Some(5)
```

```moonbit
let pq = @priority_queue.of([5, 4, 3, 2, 1])
println(pq.length()) // 4
```

## Clear

You can use `clear` to clear a priority queue.

```moonbit
let pq = @priority_queue.of([1, 2, 3, 4, 5])
println(pq.clear())
println(pq.is_empty()) // true
```

## Copy and Transfer

You can copy a priority queue using the `copy` method.

```moonbit
let pq = @priority_queue.of([1, 2, 3])
let pq2 = pq.copy()
```
---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

## T

```moonbit
:::source,moonbitlang/core/priority_queue/types.mbt,22:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,280:::impl[A : <a href="moonbitlang/core/builtin#Show">Show</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/priority_queue#T">T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/priority_queue/priority_queue.mbt,280:::fn output[A : <a href="moonbitlang/core/builtin#Show">Show</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,285:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/priority_queue#T">T</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/priority_queue/priority_queue.mbt,285:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/priority_queue#T">T</a>[X]
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### clear
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,239:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::clear[A](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> Unit
  ```
  > 
  >  Clears the queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  queue.clear()
  >  assert_eq!(queue.length(), 0)
  >  ```
- #### copy
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,69:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::copy[A](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/priority_queue#T">T</a>[A]
  ```
  > 
  >  Return a copy of the queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  let queue2 = @priority_queue.copy(queue)
  >  assert_eq!(queue2.length(), 4)
  >  ```
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,35:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::from_array[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/priority_queue#T">T</a>[A]
  ```
  > 
  >  Creates a new priority queue from an array.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4, 5])
  >  assert_eq!(queue.length(), 5)
  >  ```
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,108:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::from_iter[K : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[K]) -> <a href="moonbitlang/core/priority_queue#T">T</a>[K]
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,252:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> Bool
  ```
  > 
  >  Checks if the priority queue is empty.
  >  
  >  #### Example
  >  ```
  >  let queue : @priority_queue.T[Int] = @priority_queue.new()
  >  assert_eq!(queue.is_empty(), true)
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,94:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::iter[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,149:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::length[A](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,23:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::new[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>]() -> <a href="moonbitlang/core/priority_queue#T">T</a>[A]
  ```
  > 
  >  Creates a new empty priority queue.
  >  
  >  #### Example
  >  ```
  >  let queue : @priority_queue.T[Int] = @priority_queue.new()
  >  assert_eq!(queue.length(), 0)
  >  ```
- #### of
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,257:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::of[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/priority_queue#T">T</a>[A]
  ```
  > 
- #### peek
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,223:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::peek[A](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> A?
  ```
  > 
  >  Peeks at the first value in the priority queue, which returns None if the priority queue is empty.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  let first = queue.peek() // Some(4)
  >  assert_eq!(first, Some(4))
  >  ```
- #### pop
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,188:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::pop[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> A?
  ```
  > 
  >  Pops the first value from the priority queue, which returns None if the queue is empty.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  let first = queue.pop() // Some(4)
  >  assert_eq!(first, Some(4))
  >  assert_eq!(queue.length(), 3)
  >  ```
- #### pop\_exn
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,174:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::pop_exn[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> Unit
  ```
  > 
  >  @alert deprecated "Use `unsafe_pop` instead"
  > @coverage.skip
- #### push
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,209:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::push[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A], value : A) -> Unit
  ```
  > 
  >  Adds a value to the priority queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.new()
  >  queue.push(1)
  >  assert_eq!(queue.length(), 1)
  >  ```
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,75:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::to_array[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
- #### unsafe\_pop
  ```moonbit
  :::source,moonbitlang/core/priority_queue/priority_queue.mbt,163:::fn <a href="moonbitlang/core/priority_queue#T">T</a>::unsafe_pop[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/priority_queue#T">T</a>[A]) -> Unit
  ```
  > 
  >  Pops the first value from the priority queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  queue.unsafe_pop()
  >  assert_eq!(queue.length(), 3)
  >  ```
  >  @alert unsafe "Panic if the queue is empty."
