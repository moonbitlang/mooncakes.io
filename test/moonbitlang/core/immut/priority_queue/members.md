# Immutable Priority Queue

A priority queue is a data structure capable of maintaining maximum/minimum values at the front of the queue, which may have other names in other programming languages (C++ std::priority_queue / Rust BinaryHeap). The priority queue here is implemented as a pairing heap and has excellent performance.

# Usage

## Create

You can use `new()` or `of()` to create an immutable priority queue.

```moonbit
let queue1 : @immut/priority_queue.T[Int] = @immut/priority_queue.new()
let queue2 = @immut/priority_queue.of([1, 2, 3])
```

Note, however, that the default immutable priority queue created is greater-first; if you need to create a less-first queue, you can write a struct belongs to Compare trait to implement it.

## Length & Empty

You can use the `length` to get the length of the immutable priority queue.

```moonbit
let pq = @immut/priority_queue.new()
println(pq.length()) // 0
println(pq.push(1).length()) // 1
```

You can use the `is_empty` to determine whether the immutable priority queue is empty.

```moonbit
let pq = @immut/priority_queue.new()
println(pq.is_empty()) // true
```

## Peek & Push & Pop

You can use `peek()` to look at the head element of a queue, which must be either the maximum or minimum value of an element in the queue, depending on the nature of the specification. The return value of `peek()` is an Option, which means that the result will be `None` when the queue is empty.

```moonbit
let pq = @immut/priority_queue.of([1, 2, 3, 4, 5])
println(pq.peek()) // Some(5)
```

You can use `push()` to add elements to the immutable priority queue and get a new queue.

```moonbit
let pq : @immut/priority_queue.new()
println(pq.push(1).peek()) // Some(1)
```

You can use `pop()` to remove the element at the front of the priority queue and get a new immutable priority queue wrapped with Option. If the immutable priority queue is empty, then it will return None.

```moonbit
let pq = @immut/priority_queue.of([5, 4, 3, 2, 1])
match pq.pop(){
    Some(q) => q.peek()
    None => None
}// Some(5)
```

---
# Documentation
|Type|description|
|---|---|
|[T](#T)||
|[Cont](#Cont)||

## T

```moonbit
:::source,moonbitlang/core/immut/priority_queue/types.mbt,22:::type T
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,228:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/priority_queue#T">T</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[X]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,241:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/priority_queue#T">T</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,236:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/priority_queue#T">T</a> with op_equal[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], other : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> Bool
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,219:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/priority_queue#T">T</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,228:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[X]
  ```
  > 
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,35:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::from_array[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
  >  Creates a new immutable priority queue from an array.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4, 5])
  >  assert_eq!(queue.length(), 5)
  >  ```
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,85:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::from_iter[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/traits.mbt,40:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,241:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,186:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> Bool
  ```
  > 
  >  Checks if the immutable priority queue is empty.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.new()
  >  assert_eq!(queue.is_empty(), true)
  >  assert_eq!(queue.push(1).is_empty(), false)
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,71:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::iter[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,202:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::length[A](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> Int
  ```
  > 
  >  Return the length of the immutable priority queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.new()
  >  assert_eq!(queue.length(), 0)
  >  assert_eq!(queue.push(1).length(), 1)
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,23:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::new[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>]() -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
  >  Creates a new empty immutable priority queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.new()
  >  assert_eq!(queue.push(1).length(), 1)
  >  ```
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,207:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::of[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,236:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::op_equal[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], other : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,219:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### peek
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,170:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::peek[A](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> A?
  ```
  > 
  >  Peeks at the first value in the immutable priority queue, which returns None if the immutable priority queue is empty.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  assert_eq!(queue.peek(), Some(4))
  >  ```
- #### pop
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,120:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::pop[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]?
  ```
  > 
  >  Pops the first value from the immutable priority queue, which returns None if the queue is empty.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  let first = queue.pop()
  >  assert_eq!(first, Some(@priority_queue.of([1, 2, 3])))
  >  ```
- #### pop\_exn
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,146:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::pop_exn[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
  >  @alert deprecated "Use `unsafe_pop` instead"
- #### push
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,158:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::push[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A], value : A) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
  >  Adds a value to the immutable priority queue.
  >  
  >  #### Example
  >  ```
  >  let queue = @priority_queue.new()
  >  assert_eq!(queue.push(1).length(), 1)
  >  ```
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,47:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::to_array[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/traits.mbt,85:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### unsafe\_pop
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/priority_queue.mbt,137:::fn <a href="moonbitlang/core/immut/priority_queue#T">T</a>::unsafe_pop[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]) -> <a href="moonbitlang/core/immut/priority_queue#T">T</a>[A]
  ```
  > 
  >  Pops the first value from the immutable priority queue.
  >  
  >  Panics if the queue is empty.
  >  #### Example
  >  ```
  >  let queue = @priority_queue.of([1, 2, 3, 4])
  >  let first = queue.unsafe_pop()
  >  assert_eq!(first, @priority_queue.of([1, 2, 3]))
  >  ```

## Cont


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/immut/priority_queue/traits.mbt,85:::fn <a href="moonbitlang/core/immut/priority_queue#Cont">Cont</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
