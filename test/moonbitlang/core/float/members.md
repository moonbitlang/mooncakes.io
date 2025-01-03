# Documentation
|Type|description|
|---|---|
|[Float](#Float)||

|Value|description|
|---|---|
|[infinity](#infinity)||
|[max\_value](#max_value)||
|[min\_positive](#min_positive)||
|[min\_value](#min_value)||
|[neg\_infinity](#neg_infinity)||
|[not\_a\_number](#not_a_number)||

## infinity

```moonbit
:::source,moonbitlang/core/float/float.mbt,19:::let infinity : float
```


## max\_value

```moonbit
:::source,moonbitlang/core/float/float.mbt,25:::let max_value : float
```


## min\_positive

```moonbit
:::source,moonbitlang/core/float/float.mbt,31:::let min_positive : float
```


## min\_value

```moonbit
:::source,moonbitlang/core/float/float.mbt,28:::let min_value : float
```


## neg\_infinity

```moonbit
:::source,moonbitlang/core/float/float.mbt,22:::let neg_infinity : float
```


## not\_a\_number

```moonbit
:::source,moonbitlang/core/float/float.mbt,16:::let not_a_number : float
```


## Float


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/float/float.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/float#Float">Float</a> with output(self : float, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,34:::fn <a href="moonbitlang/core/float#Float">Float</a>::abs(self : float) -> float
  ```
  > 
- #### ceil
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,19:::fn <a href="moonbitlang/core/float#Float">Float</a>::ceil(self : float) -> float
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,42:::fn <a href="moonbitlang/core/float#Float">Float</a>::default() -> float
  ```
  > 
- #### exp
  ```moonbit
  :::source,moonbitlang/core/float/exp.mbt,74:::fn <a href="moonbitlang/core/float#Float">Float</a>::exp(self : float) -> float
  ```
  > 
- #### floor
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,22:::fn <a href="moonbitlang/core/float#Float">Float</a>::floor(self : float) -> float
  ```
  > 
- #### ln
  ```moonbit
  :::source,moonbitlang/core/float/log.mbt,51:::fn <a href="moonbitlang/core/float#Float">Float</a>::ln(self : float) -> float
  ```
  > 
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/float/mod.mbt,16:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_mod(self : float, other : float) -> float
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,37:::fn <a href="moonbitlang/core/float#Float">Float</a>::output(self : float, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### pow
  ```moonbit
  :::source,moonbitlang/core/float/pow.mbt,16:::fn <a href="moonbitlang/core/float#Float">Float</a>::pow(self : float, other : float) -> float
  ```
  > 
- #### round
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,26:::fn <a href="moonbitlang/core/float#Float">Float</a>::round(self : float) -> float
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,74:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_int(self : float) -> Int
  ```
  > 
  >  Converts a floating-point number to an integer, with proper handling of
  > special cases such as NaN and values outside the range of 32-bit integers.
  > 
  >  Parameters:
  > 
  >  * `self` : The floating-point number to be converted.
  > 
  >  Returns an integer representation of the float value. Specifically:
  >  * `0` for `@float.not_a_number` (NaN),
  >  * `@int.max_value` (2147483647) for values greater than `@int.max_value`,
  >  * `@int.min_value` (-2147483648) for values less than `@int.min_value`.
  >  * truncated (towards zero) integer value for other cases.
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "Float::to_int/normal" {
  >    inspect!((1.5 : Float).to_int(), content="1")
  >    inspect!((-1.5 : Float).to_int(), content="-1")
  >    inspect!(@float.not_a_number.to_int(), content="0")
  >    inspect!(@float.infinity.to_int(), content="2147483647")
  >    inspect!(@float.neg_infinity.to_int(), content="-2147483648")
  >  }
  >  ```
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/float/traits.mbt,85:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### trunc
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,16:::fn <a href="moonbitlang/core/float#Float">Float</a>::trunc(self : float) -> float
  ```
  > 
