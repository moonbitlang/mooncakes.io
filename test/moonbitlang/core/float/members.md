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
:::source,moonbitlang/core/float/float.mbt,19:::let infinity : Float
```


## max\_value

```moonbit
:::source,moonbitlang/core/float/float.mbt,25:::let max_value : Float
```


## min\_positive

```moonbit
:::source,moonbitlang/core/float/float.mbt,31:::let min_positive : Float
```


## min\_value

```moonbit
:::source,moonbitlang/core/float/float.mbt,28:::let min_value : Float
```


## neg\_infinity

```moonbit
:::source,moonbitlang/core/float/float.mbt,22:::let neg_infinity : Float
```


## not\_a\_number

```moonbit
:::source,moonbitlang/core/float/float.mbt,16:::let not_a_number : Float
```


## Float


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/float/float.mbt,47:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for Float
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/float/float.mbt,47:::fn hash(self : Float) -> Int
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/core/float/float.mbt,52:::fn hash_combine(self : Float, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/float/float.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for Float
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/float/float.mbt,37:::fn output(self : Float, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,34:::fn <a href="moonbitlang/core/float#Float">Float</a>::abs(self : Float) -> Float
  ```
  > 
- #### ceil
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,19:::fn <a href="moonbitlang/core/float#Float">Float</a>::ceil(self : Float) -> Float
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,42:::fn <a href="moonbitlang/core/float#Float">Float</a>::default() -> Float
  ```
  > 
- #### exp
  ```moonbit
  :::source,moonbitlang/core/float/exp.mbt,74:::fn <a href="moonbitlang/core/float#Float">Float</a>::exp(self : Float) -> Float
  ```
  > 
- #### floor
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,22:::fn <a href="moonbitlang/core/float#Float">Float</a>::floor(self : Float) -> Float
  ```
  > 
- #### ln
  ```moonbit
  :::source,moonbitlang/core/float/log.mbt,51:::fn <a href="moonbitlang/core/float#Float">Float</a>::ln(self : Float) -> Float
  ```
  > 
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/float/mod.mbt,16:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_mod(self : Float, other : Float) -> Float
  ```
  > 
- #### pow
  ```moonbit
  :::source,moonbitlang/core/float/pow.mbt,16:::fn <a href="moonbitlang/core/float#Float">Float</a>::pow(self : Float, other : Float) -> Float
  ```
  > 
- #### round
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,26:::fn <a href="moonbitlang/core/float#Float">Float</a>::round(self : Float) -> Float
  ```
  > 
- #### to\_be\_bytes
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,57:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_be_bytes(self : Float) -> Bytes
  ```
  >  Converts the Float to a Bytes in big-endian byte order.
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/float/to_int_wasm.mbt,40:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_int(self : Float) -> Int
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
- #### to\_le\_bytes
  ```moonbit
  :::source,moonbitlang/core/float/float.mbt,62:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_le_bytes(self : Float) -> Bytes
  ```
  >  Converts the Float to a Bytes in little-endian byte order.
- #### trunc
  ```moonbit
  :::source,moonbitlang/core/float/round_wasm.mbt,16:::fn <a href="moonbitlang/core/float#Float">Float</a>::trunc(self : Float) -> Float
  ```
  > 
