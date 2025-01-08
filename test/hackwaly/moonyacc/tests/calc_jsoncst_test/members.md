# Documentation
|Type|description|
|---|---|
|[ParseError](#ParseError)||
|[Token](#Token)||
|[TokenKind](#TokenKind)||
|[YYDecision](#YYDecision)||
|[YYObj\_Json](#YYObj_Json)||
|[YYSymbol](#YYSymbol)||
|[Position](#Position)||

|Value|description|
|---|---|
|[start](#start)||

## ParseError

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,55:::pub(all) enum ParseError {
  UnexpectedToken(<a href="hackwaly/moonyacc/tests/calc_jsoncst_test#Token">Token</a>, (Int, Int), <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/tests/calc_jsoncst_test#TokenKind">TokenKind</a>])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,57:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#ParseError">ParseError</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,57:::fn output(<a href="hackwaly/moonyacc/tests/calc_jsoncst_test#ParseError">ParseError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Token

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,5:::pub(all) enum Token {
  EOF
  NUMBER
  PLUS
  MINUS
  STAR
  LPAREN
  RPAREN
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,13:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#Token">Token</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,13:::fn output(<a href="hackwaly/moonyacc/tests/calc_jsoncst_test#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### kind
  ```moonbit
  :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,16:::fn <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#Token">Token</a>::kind(self : <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#Token">Token</a>) -> <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#TokenKind">TokenKind</a>
  ```
  > 

## TokenKind

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,29:::pub(all) enum TokenKind {
  TK_EOF
  TK_NUMBER
  TK_PLUS
  TK_MINUS
  TK_STAR
  TK_LPAREN
  TK_RPAREN
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,40:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#TokenKind">TokenKind</a>
  ```
  > 
  * ```moonbit
    :::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,40:::fn output(self : <a href="hackwaly/moonyacc/tests/calc_jsoncst_test#TokenKind">TokenKind</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## YYDecision

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,72:::type YYDecision
```


## YYObj\_Json

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,63:::type YYObj_Json
```


## YYSymbol

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,81:::type YYSymbol
```


## Position

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,2:::type Position = Int
```


## start

```moonbit
:::source,hackwaly/moonyacc/tests/calc_jsoncst_test/calc_jsoncst.mbt,682:::fn start(read_token : () -> (<a href="hackwaly/moonyacc/tests/calc_jsoncst_test#Token">Token</a>, Int, Int), start_pos : Int) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="hackwaly/moonyacc/tests/calc_jsoncst_test#ParseError">ParseError</a>
```

