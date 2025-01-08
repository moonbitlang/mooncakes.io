# Stack

## Overview

Stack is a last in first out (LIFO) data structure, allowing to process their elements in the reverse order they come.

## Usage

### Create and Clear

The stack can be created with the `new` function, or by using the function with prefix `from` to create a stack from an existing collection.
For instance, `from_array` creates a stack from an array.

```moonbit
let st = Stack::new()
let st2 = Stack::from_array([1, 2, 3]) // Stack::[1, 2, 3]
let st3 = Stack::of([1, 2, 3]) // Stack::[1, 2, 3]
```

To clear the elements of the stack, use the `clear` method.

```moonbit
st.clear()
```

### Length

Use `length` to get the number of elements in the stack. The `is_empty` method can be used to check if the stack is empty.

```moonbit
let st = Stack::of([1, 2, 3])
st.length() // 3
st.is_empty() // false
```

### Pop and Push

To add elements to the stack, use the `push` method, and to remove them, use the `pop` method.

```moonbit
let st = Stack::new()
st.push(1)
st.push(2)
st.pop() // Some(2)
```

The unsafe version of `pop` is `pop_exn`, which will panic if the stack is empty.

```moonbit
let st = Stack::new()
st.push(1)
st.pop_exn() // 1
st.pop_exn() // panic
```

If you don't want to remove the element, you can use the `peek` method and the unsafe version `peek_exn`.

```moonbit
let st = Stack::of([1, 2, 3])
st.peek() // Some(1)
st.peek_exn() // 1
```

If the result of `pop` is not needed, you can use the `drop` method.

```moonbit
let st = Stack::of([1, 2, 3])
st.drop()
// st = [2, 3]
```

### Traverse

To traverse the stack, use the `iter` method.

```moonbit
let st = Stack::of([1, 2, 3])
let mut sum = 0
st.each(fn(x) { sum += x }) // sum = 6
```

### Conversion

You can convert the stack to an array using the `to_array` method.

```moonbit
let st = Stack::of([1, 2, 3])
st.to_array() // [1, 2, 3]
```

---
# Documentation
|Type|description|
|---|---|
|[Stack](#Stack)||

## Stack

```moonbit
:::source,moonbitlang/x/stack/types.mbt,16:::type Stack
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/stack/types.mbt,19:::impl[T : <a href="moonbitlang/core/builtin#Default">Default</a>] <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/stack/types.mbt,19:::fn default[T : <a href="moonbitlang/core/builtin#Default">Default</a>]() -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### clear
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,137:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::clear[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Unit
  ```
  >  Clear all elements in Stack
  >  
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  s.clear()
  >  println(s) // Stack::[]
  >  ```
- #### drop
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,324:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::drop[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Unit
  ```
  >  Drop the element at the top of the stack.
  > Like pop, but does not return elements and does nothing if the Stack is empty.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  s.drop()
  >  println(s) // Stack::[2, 3]
  >  ```
- #### drop\_result
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,350:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::drop_result[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, Unit]
  ```
  >  Drop the element at the top of the stack.
  > Like drop, but when the drop is successful, it returns `Ok(())`, and when it fails, it returns `Err(())`
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  let r = s.drop_result() // Ok(())
  >  ```
- #### each
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,451:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::each[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], f : (T) -> Unit) -> Unit
  ```
  >  Iterates over the elements of the stack from top to bottom.
  >  
  >  #### Example
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  s.each(fn(i) { println(i) })'
  >  ```
- #### equal
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,531:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], other : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Bool
  ```
  >  Compare two stacks.
  > 
  >  NOTE: Since the current standard library @immut/list.T lacks the equal or op\_equal function,
  > this function internally implements the equal function of @immut/list.T.
  > 
  >  #### Example
  > 
  >  ```
  >  println(Stack::of([2, 4, 6]).equal(Stack::of([2, 4, 6]))) // true
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,481:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::fold[T, U](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], init~ : U, f : (U, T) -> U) -> U
  ```
  >  Folds over the elements of the stack from top to bottom.
  >  
  >  #### Example
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  let sum = s.fold(~init=0, fn(acc, i) { acc + i })
  >  println(sum) // 6
  >  ```
- #### from\_array
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,58:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::from_array[T](array : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  >  Create a stack based on all elements in array.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::from_array([1, 2, 3])
  >  println(s) // Stack::from_array([3, 2, 1])
  >  ```
- #### from\_list
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,40:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::from_list[T](list : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  >  Create a stack based on all elements in list.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::from_list(@immut/list.of([1, 2, 3]))
  >  println(s) // Stack::[1, 2, 3]
  >  ```
- #### from\_stack
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,118:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::from_stack[T](other : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  >  Create a stack based on another stack.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  let s1 = Stack::from_stack(s)
  >  println(s1) // output: Stack::[3, 2, 1]
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,429:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::is_empty[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Bool
  ```
  >  If stack is empty, return true, otherwise return false.
  > 
  >  #### Example
  > 
  >  ```
  >  println(Stack::of([1, 2, 3]).is_empty()) // false
  >  println(Stack::new().is_empty()) // true
  >  ```
- #### length
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,440:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::length[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Int
  ```
  >  Returns the number of elements of the Stack
- #### new
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,23:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::new[T]() -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  >  Create an empty stack.
  > 
  >  #### Example
  > 
  >  ```
  >  let s : Stack[Int] = Stack::new()
  >  println(s) // Stack::[]
  >  ```
- #### of
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,76:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::of[T](array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  >  Create a stack based on all elements in array.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  println(s) // Stack::of([3, 2, 1])
  >  ```
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,540:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], other : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,99:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### peek
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,380:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::peek[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> T?
  ```
  >  Only the top element of the stack is returned and will not be pop or drop.
  > If there are elements in the stack, return `Some (the top element of the stack)`, otherwise return `None`.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::from_array([1, 2, 3])
  >  println(s.peek()) // Some(1)
  >  println(s) // Stack::[1, 2, 3]
  >  ```
- #### peek\_exn
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,407:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::peek_exn[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> T
  ```
  >  Only the top element of the stack is returned and will not be pop or drop.
  > If there are elements in the stack, return the top element of the stack, otherwise abort.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::from_array([1, 2, 3])
  >  let s1 : Stack[Int] = Stack::new()
  >  println(s1.peek_exn()) // abort
  >  println(s.peek_exn()) // 1
  >  println(s) // Stack::[1, 2, 3]
  >  ```
  >  @alert unsafe "Panic if the stack is empty."
- #### pop
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,261:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::pop[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> T?
  ```
  >  Pop an element from the top of the stack.
  > If there are elements in the stack, return `Some (the top element of the stack)`, otherwise return `None`.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  let s1 : Stack[Int] = Stack::new()
  >  println(s.pop()) // Some(1)
  >  println(s) // Stack::[2, 3]
  >  println(s1.pop()) // None
  >  ```
- #### push
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,175:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::push[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], x : T) -> Unit
  ```
  >  Push an element into the stack.
  >  
  >  #### Example
  > 
  >  ```
  >  let s = Stack::new()
  >  s.push(1)
  >  println(s) // Stack::[1]
  >  ```
- #### push\_array
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,238:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::push_array[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], array : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  >  Push an array into the stack.
  >  
  >  #### Example
  > 
  >  ```
  >  let s : Stack[Int] = Stack::new()
  >  s.push_array([1, 2, 3])
  >  println(s) // Stack::[3, 2, 1]
  >  ```
- #### push\_list
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,196:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::push_list[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], list : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> Unit
  ```
  >  Push a list into the stack.
  >  
  >  #### Example
  > 
  >  ```
  >  let s = Stack::new()
  >  s.push_list(@immut/list.of[1, 2, 3])
  >  println(s) // Stack::[3, 2, 1]
  >  ```
- #### push\_stack
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,217:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::push_stack[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T], stack : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> Unit
  ```
  >  Push other stack into the current stack.
  >  
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  let s1 : Stack[Int] = Stack::new()
  >  s1.push_stack(s)
  >  println(s1) // Stack::[1, 2, 3]
  >  ```
- #### return\_with\_clear
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,156:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::return_with_clear[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> <a href="moonbitlang/x/stack#Stack">Stack</a>[T]
  ```
  >  Same as the `clear()`, but returns an cleared stack
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3]).return_with_clear()
  >  println(s) // Stack::[]
  >  ```
- #### to\_array
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,513:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::to_array[T : <a href="moonbitlang/core/builtin#Default">Default</a>](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  >  Convert stack to array.
  > 
  >  #### Example
  > 
  >  ```
  >  println(Stack::of([1, 2, 3]).to_array()) // [1, 2, 3]
  >  ```
- #### to\_list
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,498:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::to_list[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]
  ```
  >  Convert stack to list.
  > 
  >  #### Example
  > 
  >  ```
  >  println(Stack::of([1, 2, 3]).to_list()) // @immut/list.of([1, 2, 3])
  >  ```
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,87:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> String
  ```
  > 
- #### unsafe\_pop
  ```moonbit
  :::source,moonbitlang/x/stack/stack.mbt,296:::fn <a href="moonbitlang/x/stack#Stack">Stack</a>::unsafe_pop[T](self : <a href="moonbitlang/x/stack#Stack">Stack</a>[T]) -> T
  ```
  >  Pop an element from the top of the stack.
  > If there are elements in the stack, return the top element of the stack, otherwise abort.
  > 
  >  #### Example
  > 
  >  ```
  >  let s = Stack::of([1, 2, 3])
  >  let s1 : Stack[Int] = Stack::new()
  >  println(s.unsafe_pop()) // 1
  >  println(s) // Stack::[2, 3]
  >  println(s1.unsafe_pop()) // abort.
  >  ```
  >  @alert unsafe "Panic if the stack is empty."
