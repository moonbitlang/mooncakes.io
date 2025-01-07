# Documentation
|Type|description|
|---|---|
|[RoundMode](#RoundMode)||

|Value|description|
|---|---|
|[DIGITS](#DIGITS)||
|[DOUBLE\_EPSILON](#DOUBLE_EPSILON)| Epsilon is the minimum value that make double \`1.0 + epsilon != 1.0\`. 2.2204460492503131e-16|
|[DOUBLE\_MAX](#DOUBLE_MAX)| The largest positive value that can be represented by a double. 1.7976931348623157E+308|
|[DOUBLE\_MAX\_10\_EXP](#DOUBLE_MAX_10_EXP)| The maximum exponent a normalized double can have (base 10). 308|
|[DOUBLE\_MAX\_EXP](#DOUBLE_MAX_EXP)| The maximum exponent a normalized double can have (IEEE 754). 1024|
|[DOUBLE\_MIN](#DOUBLE_MIN)| The smallest positive value that can be represented by a double. 2.2250738585072014E-308|
|[DOUBLE\_MIN\_10\_EXP](#DOUBLE_MIN_10_EXP)| The minimum exponent a normalized double can have (base 10). -307|
|[DOUBLE\_MIN\_EXP](#DOUBLE_MIN_EXP)| The minimum exponent a normalized double can have (IEEE 754). -1021|
|[DOUBLE\_MIN\_POSITIVE](#DOUBLE_MIN_POSITIVE)| The smallest positive value that can be represented by a double. 2.2250738585072014E-308|
|[E](#E)| Nature Exponent, 2.7182818284590452354|
|[GOLDEN\_RATIO](#GOLDEN_RATIO)| golden ratio, 1.61803398874989484820|
|[INT64\_MAX](#INT64_MAX)| INT64\_MAX is the maximum value an \`Int64\` can represent. 9223372036854775807|
|[INT\_MAX](#INT_MAX)| INT\_MAX is the maximum value an \`Int\` can represent. 2147483647|
|[INV\_SQRT\_PI](#INV_SQRT_PI)| 1/sqrt(PI), 0.564189583547756286948|
|[LN10](#LN10)| ln(10), 2.30258509299404568402|
|[LN2](#LN2)| ln(2), 0.693147180559945309417|
|[LOG10E](#LOG10E)| log10(e), 0.434294481903251827651|
|[LOG2E](#LOG2E)| log2(e), 1.44269504088896340736|
|[MANTISSA\_DIGITS](#MANTISSA_DIGITS)||
|[ONE\_OVER\_PI](#ONE_OVER_PI)| 1/PI, 0.318309886183790671538|
|[PI](#PI)| The ratio of the circumference of a circle to its diameter. 3.14159265358979323846|
|[PI\_OVER\_2](#PI_OVER_2)| PI/2, 1.57079632679489661923|
|[PI\_OVER\_4](#PI_OVER_4)| PI/4, 0.785398163397448309616|
|[RADIX](#RADIX)||
|[SQRT1\_OVER\_2](#SQRT1_OVER_2)| 1/sqrt(2), 0.707106781186547524401|
|[SQRT2](#SQRT2)| sqrt(2), 1.41421356237309504880|
|[SQRT3](#SQRT3)| sqrt(3), 1.73205080756887729353|
|[SQRT5](#SQRT5)| sqrt(5), 2.23606797749978969640|
|[TWO\_OVER\_PI](#TWO_OVER_PI)| 2/PI, 0.636619772367581343076|
|[TWO\_OVER\_SQRTPI](#TWO_OVER_SQRTPI)| 2/sqrt(PI), 1.12837916709551257390|
|[UINT64\_MAX](#UINT64_MAX)| UINT64\_MAX is the maximum value an \`UInt64\` can represent. 18446744073709551615|
|[UINT\_MAX](#UINT_MAX)| UINT\_MAX is the maximum value an \`UInt\` can represent. 4294967295|
|[acos](#acos)| Compute arc cosine|
|[acosh](#acosh)| Return the inverse hyperbolic cosine of x.|
|[asin](#asin)| Compute arcsine of \`x\`|
|[asinh](#asinh)| Compute the inverse hyperbolic sine of \`x\`.|
|[atan](#atan)| Compute arctangent of \`x\`|
|[atan2](#atan2)| \`atan2(y, x)\` returns the angle whose tangent is \`y/x\`.|
|[atanh](#atanh)| hyperbolic arctangent of \``x\``.|
|[cbrt](#cbrt)| Return the cube root of \`x\`.|
|[ceil](#ceil)| Return the smallest integral value that is not less than x|
|[clamp](#clamp)| Restrict a value to a certain interval unless it is NaN.|
|[cos](#cos)| Compute cosine of double-precision floating-point number \`x\`|
|[cosh](#cosh)| Compute hyperbolic cosine function of a double-precision floating point number.|
|[cospi](#cospi)| Compute cos(pi\*x) with high accuracy.|
|[digamma](#digamma)| digamma(x) computes the digamma function of x.|
|[div\_euclid](#div_euclid)| Calculates Euclidean division, the matching method for \`rem\_euclid\`.|
|[erf](#erf)| Compute the error function of \`x\`.|
|[erfc](#erfc)| Compute the error function of x|
|[erfcinv](#erfcinv)| Calculate the inverse complementary error function of the input argument.|
|[erfcx](#erfcx)| erfcx(x) = exp(x^2) \* erfc(x)|
|[erfinv](#erfinv)| erfinv(x) computes the inverse error function of x.|
|[exp](#exp)| Return exponent of x |
|[exp10](#exp10)| Compute 10 raised to the power of x.|
|[exp2](#exp2)| Compute 2 raised to the power of x.|
|[expm1](#expm1)| Return exp(x)-1|
|[fast\_rsqrt](#fast_rsqrt)| Inverse square root approximation using the fast inverse square root algorithm.|
|[fdim](#fdim)| Compute the positive difference between \`x\` and \`y\`.|
|[floor](#floor)| Return the largest integral value less than or equal to x.|
|[fma](#fma)| fused multiply-add, fma(a, b, c) = a \* b + c, but as a single operation with higher precision|
|[fract](#fract)| Return the fractional part of a number|
|[frexp](#frexp)| Extract mantissa and exponent of a floating-point value.|
|[gamma](#gamma)| Compute Gamma function|
|[gegenbauer](#gegenbauer)| gegenbauer computes the Gegenbauer polynomial of degree n with parameter lambda at x.|
|[gegenbauer\_derivative](#gegenbauer_derivative)| gegenbauer\_derivative is the derivative of the Gegenbauer polynomial of degree n with parameter lambda at x.|
|[gegenbauer\_prime](#gegenbauer_prime)||
|[gelu](#gelu)| Computes the Gaussian Error Linear Unit (GELU) function.|
|[hermite](#hermite)| hermite(n, x) computes the nth Hermite polynomial at x.|
|[hypot](#hypot)| Returns the square root of the sum of the squares of its arguments, hypot(x, y) = sqrt(x\*x, y\*y)|
|[ilogb](#ilogb)| ilogb(x) returns the binary exponent of non-zero x|
|[isfinite](#isfinite)| Return double \`x\` is finite and is not nan|
|[isinf](#isinf)| Return isinf(x) for double x|
|[isnan](#isnan)| Return isnan(x) for double x|
|[isninf](#isninf)| Return true if x is -inf|
|[isnormal](#isnormal)| Return true if x is a normal number, false otherwise.|
|[ispinf](#ispinf)| Return true if x is +inf|
|[issubnormal](#issubnormal)| Return true if x is subnormal, false otherwise.|
|[j0](#j0)| Compute Bessel function of the first kind of order zero|
|[j1](#j1)| Compute Bessel function of the first kind of order one.|
|[jn](#jn)| Calculate the value of the Bessel function of the first kind of order n for the input argument.|
|[ldexp](#ldexp)| ldexp(x, exp) = x \* 2^exp. It is equivalent to scalbn(x, exp).|
|[lerp](#lerp)| Compute the linear interpolation between two values|
|[ln\_1p](#ln_1p)| \`ln\_1p\` is an alias for \`log1p\`|
|[log](#log)| Return the logrithm of x|
|[log10](#log10)| Return the base 10 logarithm of \`x\`|
|[log1p](#log1p)| \``log1p(x) = log(1+x)\``|
|[log2](#log2)| Compute the base-2 logarithm of a number.|
|[logaddexp](#logaddexp)| logaddexp(x1, x2) = log(exp(x1) + exp(x2))|
|[logsumexp](#logsumexp)| Return the log of the sum of exponentials of the elements of the input array.|
|[nearbyint](#nearbyint)| Rounds the input floating-point number to the nearest integer according to the specified rounding mode.|
|[nextafter](#nextafter)| Return next representable double-precision floating-point value after argument \`x\` in the direction of \`y\`.|
|[norm](#norm)| Calculate the square root of the sum of squares of any number of coordinates.|
|[norm3d](#norm3d)| Calculate the square root of the sum of squares of three coordinates of the argument.|
|[norm4d](#norm4d)| Calculate the square root of the sum of squares of four coordinates of the argument.|
|[normcdf](#normcdf)| Calculate the standard normal cumulative distribution function.|
|[normcdfinv](#normcdfinv)| Calculate the inverse of the standard normal cumulative distribution function.|
|[pow](#pow)| Compute x pow of y, where x is a double and y is a double.|
|[powi](#powi)| powi computes \`x \*\* i\` where x is a Double and i is an Int. It is an alias for \`pown\`.|
|[pown](#pown)| pown computes \`x \*\* n\` where x is a Double and n is an Int.|
|[rcbrt](#rcbrt)| Inverse cube root function|
|[rem\_euclid](#rem_euclid)| Calculates the least nonnegative remainder of \`x (mod y)\`.|
|[rhypot](#rhypot)| Inverse of the hypotenuse of a right triangle|
|[rint](#rint)| Rounds the input floating-point number to the nearest integer according to the specified rounding mode.|
|[rnorm](#rnorm)| Calculate the reciprocal of square root of the sum of squares of any number of coordinates.|
|[rnorm3d](#rnorm3d)| Calculate one over the square root of the sum of squares of three coordinates.|
|[rnorm4d](#rnorm4d)| Calculate one over the square root of the sum of squares of four coordinates.|
|[round](#round)| Return the nearest integer value to \`x\`.|
|[roundeven](#roundeven)| roundeven is a function that rounds a number to the nearest even integer.|
|[rsqrt](#rsqrt)| Inverse square root of a number|
|[scalbn](#scalbn)| Compute x \* 2 \*\*n where x is a double and n is an integer.|
|[signum](#signum)| Return a number that represents the sign of the argument.|
|[sin](#sin)| Compute sine of double-precision floating-point number \`x\`.|
|[sincos](#sincos)| Compute the sine and cosine of a number simultaneously|
|[sincospi](#sincospi)| Compute the sine and cosine of a number multiplied by pi simultaneously|
|[sinh](#sinh)| Compute hyperbolic sine function of a double-precision floating point number.|
|[sinpi](#sinpi)| Compute sin(pi\*x) with high accuracy.|
|[sqrt](#sqrt)| Compute Square Root of a number|
|[sqrt1pm1](#sqrt1pm1)| sqrt1pm1(x) compute sqrt(1 + x) - 1 with higher accuracy than the naive formula|
|[tan](#tan)| Compute the tangent of double-precision floating-point number \`x\`.|
|[tanh](#tanh)| Compute hyperbolic tangent function of a double-precision floating point number.|
|[to\_degrees](#to_degrees)| Converts radians to degrees.|
|[to\_radians](#to_radians)| Converts degrees to radians.|
|[trunc](#trunc)| Return the integral part of a floating point number|
|[y0](#y0)| Compute Bessel function of the second kind of order zero|
|[y1](#y1)| Compute Bessel function of the second kind of order one.|
|[yn](#yn)| Calculate the value of the Bessel function of the second kind of order n for the input argument.|
|[zeta](#zeta)||

## RoundMode

```moonbit
:::source,Kaida-Amethyst/moonbit-math/nearbyint.mbt,1:::pub(all) enum RoundMode {
  FE_TONEAREST
  FE_DOWNWARD
  FE_UPWARD
  FE_TOWARDZERO
}
```


## DIGITS

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,4:::let DIGITS : UInt
```


## DOUBLE\_EPSILON

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,19:::let DOUBLE_EPSILON : Double
```
 Epsilon is the minimum value that make double `1.0 + epsilon != 1.0`. 2.2204460492503131e-16

## DOUBLE\_MAX

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,28:::let DOUBLE_MAX : Double
```
 The largest positive value that can be represented by a double. 1.7976931348623157E+308

## DOUBLE\_MAX\_10\_EXP

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,40:::let DOUBLE_MAX_10_EXP : Int
```
 The maximum exponent a normalized double can have (base 10). 308

## DOUBLE\_MAX\_EXP

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,34:::let DOUBLE_MAX_EXP : Int
```
 The maximum exponent a normalized double can have (IEEE 754). 1024

## DOUBLE\_MIN

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,22:::let DOUBLE_MIN : Double
```
 The smallest positive value that can be represented by a double. 2.2250738585072014E-308

## DOUBLE\_MIN\_10\_EXP

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,37:::let DOUBLE_MIN_10_EXP : Int
```
 The minimum exponent a normalized double can have (base 10). -307

## DOUBLE\_MIN\_EXP

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,31:::let DOUBLE_MIN_EXP : Int
```
 The minimum exponent a normalized double can have (IEEE 754). -1021

## DOUBLE\_MIN\_POSITIVE

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,25:::let DOUBLE_MIN_POSITIVE : Double
```
 The smallest positive value that can be represented by a double. 2.2250738585072014E-308

## E

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,43:::let E : Double
```
 Nature Exponent, 2.7182818284590452354

## GOLDEN\_RATIO

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,91:::let GOLDEN_RATIO : Double
```
 golden ratio, 1.61803398874989484820

## INT64\_MAX

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,10:::let INT64_MAX : Int64
```
 INT64\_MAX is the maximum value an `Int64` can represent. 9223372036854775807

## INT\_MAX

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,7:::let INT_MAX : Int
```
 INT\_MAX is the maximum value an `Int` can represent. 2147483647

## INV\_SQRT\_PI

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,61:::let INV_SQRT_PI : Double
```
 1/sqrt(PI), 0.564189583547756286948

## LN10

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,82:::let LN10 : Double
```
 ln(10), 2.30258509299404568402

## LN2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,79:::let LN2 : Double
```
 ln(2), 0.693147180559945309417

## LOG10E

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,88:::let LOG10E : Double
```
 log10(e), 0.434294481903251827651

## LOG2E

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,85:::let LOG2E : Double
```
 log2(e), 1.44269504088896340736

## MANTISSA\_DIGITS

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,3:::let MANTISSA_DIGITS : UInt
```


## ONE\_OVER\_PI

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,55:::let ONE_OVER_PI : Double
```
 1/PI, 0.318309886183790671538

## PI

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,46:::let PI : Double
```
 The ratio of the circumference of a circle to its diameter. 3.14159265358979323846

## PI\_OVER\_2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,49:::let PI_OVER_2 : Double
```
 PI/2, 1.57079632679489661923

## PI\_OVER\_4

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,52:::let PI_OVER_4 : Double
```
 PI/4, 0.785398163397448309616

## RADIX

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,2:::let RADIX : UInt
```


## SQRT1\_OVER\_2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,70:::let SQRT1_OVER_2 : Double
```
 1/sqrt(2), 0.707106781186547524401

## SQRT2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,67:::let SQRT2 : Double
```
 sqrt(2), 1.41421356237309504880

## SQRT3

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,73:::let SQRT3 : Double
```
 sqrt(3), 1.73205080756887729353

## SQRT5

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,76:::let SQRT5 : Double
```
 sqrt(5), 2.23606797749978969640

## TWO\_OVER\_PI

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,58:::let TWO_OVER_PI : Double
```
 2/PI, 0.636619772367581343076

## TWO\_OVER\_SQRTPI

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,64:::let TWO_OVER_SQRTPI : Double
```
 2/sqrt(PI), 1.12837916709551257390

## UINT64\_MAX

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,16:::let UINT64_MAX : UInt64
```
 UINT64\_MAX is the maximum value an `UInt64` can represent. 18446744073709551615

## UINT\_MAX

```moonbit
:::source,Kaida-Amethyst/moonbit-math/constants.mbt,13:::let UINT_MAX : UInt
```
 UINT\_MAX is the maximum value an `UInt` can represent. 4294967295

## acos

```moonbit
:::source,Kaida-Amethyst/moonbit-math/acos.mbt,29:::fn acos(x : Double) -> Double
```
 Compute arc cosine
 #### Introduction

 Computes the principal value of the arc cosine of `x`.

 #### Special cases

 1. If `x` is NaN, a NaN is returned.
 2. If \|x\| \> 1, a NaN is returned with the invalid signal raised.

 #### Accruacy

 1 ulp (unit in the last place).

## acosh

```moonbit
:::source,Kaida-Amethyst/moonbit-math/acosh.mbt,26:::fn acosh(x : Double) -> Double
```
 Return the inverse hyperbolic cosine of x.
 #### Introduction

 Returns the inverse hyperbolic cosine of `x`, defined as the value `y` such that `x = cosh(y)`.

 #### Special cases

 1. If `x` is less than 1, the result is `NaN`.
 2. If `x` is `NaN`, the result is `NaN`.

 #### Accuracy

 1 ulp (unit in the last place).

## asin

```moonbit
:::source,Kaida-Amethyst/moonbit-math/asin.mbt,104:::fn asin(x : Double) -> Double
```
 Compute arcsine of `x`

## asinh

```moonbit
:::source,Kaida-Amethyst/moonbit-math/asinh.mbt,20:::fn asinh(x : Double) -> Double
```
 Compute the inverse hyperbolic sine of `x`.
 #### Introduction

 Computes the inverse hyperbolic sine of `x`. The inverse hyperbolic sine is defined as:
\$\$\\text{asinh}(x) = \\log(x + \\sqrt{x^2 + 1})\$\$

 #### Accuracy

 1 ulp (unit in the last place).

## atan

```moonbit
:::source,Kaida-Amethyst/moonbit-math/atan.mbt,164:::fn atan(x : Double) -> Double
```
 Compute arctangent of `x`

## atan2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/atan2.mbt,124:::fn atan2(y : Double, x : Double) -> Double
```
 `atan2(y, x)` returns the angle whose tangent is `y/x`.
 #### Special Cases:

 1. `atan2((anything), NaN)` is NaN;
 2. `atan2(NAN, (anything))` is NaN;
 3. `atan2(+-0, +(anything but NaN))` is +-0;
 4. `atan2(+-0, -(anything but NaN))` is +-pi;
 5. `atan2(+-(anything but 0 and NaN), 0)` is +-pi/2;
 6. `atan2(+-(anything but INF and NaN), +INF)` is +-0;
 7. `atan2(+-(anything but INF and NaN), -INF)` is +-pi;
 8. `atan2(+-INF,+INF)` is +-pi/4;
 9. `atan2(+-INF,-INF)` is +-3pi/4;
 10. `atan2(+-INF, (anything but,0,NaN, and INF))` is +-pi/2;

## atanh

```moonbit
:::source,Kaida-Amethyst/moonbit-math/atanh.mbt,25:::fn atanh(x : Double) -> Double
```
 hyperbolic arctangent of ``x``.
 #### Introduction:

   atanh(x) returns the hyperbolic arctangent of x.

 #### Special cases:

 1. atanh(x) is NaN if \|x\| \> 1 with signal;
 2. atanh(NaN) is that NaN with no signal;
 3. atanh(+-1) is +-INF with signal.

 #### Accuracy:

 1ulp (unit in the last place).

## cbrt

```moonbit
:::source,Kaida-Amethyst/moonbit-math/cbrt.mbt,14:::fn cbrt(x : Double) -> Double
```
 Return the cube root of `x`.
 #### Introduction

 Return the cube root of `x`.

 #### Special Cases

 1. If `x` is NaN, the result is NaN.
 2. If `x` is ±0, the result is ±0.

 #### Accuracy

 1 ulp (unit in the last place).

## ceil

```moonbit
:::source,Kaida-Amethyst/moonbit-math/ceil.mbt,2:::fn ceil(x : Double) -> Double
```
 Return the smallest integral value that is not less than x

## clamp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/clamp.mbt,23:::fn clamp(x : Double, min : Double, max : Double) -> Double
```
 Restrict a value to a certain interval unless it is NaN.

 Returns `max` if `x` is greater than `max`, and `min` if `self` is
less than `min`. Otherwise this returns `self`.

 Note that this function returns NaN if the initial value was NaN as
well.

 Note that if `min > max`, it will flip the `min` and `max` values.

 #### Special cases

 If `x`, `min`, `max` one of them is NaN, the result is NaN.

 #### Examples

 ```
 assert_eq!(clamp(-3.0, -2.0, 1.0), -2.0);
 assert_eq!(clamp(0.0, -2.0, 1.0), 0.0);
 assert_eq!(clamp(2.0, -2.0, 1.0), 1.0);
 ```

## cos

```moonbit
:::source,Kaida-Amethyst/moonbit-math/cos.mbt,2:::fn cos(x : Double) -> Double
```
 Compute cosine of double-precision floating-point number `x`

## cosh

```moonbit
:::source,Kaida-Amethyst/moonbit-math/cosh.mbt,25:::fn cosh(x : Double) -> Double
```
 Compute hyperbolic cosine function of a double-precision floating point number.

 #### Special Cases

 1. cosh(x) is \|x\| if x is +INF, -INF, or NaN.
 2. Only cosh(0)=1 is exact for finite x.

## cospi

```moonbit
:::source,Kaida-Amethyst/moonbit-math/cospi.mbt,9:::fn cospi(x : Double) -> Double
```
 Compute cos(pi\*x) with high accuracy.
 #### Introduction

 Compute cos(pi\*x) with high accuracy.

 #### Accuracy

 49 ulp (1 bit error)

## digamma

```moonbit
:::source,Kaida-Amethyst/moonbit-math/digamma.mbt,3:::fn digamma(x : Double) -> Double
```
 digamma(x) computes the digamma function of x.

## div\_euclid

```moonbit
:::source,Kaida-Amethyst/moonbit-math/div_euclid.mbt,22:::fn div_euclid(x : Double, y : Double) -> Double
```
 Calculates Euclidean division, the matching method for `rem_euclid`.
This computes the integer `n` such that
`x = n * y + rem_euclid(x, y)`.
In other words, the result is `x / y` rounded to the integer `n`
such that `x >= n * y`.

 #### Precision

 The result of this operation is guaranteed to be the rounded
infinite-precision result.

 #### Examples

 ```moonbit
 let a : Double = 7.0
 let b : Double = 4.0
 assert_eq!(div_euclid(a, b), 1.0)   // 7.0 >= 4.0 * 1.0
 assert_eq!(div_euclid(-a, b), -2.0) // -7.0 >= 4.0 * -2.0
 assert_eq!(div_euclid(a, -b), -2.0) // 7.0 >= -4.0 * -2.0
 assert_eq!(div_euclid(-a, -b), 1.0) // -7.0 >= -4.0 * 1.0
 ```

## erf

```moonbit
:::source,Kaida-Amethyst/moonbit-math/erf.mbt,101:::fn erf(x : Double) -> Double
```
 Compute the error function of `x`.
 #### Special Cases

 1. erf(0) = 0
 2. erf(inf) = 1
 3. erf(-inf) = -1
 4. erf(NaN) = NaN

## erfc

```moonbit
:::source,Kaida-Amethyst/moonbit-math/erfc.mbt,8:::fn erfc(x : Double) -> Double
```
 Compute the error function of x
 #### Special Cases

 1. erfc(0) = 1
 2. erfc(inf) = 0
 3. erfc(-inf) = 2
 4. erfc(NaN) = NaN

## erfcinv

```moonbit
:::source,Kaida-Amethyst/moonbit-math/erfcinv.mbt,9:::fn erfcinv(a : Double) -> Double
```
 Calculate the inverse complementary error function of the input argument.

 #### Special Cases

 1. erfcinv(+-0) = +Inf
 2. erfcinv(2) = -inf
 3. erfcinv(x) returns NaN for `x` outside \[0, 2\]
 4. erfcinv(NaN) = NaN

## erfcx

```moonbit
:::source,Kaida-Amethyst/moonbit-math/erfcx.mbt,2:::fn erfcx(x : Double) -> Double
```
 erfcx(x) = exp(x^2) \* erfc(x)

## erfinv

```moonbit
:::source,Kaida-Amethyst/moonbit-math/erfinv.mbt,6:::fn erfinv(x : Double) -> Double
```
 erfinv(x) computes the inverse error function of x.

 Paper: Approximating the erfinv function, Mike Giles, Oxford:
https://people.maths.ox.ac.uk/gilesm/codes/erfinv/gems.pdf

## exp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/exp.mbt,55:::fn exp(input : Double) -> Double
```
 Return exponent of x
 #### Introduction:

 Compute exp(x)

 #### Special cases:

 1. exp(INF) is INF, exp(NaN) is NaN;
 2. exp(-INF) is 0, and
 3. for finite argument, only exp(0)=1 is exact.

 #### Accuracy:
 
   according to an error analysis, the error is always less than
1 ulp (unit in the last place).


## exp10

```moonbit
:::source,Kaida-Amethyst/moonbit-math/exp10.mbt,2:::fn exp10(x : Double) -> Double
```
 Compute 10 raised to the power of x.

## exp2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/exp2.mbt,2:::fn exp2(x : Double) -> Double
```
 Compute 2 raised to the power of x.

## expm1

```moonbit
:::source,Kaida-Amethyst/moonbit-math/expm1.mbt,90:::fn expm1(x : Double) -> Double
```
 Return exp(x)-1

 #### Introduction

 Computes the exponential of `x` minus one.

 #### Special cases

 1. expm1(INF) is INF
 2. expm1(NaN) is NaN
 3. expm1(-INF) is -1
 4. for finite argument, only expm1(0) is exact.
 5. if x \> 7.09782712893383973096e+02 then expm1(x) overflows

 #### Accuracy

 According to an error analysis, the error is always less than
1 ulp (unit in the last place).

## fast\_rsqrt

```moonbit
:::source,Kaida-Amethyst/moonbit-math/fast_rsqrt.mbt,2:::fn fast_rsqrt(x : float) -> float
```
 Inverse square root approximation using the fast inverse square root algorithm.

## fdim

```moonbit
:::source,Kaida-Amethyst/moonbit-math/fdim.mbt,8:::fn fdim(x : Double, y : Double) -> Double
```
 Compute the positive difference between `x` and `y`.

 Computes the positive difference between `x` and `y`, that is, if `x > y`, returns `x - y`, otherwise returns `0`.

 1. fdim(`x`, `y`) returns `x - y` if `x > y`
 2. fdim(`x`, `y`) returns `0` if `x <= y`
 3. fdim(`x`, `y`) returns `NaN` if `x` or `y` is `NaN`

## floor

```moonbit
:::source,Kaida-Amethyst/moonbit-math/floor.mbt,2:::fn floor(x : Double) -> Double
```
 Return the largest integral value less than or equal to x.

## fma

```moonbit
:::source,Kaida-Amethyst/moonbit-math/fma_wasm.mbt,12:::fn fma(a : Double, b : Double, c : Double) -> Double
```
 fused multiply-add, fma(a, b, c) = a \* b + c, but as a single operation with higher precision

## fract

```moonbit
:::source,Kaida-Amethyst/moonbit-math/fract.mbt,18:::fn fract(x : Double) -> Double
```
 Return the fractional part of a number
 #### Introduction

 Returns the fractional part of a number, which is the number without the integer part.

 #### Example:

 ```moonbit
 let x = 3.14;
 let y = fract(x);
 assert!(y == 0.14);
 ```

 #### Accuracy

 This function always returns the exact fractional part of the number.

## frexp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/frexp.mbt,9:::fn frexp(f : Double) -> (Double, Int)
```
 Extract mantissa and exponent of a floating-point value.

## gamma

```moonbit
:::source,Kaida-Amethyst/moonbit-math/gamma.mbt,2:::fn gamma(x : Double) -> Double
```
 Compute Gamma function

## gegenbauer

```moonbit
:::source,Kaida-Amethyst/moonbit-math/gegenbauer.mbt,9:::fn gegenbauer(n : UInt, lambda : Double, x : Double) -> Double
```
 gegenbauer computes the Gegenbauer polynomial of degree n with parameter lambda at x.
 #### Introduction

 Gegenbauer polynomials are orthogonal polynomials on the interval \[-1,1\] with weight function (1-x^2)^lambda.
The formula for the Gegenbauer polynomial is

 \[ C\_n^{(\\lambda)}(x) = \\sum\_{k=0}^n \\binom{n}{k} \\frac{\\Gamma(n+2\\lambda)}{\\Gamma(n-k+1)\\Gamma(2\\lambda+k)} \\left(\\frac{x-1}{2}\\right)^{n-k} \]


## gegenbauer\_derivative

```moonbit
:::source,Kaida-Amethyst/moonbit-math/gegenbauer.mbt,46:::fn gegenbauer_derivative(n : UInt, lambda : Double, x : Double, k : UInt) -> Double
```
 gegenbauer\_derivative is the derivative of the Gegenbauer polynomial of degree n with parameter lambda at x.

## gegenbauer\_prime

```moonbit
:::source,Kaida-Amethyst/moonbit-math/gegenbauer.mbt,63:::fn gegenbauer_prime(n : UInt, lambda : Double, x : Double) -> Double
```


## gelu

```moonbit
:::source,Kaida-Amethyst/moonbit-math/gelu.mbt,2:::fn gelu(x : Double) -> Double
```
 Computes the Gaussian Error Linear Unit (GELU) function.

## hermite

```moonbit
:::source,Kaida-Amethyst/moonbit-math/hermite.mbt,9:::fn hermite(n : UInt, x : Double) -> Double
```
 hermite(n, x) computes the nth Hermite polynomial at x.
 #### Introduction

 hermite polynomials are a set of orthogonal polynomials that arise in the solution of the quantum harmonic oscillator.
the formula for the nth hermite polynomial is given by:

 \$\$H\_n(x) = (-1)^n \* e^(x^2) \* d^n/dx^n(e^(-x^2))\$\$


## hypot

```moonbit
:::source,Kaida-Amethyst/moonbit-math/hypot.mbt,119:::fn hypot(x : Double, y : Double) -> Double
```
 Returns the square root of the sum of the squares of its arguments, hypot(x, y) = sqrt(x*x, y*y)
 #### Introduction

 hypot return the square root of the sum of the squares of its arguments, the formula is:

 \$\$hypot(x) = \\sqrt{x^2 + y^2}\$\$

 #### Special cases

 1. If x or y is NaN, return NaN
 2. If x or y is inf, return +inf

 #### Accuracy

 2 ulps (units in the last place)

## ilogb

```moonbit
:::source,Kaida-Amethyst/moonbit-math/ilogb.mbt,2:::fn ilogb(x : Double) -> Int
```
 ilogb(x) returns the binary exponent of non-zero x

## isfinite

```moonbit
:::source,Kaida-Amethyst/moonbit-math/isfinite.mbt,4:::fn isfinite(x : Double) -> Bool
```
 Return double `x` is finite and is not nan

 if x is finite and not nan, return 1, otherwise return 0

## isinf

```moonbit
:::source,Kaida-Amethyst/moonbit-math/isinf.mbt,4:::fn isinf(x : Double) -> Bool
```
 Return isinf(x) for double x

 if x is infinite, return 1, otherwise return 0

## isnan

```moonbit
:::source,Kaida-Amethyst/moonbit-math/isnan.mbt,5:::fn isnan(x : Double) -> Bool
```
 Return isnan(x) for double x

 if x is NaN, return true, otherwise return false

## isninf

```moonbit
:::source,Kaida-Amethyst/moonbit-math/isinf.mbt,14:::fn isninf(x : Double) -> Bool
```
 Return true if x is -inf

## isnormal

```moonbit
:::source,Kaida-Amethyst/moonbit-math/isnormal.mbt,2:::fn isnormal(x : Double) -> Bool
```
 Return true if x is a normal number, false otherwise.

## ispinf

```moonbit
:::source,Kaida-Amethyst/moonbit-math/isinf.mbt,9:::fn ispinf(x : Double) -> Bool
```
 Return true if x is +inf

## issubnormal

```moonbit
:::source,Kaida-Amethyst/moonbit-math/issubnormal.mbt,2:::fn issubnormal(x : Double) -> Bool
```
 Return true if x is subnormal, false otherwise.

## j0

```moonbit
:::source,Kaida-Amethyst/moonbit-math/j0.mbt,33:::fn j0(x : Double) -> Double
```
 Compute Bessel function of the first kind of order zero
 #### Special cases:

 1. j0(nan)= nan
 2. j0(0) = 1
 3. j0(inf) = 0

## j1

```moonbit
:::source,Kaida-Amethyst/moonbit-math/j1.mbt,26:::fn j1(x : Double) -> Double
```
 Compute Bessel function of the first kind of order one.

 #### Special Cases

 1. `j1(x)` is NaN if `x` is NaN.
 2. `j1(x)` is 0 if `x` is ±∞.
 3. `j1(x)` is NaN if `x` is less than 0.

## jn

```moonbit
:::source,Kaida-Amethyst/moonbit-math/yn.mbt,14:::fn jn(n : Int, x : Double) -> Double
```
 Calculate the value of the Bessel function of the first kind of order n for the input argument.

 #### Special Cases

 1. jn(n, NaN) returns NaN.
 2. jn(n, x) returns NaN for n \< 0.
 3. jn(n, x) returns NaN for x \< 0.
 4. jn(n, +-0) returns 0.

 #### Notes

 1. For n = 0, j0(x) is called.
 2. For n = 1, j1(x) is called.

## ldexp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/ldexp.mbt,4:::fn ldexp(x : Double, exp : Int) -> Double
```
 ldexp(x, exp) = x \* 2^exp. It is equivalent to scalbn(x, exp).
ldexp(x, exp) = x \* 2^exp. It is equivalent to scalbn(x, exp).

## lerp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/lerp.mbt,2:::fn lerp(a : Double, b : Double, t : Double) -> Double
```
 Compute the linear interpolation between two values

## ln\_1p

```moonbit
:::source,Kaida-Amethyst/moonbit-math/log1p.mbt,197:::fn ln_1p(x : Double) -> Double
```
 `ln_1p` is an alias for `log1p`

## log

```moonbit
:::source,Kaida-Amethyst/moonbit-math/log.mbt,55:::fn log(x : Double) -> Double
```
 Return the logrithm of x
 #### Introduction:

  Return the logrithm of x

 #### Special cases:

 1. log(x) is NaN with signal if x \< 0 (including -INF).
 2. log(+INF) is +INF.
 3. log(0) is -INF with signal.

 #### Accuracy:
 
 according to an error analysis, the error is always less than
 
 1 ulp (unit in the last place).

## log10

```moonbit
:::source,Kaida-Amethyst/moonbit-math/log10.mbt,32:::fn log10(x : Double) -> Double
```
 Return the base 10 logarithm of `x`
 #### Introduction

 Return the base 10 logarithm of `x`

 #### Special cases

 `log10(x)` is `NaN` with signal if `x < 0`
`log10(+INF)` is `+INF` with no signal
`log10(0)` is `-INF` with signal
`log10(NaN)` is that `NaN` with no signal
`log10(10**N) = N` for `N=0,1,...,22`

 #### Accuracy

 1 ulp (unit in the last place)

 #### Notes

 1. To guarantee `log10(10**n)=n`, where `10**n` is normal, the rounding mode must set to Round-to-Nearest.
 2. `[1/log(10)]` rounded to 53 bits has error  .198   ulps
 3. `log10` is monotonic at all binary break points

## log1p

```moonbit
:::source,Kaida-Amethyst/moonbit-math/log1p.mbt,94:::fn log1p(x : Double) -> Double
```
 ``log1p(x) = log(1+x)``
 #### Introduction:

  Compute log(1+x)

 #### Special Cases

 1. log1p(INF) is INF, log1p(NaN) is NaN;
 2. log1p(-1) is -INF with signal;
 3. log1p(NaN) is that NaN with no signal.

 #### Accuracy:

 according to an error analysis, the error is always less than
1 ulp (unit in the last place).

 #### Note

 Assuming log() return accurate answer, the following
algorithm can be used to compute log1p(x) to within a few ULP:

 ```moonbit
 u = 1+x;
 if(u==1.0) return x ; else return log(u)*(x/(u-1.0));
 ```
 See HP-15C Advanced Functions Handbook, p.193.


## log2

```moonbit
:::source,Kaida-Amethyst/moonbit-math/log2.mbt,2:::fn log2(x : Double) -> Double
```
 Compute the base-2 logarithm of a number.

## logaddexp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/logaddexp.mbt,2:::fn logaddexp(x1 : Double, x2 : Double) -> Double
```
 logaddexp(x1, x2) = log(exp(x1) + exp(x2))

## logsumexp

```moonbit
:::source,Kaida-Amethyst/moonbit-math/logsumexp.mbt,7:::fn logsumexp(elements : <a href="moonbitlang/core/array#Array">Array</a>[Double]) -> Double
```
 Return the log of the sum of exponentials of the elements of the input array.
 #### Introduction

 logsumexp(x) returns the natural logarithm of the sum of the exponentials of the elements of the input array x.
See: https://nhigham.com/2021/01/05/what-is-the-log-sum-exp-function/
to get more information.

## nearbyint

```moonbit
:::source,Kaida-Amethyst/moonbit-math/nearbyint.mbt,35:::fn nearbyint(x : Double, round_mode~ : <a href="Kaida-Amethyst/moonbit-math#RoundMode">RoundMode</a> = ..) -> Double
```
 Rounds the input floating-point number to the nearest integer according to the specified rounding mode.

 #### Arguments
 - `x`: The floating-point number to be rounded.
 - `round_mode`: The rounding mode to use. Defaults to `FE_TONEAREST` (round to nearest, ties to even).

 #### Rounding Modes
 - `FE_TONEAREST`: Rounds to the nearest integer. If the value is exactly halfway between two integers,
   it rounds to the nearest even integer. This is the default behavior.
 - `FE_DOWNWARD`: Rounds towards negative infinity (equivalent to `floor`).
 - `FE_UPWARD`: Rounds towards positive infinity (equivalent to `ceil`).
 - `FE_TOWARDZERO`: Rounds towards zero (equivalent to `trunc`).

 #### Returns
 The rounded floating-point number.

 #### Example
 ```
 nearbyint(2.5) // Returns 2.0 (FE_TONEAREST mode)
 nearbyint(2.5, FE_DOWNWARD) // Returns 2.0 (FE_DOWNWARD mode)
 nearbyint(2.5, FE_UPWARD) // Returns 3.0 (FE_UPWARD mode)
 nearbyint(2.5, FE_TOWARDZERO) // Returns 2.0 (FE_TOWARDZERO mode)
 ```

 #### Note

 It is equivalent to `rint` function. Note that it's different with C-like languages.

## nextafter

```moonbit
:::source,Kaida-Amethyst/moonbit-math/nextafter.mbt,7:::fn nextafter(x : Double, y : Double) -> Double
```
 Return next representable double-precision floating-point value after argument `x` in the direction of `y`.

 #### Special cases

 1. nextafter(x, y) = y if x equals y.
 2. nextafter(x, y) = NaN if either x or y are NaN.

## norm

```moonbit
:::source,Kaida-Amethyst/moonbit-math/norm.mbt,8:::fn norm(vec : <a href="moonbitlang/core/array#Array">Array</a>[Double]) -> Double
```
 Calculate the square root of the sum of squares of any number of coordinates.
Calculate the length of a vector p, dimension of which is passed as an argument without undue overflow or underflow.

 #### Special Cases

 1. If one of the coordinates is infinite, the result is infinite.
 2. If one of the coordinates is NaN, the result is NaN.

## norm3d

```moonbit
:::source,Kaida-Amethyst/moonbit-math/norm3d.mbt,2:::fn norm3d(a : Double, b : Double, c : Double) -> Double
```
 Calculate the square root of the sum of squares of three coordinates of the argument.

## norm4d

```moonbit
:::source,Kaida-Amethyst/moonbit-math/norm4d.mbt,2:::fn norm4d(a : Double, b : Double, c : Double, d : Double) -> Double
```
 Calculate the square root of the sum of squares of four coordinates of the argument.

## normcdf

```moonbit
:::source,Kaida-Amethyst/moonbit-math/normcdf.mbt,2:::fn normcdf(x : Double) -> Double
```
 Calculate the standard normal cumulative distribution function.

## normcdfinv

```moonbit
:::source,Kaida-Amethyst/moonbit-math/normcdfinv.mbt,2:::fn normcdfinv(x : Double) -> Double
```
 Calculate the inverse of the standard normal cumulative distribution function.

## pow

```moonbit
:::source,Kaida-Amethyst/moonbit-math/pow.mbt,35:::fn pow(base : Double, expon : Double) -> Double
```
 Compute x pow of y, where x is a double and y is a double.
 #### Introduction:

   Compute `x**y` where `x` is a double and `y` is a double.

 #### Special cases:

 1.  (anything) \*\* 0  is 1
 2.  (anything) \*\* 1  is itself
 3.  (anything) \*\* NAN is NAN
 4.  NAN \*\* (anything except 0) is NAN
 5.  \+-(\|x\| \> 1) \*\*  +INF is +INF
 6.  \+-(\|x\| \> 1) \*\*  -INF is +0
 7.  \+-(\|x\| \< 1) \*\*  +INF is +0
 8.  \+-(\|x\| \< 1) \*\*  -INF is +INF
 9.  \+-1         \*\* +-INF is NAN
 10. \+0 \*\* (+anything except 0, NAN)               is +0
 11. \-0 \*\* (+anything except 0, NAN, odd integer)  is +0
 12. \+0 \*\* (-anything except 0, NAN)               is +INF
 13. \-0 \*\* (-anything except 0, NAN, odd integer)  is +INF
 14. \-0 \*\* (odd integer) = -( +0 \*\* (odd integer) )
 15. \+INF \*\* (+anything except 0,NAN) is +INF
 16. \+INF \*\* (-anything except 0,NAN) is +0
 17. \-INF \*\* (anything)  = -0 \*\* (-anything)
 18. (-anything) \*\* (integer) is (-1)\*\*(integer)\*(+anything\*\*integer)
 19. (-anything except 0 and inf) \*\* (non-integer) is NAN

#### Accuracy:

 pow(x,y) returns x\*\*y nearly rounded. In particular `pow(integer,integer)`
always returns the correct integer provided it is
representable.

 2 ulp (units in the last place) are added for rounding.

## powi

```moonbit
:::source,Kaida-Amethyst/moonbit-math/pown.mbt,28:::fn powi(x : Double, i : Int) -> Double
```
 powi computes `x ** i` where x is a Double and i is an Int. It is an alias for `pown`.

## pown

```moonbit
:::source,Kaida-Amethyst/moonbit-math/pown.mbt,2:::fn pown(x : Double, n : Int) -> Double
```
 pown computes `x ** n` where x is a Double and n is an Int.

## rcbrt

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rcbrt.mbt,2:::fn rcbrt(x : Double) -> Double
```
 Inverse cube root function

## rem\_euclid

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rem_euclid.mbt,30:::fn rem_euclid(x : Double, y : Double) -> Double
```
 Calculates the least nonnegative remainder of `x (mod y)`.
In particular, the return value `r` satisfies `0.0 <= r < abs(y)` in
most cases. However, due to a floating point round-off error it can
result in `r == abs(y)`, violating the mathematical definition, if
`x` is much smaller than `abs(y)` in magnitude and `x < 0.0`.
This result is not an element of the function's codomain, but it is the
closest floating point number in the real numbers and thus fulfills the
property `x == div_euclid(x, y) * y + rem_euclid(x, y)`
approximately.

 #### Precision

 The result of this operation is guaranteed to be the rounded
infinite-precision result.

 #### Examples

 ```
 let a: Double = 7.0;
 let b = 4.0;
 assert_eq!(rem_euclid(a, b), 3.0);
 assert_eq!(rem_euclid(-a, b), 1.0);
 assert_eq!(rem_euclid(a, -b), 3.0);
 assert_eq!(rem_euclid(-a, -b), 1.0);
 // limitation due to round-off error
 assert!(rem_euclid(EPSILON, 3.0) != 0.0);
 ```

## rhypot

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rhypot.mbt,2:::fn rhypot(x : Double, y : Double) -> Double
```
 Inverse of the hypotenuse of a right triangle

## rint

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rint.mbt,28:::fn rint(x : Double, round_mode~ : <a href="Kaida-Amethyst/moonbit-math#RoundMode">RoundMode</a> = ..) -> Double
```
 Rounds the input floating-point number to the nearest integer according to the specified rounding mode.

 #### Arguments
 - `x`: The floating-point number to be rounded.
 - `round_mode`: The rounding mode to use. Defaults to `FE_TONEAREST` (round to nearest, ties to even).

 #### Rounding Modes
 - `FE_TONEAREST`: Rounds to the nearest integer. If the value is exactly halfway between two integers,
   it rounds to the nearest even integer. This is the default behavior.
 - `FE_DOWNWARD`: Rounds towards negative infinity (equivalent to `floor`).
 - `FE_UPWARD`: Rounds towards positive infinity (equivalent to `ceil`).
 - `FE_TOWARDZERO`: Rounds towards zero (equivalent to `trunc`).

 #### Returns
 The rounded floating-point number.

 #### Example
 ```
 rint(2.5) // Returns 2.0 (FE_TONEAREST mode)
 rint(2.5, FE_DOWNWARD) // Returns 2.0 (FE_DOWNWARD mode)
 rint(2.5, FE_UPWARD) // Returns 3.0 (FE_UPWARD mode)
 rint(2.5, FE_TOWARDZERO) // Returns 2.0 (FE_TOWARDZERO mode)
 ```

 #### Note

 It is equivalent to `nearbyint` function. Note that it's different with C-like languages.

## rnorm

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rnorm.mbt,2:::fn rnorm(vec : <a href="moonbitlang/core/array#Array">Array</a>[Double]) -> Double
```
 Calculate the reciprocal of square root of the sum of squares of any number of coordinates.

## rnorm3d

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rnorm3d.mbt,2:::fn rnorm3d(a : Double, b : Double, c : Double) -> Double
```
 Calculate one over the square root of the sum of squares of three coordinates.

## rnorm4d

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rnorm4d.mbt,2:::fn rnorm4d(a : Double, b : Double, c : Double, d : Double) -> Double
```
 Calculate one over the square root of the sum of squares of four coordinates.

## round

```moonbit
:::source,Kaida-Amethyst/moonbit-math/round.mbt,2:::fn round(x : Double) -> Double
```
 Return the nearest integer value to `x`.

## roundeven

```moonbit
:::source,Kaida-Amethyst/moonbit-math/roundeven.mbt,18:::fn roundeven(x : Double) -> Double
```
 roundeven is a function that rounds a number to the nearest even integer.

 #### Special Cases

 1. roundeven(NaN) = NaN
 2. roundeven(±∞) = ±∞

 #### Examples

 ```
 let x = 1.4; assert_eq!(roundeven(x), 1.0);
 let x = 1.5; assert_eq!(roundeven(x), 2.0);
 let x = 1.6; assert_eq!(roundeven(x), 2.0);
 let x = 2.4; assert_eq!(roundeven(x), 2.0);
 let x = 2.5; assert_eq!(roundeven(x), 2.0);
 let x = 2.6; assert_eq!(roundeven(x), 3.0);
 ```

## rsqrt

```moonbit
:::source,Kaida-Amethyst/moonbit-math/rsqrt.mbt,4:::fn rsqrt(x : Double) -> Double
```
 Inverse square root of a number

## scalbn

```moonbit
:::source,Kaida-Amethyst/moonbit-math/scalbn.mbt,9:::fn scalbn(input : Double, n : Int) -> Double
```
 Compute x \* 2 \*\*n where x is a double and n is an integer.
 #### Introcution:

 Compute x \* 2 \*\*n without computing 2 \*\* n.

 #### Accruacy:

 1 ulp (unit in the last place).

## signum

```moonbit
:::source,Kaida-Amethyst/moonbit-math/signum.mbt,7:::fn signum(x : Double) -> Double
```
 Return a number that represents the sign of the argument.

 - `1.0` if the argument is positive, `+0.0` or `+Inf`
 - `-1.0` if the argument is negative, `-0.0` or `-Inf`
 - `NaN` if the argument is `NaN`

## sin

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sin.mbt,2:::fn sin(x : Double) -> Double
```
 Compute sine of double-precision floating-point number `x`.

## sincos

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sincos.mbt,2:::fn sincos(x : Double) -> (Double, Double)
```
 Compute the sine and cosine of a number simultaneously

## sincospi

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sincospi.mbt,2:::fn sincospi(x : Double) -> (Double, Double)
```
 Compute the sine and cosine of a number multiplied by pi simultaneously

## sinh

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sinh.mbt,24:::fn sinh(x : Double) -> Double
```
 Compute hyperbolic sine function of a double-precision floating point number.

 #### Special Cases

 1. sinh(x) is \|x\| if x is +INF, -INF, or NaN.
 2. Only sinh(0)=0 is exact for finite x.

## sinpi

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sinpi.mbt,9:::fn sinpi(x : Double) -> Double
```
 Compute sin(pi\*x) with high accuracy.
 #### Introduction

 Compute sin(pi\*x) with high accuracy.

 #### Accuracy

 1 ulp (1 bit error)

## sqrt

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sqrt.mbt,2:::fn sqrt(x : Double) -> Double
```
 Compute Square Root of a number

## sqrt1pm1

```moonbit
:::source,Kaida-Amethyst/moonbit-math/sqrt1pm1.mbt,2:::fn sqrt1pm1(x : Double) -> Double
```
 sqrt1pm1(x) compute sqrt(1 + x) - 1 with higher accuracy than the naive formula

## tan

```moonbit
:::source,Kaida-Amethyst/moonbit-math/tan.mbt,11:::fn tan(x : Double) -> Double
```
 Compute the tangent of double-precision floating-point number `x`.

## tanh

```moonbit
:::source,Kaida-Amethyst/moonbit-math/tanh.mbt,30:::fn tanh(x : Double) -> Double
```
 Compute hyperbolic tangent function of a double-precision floating point number.

 #### Special Cases

 1. tanh(x) is x if x is NaN.
 2. tanh(x) is 1 if x is +INF.

## to\_degrees

```moonbit
:::source,Kaida-Amethyst/moonbit-math/to_degrees.mbt,2:::fn to_degrees(x : Double) -> Double
```
 Converts radians to degrees.

## to\_radians

```moonbit
:::source,Kaida-Amethyst/moonbit-math/to_radians.mbt,3:::fn to_radians(x : Double) -> Double
```
 Converts degrees to radians.

## trunc

```moonbit
:::source,Kaida-Amethyst/moonbit-math/trunc.mbt,2:::fn trunc(x : Double) -> Double
```
 Return the integral part of a floating point number

## y0

```moonbit
:::source,Kaida-Amethyst/moonbit-math/y0.mbt,25:::fn y0(x : Double) -> Double
```
 Compute Bessel function of the second kind of order zero
 #### Special Cases

 1. y0(nan) is nan
 2. y0(0) is 0
 3. y0(inf) is 0

## y1

```moonbit
:::source,Kaida-Amethyst/moonbit-math/y1.mbt,26:::fn y1(x : Double) -> Double
```
 Compute Bessel function of the second kind of order one.

 #### Special Cases

 1. `y1(x)` is NaN if `x` is NaN.
 2. `y1(x)` is 0 if `x` is ±∞.
 3. `y1(x)` is NaN if `x` is less than 0.

## yn

```moonbit
:::source,Kaida-Amethyst/moonbit-math/jn.mbt,15:::fn yn(n : Int, x : Double) -> Double
```
 Calculate the value of the Bessel function of the second kind of order n for the input argument.

 #### Special Cases

 1. yn(n, x) returns NaN for n \< 0.
 2. yn(n, +-0) returns NaN.
 3. yn(n, x) returns NaN for x \< 0.
 4. yn(n, +inf) returns +0.
 5. yn(n, NaN) returns NaN.

 #### Note

 1. For n = 0, y0(x) is called.
 2. For n = 1, y1(x) is called.

## zeta

```moonbit
:::source,Kaida-Amethyst/moonbit-math/zeta.mbt,3:::fn zeta(x : Double, y : Double) -> Double
```

