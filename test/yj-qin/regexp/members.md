# RegExp
[![check](https://github.com/yj-qin/regexp/actions/workflows/check.yml/badge.svg)](https://github.com/yj-qin/regexp/actions/workflows/check.yml)

A regular expression module based on a backtracking engine. Due to backtracking during matching, some regular expressions will run for a long time under specific inputs, also known as catastrophic backtracking.
The design of the bytecode and interpreter was heavily inspired by the .NET regular expression library.

## Usage

```
let regexp = @regexp.compile("^(?<addr>[a-zA-Z0-9._%+-]+)@(?<host>[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})$")?
let match_result = regexp.matches("12345@test.com")
println(match_result.success()) // true
println(match_result.captures()) // ["12345@test.com", "12345", "test.com"]
println(match_result.named_captures()) // {"addr": "12345", "host": "test.com"}
```

## Features

### Character classes

- [x] Character range
- [x] Escapes (e.g. `\d`, `\D`, `\s`, `\S`, `\w`, `\W`)

### Assertions

- [x] Begin of input
- [x] End of input
- [ ] Word boundary
- [ ] Lookaround

### Groups

- [x] Capturing group
- [x] Non-capturing group
- [x] Named capturing group

### Backreferences

- [ ] Group backreference
- [ ] Named backreference

### Quantifiers

- [x] Zero or more (\*)
- [x] Zero or one (?)
- [x] One or more (+)
- [x] Range ({n}, {n,}, {n, m})
- [x] Non-greedy

### Encodings

- [ ] Unicode

---
# Documentation
|Type|description|
|---|---|
|[MatchResult](#MatchResult)||
|[ParseError](#ParseError)||
|[RegExp](#RegExp)||

|Value|description|
|---|---|
|[compile](#compile)||

## MatchResult

```moonbit
:::source,yj-qin/regexp/result.mbt,2:::type MatchResult
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yj-qin/regexp/result.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yj-qin/regexp#MatchResult">MatchResult</a>
  ```
  > 
  * ```moonbit
    :::source,yj-qin/regexp/result.mbt,6:::fn output(<a href="yj-qin/regexp#MatchResult">MatchResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### captures
  ```moonbit
  :::source,yj-qin/regexp/result.mbt,14:::fn <a href="yj-qin/regexp#MatchResult">MatchResult</a>::captures(self : <a href="yj-qin/regexp#MatchResult">MatchResult</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
  ```
  > 
- #### named\_captures
  ```moonbit
  :::source,yj-qin/regexp/result.mbt,19:::fn <a href="yj-qin/regexp#MatchResult">MatchResult</a>::named_captures(self : <a href="yj-qin/regexp#MatchResult">MatchResult</a>) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
  ```
  > 
- #### success
  ```moonbit
  :::source,yj-qin/regexp/result.mbt,9:::fn <a href="yj-qin/regexp#MatchResult">MatchResult</a>::success(self : <a href="yj-qin/regexp#MatchResult">MatchResult</a>) -> Bool
  ```
  > 

## ParseError

```moonbit
:::source,yj-qin/regexp/parser.mbt,5:::pub(all) enum ParseError {
  InternalParserError
  UnmatchedGroupBegin(Int)
  UnmatchedGroupEnd(Int)
  UnmatchedGroupName(Int)
  EmptyGroupName(Int)
  EmptyGroup(Int)
  UnmatchedCharClassEnd(Int)
  UnspecifiedLoopTarget(Int)
  InvalidLoop(Int)
  LoopCountOutOfRange(Int)
  LoopMaxCountSmallerThanMinCount(Int)
  EndPatternAtEscape(Int)
  ClassMissingBracket(Int)
  GroupMissingParen(Int)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yj-qin/regexp/parser.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yj-qin/regexp#ParseError">ParseError</a>
  ```
  > 
  * ```moonbit
    :::source,yj-qin/regexp/parser.mbt,20:::fn op_equal(<a href="yj-qin/regexp#ParseError">ParseError</a>, <a href="yj-qin/regexp#ParseError">ParseError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yj-qin/regexp/parser.mbt,20:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yj-qin/regexp#ParseError">ParseError</a>
  ```
  > 
  * ```moonbit
    :::source,yj-qin/regexp/parser.mbt,20:::fn output(<a href="yj-qin/regexp#ParseError">ParseError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## RegExp

```moonbit
:::source,yj-qin/regexp/regexp.mbt,2:::type RegExp
```


#### mooncakes-io-method-mark-Methods
- #### matches
  ```moonbit
  :::source,yj-qin/regexp/regexp.mbt,25:::fn <a href="yj-qin/regexp#RegExp">RegExp</a>::matches(self : <a href="yj-qin/regexp#RegExp">RegExp</a>, text : String, start~ : Int = .., end~ : Int = ..) -> <a href="yj-qin/regexp#MatchResult">MatchResult</a>
  ```
  > 
- #### pattern
  ```moonbit
  :::source,yj-qin/regexp/regexp.mbt,20:::fn <a href="yj-qin/regexp#RegExp">RegExp</a>::pattern(self : <a href="yj-qin/regexp#RegExp">RegExp</a>) -> String
  ```
  > 

## compile

```moonbit
:::source,yj-qin/regexp/regexp.mbt,15:::fn compile(pattern : String) -> <a href="yj-qin/regexp#RegExp">RegExp</a>!<a href="moonbitlang/core/error#Error">Error</a>
```

