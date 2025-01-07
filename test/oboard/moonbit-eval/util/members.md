# Documentation
|Type|description|
|---|---|
|[IndentLogger](#IndentLogger)||

|Value|description|
|---|---|
|[die](#die)||
|[i32\_to\_hex](#i32_to_hex)||
|[i64\_to\_hex](#i64_to_hex)||

## IndentLogger

```moonbit
:::source,oboard/moonbit-eval/util/indent_logger.mbt,1:::type IndentLogger
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,60:::impl <a href="moonbitlang/core/builtin#Logger">Logger</a> for <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a> with write_char(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>, c : Char) -> Unit
  ```
  > 
- ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,30:::impl <a href="moonbitlang/core/builtin#Logger">Logger</a> for <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a> with write_substring(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>, s : String, start : Int, len : Int) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### indent
  ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,17:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::indent(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,7:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::new(logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>
  ```
  > 
- #### outdent
  ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,21:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::outdent(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>) -> Unit
  ```
  > 
- #### write\_char
  ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,60:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::write_char(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>, c : Char) -> Unit
  ```
  > 
- #### write\_string
  ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,25:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::write_string(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>, s : String) -> Unit
  ```
  > 
- #### write\_sub\_string
  ```moonbit
  :::source,oboard/moonbit-eval/util/traits.mbt,63:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::write_sub_string[Self : <a href="moonbitlang/core/builtin#Logger">Logger</a>](self : Self, value : String, start : Int, len : Int) -> Unit
  ```
  > 
- #### write\_substring
  ```moonbit
  :::source,oboard/moonbit-eval/util/indent_logger.mbt,30:::fn <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>::write_substring(self : <a href="oboard/moonbit-eval/util#IndentLogger">IndentLogger</a>, s : String, start : Int, len : Int) -> Unit
  ```
  > 

## die

```moonbit
:::source,oboard/moonbit-eval/util/error.mbt,1:::fn die[T](msg : String) -> T
```


## i32\_to\_hex

```moonbit
:::source,oboard/moonbit-eval/util/tohex.mbt,1:::fn i32_to_hex(v : Int) -> String
```


## i64\_to\_hex

```moonbit
:::source,oboard/moonbit-eval/util/tohex.mbt,15:::fn i64_to_hex(v : Int64) -> String
```

