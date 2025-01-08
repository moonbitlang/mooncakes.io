# Documentation
|Trait|description|
|---|---|
|[@hackwaly/moonyacc/lib/lr1.AbstractLookaheadSet](#@hackwaly/moonyacc/lib/lr1.AbstractLookaheadSet)||

|Type|description|
|---|---|
|[Automaton](#Automaton)||
|[ConflictLocation](#ConflictLocation)||
|[Decision](#Decision)||
|[EncodedLR0Item](#EncodedLR0Item)||
|[EncodedLR0ItemSet](#EncodedLR0ItemSet)| Always sorted|
|[EncodedLR1ItemSet](#EncodedLR1ItemSet)||
|[EncodedLookaheadSet](#EncodedLookaheadSet)||
|[EncodedSymbolicLookaheadSet](#EncodedSymbolicLookaheadSet)||
|[EpsilonLookaheadSet](#EpsilonLookaheadSet)||
|[LR0Item](#LR0Item)||
|[LR0Node](#LR0Node)||
|[LR1Item](#LR1Item)||
|[LR1ItemGroup](#LR1ItemGroup)||
|[LR1PreState](#LR1PreState)||
|[LR1State](#LR1State)||
|[Lookahead](#Lookahead)||
|[ResolveConflictError](#ResolveConflictError)||

|Value|description|
|---|---|
|[build\_closure\_fn](#build_closure_fn)||
|[resolve\_conflicts](#resolve_conflicts)| Resolve conflicts by using precedence and associativity information|

## @hackwaly/moonyacc/lib/lr1.AbstractLookaheadSet

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/abstract_lookahead_set.mbt,2:::trait @hackwaly/moonyacc/lib/lr1.AbstractLookaheadSet
```


## Automaton

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,115:::pub(all) struct Automaton {
  states : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>]
  starts : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>, <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>)]
  conflicts : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">@hackwaly/moonyacc/lib/util/hashmap2.T</a>[<a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>]]
}
```


#### mooncakes-io-method-mark-Methods
- #### build
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,124:::fn <a href="hackwaly/moonyacc/lib/lr1#Automaton">Automaton</a>::build(grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>) -> <a href="hackwaly/moonyacc/lib/lr1#Automaton">Automaton</a>
  ```
  > 

## ConflictLocation

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,109:::pub(all) struct ConflictLocation {
  state : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>
  input : <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,112:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,112:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>, <a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,112:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,112:::fn hash_combine(<a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived

## Decision

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,26:::pub(all) enum Decision {
  Shift(<a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>)
  Reduce(<a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>)
  Accept
  Conflict(<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,32:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,32:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>, <a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>) -> Bool
    ```
    > automatically derived

## EncodedLR0Item

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::pub(all) type EncodedLR0Item Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::fn compare(<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,2:::fn hash_combine(<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### decode
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,13:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>::decode(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>) -> <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 
- #### decode\_postdot
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,31:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>::decode_postdot(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>) -> <a href="hackwaly/moonyacc/lib/grm#Symbol">@hackwaly/moonyacc/lib/grm.Symbol</a>?
  ```
  > 
- #### decode\_production
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,23:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>::decode_production(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>) -> <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,5:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>::new(production : <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>, dot : Int) -> <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>
  ```
  > 
- #### unsafe\_shift
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item.mbt,41:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>::unsafe_shift(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>) -> <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>
  ```
  > 

## EncodedLR0ItemSet

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,2:::pub(all) struct EncodedLR0ItemSet {
  items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>]
  hash : Int?
}
```
 Always sorted

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,40:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,40:::fn default() -> <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>
    ```
    > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,8:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,8:::fn op_equal(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>, other : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>) -> Bool
    ```
    > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,13:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,19:::fn hash(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>) -> Int
    ```
    > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,13:::fn hash_combine(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>, _hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### decode\_iter
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,52:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>::decode_iter(self : <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>, grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(Int, <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>)]
  ```
  > 
- #### empty
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,35:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>::empty() -> <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>
  ```
  > 
- #### from\_sorted\_array
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lr0_item_set.mbt,45:::fn <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>::from_sorted_array(items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>]) -> <a href="hackwaly/moonyacc/lib/lr1#EncodedLR0ItemSet">EncodedLR0ItemSet</a>
  ```
  > 

## EncodedLR1ItemSet

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/encoded_lr1_item_set.mbt,2:::type EncodedLR1ItemSet
```


## EncodedLookaheadSet

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::type EncodedLookaheadSet
```

 0: EndOfInput
1\..\<1024: Terminal number + 1

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::fn compare(<a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>, <a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>, <a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/encoded_lookahead_set.mbt,4:::fn hash_combine(<a href="hackwaly/moonyacc/lib/lr1#EncodedLookaheadSet">EncodedLookaheadSet</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived

## EncodedSymbolicLookaheadSet

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/encoded_symbolic_lookahead_set.mbt,2:::type EncodedSymbolicLookaheadSet
```


## EpsilonLookaheadSet

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/epsilon_lookahead_set.mbt,2:::type EpsilonLookaheadSet
```


## LR0Item

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,2:::pub(all) struct LR0Item {
  production : <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>
  dot : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,5:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,5:::fn compare(<a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>, <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,5:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>, <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,5:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,5:::fn hash_combine(<a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,8:::fn <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>::new(production : <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>, dot : Int) -> <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 
- #### postdot
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,13:::fn <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>::postdot(self : <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>) -> <a href="hackwaly/moonyacc/lib/grm#Symbol">@hackwaly/moonyacc/lib/grm.Symbol</a>?
  ```
  > 
- #### shift
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr0_item.mbt,22:::fn <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>::shift(self : <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>) -> <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 

## LR0Node

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,35:::type LR0Node
```


## LR1Item

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,2:::pub(all) struct LR1Item {
  production : <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>
  dot : Int
  lookahead : <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,6:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,6:::fn compare(<a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>, <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,6:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>, <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,29:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,29:::fn output(self : <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### core
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,9:::fn <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>::core(self : <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>) -> <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  ```
  > 
- #### postdot
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,14:::fn <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>::postdot(self : <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>) -> <a href="hackwaly/moonyacc/lib/grm#Symbol">@hackwaly/moonyacc/lib/grm.Symbol</a>?
  ```
  > 
- #### shift
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lr1_item.mbt,23:::fn <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>::shift(self : <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>) -> <a href="hackwaly/moonyacc/lib/lr1#LR1Item">LR1Item</a>
  ```
  > 

## LR1ItemGroup

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,2:::pub(all) struct LR1ItemGroup {
  core : <a href="hackwaly/moonyacc/lib/lr1#LR0Item">LR0Item</a>
  lookahead_set : <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,8:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1ItemGroup">LR1ItemGroup</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,8:::fn output(self : <a href="hackwaly/moonyacc/lib/lr1#LR1ItemGroup">LR1ItemGroup</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## LR1PreState

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,55:::type LR1PreState
```


## LR1State

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,61:::pub(all) struct LR1State {
  num : Int
  goto : <a href="moonbitlang/core/sorted_map#T">@moonbitlang/core/sorted_map.T</a>[<a href="hackwaly/moonyacc/lib/grm#Symbol">@hackwaly/moonyacc/lib/grm.Symbol</a>, <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>]
  action : <a href="moonbitlang/core/sorted_map#T">@moonbitlang/core/sorted_map.T</a>[<a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, <a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>]
  stamp : <a href="hackwaly/moonyacc/lib/util/stamp#Stamp">@hackwaly/moonyacc/lib/util/stamp.Stamp</a>
  // private fields
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,75:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,75:::fn compare(self : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, other : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>) -> Int
    ```
    > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,72:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,72:::fn op_equal(self : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, other : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>) -> Bool
    ```
    > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,80:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,80:::fn hash_combine(self : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### iter\_item\_groups
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,85:::fn <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>::iter_item_groups(self : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="hackwaly/moonyacc/lib/lr1#LR1ItemGroup">LR1ItemGroup</a>]
  ```
  > 
- #### set\_action
  ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/automaton.mbt,90:::fn <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>::set_action(self : <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, input : <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, decision : <a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>) -> Unit
  ```
  > 

## Lookahead

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,2:::pub(all) enum Lookahead {
  EndOfInput
  Input(<a href="hackwaly/moonyacc/lib/grm#Terminal">@hackwaly/moonyacc/lib/grm.Terminal</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,5:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,5:::fn compare(<a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,5:::fn op_equal(<a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,8:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,8:::fn hash_combine(self : <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/lib/lr1/lookahead.mbt,16:::fn output(self : <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## ResolveConflictError

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/resolve_conflicts.mbt,2:::pub(all) enum ResolveConflictError {
  Reduce_conflict_resolved_by_presentation_order(<a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>], <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>)
  Shift_reduce_conflict_resolved_without_precedence(<a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>)
  Shift_reduce_conflict_not_resolved_because_of_non_assoc(<a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, <a href="hackwaly/moonyacc/lib/lr1#Lookahead">Lookahead</a>, <a href="hackwaly/moonyacc/lib/lr1#LR1State">LR1State</a>, <a href="hackwaly/moonyacc/lib/grm#Production">@hackwaly/moonyacc/lib/grm.Production</a>)
}
```


## build\_closure\_fn

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/closure.mbt,2:::fn build_closure_fn[LookaheadSet : <a href="hackwaly/moonyacc/lib/lr1#AbstractLookaheadSet">AbstractLookaheadSet</a>](grammar : <a href="hackwaly/moonyacc/lib/grm#Grammar">@hackwaly/moonyacc/lib/grm.Grammar</a>) -> ((<a href="moonbitlang/core/builtin#Iter">Iter</a>[(<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, LookaheadSet)]) -> <a href="moonbitlang/core/array#Array">Array</a>[(<a href="hackwaly/moonyacc/lib/lr1#EncodedLR0Item">EncodedLR0Item</a>, LookaheadSet)])
```


## resolve\_conflicts

```moonbit
:::source,hackwaly/moonyacc/lib/lr1/resolve_conflicts.mbt,24:::fn resolve_conflicts(conflicts : <a href="hackwaly/moonyacc/lib/util/hashmap2#T">@hackwaly/moonyacc/lib/util/hashmap2.T</a>[<a href="hackwaly/moonyacc/lib/lr1#ConflictLocation">ConflictLocation</a>, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="hackwaly/moonyacc/lib/lr1#Decision">Decision</a>]]) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/lr1#ResolveConflictError">ResolveConflictError</a>]
```
 Resolve conflicts by using precedence and associativity information
