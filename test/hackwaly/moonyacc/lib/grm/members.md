# Documentation
|Type|description|
|---|---|
|[Associativity](#Associativity)||
|[BuilderContext](#BuilderContext)||
|[Grammar](#Grammar)||
|[Nonterminal](#Nonterminal)||
|[Nullability](#Nullability)||
|[Production](#Production)||
|[Symbol](#Symbol)||
|[Terminal](#Terminal)||
|[BuilderSymbol](#BuilderSymbol)||

|Value|description|
|---|---|
|[build](#build)||

## Associativity

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,22:::pub(all) enum Associativity {
  LeftAssoc
  RightAssoc
  NonAssoc
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,26:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a> with op_equal(<a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>, <a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,26:::fn <a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>::op_equal(<a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>, <a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>) -> Bool
  ```
  > automatically derived

## BuilderContext

```moonbit
:::source,hackwaly/moonyacc/lib/grm/builder.mbt,5:::pub type BuilderContext
```


#### mooncakes-io-method-mark-Methods
- #### add\_production
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/builder.mbt,22:::fn <a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>::add_production(self : <a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>, lhs : String, rhs : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> Int
  ```
  > 
- #### set\_prec
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/builder.mbt,12:::fn <a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>::set_prec(self : <a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>, term : String, assoc : <a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>, level : Int) -> Unit
  ```
  > 
- #### set\_start
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/builder.mbt,31:::fn <a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>::set_start(self : <a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>, name : String) -> Unit
  ```
  > 

## Grammar

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,153:::pub(all) struct Grammar {
  starts : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Production">Production</a>]
  terminals : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>]
  nonterminals : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>]
  productions : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Production">Production</a>]
}
```


## Nonterminal

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,62:::pub(all) struct Nonterminal {
  num : Int
  name : String
  productions : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Production">Production</a>]
  references : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, Int)]
  nullability : <a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,81:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a> with hash_combine(self : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,86:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a> with output(self : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,76:::fn <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>::compare(self : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>, other : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,40:::fn <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,81:::fn <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>::hash_combine(self : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,71:::fn <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>::op_equal(self : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>, other : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,86:::fn <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>::output(self : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Nullability

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,55:::pub(all) enum Nullability {
  Null
  Nullable
  NonNullable
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,59:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a> with op_equal(<a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a>, <a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,59:::fn <a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a>::op_equal(<a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a>, <a href="hackwaly/moonyacc/lib/grm#Nullability">Nullability</a>) -> Bool
  ```
  > automatically derived

## Production

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,105:::pub(all) struct Production {
  num : Int
  lhs : <a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>
  rhs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>]
  prec : Int?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,116:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/grm#Production">Production</a> with compare(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, other : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>) -> Int
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,121:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/grm#Production">Production</a> with hash_combine(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,113:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/grm#Production">Production</a> with op_equal(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, other : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>) -> Bool
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,148:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/grm#Production">Production</a> with output(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,116:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::compare(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, other : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,40:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,121:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::hash_combine(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,113:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::op_equal(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, other : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,148:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::output(self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### output\_with\_opt\_dot
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,126:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::output_with_opt_dot[Logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>](self : <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, logger : Logger, dot? : Int) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/grm#Production">Production</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Symbol

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,91:::pub(all) enum Symbol {
  T(<a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>)
  NT(<a href="hackwaly/moonyacc/lib/grm#Nonterminal">Nonterminal</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,94:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a> with compare(<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,94:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a> with hash_combine(<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,94:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a> with op_equal(<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,97:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a> with output(self : <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,94:::fn <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>::compare(<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>) -> Int
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,40:::fn <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,94:::fn <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>::hash_combine(<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,94:::fn <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>::op_equal(<a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,97:::fn <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>::output(self : <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/grm#Symbol">Symbol</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Terminal

```moonbit
:::source,hackwaly/moonyacc/lib/grm/types.mbt,29:::pub(all) struct Terminal {
  num : Int
  name : String
  references : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="hackwaly/moonyacc/lib/grm#Production">Production</a>, Int)]
  prec : (Int, <a href="hackwaly/moonyacc/lib/grm#Associativity">Associativity</a>)?
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,40:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a> with compare(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, other : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>) -> Int
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,45:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a> with hash_combine(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,37:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a> with op_equal(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, other : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>) -> Bool
  ```
  > 
- ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,50:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a> with output(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,40:::fn <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>::compare(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, other : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,40:::fn <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,45:::fn <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>::hash_combine(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,37:::fn <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>::op_equal(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, other : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/types.mbt,50:::fn <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>::output(self : <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/grm/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/grm#Terminal">Terminal</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BuilderSymbol

```moonbit
:::source,hackwaly/moonyacc/lib/grm/builder.mbt,2:::type BuilderSymbol = String
```


## build

```moonbit
:::source,hackwaly/moonyacc/lib/grm/builder.mbt,39:::fn build(f : (<a href="hackwaly/moonyacc/lib/grm#BuilderContext">BuilderContext</a>) -> Unit) -> <a href="hackwaly/moonyacc/lib/grm#Grammar">Grammar</a>
```

