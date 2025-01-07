# Moonbit/Core Json5

This is roughly ported from https://github.com/json5/json5

Currently, only parsing is implemented.

---
# Documentation
|Type|description|
|---|---|
|[ParseError](#ParseError)||
|[ParseErrorData](#ParseErrorData)||
|[Position](#Position)||
|[Token](#Token)||

|Value|description|
|---|---|
|[parse](#parse)||

## ParseError

```moonbit
:::source,moonbitlang/x/json5/types.mbt,30:::pub(all) type! ParseError <a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a>

```


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,51:::fn <a href="moonbitlang/x/json5#ParseError">ParseError</a>::output(self : <a href="moonbitlang/x/json5#ParseError">ParseError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,38:::fn <a href="moonbitlang/x/json5#ParseError">ParseError</a>::to_string(self : <a href="moonbitlang/x/json5#ParseError">ParseError</a>) -> String
  ```
  > 

## ParseErrorData

```moonbit
:::source,moonbitlang/x/json5/types.mbt,22:::pub(all) enum ParseErrorData {
  InvalidChar(<a href="moonbitlang/x/json5#Position">Position</a>, Char)
  InvalidEof
  InvalidNumber(<a href="moonbitlang/x/json5#Position">Position</a>, String)
  InvalidIdentEscape(<a href="moonbitlang/x/json5#Position">Position</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,27:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a> with op_equal(<a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a>, <a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,27:::fn <a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a>::op_equal(<a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a>, <a href="moonbitlang/x/json5#ParseErrorData">ParseErrorData</a>) -> Bool
  ```
  > automatically derived

## Position

```moonbit
:::source,moonbitlang/x/json5/types.mbt,16:::pub(all) struct Position {
  line : Int
  column : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/json5#Position">Position</a> with op_equal(<a href="moonbitlang/x/json5#Position">Position</a>, <a href="moonbitlang/x/json5#Position">Position</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/json5#Position">Position</a> with output(<a href="moonbitlang/x/json5#Position">Position</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,19:::fn <a href="moonbitlang/x/json5#Position">Position</a>::op_equal(<a href="moonbitlang/x/json5#Position">Position</a>, <a href="moonbitlang/x/json5#Position">Position</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,moonbitlang/x/json5/types.mbt,19:::fn <a href="moonbitlang/x/json5#Position">Position</a>::output(<a href="moonbitlang/x/json5#Position">Position</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/json5/traits.mbt,85:::fn <a href="moonbitlang/x/json5#Position">Position</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## parse

```moonbit
:::source,moonbitlang/x/json5/parse.mbt,16:::fn parse(input : String) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="moonbitlang/x/json5#ParseError">ParseError</a>
```


## Token


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/json5/traits.mbt,85:::fn <a href="moonbitlang/x/json5#Token">Token</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
