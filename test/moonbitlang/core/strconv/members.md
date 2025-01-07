# Strconv

This package implements conversions to and from string representations of basic data types.

# Usage

## Parse

Use `parse_bool`, `parse_double`, `parse_int`, and `parse_int64` convert strings to values.

```moonbit
let b = @strconv.parse_bool("true")?         // true
let i1 = @strconv.parse_int("1234567")?      // 1234567
let i2 = @strconv.parse_int("101", 2)?       // 5
let d = @strconv.parse_double("123.4567")?   // 123.4567
```

For types that implement the `FromStr` trait, you can also use helper function `parse` to convert a string to a value.

```moonbit
let a : Int = @strconv.parse?("123").unwrap()   // 123 
let b : Bool = @strconv.parse?("true").unwrap() // true
```

---
# Documentation
|Trait|description|
|---|---|
|[FromStr](#FromStr)||

|Type|description|
|---|---|
|[Decimal](#Decimal)||
|[StrConvError](#StrConvError)||

|Value|description|
|---|---|
|[parse](#parse)||
|[parse\_bool](#parse_bool)||
|[parse\_double](#parse_double)||
|[parse\_int](#parse_int)||
|[parse\_int64](#parse_int64)||

## FromStr

```moonbit
:::source,moonbitlang/core/strconv/traits.mbt,22:::pub(open) trait FromStr {
  from_string(String) -> Self!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/strconv/traits.mbt,27:::impl <a href="moonbitlang/core/strconv#FromStr">FromStr</a> for <a href="moonbitlang/core/bool#Bool">Bool</a> with from_string(str : String) -> Bool!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/strconv/traits.mbt,30:::impl <a href="moonbitlang/core/strconv#FromStr">FromStr</a> for <a href="moonbitlang/core/int#Int">Int</a> with from_string(str : String) -> Int!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/strconv/traits.mbt,33:::impl <a href="moonbitlang/core/strconv#FromStr">FromStr</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with from_string(str : String) -> Int64!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/strconv/traits.mbt,36:::impl <a href="moonbitlang/core/strconv#FromStr">FromStr</a> for <a href="moonbitlang/core/double#Double">Double</a> with from_string(str : String) -> Double!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
  ```
  > 

## Decimal

```moonbit
:::source,moonbitlang/core/strconv/decimal.mbt,22:::type Decimal
```

 High Precision Decimal structure for "Simple Decimal Conversion" algorithm.
Developed by Ken. Thompson, Russ Cox, Robert Griesemer, Nigel Tao.
 
 reference:
 - <https://nigeltao.github.io/blog/2020/parse-number-f64-simple.html>
 - <https://nigeltao.github.io/blog/2020/eisel-lemire.html>

#### mooncakes-io-method-mark-Methods
- #### from\_int64
  ```moonbit
  :::source,moonbitlang/core/strconv/decimal.mbt,56:::fn <a href="moonbitlang/core/strconv#Decimal">Decimal</a>::from_int64(v : Int64) -> <a href="moonbitlang/core/strconv#Decimal">Decimal</a>
  ```
  > 
  >  Create a decimal with an Int64 value.
- #### new
  ```moonbit
  :::source,moonbitlang/core/strconv/decimal.mbt,44:::fn <a href="moonbitlang/core/strconv#Decimal">Decimal</a>::new() -> <a href="moonbitlang/core/strconv#Decimal">Decimal</a>
  ```
  > 
  >  Create a zero decimal.
- #### parse\_decimal
  ```moonbit
  :::source,moonbitlang/core/strconv/decimal.mbt,62:::fn <a href="moonbitlang/core/strconv#Decimal">Decimal</a>::parse_decimal(str : String) -> <a href="moonbitlang/core/strconv#Decimal">Decimal</a>!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
  ```
  > 
  >  Create a decimal from number string.
- #### shift
  ```moonbit
  :::source,moonbitlang/core/strconv/decimal.mbt,234:::fn <a href="moonbitlang/core/strconv#Decimal">Decimal</a>::shift(self : <a href="moonbitlang/core/strconv#Decimal">Decimal</a>, s : Int) -> Unit
  ```
  > 
  >  Binary shift left (s \> 0) or right (s \< 0).
  > The shift count must not larger than the max\_shift to avoid overflow.
- #### to\_double
  ```moonbit
  :::source,moonbitlang/core/strconv/decimal.mbt,148:::fn <a href="moonbitlang/core/strconv#Decimal">Decimal</a>::to_double(self : <a href="moonbitlang/core/strconv#Decimal">Decimal</a>) -> Double!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
  ```
  > 
  >  Convert the decimal to Double.

## StrConvError

```moonbit
:::source,moonbitlang/core/strconv/errors.mbt,16:::pub(all) type! StrConvError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/strconv/errors.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/strconv#StrConvError">StrConvError</a> with output(self : <a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/core/strconv/errors.mbt,19:::fn <a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>::output(self : <a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/strconv/traits.mbt,85:::fn <a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## parse

```moonbit
:::source,moonbitlang/core/strconv/traits.mbt,39:::fn parse[A : <a href="moonbitlang/core/strconv#FromStr">FromStr</a>](str : String) -> A!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
```


## parse\_bool

```moonbit
:::source,moonbitlang/core/strconv/bool.mbt,17:::fn parse_bool(str : String) -> Bool!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
```

 Parse a string and return the represented boolean value or an error.

## parse\_double

```moonbit
:::source,moonbitlang/core/strconv/double.mbt,49:::fn parse_double(str : String) -> Double!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
```


## parse\_int

```moonbit
:::source,moonbitlang/core/strconv/int.mbt,103:::fn parse_int(str : String, base~ : Int = ..) -> Int!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
```

 Parse a string in the given base (0, 2 to 36), return a Int number or an error.
If the `~base` argument is 0, the base will be inferred by the prefix.

## parse\_int64

```moonbit
:::source,moonbitlang/core/strconv/int.mbt,30:::fn parse_int64(str : String, base~ : Int = ..) -> Int64!<a href="moonbitlang/core/strconv#StrConvError">StrConvError</a>
```

 Parse a string in the given base (0, 2 to 36), return a Int64 number or an error.
If the `~base` argument is 0, the base will be inferred by the prefix.
