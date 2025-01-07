# Immutable List

List is implemented as a **linked list**, supporting O(1) head access.
- Moonbit list is **homogeneous** list, which means all elements in the list must be of the same type.
- Moonbit list does not support random access well, you can only access elements by iterating through the list. If you need randomly access the nth element, you should use `Array` instead.

# Usage

## Building lists 

You can create a list manually via the `new()` or construct it using the `of()` method: 
```moonbit
let list0 : @immut/list.T[Int] = @immut/list.new()
let list1 = @immut/list.of([1, 2, 3, 4, 5])
```

Or use `Cons` constructor directly (Adds a single element to the beginning of a list):
```moonbit
let list = @immut/list.Cons(1, Cons(2, Cons(3, Nil)))
```

Build a repeated list by using the `repeat()` method:
```moonbit
println(@immut/list.repeat(3, 1)) // of([1, 1, 1])
```

## Pattern matching
You can use pattern matching to destructure a list:
```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
match list {
    Cons(head, tail) => println(head)
    Nil => println("Empty list")
}
```

## Iterating over a list
The standard library provides a lot of tools for iterating over a list, such as `each()`, `eachi()`, etc. (For details check the API documentation)
```moonbit
let list = @immut.list.of([1, 2, 3, 4, 5])
let list1 = list.each(fn (ele) { println(ele) }) 
```

## Appending / Joining lists
To simply concatenate two lists, you can use the `concat()` method (or `+` operator):
```moonbit
let list1 = @immut/list.of([1, 2, 3])
let list2 = @immut/list.of([4, 5, 6])
let list3 = list1.concat(list2) // of([1, 2, 3, 4, 5, 6])
let list4 = list1 + list2 // of([1, 2, 3, 4, 5, 6])
```

For concatenating multiple lists (especially the length is unknown), you can use the `flatten()` method:
```moonbit
let ls1 = @immut/list.of([1, 2, 3])
let ls2 = @immut/list.of([4, 5, 6])
let ls3 = @immut/list.of([7, 8, 9])
let ls4 = @immut/list.of([ls1, ls2, ls3])
println(ls4.flatten()) // of([1, 2, 3, 4, 5, 6, 7, 8, 9])
```

To insert separate elements into a list, you can use the `intersperse()` method:

```moonbit
let list = @immut/list.of([1, 2, 3])
println(list.intersperse(0)) // of([1, 0, 2, 0, 3])
```

## Filtering / Rejecting / Selecting elements
There are three ways to filter / reject / select multiple elements from a list:
- Go through the entire list and decide whether the element should be present in the resultant list or not. Use `filter` for this.
- To extract the first (or last) N elements of a list (and N is independent of the contents of the list). Use `take` or `drop` in this case.
- To stop selecting elements (terminate the iteration) as soon as a condition is met, using `take_while` or `drop_while`

```moonbit
let ls = @immut/list.of([1, 2, 3, 4, 5])
ls.filter(fn (ele) { ele % 2 == 0 }) // of([2, 4])
ls.take(2) // of([1, 2])
ls.drop(2) // of([3, 4, 5])
ls.take_while(fn (ele) { ele < 3 }) // of([1, 2])
ls.drop_while(fn (ele) { ele < 3 }) // of([3, 4, 5])
```

## Accessing elements / sub-lists
You can access the head of the list using the `head()` (O(1)) method. It returns `Some(head)` or `None` if the list is empty.
And access the last element using the `last()` method (O(n)). 

```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
println(list.head()) // Some(1)
println(list.last()) // 5
```

For randomly accessing, you can use the `nth()` method, which returns the nth element in the list (O(n)). 
If the index is out of bounds, it returns `None`.
```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
list.nth(2) // Some(3)
list.nth(8) // None
```

To get a sub-list from the list, you can use the `init_()` method for getting all elements except the last one, and `tail()` for getting all elements except the first one.
```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
list.init_() // of([1, 2, 3, 4])
list.tail() // of([2, 3, 4, 5])
```

## Reducing Lists
You can reduce (fold) a list to a single value using the `fold()` method.
```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
list.fold(init=0, fn(acc, x) { acc + x }) // 15
```

There are some special folds that you can use like `any`, `all`, `sum`, `maximum`, and `minimum`. Check the API documentation below for more details.

## List transformations
To transform list elements, you can use the `map()` method.
```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
list.map(fn (ele) { ele * 2 }) // of([2, 4, 6, 8, 10])
```

The `rev` method reverses the list.
```moonbit
let list = @immut/list.of([1, 2, 3, 4, 5])
list.rev() // of([5, 4, 3, 2, 1])
```
---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

|Value|description|
|---|---|
|[repeat](#repeat)||
|[singleton](#singleton)||
|[unfold](#unfold)||
|[unzip](#unzip)||

## T

```moonbit
:::source,moonbitlang/core/immut/list/types.mbt,16:::pub(all) enum T {
  Nil
  Cons(A, <a href="moonbitlang/core/immut/list#T">T</a>[A])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1116:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/immut/list#T">T</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/list#T">T</a>[X]
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,45:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="moonbitlang/core/immut/list#T">T</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1129:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/immut/list#T">T</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/list/types.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/immut/list#T">T</a> with op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="moonbitlang/core/immut/list#T">T</a>[A], <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/immut/list#T">T</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](xs : <a href="moonbitlang/core/immut/list#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,31:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/immut/list#T">T</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,16:::fn <a href="moonbitlang/core/immut/list#T">T</a>::add[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], head : A) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
- #### all
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,218:::fn <a href="moonbitlang/core/immut/list#T">T</a>::all[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> Bool) -> Bool
  ```
  > 
  >  Test if all elements of the list satisfy the predicate.
- #### any
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,227:::fn <a href="moonbitlang/core/immut/list#T">T</a>::any[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> Bool) -> Bool
  ```
  > 
  >  Test if any element of the list satisfies the predicate.
- #### arbitrary
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1116:::fn <a href="moonbitlang/core/immut/list#T">T</a>::arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/immut/list#T">T</a>[X]
  ```
  > 
- #### concat
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,331:::fn <a href="moonbitlang/core/immut/list#T">T</a>::concat[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], other : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Concatenate two lists.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5]).concat(@list.of([6, 7, 8, 9, 10]))
  >  assert_eq!(ls, @list.of([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
  >  ```
- #### concat\_map
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,516:::fn <a href="moonbitlang/core/immut/list#T">T</a>::concat_map[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  map over the list and concat all results.
  > 
  >  `concat_map(f, ls)` equal to `ls.map(f).fold(Nil, fn(acc, x) { acc.concat(x) })))`
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.from_array([1, 2, 3])
  >  let r = ls.flat_map(fn(x) { @list.from_array([x, x * 2]) })
  >  assert_eq!(r, @list.from_array([1, 2, 2, 4, 3, 6]))
  >  ```
  >  @alert deprecated "Use `flat_map` instead"
- #### contains
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,758:::fn <a href="moonbitlang/core/immut/list#T">T</a>::contains[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], value : A) -> Bool
  ```
  > 
  >  Check if the list contains the value.
- #### default
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1067:::fn <a href="moonbitlang/core/immut/list#T">T</a>::default[X]() -> <a href="moonbitlang/core/immut/list#T">T</a>[X]
  ```
  > 
  >  The empty list
- #### drop
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,817:::fn <a href="moonbitlang/core/immut/list#T">T</a>::drop[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], n : Int) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Drop first n elements of the list.
  > If the list is shorter than n, return an empty list.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5])
  >  let r = ls.drop(3)
  >  assert_eq!(r, @list.of([4, 5]))
  >  ```
- #### drop\_while
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,858:::fn <a href="moonbitlang/core/immut/list#T">T</a>::drop_while[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], p : (A) -> Bool) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Drop the longest prefix of a list of elements that satisfies a given predicate.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.from_array([1, 2, 3, 4])
  >  let r = ls.drop_while(fn(x) { x < 3 })
  >  assert_eq!(r, @list.of([3, 4]))
  >  ```
- #### each
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,103:::fn <a href="moonbitlang/core/immut/list#T">T</a>::each[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the list.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = []
  >  @list.of([1, 2, 3, 4, 5]).each(fn(x) { arr.push(x) })
  >  assert_eq!(arr, [1, 2, 3, 4, 5])
  >  ```
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,123:::fn <a href="moonbitlang/core/immut/list#T">T</a>::eachi[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (Int, A) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the list with index.
  > 
  >  #### Example
  > 
  >  ```
  >  let arr = []
  >  @list.of([1, 2, 3, 4, 5]).eachi(fn(i, x) { arr.push("(\{i},\{x})") })
  >  assert_eq!(arr, ["(0,1)", "(1,2)", "(2,3)", "(3,4)", "(4,5)"])
  >  ```
- #### equal
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1028:::fn <a href="moonbitlang/core/immut/list#T">T</a>::equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], other : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Bool
  ```
  > 
  >  Compares two lists for equality.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3]).equal(@list.of([1, 2, 3])), true)
  >  ```
- #### filter
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,204:::fn <a href="moonbitlang/core/immut/list#T">T</a>::filter[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> Bool) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Filter the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).filter(fn(x){ x % 2 == 0}), @list.of([2, 4]))
  >  ```
- #### filter\_map
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,549:::fn <a href="moonbitlang/core/immut/list#T">T</a>::filter_map[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> B?) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  Map over the list and keep all `value`s for which the mapped result is `Some(value)`.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([4, 2, 2, 6, 3, 1])
  >  let r = ls.filter_map(fn(x) { if (x >= 3) { Some(x) } else { None } })
  >  assert_eq!(r, @list.of([4, 6, 3]))
  >  ```
- #### find
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,931:::fn <a href="moonbitlang/core/immut/list#T">T</a>::find[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> Bool) -> A?
  ```
  > 
  >  Find the first element in the list that satisfies f.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 3, 5, 8]).find(fn(element) -> Bool { element % 2 == 0}), Some(8))
  >  assert_eq!(@list.of([1, 3, 5]).find(fn(element) -> Bool { element % 2 == 0}), None)
  >  ```
- #### findi
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,952:::fn <a href="moonbitlang/core/immut/list#T">T</a>::findi[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A, Int) -> Bool) -> A?
  ```
  > 
  >  Find the first element in the list that satisfies f and passes the index as an argument.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 3, 5, 8]).findi(fn(element, index) -> Bool { (element % 2 == 0) && (index == 3) }), Some(8))
  >  assert_eq!(@list.of([1, 3, 8, 5]).findi(fn(element, index) -> Bool { (element % 2 == 0) && (index == 3) }), None)
  >  ```
- #### flat\_map
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,532:::fn <a href="moonbitlang/core/immut/list#T">T</a>::flat_map[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  map over the list and concat all results.
  > 
  >  `flat_map(f, ls)` equal to `ls.map(f).fold(Nil, fn(acc, x) { acc.concat(x) })))`
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.from_array([1, 2, 3])
  >  let r = ls.flat_map(fn(x) { @list.from_array([x, x * 2]) })
  >  assert_eq!(r, @list.from_array([1, 2, 2, 4, 3, 6]))
  >  ```
- #### flatten
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,658:::fn <a href="moonbitlang/core/immut/list#T">T</a>::flatten[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[<a href="moonbitlang/core/immut/list#T">T</a>[A]]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  flatten a list of lists.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.flatten(@list.from_array([@list.from_array([1,2,3]), @list.from_array([4,5,6]), @list.from_array([7,8,9])]))
  >  assert_eq!(ls, @list.from_array([1, 2, 3, 4, 5, 6, 7, 8, 9]))
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,375:::fn <a href="moonbitlang/core/immut/list#T">T</a>::fold[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold the list from left.
  > 
  >  #### Example
  > 
  >  ```
  >  let r = @list.of([1, 2, 3, 4, 5]).fold(init=0, fn(acc, x) { acc + x })
  >  assert_eq!(r, 15)
  >  ```
- #### fold\_left
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,407:::fn <a href="moonbitlang/core/immut/list#T">T</a>::fold_left[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (B, A) -> B, init~ : B) -> B
  ```
  > 
  >  Fold the list from left.
  > 
  >  #### Example
  > 
  >  ```
  >  let r = @list.of([1, 2, 3, 4, 5]).fold(init=0, fn(acc, x) { acc + x })
  >  assert_eq!(r, 15)
  >  ```
  >  @alert deprecated "Use `fold` instead"
- #### fold\_lefti
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,456:::fn <a href="moonbitlang/core/immut/list#T">T</a>::fold_lefti[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (Int, B, A) -> B, init~ : B) -> B
  ```
  > 
  >  Fold the list from left with index.
  > @alert deprecated "Use `foldi` instead"
- #### fold\_right
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,420:::fn <a href="moonbitlang/core/immut/list#T">T</a>::fold_right[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A, B) -> B, init~ : B) -> B
  ```
  > 
  >  Fold the list from right.
  > 
  >  #### Example
  >  ```
  >  let r = @list.of([1, 2, 3, 4, 5]).rev_fold(fn(x, acc) { x + acc }, init=0)
  >  assert_eq!(r, 15)
  >  ```
  >  @alert deprecated "Use `rev_fold` instead"
- #### fold\_righti
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,470:::fn <a href="moonbitlang/core/immut/list#T">T</a>::fold_righti[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (Int, A, B) -> B, init~ : B) -> B
  ```
  > 
  >  Fold the list from right with index.
  > @alert deprecated "Use `rev_foldi` instead"
- #### foldi
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,429:::fn <a href="moonbitlang/core/immut/list#T">T</a>::foldi[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold the list from left with index.
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,76:::fn <a href="moonbitlang/core/immut/list#T">T</a>::from_array[A](arr : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Convert array to list.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5])
  >  assert_eq!(ls, @list.from_array([1, 2, 3, 4, 5]))
  >  ```
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1102:::fn <a href="moonbitlang/core/immut/list#T">T</a>::from_iter[A](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,61:::fn <a href="moonbitlang/core/immut/list#T">T</a>::from_json[A : <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/immut/list/traits.mbt,40:::fn <a href="moonbitlang/core/immut/list#T">T</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1129:::fn <a href="moonbitlang/core/immut/list#T">T</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### head
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,273:::fn <a href="moonbitlang/core/immut/list#T">T</a>::head[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A?
  ```
  > 
  >  Get first element of the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).head(), Some(1))
  >  ```
- #### head\_exn
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,261:::fn <a href="moonbitlang/core/immut/list#T">T</a>::head_exn[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A
  ```
  > 
  >  @alert deprecated "Use `unsafe_head` instead"
- #### init\_
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,314:::fn <a href="moonbitlang/core/immut/list#T">T</a>::init_[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Init of the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).init_(), @list.of([1, 2, 3, 4]))
  >  ```
- #### intercalate
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1061:::fn <a href="moonbitlang/core/immut/list#T">T</a>::intercalate[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[<a href="moonbitlang/core/immut/list#T">T</a>[A]], sep : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Similar to intersperse but with a list of values.
  > 
  >  #### Example
  >  ```
  >  let ls = @list.of([
  >     @list.of([1, 2, 3]),
  >     @list.of([4, 5, 6]),
  >     @list.of([7, 8, 9]),
  >  ])
  >  let r = ls.intercalate(@list.of([0]))
  >  assert_eq!(r, @list.of([1, 2, 3, 0, 4, 5, 6, 0, 7, 8, 9]))
  >  ```
- #### intersperse
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,611:::fn <a href="moonbitlang/core/immut/list#T">T</a>::intersperse[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], separator : A) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Insert separator to the list.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.intersperse(@list.from_array(["1", "2", "3", "4", "5"]), "|")
  >  assert_eq!(ls, @list.from_array(["1", "|", "2", "|", "3", "|", "4", "|", "5"]))
  >  ```
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,622:::fn <a href="moonbitlang/core/immut/list#T">T</a>::is_empty[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Bool
  ```
  > 
  >  Check if the list is empty.
- #### is\_prefix
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1012:::fn <a href="moonbitlang/core/immut/list#T">T</a>::is_prefix[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], prefix : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Bool
  ```
  > 
  >  Returns true if list starts with prefix.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).is_prefix(@list.of([1, 2, 3])), true)
  >  ```
- #### is\_suffix
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1044:::fn <a href="moonbitlang/core/immut/list#T">T</a>::is_suffix[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], suffix : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Bool
  ```
  > 
  >  Returns true if list ends with suffix.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).is_suffix(@list.of([3, 4, 5])), true)
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1072:::fn <a href="moonbitlang/core/immut/list#T">T</a>::iter[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1087:::fn <a href="moonbitlang/core/immut/list#T">T</a>::iter2[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, A]
  ```
  > 
- #### last
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,298:::fn <a href="moonbitlang/core/immut/list#T">T</a>::last[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A?
  ```
  > 
  >  Last element of the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).last(), Some(5))
  >  ```
- #### length
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,86:::fn <a href="moonbitlang/core/immut/list#T">T</a>::length[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Int
  ```
  > 
  >  Get the length of the list.
- #### lookup
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,915:::fn <a href="moonbitlang/core/immut/list#T">T</a>::lookup[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[(A, B)], v : A) -> B?
  ```
  > 
  >  Looks up a key in an association list.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.from_array([(1, "a"), (2, "b"), (3, "c")])
  >  assert_eq!(ls.lookup(3), Some("c"))
  >  ```
- #### map
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,141:::fn <a href="moonbitlang/core/immut/list#T">T</a>::map[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> B) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  Maps the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).map(fn(x){ x * 2}), @list.of([2, 4, 6, 8, 10]))
  >  ```
- #### mapi
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,150:::fn <a href="moonbitlang/core/immut/list#T">T</a>::mapi[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (Int, A) -> B) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  Maps the list with index.
- #### maximum
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,685:::fn <a href="moonbitlang/core/immut/list#T">T</a>::maximum[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A?
  ```
  > 
  >  Get maximum element of the list.
  > Returns None if the list is empty.
- #### minimum
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,716:::fn <a href="moonbitlang/core/immut/list#T">T</a>::minimum[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A?
  ```
  > 
  >  Get minimum element of the list.
- #### nth
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,578:::fn <a href="moonbitlang/core/immut/list#T">T</a>::nth[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], n : Int) -> A?
  ```
  > 
  >  Get nth element of the list or None if the index is out of bounds
- #### nth\_exn
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,572:::fn <a href="moonbitlang/core/immut/list#T">T</a>::nth_exn[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], n : Int) -> A
  ```
  > 
  >  @alert deprecated "Use `unsafe_nth` instead"
- #### of
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,1107:::fn <a href="moonbitlang/core/immut/list#T">T</a>::of[A](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,752:::fn <a href="moonbitlang/core/immut/list#T">T</a>::op_add[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], other : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Concatenate two lists.
  > 
  >  `a + b` equal to `a.concat(b)`
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/immut/list/types.mbt,19:::fn <a href="moonbitlang/core/immut/list#T">T</a>::op_equal[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="moonbitlang/core/immut/list#T">T</a>[A], <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,21:::fn <a href="moonbitlang/core/immut/list#T">T</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>](xs : <a href="moonbitlang/core/immut/list#T">T</a>[A], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,992:::fn <a href="moonbitlang/core/immut/list#T">T</a>::remove[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], elem : A) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Removes the first occurrence of the specified element from the list, if it is present.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).remove(3), @list.of([1, 2, 4, 5]))
  >  ```
- #### remove\_at
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,975:::fn <a href="moonbitlang/core/immut/list#T">T</a>::remove_at[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], index : Int) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Removes the element at the specified index in the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).remove_at(2), @list.of([1, 2, 4, 5]))
  >  ```
- #### rev
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,362:::fn <a href="moonbitlang/core/immut/list#T">T</a>::rev[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Reverse the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).rev(), @list.of([5, 4, 3, 2, 1]))
  >  ```
- #### rev\_concat
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,347:::fn <a href="moonbitlang/core/immut/list#T">T</a>::rev_concat[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], other : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Reverse the first list and concatenate it with the second.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5]).rev_concat(@list.of([6, 7, 8, 9, 10]))
  >  assert_eq!(ls, @list.of([5, 4, 3, 2, 1, 6, 7, 8, 9, 10]))
  >  ```
- #### rev\_fold
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,390:::fn <a href="moonbitlang/core/immut/list#T">T</a>::rev_fold[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], init~ : B, f : (A, B) -> B) -> B
  ```
  > 
  >  Fold the list from right.
  > 
  >  #### Example
  >  ```
  >  let r = @list.of([1, 2, 3, 4, 5]).rev_fold(fn(x, acc) { x + acc }, init=0)
  >  assert_eq!(r, 15)
  >  ```
- #### rev\_foldi
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,442:::fn <a href="moonbitlang/core/immut/list#T">T</a>::rev_foldi[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], init~ : B, f : (Int, A, B) -> B) -> B
  ```
  > 
  >  Fold the list from right with index.
- #### rev\_map
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,170:::fn <a href="moonbitlang/core/immut/list#T">T</a>::rev_map[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A) -> B) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  Maps the list and reverses the result.
  > 
  >  `list.rev_map(f)` is equivalent to `list.map(f).rev()` but more efficient.
  > 
  >  #### Example
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).rev_map(fn(x) { x * 2 }), @list.of([10, 8, 6, 4, 2]))
  >  ```
- #### scan\_left
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,875:::fn <a href="moonbitlang/core/immut/list#T">T</a>::scan_left[A, E](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (E, A) -> E, init~ : E) -> <a href="moonbitlang/core/immut/list#T">T</a>[E]
  ```
  > 
  >  Fold a list and return a list of successive reduced values from the left
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5])
  >  let r = ls.scan_left(fn(acc, x) { acc + x }, init=0)
  >  assert_eq!(r, @list.of([0, 1, 3, 6, 10, 15]))
  >  ```
- #### scan\_right
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,896:::fn <a href="moonbitlang/core/immut/list#T">T</a>::scan_right[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], f : (A, B) -> B, init~ : B) -> <a href="moonbitlang/core/immut/list#T">T</a>[B]
  ```
  > 
  >  Fold a list and return a list of successive reduced values from the right
  > 
  >  Note that the order of parameters on the accumulating function are reversed.
  > 
  >  #### Example
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5])
  >  let r = ls.scan_right(fn(x, acc) { acc + x }, init=0)
  >  assert_eq!(r, @list.of([15, 14, 12, 9, 5, 0]))
  >  ```
- #### sort
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,737:::fn <a href="moonbitlang/core/immut/list#T">T</a>::sort[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Sort the list in ascending order.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.sort(@list.from_array([1,123,52,3,6,0,-6,-76]))
  >  assert_eq!(ls, @list.from_array([-76, -6, 0, 1, 3, 6, 52, 123]))
  >  ```
- #### tail
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,242:::fn <a href="moonbitlang/core/immut/list#T">T</a>::tail[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Tail of the list.
  > 
  >  #### Example
  > 
  >  ```
  >  assert_eq!(@list.of([1, 2, 3, 4, 5]).tail(), @list.of([2, 3, 4, 5]))
  >  ```
- #### take
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,792:::fn <a href="moonbitlang/core/immut/list#T">T</a>::take[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], n : Int) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Take first n elements of the list.
  > If the list is shorter than n, return the whole list.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.of([1, 2, 3, 4, 5])
  >  let r = ls.take(3)
  >  assert_eq!(r, @list.of([1, 2, 3]))
  >  ```
- #### take\_while
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,841:::fn <a href="moonbitlang/core/immut/list#T">T</a>::take_while[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], p : (A) -> Bool) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
  ```
  > 
  >  Take the longest prefix of a list of elements that satisfies a given predicate.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @list.from_array([1, 2, 3, 4])
  >  let r = ls.take_while(fn(x) { x < 3 })
  >  assert_eq!(r, @list.of([1, 2]))
  >  ```
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,179:::fn <a href="moonbitlang/core/immut/list#T">T</a>::to_array[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
  >  Convert list to array.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,40:::fn <a href="moonbitlang/core/immut/list#T">T</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,26:::fn <a href="moonbitlang/core/immut/list#T">T</a>::to_string[A : <a href="moonbitlang/core/builtin#Show">Show</a>](xs : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> String
  ```
  > 
- #### unsafe\_head
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,252:::fn <a href="moonbitlang/core/immut/list#T">T</a>::unsafe_head[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A
  ```
  > 
  >  Get first element of the list.
  > @alert unsafe "Panic if the list is empty"
- #### unsafe\_last
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,282:::fn <a href="moonbitlang/core/immut/list#T">T</a>::unsafe_last[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A
  ```
  > 
  >  @alert unsafe "Panic if the list is empty"
- #### unsafe\_maximum
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,667:::fn <a href="moonbitlang/core/immut/list#T">T</a>::unsafe_maximum[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A
  ```
  > 
  >  @alert unsafe "Panic if the list is empty"
- #### unsafe\_minimum
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,699:::fn <a href="moonbitlang/core/immut/list#T">T</a>::unsafe_minimum[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/immut/list#T">T</a>[A]) -> A
  ```
  > 
  >  @alert unsafe "Panic if the list is empty"
- #### unsafe\_nth
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,562:::fn <a href="moonbitlang/core/immut/list#T">T</a>::unsafe_nth[A](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], n : Int) -> A
  ```
  > 
  >  @alert unsafe "Panic if the index is out of bounds"
- #### zip
  ```moonbit
  :::source,moonbitlang/core/immut/list/list.mbt,491:::fn <a href="moonbitlang/core/immut/list#T">T</a>::zip[A, B](self : <a href="moonbitlang/core/immut/list#T">T</a>[A], other : <a href="moonbitlang/core/immut/list#T">T</a>[B]) -> <a href="moonbitlang/core/immut/list#T">T</a>[(A, B)]?
  ```
  > 
  >  Zip two lists.
  > If the lists have different lengths, it will return None.
  > 
  >  #### Example
  > 
  >  ```
  >  let r = @list.zip(@list.of([1, 2, 3, 4, 5]), @list.of([6, 7, 8, 9, 10]))
  >  assert_eq!(r, Some(@list.from_array([(1, 6), (2, 7), (3, 8), (4, 9), (5, 10)])))
  >  ```

## repeat

```moonbit
:::source,moonbitlang/core/immut/list/list.mbt,594:::fn repeat[A](n : Int, x : A) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
```

 Create a list of length n with the given value

 #### Example

 ```
 assert_eq!(@list.repeat(5, 1), @list.from_array([1, 1, 1, 1, 1]))
 ```

## singleton

```moonbit
:::source,moonbitlang/core/immut/list/list.mbt,1124:::fn singleton[A](x : A) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
```


## unfold

```moonbit
:::source,moonbitlang/core/immut/list/list.mbt,774:::fn unfold[A, S](f : (S) -> (A, S)?, init~ : S) -> <a href="moonbitlang/core/immut/list#T">T</a>[A]
```

 Produces a collection iteratively.

 #### Example

 ```
 let r = @list.unfold(init=0, fn { i => if i == 3 { None } else { Some((i, i + 1)) } })
 assert_eq!(r, @list.from_array([0, 1, 2]))
 ```

## unzip

```moonbit
:::source,moonbitlang/core/immut/list/list.mbt,639:::fn unzip[A, B](list : <a href="moonbitlang/core/immut/list#T">T</a>[(A, B)]) -> (<a href="moonbitlang/core/immut/list#T">T</a>[A], <a href="moonbitlang/core/immut/list#T">T</a>[B])
```

 Unzip two lists.

 #### Example

 ```
 let (a,b) = @list.unzip(@list.from_array([(1,2),(3,4),(5,6)]))
 assert_eq!(a, @list.from_array([1, 3, 5]))
 assert_eq!(b, @list.from_array([2, 4, 6]))
 ```
