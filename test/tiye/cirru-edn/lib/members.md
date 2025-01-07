# Documentation
|Type|description|
|---|---|
|[Edn](#Edn)||
|[EdnBufferView](#EdnBufferView)||
|[EdnCommonError](#EdnCommonError)||
|[EdnListView](#EdnListView)||
|[EdnMapView](#EdnMapView)||
|[EdnRecordView](#EdnRecordView)||
|[EdnSetView](#EdnSetView)||
|[EdnTag](#EdnTag)||
|[EdnTupleView](#EdnTupleView)||

|Value|description|
|---|---|
|[format](#format)| generate string from Edn|
|[hello](#hello)||
|[parse](#parse)| parse Cirru code into data|

## Edn

```moonbit
:::source,tiye/cirru-edn/lib/edn.mbt,7:::pub(all) enum Edn {
  Nil
  Bool(Bool)
  Number(Double)
  Symbol(String)
  Tag(<a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>)
  Str(String)
  Quote(<a href="tiye/cirru-parser/lib#Cirru">@tiye/cirru-parser/lib.Cirru</a>)
  Tuple(<a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>)
  List(<a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a>)
  Set(<a href="tiye/cirru-edn/lib#EdnSetView">EdnSetView</a>)
  Map(<a href="tiye/cirru-edn/lib#EdnMapView">EdnMapView</a>)
  Record(<a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>)
  Buffer(<a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,23:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/cirru-edn/lib#Edn">Edn</a> with default() -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,23:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/cirru-edn/lib#Edn">Edn</a> with hash_combine(<a href="tiye/cirru-edn/lib#Edn">Edn</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,23:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#Edn">Edn</a> with op_equal(<a href="tiye/cirru-edn/lib#Edn">Edn</a>, <a href="tiye/cirru-edn/lib#Edn">Edn</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,60:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::compare(self : <a href="tiye/cirru-edn/lib#Edn">Edn</a>, right : <a href="tiye/cirru-edn/lib#Edn">Edn</a>) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,23:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::default() -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,tiye/cirru-edn/lib/traits.mbt,40:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,23:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::hash_combine(<a href="tiye/cirru-edn/lib#Edn">Edn</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### is\_literal
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,128:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::is_literal(self : <a href="tiye/cirru-edn/lib#Edn">Edn</a>) -> Bool
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,23:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::op_equal(<a href="tiye/cirru-edn/lib#Edn">Edn</a>, <a href="tiye/cirru-edn/lib#Edn">Edn</a>) -> Bool
  ```
  > automatically derived
- #### str
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,106:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::str(s : String) -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  ```
  > 
- #### symbol
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,116:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::symbol(s : String) -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  ```
  > 
- #### tag
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,111:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::tag(s : String) -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,26:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::to_string(self : <a href="tiye/cirru-edn/lib#Edn">Edn</a>) -> String
  ```
  > 
- #### tuple
  ```moonbit
  :::source,tiye/cirru-edn/lib/edn.mbt,121:::fn <a href="tiye/cirru-edn/lib#Edn">Edn</a>::tuple(tag : <a href="tiye/cirru-edn/lib#Edn">Edn</a>, extra : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-edn/lib#Edn">Edn</a>]) -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  ```
  > 

## EdnBufferView

```moonbit
:::source,tiye/cirru-edn/lib/buffer.mbt,2:::type EdnBufferView
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/buffer.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a> with op_equal(<a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a>, <a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/buffer.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a>::op_equal(<a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a>, <a href="tiye/cirru-edn/lib#EdnBufferView">EdnBufferView</a>) -> Bool
  ```
  > automatically derived

## EdnCommonError

```moonbit
:::source,tiye/cirru-edn/lib/lib.mbt,2:::pub(all) type! EdnCommonError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,2:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a> with default() -> <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,2:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a> with hash_combine(<a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a> with op_equal(<a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>, <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a> with output(self : <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>::default() -> <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,tiye/cirru-edn/lib/traits.mbt,40:::fn <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>::hash_combine(<a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>::op_equal(<a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>, <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,12:::fn <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>::output(self : <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-edn/lib/lib.mbt,5:::fn <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>::to_string(self : <a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>) -> String
  ```
  > 

## EdnListView

```moonbit
:::source,tiye/cirru-edn/lib/list.mbt,2:::type EdnListView
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/list.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a> with op_equal(<a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a>, <a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/list.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a>::op_equal(<a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a>, <a href="tiye/cirru-edn/lib#EdnListView">EdnListView</a>) -> Bool
  ```
  > automatically derived

## EdnMapView

```moonbit
:::source,tiye/cirru-edn/lib/map.mbt,2:::type EdnMapView
```


## EdnRecordView

```moonbit
:::source,tiye/cirru-edn/lib/record.mbt,2:::pub(all) struct EdnRecordView {
  tag : <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>
  extra : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>, <a href="tiye/cirru-edn/lib#Edn">Edn</a>)]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/record.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a> with op_equal(<a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>, <a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/record.mbt,5:::fn <a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>::op_equal(<a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>, <a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-edn/lib/record.mbt,20:::fn <a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>::to_string(self : <a href="tiye/cirru-edn/lib#EdnRecordView">EdnRecordView</a>) -> String
  ```
  > 

## EdnSetView

```moonbit
:::source,tiye/cirru-edn/lib/set.mbt,4:::type EdnSetView
```


## EdnTag

```moonbit
:::source,tiye/cirru-edn/lib/tag.mbt,2:::type EdnTag
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/tag.mbt,2:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a> with hash_combine(<a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,tiye/cirru-edn/lib/tag.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a> with op_equal(<a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>, <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,tiye/cirru-edn/lib/tag.mbt,20:::fn <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>::compare(self : <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>, other : <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,tiye/cirru-edn/lib/traits.mbt,40:::fn <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/cirru-edn/lib/tag.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>::hash_combine(<a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/tag.mbt,2:::fn <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>::op_equal(<a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>, <a href="tiye/cirru-edn/lib#EdnTag">EdnTag</a>) -> Bool
  ```
  > automatically derived

## EdnTupleView

```moonbit
:::source,tiye/cirru-edn/lib/tuple.mbt,2:::pub(all) struct EdnTupleView {
  tag : <a href="tiye/cirru-edn/lib#Edn">Edn</a>
  extra : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-edn/lib#Edn">Edn</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-edn/lib/tuple.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a> with op_equal(<a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>, <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,tiye/cirru-edn/lib/tuple.mbt,36:::fn <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>::compare(self : <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>, right : <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,tiye/cirru-edn/lib/tuple.mbt,8:::fn <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>::new(tag : <a href="tiye/cirru-edn/lib#Edn">Edn</a>, extra : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-edn/lib#Edn">Edn</a>]) -> <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-edn/lib/tuple.mbt,5:::fn <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>::op_equal(<a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>, <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>) -> Bool
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-edn/lib/tuple.mbt,24:::fn <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>::to_string(self : <a href="tiye/cirru-edn/lib#EdnTupleView">EdnTupleView</a>) -> String
  ```
  > 

## format

```moonbit
:::source,tiye/cirru-edn/lib/lib.mbt,373:::fn format(data : <a href="tiye/cirru-edn/lib#Edn">Edn</a>, use_inline : Bool) -> String!<a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>
```
 generate string from Edn

## hello

```moonbit
:::source,tiye/cirru-edn/lib/edn.mbt,2:::fn hello() -> String
```


## parse

```moonbit
:::source,tiye/cirru-edn/lib/lib.mbt,17:::fn parse(s : String) -> <a href="tiye/cirru-edn/lib#Edn">Edn</a>!<a href="tiye/cirru-edn/lib#EdnCommonError">EdnCommonError</a>
```
 parse Cirru code into data
