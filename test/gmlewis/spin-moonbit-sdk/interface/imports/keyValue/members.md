# Documentation
|Type|description|
|---|---|
|[Error\_](#Error_)| The set of errors which may be raised by functions in this interface|
|[Store](#Store)| An open key-value store|

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,14:::pub(all) enum Error_ {
  StoreTableFull
  NoSuchStore
  AccessDenied
  Other(String)
}
```
 The set of errors which may be raised by functions in this interface

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,19:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,19:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Store

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,3:::pub(all) type Store Int
```
 An open key-value store

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### delete
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,139:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::delete(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, key : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>]
  ```
  >  Delete the tuple with the specified `key`
  > 
  >  No error is raised if a tuple did not previously exist for `key`.
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,9:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>) -> Unit
  ```
  > 
- #### exists
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,170:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::exists(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, key : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Bool, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>]
  ```
  >  Return whether a tuple exists for the specified `key`
- #### get
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,58:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::get(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, key : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Bytes?, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>]
  ```
  >  Get the value associated with the specified `key`
  > 
  >  Returns `ok(none)` if the key does not exist.
- #### get\_keys
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,201:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::get_keys(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/array#Array">Array</a>[String], <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>]
  ```
  >  Return a list of all the keys
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,3:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>) -> Bool
  ```
  > automatically derived
- #### open
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,26:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::open(label : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>]
  ```
  >  Open the store with the specified label.
  > 
  >  `label` must refer to a store allowed in the spin.toml manifest.
  > 
  >  `error::no-such-store` will be raised if the `label` is not recognized.
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,3:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/top.mbt,99:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>, key : String, value : Bytes) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Error_">Error_</a>]
  ```
  >  Set the `value` associated with the specified `key` overwriting any existing value.
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/keyValue/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/keyValue#Store">Store</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
