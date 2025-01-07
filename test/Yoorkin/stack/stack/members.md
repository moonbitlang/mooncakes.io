# Documentation
|Type|description|
|---|---|
|[Stack](#Stack)| A stack of values of type \`T\`.|

## Stack

```moonbit
:::source,Yoorkin/stack/stack/stack.mbt,28:::type Stack
```
 A stack of values of type `T`.

 #### Usage

 ```
 fn init {
   // Create a new stack of integers
   let stack : Stack[Int] = Stack.make()
 
   // Push some values onto the stack
   stack.push(10)
   stack.push(20)
   stack.push(30)
 
   // Pop values from the stack
   let value1 = stack.pop()
   let value2 = stack.pop()
   let value3 = stack.pop()
 
   // Print the popped values
   print(value1) // Output: 30
   print(value2) // Output: 20
   print(value3) // Output: 10
 }
 ```


#### mooncakes-io-method-mark-Methods
- #### make
  ```moonbit
  :::source,Yoorkin/stack/stack/stack.mbt,68:::fn <a href="Yoorkin/stack/stack#Stack">Stack</a>::make[T]() -> <a href="Yoorkin/stack/stack#Stack">Stack</a>[T]
  ```
  >  Creates a new empty stack.
  > 
  >  #### Returns
  > 
  >  A new empty stack.
  > 
- #### pop
  ```moonbit
  :::source,Yoorkin/stack/stack/stack.mbt,52:::fn <a href="Yoorkin/stack/stack#Stack">Stack</a>::pop[T](self : <a href="Yoorkin/stack/stack#Stack">Stack</a>[T]) -> T
  ```
  >  Pops a value from the stack.
  > 
  >  #### Returns
  > 
  >  The value popped from the stack.
  > 
  >  #### Panics
  > 
  >  Panics if the stack is empty.
  > 
- #### push
  ```moonbit
  :::source,Yoorkin/stack/stack/stack.mbt,38:::fn <a href="Yoorkin/stack/stack#Stack">Stack</a>::push[T](self : <a href="Yoorkin/stack/stack#Stack">Stack</a>[T], val : T) -> Unit
  ```
  >  Pushes a value onto the stack.
  > 
  >  #### Arguments
  > 
  >  * `val` - The value to be pushed onto the stack.
  > 
