# Rational

The `Rational` type represents a rational number, which is a number that can be expressed as a fraction `a/b` where `a` and `b` are integers and `b` is not zero.

# Usage

## Arithmetic Operations

The `Rational` type supports the following arithmetic operations:

```moonbit
let a = @rational.new(1L, 2L)
let b = @rational.new(1L, 3L)
let c = a + b // 5/6
let d = a - b // 1/6
let e = a * b // 1/6
let f = a / b // 3/2
let g = -a // -1/2
let h = a.reciprocal() // 2/1
let i = g.abs() // 1/2
```

## Comparison Operations

The `Rational` type supports the following comparison operations:

```moonbit
let a = @rational.new(1L, 2L)
let b = @raitonal.new(1L, 3L)
let c = a == b // false
let d = a != b // true
let e = a < b // false
let f = a <= b // false
let g = a > b // true
let h = a >= b // true
let i = a.compare(b) // -1
```

## Integer Operations

The `Rational` type supports the following integer operations:

```moonbit
let a = @rational.new(1L, 2L)
let c = a.floor() // 0
let d = a.ceil() // 1
let b = a.fract() // 1
let e = a.trunc() // 0
let h = a.is_integer() // false
```

## Double Operations

The `Rational` type supports the following double operations:

```moonbit
let a = @rational.new(1L, 2L)
let b = a.to_double() // 0.5
let c = @rational.from_double(0.5) // 1/2
```

## String Operations

The `Rational` type supports the following string operations:

```moonbit
let a = @rational.new(1L, 2L)
let b = a.to_string() // "1/2"
```


---
# Documentation
|Type|description|
|---|---|
|[RationalError](#RationalError)||
|[T](#T)||

## RationalError

```moonbit
:::source,moonbitlang/core/rational/rational.mbt,167:::pub(all) type! RationalError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,177:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/rational#RationalError">RationalError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/rational/rational.mbt,177:::fn op_equal(self : <a href="moonbitlang/core/rational#RationalError">RationalError</a>, other : <a href="moonbitlang/core/rational#RationalError">RationalError</a>) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,170:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/rational#RationalError">RationalError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/rational/rational.mbt,170:::fn output(self : <a href="moonbitlang/core/rational#RationalError">RationalError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## T

```moonbit
:::source,moonbitlang/core/rational/rational.mbt,25:::type T
```

 Rational number type.
 
 Invariants:
 - The denominator is always positive.
 - The numerator and denominator are always coprime.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,305:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/rational/rational.mbt,305:::fn output(self : <a href="moonbitlang/core/rational#T">T</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,319:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> for <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/rational/rational.mbt,319:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/rational#T">T</a>
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,125:::fn <a href="moonbitlang/core/rational#T">T</a>::abs(self : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  >  Returns the absolute value of a rational number.
- #### ceil
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,265:::fn <a href="moonbitlang/core/rational#T">T</a>::ceil(self : <a href="moonbitlang/core/rational#T">T</a>) -> Int64
  ```
  > 
  >  Ceils a rational number towards positive infinity.
- #### compare
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,137:::fn <a href="moonbitlang/core/rational#T">T</a>::compare(self : <a href="moonbitlang/core/rational#T">T</a>, other : <a href="moonbitlang/core/rational#T">T</a>) -> Int
  ```
  > 
  >  Compares two rational numbers.
- #### floor
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,277:::fn <a href="moonbitlang/core/rational#T">T</a>::floor(self : <a href="moonbitlang/core/rational#T">T</a>) -> Int64
  ```
  > 
  >  Floors a rational number towards negative infinity.
- #### fract
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,300:::fn <a href="moonbitlang/core/rational#T">T</a>::fract(self : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  >  Fractional part of a rational number.
  > Same as `self - self.trunc()`.
- #### from\_double
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,188:::fn <a href="moonbitlang/core/rational#T">T</a>::from_double(value : Double) -> <a href="moonbitlang/core/rational#T">T</a>!<a href="moonbitlang/core/rational#RationalError">RationalError</a>
  ```
  > 
  >  Returns the approximate rational value of a double.
- #### is\_integer
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,333:::fn <a href="moonbitlang/core/rational#T">T</a>::is_integer(self : <a href="moonbitlang/core/rational#T">T</a>) -> Bool
  ```
  > 
- #### neg
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,119:::fn <a href="moonbitlang/core/rational#T">T</a>::neg(self : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  >  Returns the negation of a rational number.
- #### new
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,42:::fn <a href="moonbitlang/core/rational#T">T</a>::new(numerator : Int64, denominator : Int64) -> <a href="moonbitlang/core/rational#T">T</a>?
  ```
  > 
  >  Creates a rational number.
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,69:::fn <a href="moonbitlang/core/rational#T">T</a>::op_add(self : <a href="moonbitlang/core/rational#T">T</a>, other : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  >  NOTE: we don't check overflow here, to align with the `op_add` of `Int64`.
  > TODO: add a `checked_add` method.
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,93:::fn <a href="moonbitlang/core/rational#T">T</a>::op_div(self : <a href="moonbitlang/core/rational#T">T</a>, other : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,131:::fn <a href="moonbitlang/core/rational#T">T</a>::op_equal(self : <a href="moonbitlang/core/rational#T">T</a>, other : <a href="moonbitlang/core/rational#T">T</a>) -> Bool
  ```
  > 
  >  Equal to operator for rational numbers.
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,85:::fn <a href="moonbitlang/core/rational#T">T</a>::op_mul(self : <a href="moonbitlang/core/rational#T">T</a>, other : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,77:::fn <a href="moonbitlang/core/rational#T">T</a>::op_sub(self : <a href="moonbitlang/core/rational#T">T</a>, other : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
- #### reciprocal
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,109:::fn <a href="moonbitlang/core/rational#T">T</a>::reciprocal(self : <a href="moonbitlang/core/rational#T">T</a>) -> <a href="moonbitlang/core/rational#T">T</a>
  ```
  > 
  >  Returns the reciprocal of a rational number.
- #### to\_double
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,151:::fn <a href="moonbitlang/core/rational#T">T</a>::to_double(self : <a href="moonbitlang/core/rational#T">T</a>) -> Double
  ```
  > 
  >  Returns the approximate double value of a rational number.
- #### trunc
  ```moonbit
  :::source,moonbitlang/core/rational/rational.mbt,289:::fn <a href="moonbitlang/core/rational#T">T</a>::trunc(self : <a href="moonbitlang/core/rational#T">T</a>) -> Int64
  ```
  > 
  >  Rounds a rational number towards zero.
