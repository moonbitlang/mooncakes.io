# moonbit的一个双向链表库

## 使用 Usage
```
let list: @linklist.LinkList[Int] = @linklist.LinkList::new().push(123).push(456).push(789)  
let last=list.peek()
if last==789{
    println(list.pop())
}
list.remove(123)
if list.shift()==456{
    list.unshift(123)
}
let _ = list.push(23).push(33).push(34)
for ele in list{
    println(ele)
}

println("下面是反向迭代")
let m = list.reverse_iter()
for str in m{
  println(str)    
}

let list = @linklist.LinkList::of([1,2,3,4,5,6,7,8,9])
let _ =list.drop_while(fn(value)->Bool{
  value % 2 == 0
})
println(list)
println(list[3])
```
---
# Documentation
|Type|description|
|---|---|
|[LinkList](#LinkList)||
|[Node](#Node)||

## LinkList

```moonbit
:::source,suiyunonghen/linklist/linklist.mbt,123:::pub struct LinkList {
  length : Int
  // private fields
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,180:::impl[T : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  > 
  * ```moonbit
    :::source,suiyunonghen/linklist/linklist.mbt,180:::fn output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](xs : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,176:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::add[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T) -> Unit
  ```
  > 
- #### bringtofront
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,709:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::bringtofront[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T, findFromHead~ : Bool = ..) -> Unit
  ```
  >  Move the first element found to the beginning of the linked list
  >  
  >  #### Example
  > 
  >  ```
  >  let list = @linklist.LinkList::of([1,2,3,4,5,6,7,8,9])
  >  list.bringtofront(4,findFromHead=false)
  >  // 4<=>1<=>2<=>3<=>5<=>6<=>7<=>8<=>9
  >  ```
- #### clear
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,360:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::clear[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> Unit
  ```
  > 
- #### contains
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,495:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::contains[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T) -> Bool
  ```
  >  Check if the linkList contains the value.
- #### default
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,744:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::default[T]() -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  > 
- #### drop\_while
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,551:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::drop_while[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], f : (T) -> Bool) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  >  Drop the longest prefix of a LinkList of elements that satisfies a given predicate.
  > 
  >  #### Example
  > 
  >  ```
  >  from_array([1, 2, 3, 4]).drop_while(fn(x) { x < 3 })
  >  ```
- #### filter
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,433:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::filter[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], f : (T) -> Bool) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  >  Filter the list.
  > 
  >  #### Example
  > 
  >  ```
  >  println(of([1, 2, 3, 4, 5]).filter(fn(x){ x % 2 == 0}))
  >  // output: from_array([2, 4])
  >  ```
- #### find
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,614:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::find[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], f : (T) -> Bool) -> T?
  ```
  >  Find the first element in the LinkList that satisfies f.
  > 
  >  #### Example
  > 
  >  ```
  >  println(of([1, 3, 5, 8]).find(fn(element) -> Bool { element % 2 == 0}))
  >  // output: Some(8)
  >  ```
- #### findNode
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,648:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::findNode[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], f : (T) -> Bool) -> <a href="suiyunonghen/linklist#Node">Node</a>[T]?
  ```
  >  Find the first elementNode in the LinkList that satisfies f.
  > 
  >  #### Example
  > 
  >  ```
  >  let node5 = list.findNode(fn(value:Int)->Bool{
  >      value==5
  >    })
  >    match node5{
  >     Some(v)=>{
  >       println("查到了内容\{v},下面准备从这里开始往后迭代")
  >       for value in v{
  >         println(value)
  >       }
  >       println("准备反向迭代")
  >       for value in v.reverse_iter(){
  >         println(value)
  >       }
  >     }
  >     None=>println("悟了")
  >   }
  >  // output: Some(8)
  >  ```
- #### from\_array
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,196:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::from_array[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  >  Convert array to LinkList.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = @LinkList::from_array([1, 2, 3, 4, 5])
  >  println(ls) // output: 1<=>2<=>3<=>4<=>5
  >  ```
- #### from\_iter
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,752:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::from_iter[T](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  > 
- #### iter
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,316:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::iter[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  >  for ele in LinkList
- #### lookup
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,594:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::lookup[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>, B](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[(A, B)], value : A) -> B?
  ```
  >  Looks up a key in an association LinkList.
  > 
  >  #### Example
  > 
  >  ```
  >  let ls = from_array([(1, "a"), (2, "b"), (3, "c")])
  >  ls.lookup(3) // output: Some("c")
  >  ```
- #### map
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,388:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::map[A, B](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[A], f : (A) -> B) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[B]
  ```
  >  Maps the list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[Int] = @linklist.LinkList::new()
  >  ..push(1)
  >  ..push(2)
  >  ..push(3)
  >  ..push(4)
  >  let lst = list.map(fn(v)->Int{v*2})
  >  // lst=[2,4,6,8]
  >  ```
- #### new
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,129:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::new[T]() -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  > 
- #### of
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,759:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::of[T](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,137:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::op_get[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], index : Int) -> T?
  ```
  > 
- #### peek
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,250:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::peek[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> T?
  ```
  > Detecting tail data of linked list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[Int] = @linklist.LinkList::new()
  >  ..push(123)
  >  ..push(456)
  >  ..push(789)
  >  assert_eq!(list.peek(),Some(789))
  >  assert_eq!(list.peek(),Some(789))
  >  assert_eq!(list.length,3)
  >  ```
- #### pop
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,220:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::pop[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> T?
  ```
  > Pop up data from the end of the linked list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[Int] = @linklist.LinkList::new()
  >  ..push(123)
  >  ..push(456)
  >  ..push(789)
  >  assert_eq!(list.pop(),Some(789))
  >  assert_eq!(list.pop(),Some(456))
  >  assert_eq!(list.pop(),Some(123))
  >  assert_eq!(list.pop(),None)
  >  assert_eq!(list.length,0)
  >  ```
- #### push
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,162:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::push[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T) -> Unit
  ```
  > Add data to the end of the linked list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[String] = @linklist.LinkList::new()
  >  ..push("test")
  >  ..push("dxsoft")
  >  ..push("data")
  >  for str in list{
  >    println(str)
  >  } 
  >  ```
- #### remove
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,508:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::remove[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T) -> Bool
  ```
  >  remove value from linkList
- #### reverse\_iter
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,344:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::reverse_iter[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  >  reverse iterator
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[String] = @linklist.LinkList::new()
  >  ..push("反向")
  >  ..push("迭代器")
  >  let m = list.reverse_iter()
  >  for str in m{
  >    println(str) 
  >  ```
  >  }
- #### reverse\_map
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,413:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::reverse_map[A, B](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[A], f : (A) -> B) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[B]
  ```
  >  Reverse maps the list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[Int] = @linklist.LinkList::new()
  >  ..push(1)
  >  ..push(2)
  >  ..push(3)
  >  ..push(4)
  >  let lst = list.reverse_map(fn(v)->Int{v*2})
  >  // lst=8<=>6<=>4<=>2
  >  ```
- #### sendtoback
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,664:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::sendtoback[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T, findFromEnd~ : Bool = ..) -> Unit
  ```
  >  Move the first element found to the end of the linked list
  >  
  >  #### Example
  > 
  >  ```
  >  let list = @linklist.LinkList::of([1,2,3,4,5,6,7,8,9])
  >  list.sendtoback(8,findFromEnd=true)
  >  // 1<=>2<=>3<=>4<=>5<=>6<=>7<=>9<=>8
  >  ```
- #### shift
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,272:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::shift[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> T?
  ```
  > Pop up data from the head of the linked list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[Int] = @linklist.LinkList::new()
  >  ..push(123)
  >  ..push(456)
  >  ..push(789)
  >  assert_eq!(list.shift(),Some(123))
  >  assert_eq!(list.shift(),Some(456))
  >  assert_eq!(list.shift(),Some(789))
  >  assert_eq!(list.shift(),None)
  >  assert_eq!(list.length,0)
  >  ```
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,184:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](xs : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T]) -> String
  ```
  > 
- #### unshift
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,301:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::unshift[T](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[T], value : T) -> Unit
  ```
  > Insert data to the head of the linked list.
  > 
  >  #### Example
  > 
  >  ```
  >  let list: @linklist.LinkList[String] = @linklist.LinkList::new()
  >  ..unshift("test")
  >  ..unshift("dxsoft")
  >  ..unshift("data")
  >  for str in list{
  >    println(str)
  >  } 
  >  ```
- #### unzip
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,481:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::unzip[A, B](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[(A, B)]) -> (<a href="suiyunonghen/linklist#LinkList">LinkList</a>[A], <a href="suiyunonghen/linklist#LinkList">LinkList</a>[B])
  ```
  >  Unzip two linkLists.
  > 
  >  #### Example
  > 
  >  ```
  >  let (a,b) = unzip(from_array([(1,2),(3,4),(5,6)]))
  >  println(a) // output: from_array([1, 3, 5])
  >  println(b) // output: from_array([2, 4, 6])
  >  ```
- #### zip
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,456:::fn <a href="suiyunonghen/linklist#LinkList">LinkList</a>::zip[A, B](self : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[A], other : <a href="suiyunonghen/linklist#LinkList">LinkList</a>[B]) -> <a href="suiyunonghen/linklist#LinkList">LinkList</a>[(A, B)]?
  ```
  >  Zip two LinkList.
  > If the lists have different lengths, it will return None.
  > 
  >  #### Example
  > 
  >  ```
  >  let r = zip(of[1, 2, 3, 4, 5]), of([6, 7, 8, 9, 10]))
  >  println(r) // output: Some((1, 6)<=>(2, 7)<=>(3, 8)<=>(4, 9)<=>(5, 10))
  >  ```

## Node

```moonbit
:::source,suiyunonghen/linklist/linklist.mbt,15:::type Node
```


#### mooncakes-io-method-mark-Methods
- #### findNode
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,29:::fn <a href="suiyunonghen/linklist#Node">Node</a>::findNode[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="suiyunonghen/linklist#Node">Node</a>[T], value : T) -> <a href="suiyunonghen/linklist#Node">Node</a>[T]?
  ```
  > 
- #### findNodeEx
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,44:::fn <a href="suiyunonghen/linklist#Node">Node</a>::findNodeEx[T](self : <a href="suiyunonghen/linklist#Node">Node</a>[T], f : (T) -> Bool) -> <a href="suiyunonghen/linklist#Node">Node</a>[T]?
  ```
  > 
- #### iter
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,89:::fn <a href="suiyunonghen/linklist#Node">Node</a>::iter[T](self : <a href="suiyunonghen/linklist#Node">Node</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
- #### reverse\_iter
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,107:::fn <a href="suiyunonghen/linklist#Node">Node</a>::reverse_iter[T](self : <a href="suiyunonghen/linklist#Node">Node</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
- #### rfindNode
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,59:::fn <a href="suiyunonghen/linklist#Node">Node</a>::rfindNode[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="suiyunonghen/linklist#Node">Node</a>[T], value : T) -> <a href="suiyunonghen/linklist#Node">Node</a>[T]?
  ```
  > 
- #### rfindNodeEx
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,74:::fn <a href="suiyunonghen/linklist#Node">Node</a>::rfindNodeEx[T](self : <a href="suiyunonghen/linklist#Node">Node</a>[T], f : (T) -> Bool) -> <a href="suiyunonghen/linklist#Node">Node</a>[T]?
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,25:::fn <a href="suiyunonghen/linklist#Node">Node</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/linklist#Node">Node</a>[T]) -> String
  ```
  > 
- #### value
  ```moonbit
  :::source,suiyunonghen/linklist/linklist.mbt,21:::fn <a href="suiyunonghen/linklist#Node">Node</a>::value[T](self : <a href="suiyunonghen/linklist#Node">Node</a>[T]) -> T
  ```
  > 
