# Documentation
|Type|description|
|---|---|
|[Context](#Context)||
|[ContextOfNumber](#ContextOfNumber)||
|[Token](#Token)||
|[TokenPosition](#TokenPosition)||

|Value|description|
|---|---|
|[lex](#lex)||
|[token\_postion](#token_postion)||
|[token\_postion\_array](#token_postion_array)||

## Context

```moonbit
:::source,oboard/moonbit-eval/lex/lex.mbt,11:::pub(all) struct Context {
  str : String
  offset : Int
  array : <a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/lex#Token">Token</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/lex/lex.mbt,15:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/lex#Context">Context</a> with output(<a href="oboard/moonbit-eval/lex#Context">Context</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,oboard/moonbit-eval/lex/lex.mbt,15:::fn <a href="oboard/moonbit-eval/lex#Context">Context</a>::output(<a href="oboard/moonbit-eval/lex#Context">Context</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,oboard/moonbit-eval/lex/traits.mbt,85:::fn <a href="oboard/moonbit-eval/lex#Context">Context</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ContextOfNumber

```moonbit
:::source,oboard/moonbit-eval/lex/lex_number.mbt,11:::type ContextOfNumber
```


## Token

```moonbit
:::source,oboard/moonbit-eval/lex/lex_token.mbt,7:::pub(all) enum Token {
  Number(Int)
  Number_Double(Double)
  Identifier(String)
  Fun_name(String)
  StringLiteral(String)
  Unit
  Bool
  Int
  Double
  String
  Tuple
  Array
  Main
  Not
  Loop
  For
  While
  Let
  Mut
  If
  Else
  Fn
  True
  False
  Add
  AddEqual
  Sub
  SubEqual
  Mul
  MulEqual
  Div
  DivEqual
  Assign
  EqEq
  LessThan
  LessEqual
  NotEqual
  GreaterThan
  GreaterEqual
  Comma
  Semicolon
  Colon
  PathSep
  Question
  DoubleQuote
  SingleQuote
  LParen
  RParen
  LBracket
  RBracket
  LBrace
  RBrace
  Arrow
  Comment
  Newline
  Skip
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/lex/lex_token.mbt,87:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="oboard/moonbit-eval/lex#Token">Token</a> with op_equal(<a href="oboard/moonbit-eval/lex#Token">Token</a>, <a href="oboard/moonbit-eval/lex#Token">Token</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/lex/lex_token.mbt,87:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/lex#Token">Token</a> with output(<a href="oboard/moonbit-eval/lex#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,oboard/moonbit-eval/lex/lex_token.mbt,87:::fn <a href="oboard/moonbit-eval/lex#Token">Token</a>::op_equal(<a href="oboard/moonbit-eval/lex#Token">Token</a>, <a href="oboard/moonbit-eval/lex#Token">Token</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,oboard/moonbit-eval/lex/lex_token.mbt,87:::fn <a href="oboard/moonbit-eval/lex#Token">Token</a>::output(<a href="oboard/moonbit-eval/lex#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,oboard/moonbit-eval/lex/traits.mbt,85:::fn <a href="oboard/moonbit-eval/lex#Token">Token</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenPosition

```moonbit
:::source,oboard/moonbit-eval/lex/lex_token.mbt,90:::pub(all) struct TokenPosition {
  token_number : Int
  line : Int
  column_start : Int
  column_end : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/lex/lex_token.mbt,95:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a> with output(<a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,oboard/moonbit-eval/lex/lex_token.mbt,95:::fn <a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a>::output(<a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,oboard/moonbit-eval/lex/traits.mbt,85:::fn <a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## lex

```moonbit
:::source,oboard/moonbit-eval/lex/lex.mbt,17:::fn lex(context : <a href="oboard/moonbit-eval/lex#Context">Context</a>) -> Unit
```


## token\_postion

```moonbit
:::source,oboard/moonbit-eval/lex/lex.mbt,2:::let token_postion : <a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a>
```


## token\_postion\_array

```moonbit
:::source,oboard/moonbit-eval/lex/lex.mbt,9:::let token_postion_array : <a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/lex#TokenPosition">TokenPosition</a>]
```

