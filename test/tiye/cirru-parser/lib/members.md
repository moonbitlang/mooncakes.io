# Documentation
|Type|description|
|---|---|
|[Cirru](#Cirru)| Cirru uses nested Vecters and Strings as data structure|
|[CirruLexItem](#CirruLexItem)||
|[CirruLexState](#CirruLexState)||
|[CirruParseError](#CirruParseError)||
|[CirruWriterOptions](#CirruWriterOptions)| options for writer, \`use\_inline\` for more compact format.|
|[FormatCirruError](#FormatCirruError)||
|[FormatError](#FormatError)||
|[WriterNode](#WriterNode)||

|Value|description|
|---|---|
|[format](#format)| format Cirru code, use options to control \`use\_inline\` option|
|[format\_to\_lisp](#format_to_lisp)| format program to Cirru to Lisp-like code|
|[parse](#parse)| main function to parse Cirru code into syntax tree|

## Cirru

```moonbit
:::source,tiye/cirru-parser/lib/primes.mbt,2:::pub(all) enum Cirru {
  Leaf(String)
  List(<a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-parser/lib#Cirru">Cirru</a>])
}
```
 Cirru uses nested Vecters and Strings as data structure

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,48:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="tiye/cirru-parser/lib#Cirru">Cirru</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,10:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/cirru-parser/lib#Cirru">Cirru</a> with hash(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Int
  ```
  > 
- ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,23:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="tiye/cirru-parser/lib#Cirru">Cirru</a> with hash_combine(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,7:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-parser/lib#Cirru">Cirru</a> with op_equal(<a href="tiye/cirru-parser/lib#Cirru">Cirru</a>, <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,101:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::compare(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>, other : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Int
  ```
  > 
- #### from\_json
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,48:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- #### hash
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,10:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::hash(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,23:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::hash_combine(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### is\_comment
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,154:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::is_comment(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Bool
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,130:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::is_empty(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Bool
  ```
  > 
- #### is\_nested
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,138:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::is_nested(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Bool
  ```
  > 
- #### length
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,122:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::length(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,7:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::op_equal(<a href="tiye/cirru-parser/lib#Cirru">Cirru</a>, <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,73:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::output(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,34:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::to_json(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,78:::fn <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>::to_string(self : <a href="tiye/cirru-parser/lib#Cirru">Cirru</a>) -> String
  ```
  > 

## CirruLexItem

```moonbit
:::source,tiye/cirru-parser/lib/primes.mbt,171:::type CirruLexItem
```


## CirruLexState

```moonbit
:::source,tiye/cirru-parser/lib/primes.mbt,162:::type CirruLexState
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,168:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="tiye/cirru-parser/lib#CirruLexState">CirruLexState</a> with output(<a href="tiye/cirru-parser/lib#CirruLexState">CirruLexState</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,tiye/cirru-parser/lib/primes.mbt,168:::fn <a href="tiye/cirru-parser/lib#CirruLexState">CirruLexState</a>::output(<a href="tiye/cirru-parser/lib#CirruLexState">CirruLexState</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-parser/lib/traits.mbt,85:::fn <a href="tiye/cirru-parser/lib#CirruLexState">CirruLexState</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CirruParseError

```moonbit
:::source,tiye/cirru-parser/lib/parser.mbt,70:::type CirruParseError
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-parser/lib/parser.mbt,73:::fn <a href="tiye/cirru-parser/lib#CirruParseError">CirruParseError</a>::to_string(self : <a href="tiye/cirru-parser/lib#CirruParseError">CirruParseError</a>) -> String
  ```
  >  display Cirru parse error

## CirruWriterOptions

```moonbit
:::source,tiye/cirru-parser/lib/writer.mbt,146:::pub(all) struct CirruWriterOptions {
  use_inline : Bool
}
```
 options for writer, `use_inline` for more compact format.

## FormatCirruError

```moonbit
:::source,tiye/cirru-parser/lib/writer.mbt,168:::pub(all) type! FormatCirruError String

```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,tiye/cirru-parser/lib/writer.mbt,171:::fn <a href="tiye/cirru-parser/lib#FormatCirruError">FormatCirruError</a>::to_string(self : <a href="tiye/cirru-parser/lib#FormatCirruError">FormatCirruError</a>) -> String
  ```
  > 

## FormatError

```moonbit
:::source,tiye/cirru-parser/lib/s_expr.mbt,2:::type FormatError
```


## WriterNode

```moonbit
:::source,tiye/cirru-parser/lib/writer.mbt,2:::type WriterNode
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/cirru-parser/lib/writer.mbt,8:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/cirru-parser/lib#WriterNode">WriterNode</a> with op_equal(<a href="tiye/cirru-parser/lib#WriterNode">WriterNode</a>, <a href="tiye/cirru-parser/lib#WriterNode">WriterNode</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,tiye/cirru-parser/lib/writer.mbt,8:::fn <a href="tiye/cirru-parser/lib#WriterNode">WriterNode</a>::op_equal(<a href="tiye/cirru-parser/lib#WriterNode">WriterNode</a>, <a href="tiye/cirru-parser/lib#WriterNode">WriterNode</a>) -> Bool
  ```
  > automatically derived

## format

```moonbit
:::source,tiye/cirru-parser/lib/writer.mbt,331:::fn format(xs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-parser/lib#Cirru">Cirru</a>], options : <a href="tiye/cirru-parser/lib#CirruWriterOptions">CirruWriterOptions</a>) -> String!<a href="tiye/cirru-parser/lib#FormatCirruError">FormatCirruError</a>
```
 format Cirru code, use options to control `use_inline` option

## format\_to\_lisp

```moonbit
:::source,tiye/cirru-parser/lib/s_expr.mbt,5:::fn format_to_lisp(xs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-parser/lib#Cirru">Cirru</a>]) -> String!<a href="tiye/cirru-parser/lib#FormatError">FormatError</a>
```
 format program to Cirru to Lisp-like code

## parse

```moonbit
:::source,tiye/cirru-parser/lib/parser.mbt,61:::fn parse(code : String) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/cirru-parser/lib#Cirru">Cirru</a>]!<a href="tiye/cirru-parser/lib#CirruParseError">CirruParseError</a>
```
 main function to parse Cirru code into syntax tree
