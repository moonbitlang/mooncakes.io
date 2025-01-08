# Documentation
|Type|description|
|---|---|
|[BindingSubject](#BindingSubject)||
|[MetaProvider](#MetaProvider)||
|[NonTerminalMeta](#NonTerminalMeta)||
|[ProductionMeta](#ProductionMeta)||
|[PubType](#PubType)||
|[TerminalMeta](#TerminalMeta)||
|[CodeFragment](#CodeFragment)||

## BindingSubject

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,5:::pub(all) enum BindingSubject {
  Data(Int)
  LastPos
  StartPos(Int)
  EndPos(Int)
  SymbolStartPos
}
```


## MetaProvider

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,38:::pub(all) struct MetaProvider {
  header : String
  footer : String
  position_data_type : String
  terminal_meta : (String) -> <a href="hackwaly/moonyacc/lib/codegen#TerminalMeta">TerminalMeta</a>
  nonterminal_meta : (String) -> <a href="hackwaly/moonyacc/lib/codegen#NonTerminalMeta">NonTerminalMeta</a>
  production_meta : (Int) -> <a href="hackwaly/moonyacc/lib/codegen#ProductionMeta">ProductionMeta</a>
  derive_map : <a href="moonbitlang/core/immut/hashmap#T">@moonbitlang/core/immut/hashmap.T</a>[<a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>, String]
}
```


## NonTerminalMeta

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,26:::pub(all) struct NonTerminalMeta {
  data_type : String
}
```


## ProductionMeta

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,14:::pub(all) struct ProductionMeta {
  bindings : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="hackwaly/moonyacc/lib/codegen#BindingSubject">BindingSubject</a>, String)]
  body : String
}
```


## PubType

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,31:::pub(all) enum PubType {
  Token
  TokenKind
  ParseError
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::fn compare(<a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>, <a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::fn op_equal(<a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>, <a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::fn hash_combine(<a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/codegen/types.mbt,35:::fn to_json(<a href="hackwaly/moonyacc/lib/codegen#PubType">PubType</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived

## TerminalMeta

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,20:::pub(all) struct TerminalMeta {
  data_type : String?
  image : String?
}
```


## CodeFragment

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/types.mbt,2:::type CodeFragment = String
```

