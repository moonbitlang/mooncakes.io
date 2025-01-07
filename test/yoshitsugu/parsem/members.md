# Documentation
|Trait|description|
|---|---|
|[Parsable](#Parsable)||

|Type|description|
|---|---|
|[ParseError](#ParseError)||
|[ParseResult](#ParseResult)||
|[Parser](#Parser)||

|Value|description|
|---|---|
|[any\_char](#any_char)||
|[char](#char)||
|[choice](#choice)||
|[digit](#digit)||
|[digits](#digits)||
|[many](#many)||
|[many1](#many1)||
|[option](#option)||
|[parse](#parse)||
|[sep\_by](#sep_by)||
|[sep\_by1](#sep_by1)||
|[sequence](#sequence)||
|[sequence3](#sequence3)| \||
|[string](#string)||

## Parsable

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,41:::trait Parsable
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,51:::impl <a href="yoshitsugu/parsem#Parsable">Parsable</a> for <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a> with to_char_list(self : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[Char]) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[Char]
  ```
  > 
- ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,46:::impl <a href="yoshitsugu/parsem#Parsable">Parsable</a> for <a href="moonbitlang/core/string#String">String</a> with to_char_list(self : String) -> <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[Char]
  ```
  > 

## ParseError

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,2:::type ParseError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yoshitsugu/parsem#ParseError">ParseError</a> with output(self : <a href="yoshitsugu/parsem#ParseError">ParseError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,12:::fn <a href="yoshitsugu/parsem#ParseError">ParseError</a>::output(self : <a href="yoshitsugu/parsem#ParseError">ParseError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,yoshitsugu/parsem/traits.mbt,85:::fn <a href="yoshitsugu/parsem#ParseError">ParseError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ParseResult

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,30:::pub type ParseResult <a href="moonbitlang/core/result#Result">Result</a>[(T, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[Char]), <a href="yoshitsugu/parsem#ParseError">ParseError</a>]
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,31:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yoshitsugu/parsem#ParseResult">ParseResult</a> with output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="yoshitsugu/parsem#ParseResult">ParseResult</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,31:::fn <a href="yoshitsugu/parsem#ParseResult">ParseResult</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="yoshitsugu/parsem#ParseResult">ParseResult</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yoshitsugu/parsem/traits.mbt,85:::fn <a href="yoshitsugu/parsem#ParseResult">ParseResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Parser

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,35:::pub type Parser (<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[Char]) -> <a href="yoshitsugu/parsem#ParseResult">ParseResult</a>[T]
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,35:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yoshitsugu/parsem#Parser">Parser</a> with output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="yoshitsugu/parsem#Parser">Parser</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### bind
  ```moonbit
  :::source,yoshitsugu/parsem/combinator.mbt,187:::fn <a href="yoshitsugu/parsem#Parser">Parser</a>::bind[T, U](self : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], func : (T) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[U]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[U]
  ```
  > 
  >  Chains parsers by applying a function to the result of the first parser
  > to produce the next parser.
- #### map
  ```moonbit
  :::source,yoshitsugu/parsem/combinator.mbt,175:::fn <a href="yoshitsugu/parsem#Parser">Parser</a>::map[T, U](self : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], func : (T) -> U) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[U]
  ```
  > 
  >  Transforms the result of the parser using the provided function.
- #### output
  ```moonbit
  :::source,yoshitsugu/parsem/parser.mbt,35:::fn <a href="yoshitsugu/parsem#Parser">Parser</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="yoshitsugu/parsem#Parser">Parser</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### precede
  ```moonbit
  :::source,yoshitsugu/parsem/combinator.mbt,152:::fn <a href="yoshitsugu/parsem#Parser">Parser</a>::precede[T, U](self : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], next_parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[U]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[T]
  ```
  > 
  >  Applies two parsers sequentially until one of them fails.
  > Returns the result of the first successful parser(self).
- #### then
  ```moonbit
  :::source,yoshitsugu/parsem/combinator.mbt,140:::fn <a href="yoshitsugu/parsem#Parser">Parser</a>::then[T, U](self : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], next_parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[U]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[U]
  ```
  > 
  >  Applies two parsers sequentially until one of them fails.
  > Returns the result of the last successful parser.
- #### to\_string
  ```moonbit
  :::source,yoshitsugu/parsem/traits.mbt,85:::fn <a href="yoshitsugu/parsem#Parser">Parser</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## any\_char

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,132:::fn any_char() -> <a href="yoshitsugu/parsem#Parser">Parser</a>[Char]
```

 Just consumes any character

## char

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,61:::fn char(expected : Char) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[Char]
```

 Matches one character.
Returns matched character.

## choice

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,40:::fn choice[T](parsers : <a href="moonbitlang/core/array#Array">Array</a>[<a href="yoshitsugu/parsem#Parser">Parser</a>[T]]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[T]
```

 Applies the array of parsers one by one until one of them succeeds.
Returns the value of the succeeding parser.

## digit

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,78:::fn digit() -> <a href="yoshitsugu/parsem#Parser">Parser</a>[Char]
```

 Matches one digit character.
Returns matched character.

## digits

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,114:::fn digits[T : <a href="moonbitlang/core/strconv#FromStr">@moonbitlang/core/strconv.FromStr</a>]() -> <a href="yoshitsugu/parsem#Parser">Parser</a>[T]
```

 Matches digitsstring.
Returns matched digit string automatically convert into specific number type by @strconv.

## many

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,4:::fn many[T](parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[T]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```

 Applies the parser **zero** or more times.
Returns a immutable list of the returned values of parser.

## many1

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,23:::fn many1[T](parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[T]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```

 Applies the parser **one** or more times.
Returns a immutable list of the returned values of parser.

## option

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,164:::fn option[T](fallback_value : T, parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[T]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[T]
```

 Tries to apply the parser. If it fails without consuming input, it returns the value `fallback_value`,
otherwise the value returned by the parser

## parse

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,54:::fn parse[S : <a href="yoshitsugu/parsem#Parsable">Parsable</a>, T](parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], input : S) -> <a href="yoshitsugu/parsem#ParseResult">ParseResult</a>[T]
```


## sep\_by

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,97:::fn sep_by[T, U](parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], sep_by : <a href="yoshitsugu/parsem#Parser">Parser</a>[U]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```

 Applies **zero** or more occurrences of `parser` separated by `sep_by`.
Returns a immutable list of the values returned by the `parser`.

## sep\_by1

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,112:::fn sep_by1[T, U](parser : <a href="yoshitsugu/parsem#Parser">Parser</a>[T], sep_by : <a href="yoshitsugu/parsem#Parser">Parser</a>[U]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```

 Applies **one** or more occurrences of `parser` separated by `sep_by`.
Returns a immutable list of the values returned by the `parser`.

## sequence

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,62:::fn sequence[T1, T2](parser1 : <a href="yoshitsugu/parsem#Parser">Parser</a>[T1], parser2 : <a href="yoshitsugu/parsem#Parser">Parser</a>[T2]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[(T1, T2)]
```

 Applies 2 parsers until any parser fails.
Returns tuple of the result of the parsers.

## sequence3

```moonbit
:::source,yoshitsugu/parsem/combinator.mbt,81:::fn sequence3[T1, T2, T3](parser1 : <a href="yoshitsugu/parsem#Parser">Parser</a>[T1], parser2 : <a href="yoshitsugu/parsem#Parser">Parser</a>[T2], parser3 : <a href="yoshitsugu/parsem#Parser">Parser</a>[T3]) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[(T1, T2, T3)]
```
 \|
Applies 3 parsers until any parser fails.
Returns tuple of the result of the parsers.

## string

```moonbit
:::source,yoshitsugu/parsem/parser.mbt,95:::fn string(expected : String) -> <a href="yoshitsugu/parsem#Parser">Parser</a>[String]
```

 Matches one string.
Returns matched string.
