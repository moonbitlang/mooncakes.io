# Documentation
|Type|description|
|---|---|
|[Fundef](#Fundef)||
|[Name](#Name)||
|[NameFromStringError](#NameFromStringError)||
|[Op](#Op)||
|[Syntax](#Syntax)||
|[Type](#Type)||

## Fundef

```moonbit
:::source,oboard/moonbit-eval/types/types.mbt,44:::pub(all) struct Fundef {
  name : (String, <a href="oboard/moonbit-eval/types#Type">Type</a>)
  args : <a href="moonbitlang/core/array#Array">Array</a>[(String, <a href="oboard/moonbit-eval/types#Type">Type</a>)]
  body : <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,48:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/types#Fundef">Fundef</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/types.mbt,48:::fn output(<a href="oboard/moonbit-eval/types#Fundef">Fundef</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/utils.mbt,84:::fn <a href="oboard/moonbit-eval/types#Fundef">Fundef</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="oboard/moonbit-eval/types#Fundef">Fundef</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/utils.mbt,72:::fn <a href="oboard/moonbit-eval/types#Fundef">Fundef</a>::to_json(self : <a href="oboard/moonbit-eval/types#Fundef">Fundef</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

## Name

```moonbit
:::source,oboard/moonbit-eval/types/name.mbt,1:::type Name
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,4:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/name.mbt,4:::fn compare(<a href="oboard/moonbit-eval/types#Name">Name</a>, <a href="oboard/moonbit-eval/types#Name">Name</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/name.mbt,4:::fn op_equal(<a href="oboard/moonbit-eval/types#Name">Name</a>, <a href="oboard/moonbit-eval/types#Name">Name</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,4:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/name.mbt,4:::fn hash_combine(<a href="oboard/moonbit-eval/types#Name">Name</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/name.mbt,6:::fn output(self : <a href="oboard/moonbit-eval/types#Name">Name</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,80:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="oboard/moonbit-eval/types#Name">Name</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### from\_string
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,33:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::from_string(s : String) -> <a href="oboard/moonbit-eval/types#Name">Name</a>!<a href="oboard/moonbit-eval/types#NameFromStringError">NameFromStringError</a>
  ```
  > 
- #### name\_and\_slot
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,68:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::name_and_slot(name : String, slot : Int) -> <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
- #### name\_only
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,64:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::name_only(name : String) -> <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
- #### slot\_only
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,72:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::slot_only(slot : Int) -> <a href="oboard/moonbit-eval/types#Name">Name</a>
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,76:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::to_json(self : <a href="oboard/moonbit-eval/types#Name">Name</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,10:::fn <a href="oboard/moonbit-eval/types#Name">Name</a>::to_string(self : <a href="oboard/moonbit-eval/types#Name">Name</a>) -> String
  ```
  > 

## NameFromStringError

```moonbit
:::source,oboard/moonbit-eval/types/name.mbt,19:::type NameFromStringError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/types/name.mbt,23:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/types#NameFromStringError">NameFromStringError</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/name.mbt,23:::fn output(self : <a href="oboard/moonbit-eval/types#NameFromStringError">NameFromStringError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## Op

```moonbit
:::source,oboard/moonbit-eval/types/types.mbt,29:::pub(all) enum Op {
  Add
  Sub
  Mul
  Div
  EqEq
  LessEqual
  NotEqual
  LessThan
  GreaterThan
  GreaterEqual
  And
  Or
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,42:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="oboard/moonbit-eval/types#Op">Op</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/types.mbt,42:::fn op_equal(<a href="oboard/moonbit-eval/types#Op">Op</a>, <a href="oboard/moonbit-eval/types#Op">Op</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,42:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/types#Op">Op</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/types.mbt,42:::fn output(<a href="oboard/moonbit-eval/types#Op">Op</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,42:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="oboard/moonbit-eval/types#Op">Op</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/types.mbt,42:::fn to_json(<a href="oboard/moonbit-eval/types#Op">Op</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## Syntax

```moonbit
:::source,oboard/moonbit-eval/types/types.mbt,4:::pub(all) enum Syntax {
  Unit
  Bool(Bool)
  Int(Int)
  Double(Double)
  String(String)
  Var(String)
  Tuple(<a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>])
  Not(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  Array(<a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>])
  Neg(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  App(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>])
  Get(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  If(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  ForIn(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  For(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  Prim(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Op">Op</a>)
  Assign(String, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  Let((String, <a href="oboard/moonbit-eval/types#Type">Type</a>), <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, Bool)
  LetRec(<a href="oboard/moonbit-eval/types#Fundef">Fundef</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  LetTuple(<a href="moonbitlang/core/array#Array">Array</a>[(String, <a href="oboard/moonbit-eval/types#Type">Type</a>)], <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  Put(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>)
  Seq(<a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,27:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/types.mbt,27:::fn output(<a href="oboard/moonbit-eval/types#Syntax">Syntax</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/utils.mbt,169:::fn <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/utils.mbt,127:::fn <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>::to_json(self : <a href="oboard/moonbit-eval/types#Syntax">Syntax</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

## Type

```moonbit
:::source,oboard/moonbit-eval/types/types.mbt,50:::pub(all) enum Type {
  Unit
  Bool
  Int
  Double
  String
  Fun(<a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/types#Type">Type</a>], <a href="oboard/moonbit-eval/types#Type">Type</a>)
  Tuple(<a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/types#Type">Type</a>])
  Array(<a href="oboard/moonbit-eval/types#Type">Type</a>)
  Var(<a href="moonbitlang/core/ref#Ref">Ref</a>[<a href="oboard/moonbit-eval/types#Type">Type</a>?])
  Ptr
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,61:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/types#Type">Type</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/types/types.mbt,61:::fn output(<a href="oboard/moonbit-eval/types#Type">Type</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/utils.mbt,19:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::from_json(self : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="oboard/moonbit-eval/types#Type">Type</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### is\_float\_like
  ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,75:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::is_float_like(self : <a href="oboard/moonbit-eval/types#Type">Type</a>) -> Bool
  ```
  > 
- #### is\_ptr\_like
  ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,63:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::is_ptr_like(self : <a href="oboard/moonbit-eval/types#Type">Type</a>) -> Bool
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,103:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::op_equal(self : <a href="oboard/moonbit-eval/types#Type">Type</a>, other : <a href="oboard/moonbit-eval/types#Type">Type</a>) -> Bool
  ```
  > 
- #### repr
  ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,119:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::repr(self : <a href="oboard/moonbit-eval/types#Type">Type</a>) -> <a href="oboard/moonbit-eval/types#Type">Type</a>
  ```
  > 
- #### size\_of
  ```moonbit
  :::source,oboard/moonbit-eval/types/types.mbt,87:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::size_of(self : <a href="oboard/moonbit-eval/types#Type">Type</a>, size_of_ptr : Int) -> Int
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,oboard/moonbit-eval/types/utils.mbt,2:::fn <a href="oboard/moonbit-eval/types#Type">Type</a>::to_json(self : <a href="oboard/moonbit-eval/types#Type">Type</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
