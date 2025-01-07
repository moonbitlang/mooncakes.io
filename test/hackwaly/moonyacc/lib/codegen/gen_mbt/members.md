# Documentation
|Type|description|
|---|---|
|[CodegenDecision](#CodegenDecision)||
|[CodegenSymbol](#CodegenSymbol)||
|[Mode](#Mode)||
|[TokenPayloadRewrite](#TokenPayloadRewrite)||

|Value|description|
|---|---|
|[codegen](#codegen)||
|[codegen\_tokens](#codegen_tokens)||

## CodegenDecision

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,18:::type CodegenDecision
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,23:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a> with compare(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,23:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a> with op_equal(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,23:::fn <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>::compare(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,23:::fn <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>::op_equal(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenDecision">CodegenDecision</a>) -> Bool
  ```
  > automatically derived

## CodegenSymbol

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,2:::type CodegenSymbol
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,6:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a> with compare(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a> with op_equal(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,6:::fn <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>::compare(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,6:::fn <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>::op_equal(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>, <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#CodegenSymbol">CodegenSymbol</a>) -> Bool
  ```
  > automatically derived

## Mode

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,53:::pub(all) enum Mode {
  Default
  JsonCst(<a href="hackwaly/moonyacc/lib/codegen/gen_mbt#TokenPayloadRewrite">TokenPayloadRewrite</a>?)
}
```


## TokenPayloadRewrite

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,59:::pub(all) enum TokenPayloadRewrite {
  NoPayload
  JsonPayload
}
```


## codegen

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,183:::fn codegen(grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>, automaton : <a href="hackwaly/moonyacc/lib/lr1#Automaton">@hackwaly/moonyacc/lib/lr1.Automaton</a>, meta : <a href="hackwaly/moonyacc/lib/codegen#MetaProvider">@hackwaly/moonyacc/lib/codegen.MetaProvider</a>, output : <a href="moonbitlang/core/builtin#Logger">Logger</a>, external_tokens~ : Bool = .., no_comments~ : Bool = .., mode~ : <a href="hackwaly/moonyacc/lib/codegen/gen_mbt#Mode">Mode</a> = ..) -> Unit
```


## codegen\_tokens

```moonbit
:::source,hackwaly/moonyacc/lib/codegen/gen_mbt/gen_mbt.mbt,65:::fn codegen_tokens(terminals : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Terminal">@hackwaly/moonyacc/lib/grm.Terminal</a>], terminal_meta : (String) -> <a href="hackwaly/moonyacc/lib/codegen#TerminalMeta">@hackwaly/moonyacc/lib/codegen.TerminalMeta</a>, output : <a href="moonbitlang/core/builtin#Logger">Logger</a>, no_comments~ : Bool = .., derive_map~ : <a href="moonbitlang/core/immut/hashmap#T">@moonbitlang/core/immut/hashmap.T</a>[<a href="hackwaly/moonyacc/lib/codegen#PubType">@hackwaly/moonyacc/lib/codegen.PubType</a>, String] = ..) -> Unit
```

