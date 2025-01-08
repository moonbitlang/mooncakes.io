# Documentation
|Type|description|
|---|---|
|[Double](#Double)||

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
:::source,moonbitlang/core/double/double.mbt,19:::let infinity : Double
```


## max\_value

```moonbit
:::source,moonbitlang/core/double/double.mbt,25:::let max_value : Double
```


## min\_positive

```moonbit
:::source,moonbitlang/core/double/double.mbt,31:::let min_positive : Double
```


## min\_value

```moonbit
:::source,moonbitlang/core/double/double.mbt,28:::let min_value : Double
```


## neg\_infinity

```moonbit
:::source,moonbitlang/core/double/double.mbt,22:::let neg_infinity : Double
```


## not\_a\_number

```moonbit
:::source,moonbitlang/core/double/double.mbt,16:::let not_a_number : Double
```


## Double


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/double/double.mbt,163:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for Double
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/double/double.mbt,163:::fn hash(self : Double) -> Int
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/core/double/double.mbt,168:::fn hash_combine(self : Double, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/double/double.mbt,179:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for Double
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/double/double.mbt,179:::fn output(self : Double, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,39:::fn <a href="moonbitlang/core/double#Double">Double</a>::abs(self : Double) -> Double
  ```
  > 
- #### ceil
  ```moonbit
  :::source,moonbitlang/core/double/round_wasm.mbt,19:::fn <a href="moonbitlang/core/double#Double">Double</a>::ceil(self : Double) -> Double
  ```
  > 
- #### exp
  ```moonbit
  :::source,moonbitlang/core/double/exp_nonjs.mbt,16:::fn <a href="moonbitlang/core/double#Double">Double</a>::exp(self : Double) -> Double
  ```
  > 
- #### floor
  ```moonbit
  :::source,moonbitlang/core/double/round_wasm.mbt,22:::fn <a href="moonbitlang/core/double#Double">Double</a>::floor(self : Double) -> Double
  ```
  > 
- #### from\_int
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,34:::fn <a href="moonbitlang/core/double#Double">Double</a>::from_int(i : Int) -> Double
  ```
  > 
- #### inf
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,68:::fn <a href="moonbitlang/core/double#Double">Double</a>::inf(sign : Int) -> Double
  ```
  > 
  >  Returns positive infinity if sign \>= 0, negative infinity if sign \< 0.
  > @alert deprecated "Use `@double.infinity` and `@double.neg_infinity` instead"
  > @coverage.skip
- #### is\_close
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,184:::fn <a href="moonbitlang/core/double#Double">Double</a>::is_close(self : Double, other : Double, relative_tolerance~ : Double = .., absolute_tolerance~ : Double = ..) -> Bool
  ```
  > 
- #### is\_inf
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,93:::fn <a href="moonbitlang/core/double#Double">Double</a>::is_inf(self : Double) -> Bool
  ```
  > 
  >  Check whether the double is infinity
- #### is\_nan
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,86:::fn <a href="moonbitlang/core/double#Double">Double</a>::is_nan(self : Double) -> Bool
  ```
  > 
  >  Check whether the double is a "not-a-number" value
- #### is\_neg\_inf
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,105:::fn <a href="moonbitlang/core/double#Double">Double</a>::is_neg_inf(self : Double) -> Bool
  ```
  > 
  >  Check whether the double is negative infinity
- #### is\_pos\_inf
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,99:::fn <a href="moonbitlang/core/double#Double">Double</a>::is_pos_inf(self : Double) -> Bool
  ```
  > 
  >  Check whether the double is positive infinity
- #### ln
  ```moonbit
  :::source,moonbitlang/core/double/log.mbt,74:::fn <a href="moonbitlang/core/double#Double">Double</a>::ln(self : Double) -> Double
  ```
  > 
- #### log10
  ```moonbit
  :::source,moonbitlang/core/double/log.mbt,108:::fn <a href="moonbitlang/core/double#Double">Double</a>::log10(self : Double) -> Double
  ```
  > 
- #### log2
  ```moonbit
  :::source,moonbitlang/core/double/log.mbt,99:::fn <a href="moonbitlang/core/double#Double">Double</a>::log2(self : Double) -> Double
  ```
  > 
- #### min\_normal
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,80:::fn <a href="moonbitlang/core/double#Double">Double</a>::min_normal() -> Double
  ```
  > 
  >  Returns the smallest positive normal value of Double
  > @alert deprecated "Use `@double.min_positive` instead"
  > @coverage.skip
- #### nan
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,60:::fn <a href="moonbitlang/core/double#Double">Double</a>::nan() -> Double
  ```
  >  Returns a "not-a-number" value
  >  
  >  @alert deprecated "Use `@double.not_a_number` instead"
  > @coverage.skip
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/double/mod_nonjs.mbt,16:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_mod(self : Double, other : Double) -> Double
  ```
  > 
- #### pow
  ```moonbit
  :::source,moonbitlang/core/double/pow_nonjs.mbt,111:::fn <a href="moonbitlang/core/double#Double">Double</a>::pow(self : Double, other : Double) -> Double
  ```
  > 
- #### round
  ```moonbit
  :::source,moonbitlang/core/double/round_wasm.mbt,26:::fn <a href="moonbitlang/core/double#Double">Double</a>::round(self : Double) -> Double
  ```
  > 
- #### signum
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,46:::fn <a href="moonbitlang/core/double#Double">Double</a>::signum(self : Double) -> Double
  ```
  > 
  >  Returns the sign of the double.
  >  - If the double is positive, returns 1.0.
  >  - If the double is negative, returns -1.0.
  >  - Otherwise, returns the double itself (0.0, -0.0 and NaN).
- #### to\_be\_bytes
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,208:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_be_bytes(self : Double) -> Bytes
  ```
  >  Converts the Double to a Bytes in big-endian byte order.
- #### to\_le\_bytes
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,213:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_le_bytes(self : Double) -> Bytes
  ```
  >  Converts the Double to a Bytes in little-endian byte order.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/double/double.mbt,174:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_string(self : Double) -> String
  ```
  > 
  >  @intrinsic %f64.to\_string
- #### trunc
  ```moonbit
  :::source,moonbitlang/core/double/round_wasm.mbt,16:::fn <a href="moonbitlang/core/double#Double">Double</a>::trunc(self : Double) -> Double
  ```
  > 
