# pretty printer

A declarative-style pretty printer engine, which includes printers for built-in 
types such as `Array`, `Map`, and `JsonValue`.

# Install

Add `Yoorkin/prettyprinter` as dependency by `moon add`.

Import package `prettyprinter` in `moon.pkg.json`, like this:

```
{
  "import": [
    "Yoorkin/prettyprinter"
  ]
}
```

# Usage

## Print Value

Use `render` to pretty print any type implemented `Pretty` trait.

```moonbit
let map = {
  "name": ["John", "Mike"], "age": ["15","18"], "id": ["11109121","2000012312"]
}
map |> @prettyprinter.render() |> println()
```

output:
```
{
  "name": ["John", "Mike"],
  "age": ["15", "18"],
  "id": ["11109121", "2000012312"]
}
```

## Implement Pretty Trait

Write declarative code to implement a printer for your type. 
See example in package `prettyprinter/example`.


---
# Documentation
|Trait|description|
|---|---|
|[@Yoorkin/prettyprinter.Pretty](#@Yoorkin/prettyprinter.Pretty)||

|Type|description|
|---|---|
|[Document](#Document)||
|[Requirement](#Requirement)||

|Value|description|
|---|---|
|[braces](#braces)| wraps the given document in braces.|
|[brackets](#brackets)| wraps the given document in brackets. |
|[char](#char)||
|[concat](#concat)| Concatenate two documents.|
|[empty](#empty)| Empty document.|
|[flow](#flow)| print each docuemnts in the same line if it fits, insert a line break otherwise.|
|[group](#group)| \`group(doc)\` tries to render the \`doc\` on a single line, |
|[hardline](#hardline)| Force line break with current indentation.|
|[line](#line)| Represents a line break if the line is too long, or a space if it fits.|
|[list](#list)| Concatenate documents.|
|[nest](#nest)| Nest the document by \`n\` spaces.|
|[parens](#parens)| wraps the given document in parentheses. |
|[pretty](#pretty)||
|[render](#render)| Renders a document as a pretty string with a specified width.|
|[separate](#separate)| This function takes a separator document \`sep\` and an array of documents \`docs\` and returns a document|
|[separate\_map](#separate_map)| This function takes a separator document, an array of values, and a mapping function, and returns a document|
|[softline](#softline)| Represents a line break if the line is too long, or nothing if it fits.|
|[space](#space)| Space character.|
|[string](#string)| print the string with double quotes.|
|[surround](#surround)| Surrounds the given document with the left and right documents.|
|[switch](#switch)| Switch between two documents based on the available space.|
|[text](#text)||

## @Yoorkin/prettyprinter.Pretty

```moonbit
:::source,Yoorkin/prettyprinter/pretty.mbt,2:::pub(open) trait @Yoorkin/prettyprinter.Pretty {
  pretty(Self) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,60:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Unit
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,60:::fn pretty(_unit : Unit) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a unit value.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,33:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Bool
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,33:::fn pretty(b : Bool) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a Bool.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,245:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Byte
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,245:::fn pretty(byte : Byte) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,48:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Char
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,48:::fn pretty(c : Char) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a character.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,36:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Int
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,36:::fn pretty(i : Int) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print an Int.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,39:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,39:::fn pretty(i : Int64) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print an Int64.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,42:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for UInt
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,42:::fn pretty(i : UInt) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a UInt.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,45:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for UInt64
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,45:::fn pretty(i : UInt64) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a UInt64.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,54:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Float
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,54:::fn pretty(f : Float) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a float.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,51:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Double
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,51:::fn pretty(d : Double) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a double.
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,30:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for String
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,30:::fn pretty(str : String) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a string.
    >  
    >  ```
    >  pretty("Hello, World!") |> inspect!(content="\"Hello, World!\"")
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,83:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for A?
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,83:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](opt : A?) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print an option value.
    >  
    >  ```
    >  let opt = Some(5)
    >  inspect!(pretty(opt), content="Some(5)")
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,100:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/result#Result">Result</a>[A, B]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,100:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](res : <a href="moonbitlang/core/result#Result">Result</a>[A, B]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a result value.
    >  
    >  ```
    >  let ok : Result[Int, String] = Ok(100)
    >  let err : Result[Int, String] = Err("error")
    >  inspect!(pretty(ok), content="Ok(100)")
    >  inspect!(pretty(err), content=
    >    #|Err("error")
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,291:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,291:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a FixedArray
    >  
    >  ```
    >  let x  : FixedArray[_] = [1, 2, 3]
    >  inspect!(
    >    pretty(x),
    >    content="[1, 2, 3]",
    >  )
    >  inspect!(
    >    render(x, width=5),
    >    content=
    >      #|[
    >      #|  1,
    >      #|  2,
    >      #|  3
    >      #|]
    >    ,
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,263:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for Bytes
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,263:::fn pretty(bytes : Bytes) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a Bytes
    >  
    >  ```
    >  let x = Bytes::of([1,2,3,4,5])
    >  inspect!(pretty(x), content="[b'\\x01', b'\\x02', b'\\x03', b'\\x04', b'\\x05']")
    >  inspect!(
    >    render(x, width=15),
    >    content=
    >      #|[
    >      #|  b'\x01', b'\x02',
    >      #|  b'\x03', b'\x04',
    >      #|  b'\x05'
    >      #|]
    >    ,
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,396:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,396:::fn pretty(buffer : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,68:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/array#Array">Array</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,68:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](xs : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print an array.
    >  
    >  ```
    >  let arr = [1, 2, 3, 4]
    >  inspect!(pretty(arr), content="[1, 2, 3, 4]")
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,167:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,167:::fn pretty(json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a JSON value.
    >  
    >  ```
    >  let user : Json = {
    >    "name": "John Doe",
    >    "age": 30,
    >    "is_student": false,
    >    "grades": [100, 90, 80],
    >    "address": { "street": "123 Main St", "city": "Springfield", "state": "IL" },
    >  }
    >  inspect!(
    >    pretty(user),
    >    content=
    >      #|{
    >      #|  "name": John Doe,
    >      #|  "age": 30,
    >      #|  "is_student": false,
    >      #|  "grades": [100, 90, 80],
    >      #|  "address": {"street": 123 Main St, "city": Springfield, "state": IL}
    >      #|}
    >    ,
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,131:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/builtin#Map">Map</a>[A, B]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,131:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](m : <a href="moonbitlang/core/builtin#Map">Map</a>[A, B]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a map.
    >  
    >  ```
    >  let score : Map[String, Int] = {
    >    "player1": 1009,
    >    "player2": 200,
    >    "player3": 30,
    >    "player4": 999999999,
    >    "player5": 999999999,
    >  }
    >  inspect!(
    >    pretty(score),
    >    content=
    >      #|{
    >      #|  "player1": 1009,
    >      #|  "player2": 200,
    >      #|  "player3": 30,
    >      #|  "player4": 999999999,
    >      #|  "player5": 999999999
    >      #|}
    >    ,
    >  )
    >  ```
    >  
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,235:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/builtin#Set">Set</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,235:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](set : <a href="moonbitlang/core/builtin#Set">Set</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a Set
    >  
    >  ```
    >  let set = Set::of([1,2,3])
    >  inspect!(pretty(set), content="{1, 2, 3}")
    >  inspect!(
    >    render(set, width=5),
    >    content=
    >      #|{
    >      #|  1,
    >      #|  2,
    >      #|  3
    >      #|}
    >    ,
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,399:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/deque#T">@moonbitlang/core/deque.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,399:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](deque : <a href="moonbitlang/core/deque#T">@moonbitlang/core/deque.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,317:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/hashmap#T">@moonbitlang/core/hashmap.T</a>[A, B]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,317:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](map : <a href="moonbitlang/core/hashmap#T">@moonbitlang/core/hashmap.T</a>[A, B]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a `@hashmap.T`
    >  
    >  ```
    >  let x = @hashmap.of([("key1",1),("key2",2000)])
    >  inspect!(pretty(x), content=
    >    #|{"key2": 2000, "key1": 1}
    >  )
    >  inspect!(
    >    render(x, width=5),
    >    content=
    >      #|{
    >      #|  "key2": 2000,
    >      #|  "key1": 1
    >      #|}
    >    ,
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,346:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/hashset#T">@moonbitlang/core/hashset.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,346:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](set : <a href="moonbitlang/core/hashset#T">@moonbitlang/core/hashset.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
    >  ```
    >  let x = @hashset.of(["key1","key2"])
    >  inspect!(pretty(x), content=
    >    #|{"key1", "key2"}
    >  )
    >  inspect!(
    >    render(x, width=5),
    >    content=
    >      #|{
    >      #|  "key1",
    >      #|  "key2"
    >      #|}
    >    ,
    >  )
    >  ```
    >  
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,404:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/immut/array#T">@moonbitlang/core/immut/array.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,404:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](array : <a href="moonbitlang/core/immut/array#T">@moonbitlang/core/immut/array.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,409:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/immut/hashmap#T">@moonbitlang/core/immut/hashmap.T</a>[A, B]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,409:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](map : <a href="moonbitlang/core/immut/hashmap#T">@moonbitlang/core/immut/hashmap.T</a>[A, B]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,424:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/immut/hashset#T">@moonbitlang/core/immut/hashset.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,424:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](set : <a href="moonbitlang/core/immut/hashset#T">@moonbitlang/core/immut/hashset.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,211:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,211:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](list : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a `@immut/list.T`
    >  
    >  ```
    >  let list = @immut/list.of([(1,'a'), (2,'b'), (3,'c')])
    >  inspect!(pretty(list), content="[(1, a), (2, b), (3, c)]")
    >  inspect!(render(list,width=10), content=
    >    #|[
    >    #|  (1, a),
    >    #|  (2, b),
    >    #|  (3, c)
    >    #|]
    >  )
    >  ```
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,434:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[A, B]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,434:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](map : <a href="moonbitlang/core/immut/sorted_map#T">@moonbitlang/core/immut/sorted_map.T</a>[A, B]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,449:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/immut/sorted_set#T">@moonbitlang/core/immut/sorted_set.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,449:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](set : <a href="moonbitlang/core/immut/sorted_set#T">@moonbitlang/core/immut/sorted_set.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,389:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/priority_queue#T">@moonbitlang/core/priority_queue.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,389:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a>](queue : <a href="moonbitlang/core/priority_queue#T">@moonbitlang/core/priority_queue.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,379:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/queue#T">@moonbitlang/core/queue.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,379:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](queue : <a href="moonbitlang/core/queue#T">@moonbitlang/core/queue.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,356:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/sorted_map#T">@moonbitlang/core/sorted_map.T</a>[A, B]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,356:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](map : <a href="moonbitlang/core/sorted_map#T">@moonbitlang/core/sorted_map.T</a>[A, B]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,369:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="moonbitlang/core/sorted_set#T">@moonbitlang/core/sorted_set.T</a>[A]
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,369:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](set : <a href="moonbitlang/core/sorted_set#T">@moonbitlang/core/sorted_set.T</a>[A]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,144:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,144:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](pair : (A, B)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,153:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,153:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,172:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C, D)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,172:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C, D)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,193:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C, D, E)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,199:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C, D, E)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,220:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C, D, E, F)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,227:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C, D, E, F)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,250:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, G : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C, D, E, F, G)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,258:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, G : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C, D, E, F, G)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,283:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, G : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, H : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C, D, E, F, G, H)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,292:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, G : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, H : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C, D, E, F, G, H)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 
- ```moonbit
  :::source,Yoorkin/prettyprinter/tuple.mbt,319:::impl[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, G : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, H : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, I : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>] <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for (A, B, C, D, E, F, G, H, I)
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/tuple.mbt,329:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, B : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, C : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, D : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, E : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, F : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, G : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, H : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>, I : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](tuple : (A, B, C, D, E, F, G, H, I)) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    > 

## Document

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,34:::type Document
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/prettyprinter/pretty.mbt,57:::impl <a href="Yoorkin/prettyprinter#Pretty">Pretty</a> for <a href="Yoorkin/prettyprinter#Document">Document</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/pretty.mbt,57:::fn pretty(doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
    ```
    >  Pretty print a document.
- ```moonbit
  :::source,Yoorkin/prettyprinter/document.mbt,146:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Yoorkin/prettyprinter#Document">Document</a>
  ```
  > 
  * ```moonbit
    :::source,Yoorkin/prettyprinter/document.mbt,146:::fn output(self : <a href="Yoorkin/prettyprinter#Document">Document</a>, buf : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### op\_add
  ```moonbit
  :::source,Yoorkin/prettyprinter/document.mbt,136:::fn <a href="Yoorkin/prettyprinter#Document">Document</a>::op_add(self : <a href="Yoorkin/prettyprinter#Document">Document</a>, other : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,Yoorkin/prettyprinter/document.mbt,141:::fn <a href="Yoorkin/prettyprinter#Document">Document</a>::to_string(self : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> String
  ```
  > 

## Requirement

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,2:::type Requirement
```


## braces

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,82:::fn braces(doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 wraps the given document in braces.
 
 ```
 inspect!(braces(text("doc")), content="{doc}")
 ```

## brackets

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,73:::fn brackets(doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 wraps the given document in brackets.
 
 ```
 inspect!(brackets(text("doc")), content="[doc]")
 ```

## char

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,94:::fn char(c : Char) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```


## concat

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,131:::fn concat(l : <a href="Yoorkin/prettyprinter#Document">Document</a>, r : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Concatenate two documents.
You can also use the `+` operator.

## empty

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,59:::let empty : <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Empty document.
`render(empty) == ""`

## flow

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,112:::fn flow(doc : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/prettyprinter#Document">Document</a>]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 print each docuemnts in the same line if it fits, insert a line break otherwise.
 
 ```
 let words = [
   "The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog",
 ]
 let doc = words.map(fn(x){text(x) + space}) |> flow()
 inspect!(doc, content="The quick brown fox jumps over the lazy dog ")
 inspect!(
   render(doc, width=10),
   content=
     #|The quick brown 
     #|fox jumps over 
     #|the lazy dog 
   ,
 )
 ```

## group

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,112:::fn group(doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 `group(doc)` tries to render the `doc` on a single line,
but if the `doc` doesn't fit, or contains a `hardline`, all the `switch`
inside the `doc` will be rendered with the right document.

## hardline

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,76:::let hardline : <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Force line break with current indentation.
This document will always doesn't fit in the current line.
 
 #### Example
 
 ```
 render(text("hello") + nest(hardline + text("world")))
 |> inspect!(
   content=
     #|hello
     #|  world
   ,
 )
 ```
 

## line

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,86:::let line : <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Represents a line break if the line is too long, or a space if it fits.

## list

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,99:::fn list(ls : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/prettyprinter#Document">Document</a>]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Concatenate documents.

## nest

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,125:::fn nest(indent~ : Int = .., doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Nest the document by `n` spaces.
Any line breaks inside the nested document will be indented by `n` spaces.

## parens

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,64:::fn parens(doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 wraps the given document in parentheses.
 
 ```
 inspect!(parens(text("doc")), content="(doc)")
 ```

## pretty

```moonbit
:::source,Yoorkin/prettyprinter/pretty.mbt,7:::fn pretty[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](x : A) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```


## render

```moonbit
:::source,Yoorkin/prettyprinter/pretty.mbt,21:::fn render[A : <a href="Yoorkin/prettyprinter#Pretty">Pretty</a>](document : A, width~ : Int = ..) -> String
```
 Renders a document as a pretty string with a specified width.

 #### Arguments

 * `x` - The document to render.
 * `width` - The maximum width of the rendered string. Defaults to 80.

 #### Returns

 The rendered string.

## separate

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,38:::fn separate(sep : <a href="Yoorkin/prettyprinter#Document">Document</a>, docs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/prettyprinter#Document">Document</a>]) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 This function takes a separator document `sep` and an array of documents `docs` and returns a document
where each document in the array is separated by the separator document.

 #### Example

 ```
 let sep = text("-")
 let docs = [text("Hello"), text("World"), text("!")]
 separate(sep, docs).pretty() |> inspect!(content="Hello-World-!")
 ```

## separate\_map

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,20:::fn separate_map[A](sep : <a href="Yoorkin/prettyprinter#Document">Document</a>, elems : <a href="moonbitlang/core/array#Array">Array</a>[A], f : (A) -> <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 This function takes a separator document, an array of values, and a mapping function, and returns a document
where each value in the array is mapped to a document using the mapping function, and then separated by the separator document.

 #### Arguments

 * `sep` - The separator document to be used between each mapped value.
 * `xs` - The array of values to be mapped and separated.
 * `f` - The mapping function that takes a value from the array and returns a document.

 #### Returns

 The resulting document where each value is mapped and separated by the separator document.

 #### Example

 ```
 let doc = separate_map(text(","), [1,2,3], pretty)
 inspect!(doc, content="1,2,3") 
 ```

## softline

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,83:::let softline : <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Represents a line break if the line is too long, or nothing if it fits.

## space

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,80:::let space : <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Space character.
`render(space) == " "`

## string

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,91:::fn string(str : String) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 print the string with double quotes.
 
 ```
 inspect!(string("Hello, World!"), content="\"Hello, World!\"")
 ```

## surround

```moonbit
:::source,Yoorkin/prettyprinter/utils.mbt,55:::fn surround(left : <a href="Yoorkin/prettyprinter#Document">Document</a>, right : <a href="Yoorkin/prettyprinter#Document">Document</a>, doc : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Surrounds the given document with the left and right documents.
 
 `surround(l, r, doc)` is equivalent to `l + doc + r`
 
 #### Example
 
 ```
 inspect!(surround(char('['), char(']'), text("doc")), content="[doc]")
 ```

## switch

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,119:::fn switch(l : <a href="Yoorkin/prettyprinter#Document">Document</a>, r : <a href="Yoorkin/prettyprinter#Document">Document</a>) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```
 Switch between two documents based on the available space.
The left document represents the flatten mode, and the right one the pretty mode.
If the left document fits, it will be rendered, otherwise the right one.

## text

```moonbit
:::source,Yoorkin/prettyprinter/document.mbt,89:::fn text(s : String) -> <a href="Yoorkin/prettyprinter#Document">Document</a>
```

