# Parser combinator

A simple parser combinator 简单的语法分析组合子

Support any stream with `Seq` 利用`Seq`支持各类流

## Usage 使用方法

```moonbit
test {
  let parser = pstring("Hello").and_then(pint)
  let Some(result, _) = parser.parse(Seq::from_string("Hello1234"))
  inspect(result, content="Hello")
}
```
---
# Documentation
|Type|description|
|---|---|
|[Parser](#Parser)| A parser combinator|
|[Seq](#Seq)| A possibily infinate lazy list|

|Value|description|
|---|---|
|[lift2](#lift2)||
|[one\_of](#one_of)||
|[pchar](#pchar)||
|[pchar\_such\_that](#pchar_such_that)||
|[pconst](#pconst)| Parser that always succeed with given value|
|[pdigit](#pdigit)| parse digit|
|[pfail](#pfail)| Parser that always fail|
|[pint](#pint)| parser for integer|
|[pint64](#pint64)| parser for integer 64 bits|
|[pstring](#pstring)| parser that tries to match the given string|
|[pvalue](#pvalue)| Parses a token with predicate|
|[sequence](#sequence)||

## Parser

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,2:::pub type Parser (<a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[Token]) -> (Value, <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[Token])?
```
 A parser combinator

#### mooncakes-io-method-mark-Methods
- #### and\_then
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,93:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::and_then[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], other : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, (A, B)]
  ```
  > 
- #### apply
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,151:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::apply[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], f : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, (A) -> B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]
  ```
  > 
- #### between
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,325:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::between[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], around : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
  ```
  > 
- #### map
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,136:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::map[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], f : (A) -> B) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]
  ```
  > 
- #### omit\_first
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,313:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::omit_first[Token, A, B](parser : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, (A, B)]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]
  ```
  > 
- #### omit\_second
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,319:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::omit_second[Token, A, B](parser : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, (A, B)]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
  ```
  > 
- #### optional
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,309:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::optional[Token, A](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A?]
  ```
  > 
- #### or\_else
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,112:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::or_else[Token, A](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], other : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
  ```
  > 
- #### or\_others
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,126:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::or_others[Token, A](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], others : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[<a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
  ```
  > 
- #### parse
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,9:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::parse[Token, Value](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, Value], sequence : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[Token]) -> (Value, <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[Token])?
  ```
  >  Parses a sequence of tokens
  > 
  >  If the parsing succeeds, `Some(result, rest)` is returned  
  > Otherwise, `None` is returned.
  > TODO: Move to `Result[A, B]`
- #### ref
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,332:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::ref[Token, A](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[<a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
  ```
  > 
- #### repeat
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,242:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::repeat[Token, A](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
  ```
  > 
- #### repeat\_0\_to\_n
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,200:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::repeat_0_to_n[Token, A](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], n : Int) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
  ```
  > 
- #### repeat\_0\_to\_n\_with\_sep
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,207:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::repeat_0_to_n_with_sep[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], n : Int, separator : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
  ```
  > 
- #### repeat\_n
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,158:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::repeat_n[Token, A](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], n : Int) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
  ```
  > 
- #### repeat\_n\_with\_sep
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,165:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::repeat_n_with_sep[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], n : Int, sep : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
  ```
  > 
- #### repeat\_with\_sep
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/parsec.mbt,248:::fn <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>::repeat_with_sep[Token, A, B](self : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], separator : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
  ```
  > 

## Seq

```moonbit
:::source,peter-jerry-ye/parser-combinator/seq.mbt,2:::pub type Seq () -> (T, <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T])?
```
 A possibily infinate lazy list

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,12:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::default[T]() -> <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]
  ```
  > 
- #### from\_array
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,74:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::from_array[T](array : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]
  ```
  >  Construct a sequence from array
- #### from\_list
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,33:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::from_list[T](list : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]
  ```
  >  Construct a sequence from list
- #### from\_string
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,45:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::from_string(str : String) -> <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[Char]
  ```
  >  Construct a sequence from string
- #### is\_empty
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,5:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::is_empty[T](seq : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]) -> Bool
  ```
  >  Checks if the sequence is empty
- #### length
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,85:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::length[T](self : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]) -> Int
  ```
  > 
- #### map
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,28:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::map[T1, T2](seq : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T1], f : (T1) -> T2) -> <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T2]
  ```
  >  Map the sequence
  > 
  >  If the sequence is x0, x1, ... then `seq.map(f)` is f(x0), f(x1), ...
- #### output
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,99:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T], log : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,92:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::to_string[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]) -> String
  ```
  > 
- #### uncons
  ```moonbit
  :::source,peter-jerry-ye/parser-combinator/seq.mbt,21:::fn <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>::uncons[T](seq : <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T]) -> (T, <a href="peter-jerry-ye/parser-combinator#Seq">Seq</a>[T])?
  ```
  >  Unwrap a sequence
  > 
  >  If `seq` is empty, then `seq.uncons()` is `None`  
  > Else is `Some(hd, tl)` where `hd` is the head of the sequence
  > and `tl` is the tail

## lift2

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,48:::fn lift2[Token, A, B, C](f : (A, B) -> C) -> ((<a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A], <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, B]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, C])
```


## one\_of

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,350:::fn one_of[A : <a href="moonbitlang/core/builtin#Show">Show</a>](array : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, A]
```


## pchar

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,341:::fn pchar(char : Char) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, Char]
```


## pchar\_such\_that

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,337:::fn pchar_such_that(predicate : (Char) -> Bool) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, Char]
```


## pconst

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,44:::fn pconst[Token, A](a : A) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
```
 Parser that always succeed with given value

## pdigit

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,348:::let pdigit : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, Int]
```
 parse digit

 %x30-39

## pfail

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,39:::fn pfail[Token, A]() -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]
```
 Parser that always fail

## pint

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,376:::let pint : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, Int]
```
 parser for integer

 \[ "-" \] ( %x30 / (%x31-39) \*(%x30-39)

## pint64

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,391:::let pint64 : <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, Int64]
```
 parser for integer 64 bits

 \[ "-" \] ( %x30 / (%x31-39) \*(%x30-39)

## pstring

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,415:::fn pstring(string : String) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Char, String]
```
 parser that tries to match the given string

## pvalue

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,20:::fn pvalue[Token, Value](predicate : (Token) -> Value?) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, Value]
```
 Parses a token with predicate

 The predicate should return `Some(value)` if the tokens fulfills
or `None` otherwise

## sequence

```moonbit
:::source,peter-jerry-ye/parser-combinator/parsec.mbt,54:::fn sequence[Token, A](parsers : <a href="moonbitlang/core/array#Array">Array</a>[<a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, A]]) -> <a href="peter-jerry-ye/parser-combinator#Parser">Parser</a>[Token, <a href="moonbitlang/core/array#Array">Array</a>[A]]
```

