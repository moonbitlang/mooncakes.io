# Moonbit Math Library

[中文版](README-CN.md)

## Overview

The Moonbit Math Library is a comprehensive collection of mathematical functions implemented in the Moonbit programming language. This library is designed to provide high-precision mathematical operations that align closely with the implementations found in the GNU C Library (glibc). It includes a wide range of functions such as trigonometric, exponential, logarithmic, and special functions, all of which are essential for numerical computations.

## Installation

To use the Moonbit Math Library in your project, you can easily add it via the Moonbit package manager. Simply run the following command:

```bash
moon add Kaida-Amethyst/moonbit-math
```

Or:

```bash
moon add Kaida-Amethyst/math
```

This command will add the library to your project dependencies, allowing you to import and use the mathematical functions seamlessly.

## Precision

The Moonbit Math Library strives for high precision in its calculations, aiming to match the accuracy of glibc implementations. Below is a table that outlines the ULP (Units in the Last Place) precision differences for each function in the library.

| func          | description                          | Support | ulp (for result is float or double) |
|---------------|--------------------------------------|---------|-------------------------------------|
| abs           | Compute absolute value               | ✓       |  0                                  |
| acos          | Compute arccosine                    | ✓       |  1                                  |
| acosh         | Compute inverse hyperbolic cosine    | ✓       |  1                                  |
| asin          | Compute arcsine                      | ✓       |  1                                  |
| asinh         | Compute inverse hyperbolic sine      | ✓       |  1                                  |
| atan          | Compute arctangent                   | ✓       |  1                                  |
| atan2         | Compute arctangent with two arguments| ✓       |  1                                  |
| atanh         | Compute inverse hyperbolic tangent   | ✓       |  1                                  |
| cbrt          | Compute cubic root                   | ✓       |  1                                  |
| ceil          | Round up to the nearest integer      | ✓       |  0                                  |
| clamp         | Clamp value within a specified range | ✓       |  0                                  |
| cos           | Compute cosine                       | ✓       |  49                                 |
| cosh          | Compute hyperbolic cosine            | ✓       |  1                                  |
| cospi         | Compute cos(πx)                      | ✓       |  3                                  |
| cyl_bessel_i0 | Cylindrical Bessel function of order 0| (TODO) |  (TODO)                             |
| cyl_bessel_i1 | Cylindrical Bessel function of order 1| (TODO) |  (TODO)                             |
| digamma       | Compute Digamma function             | ✓       |  4                                  |
| div_euclid    | Compute Euclidean division           | ✓       |  0                                  |
| erf           | Compute error function               | ✓       |  1                                  |
| erfc          | Compute complementary error function | ✓       |  (TODO)                             |
| erfcinv       | Compute inverse complementary error function | ✓      |  (TODO)                      |
| erfcx         | Compute scaled complementary error function | ✓       |  1                           |
| erfinv        | Compute inverse error function       | ✓       |  2                                  |
| exp           | Compute exponential function         | ✓       |  0                                  |
| exp10         | Compute 10 raised to the power of x  | ✓       |  0                                  |
| exp2          | Compute 2 raised to the power of x   | ✓       |  58                                 |
| expm1         | Compute exp(x) - 1                   | ✓       |  0                                  |
| fast_rsqrt    | Compute fast reciprocal square root  | ✓       |  (TODO)                             |
| floor         | Round down to the nearest integer    | ✓       |  0                                  |
| fract         | Compute fractional part              | ✓       |  0                                  |
| fdim          | Compute positive difference of two numbers | ✓       |  0                            |
| gelu          | Compute GELU function                | ✓       |  (TODO)                             |
| gegenbauer    | Compute Gegenbauer polynomial        | ✓       |  (TODO)                             |
| gamma         | Compute Gamma function               | ✓       |  (TODO)                             |
| hermite       | Compute Hermite polynomial           | ✓       |  3                                  |
| hypot         | Compute Euclidean norm               | ✓       |  0                                  |
| ilogb         | Compute integer part of log2(x)      | ✓       |  0                            |
| isfinite      | Check if value is finite             | ✓       |  0                                  |
| isinf         | Check if value is infinite           | ✓       |  0                                  |
| isnan         | Check if value is NaN                | ✓       |  0                                  |
| isnormal      | Check if value is normal             | ✓       |  0                                  |
| issubnormal   | Check if value is subnormal          | ✓       |  0                                  |
| jacobi        | Compute Jacobi elliptic function     | ✓       |  0                                  |
| j0            | Compute Bessel function of the first kind (0th order) | ✓       |  2                 |
| j1            | Compute Bessel function of the first kind (1st order) | ✓       |  4                 |
| jn            | Compute Bessel function of the first kind (nth order) | ✓       |  1                 |
| ldexp         | Compute x * 2^exp                    | ✓       |  0                                  |
| log           | Compute natural logarithm            | ✓       |  0                                  |
| log10         | Compute logarithm base 10            | ✓       |  0                                  |
| log1p         | Compute log(1 + x)                   | ✓       |  0                                  |
| log2          | Compute logarithm base 2             | ✓       |  0                                  |
| logaddexp     | Compute log(exp(x) + exp(y))         | ✓       |  0                                  |
| logb          | Compute integer part of log2(x)      | ✓       |  0                                  |
| logsumexp     | Compute log(sum(exp(x)))             | ✓       |  0                                  |
| nearbyint     | Round to nearest integer             | ✓       |  0                                  |
| nextafter     | Return next floating-point number    | ✓       |  0                                  |
| nextdown      | Return next smaller floating-point number | (TODO)       |  (TODO)                   |
| nextup        | Return next larger floating-point number | (TODO)    |  (TODO)                       |
| norm          | Compute norm                         | ✓       |  0                                  |
| norm3d        | Compute norm3d                       | ✓       |  0                                  |
| norm4d        | Compute norm4d                       | ✓       |  0                                  |
| normcdf       | Compute cumulative distribution function of normal distribution | ✓       |  0       |
| normcdfinv    | Compute inverse cumulative distribution function of normal distribution | ✓       |  0   |
| pown          | Compute integer power of x           | ✓       |  0                                  |
| polygamma     | Compute Polygamma function           | (TODO)  |  (TODO)                             |
| pow           | Compute x raised to the power of y   | ✓       |  0                                  |
| rcbrt         | Compute reciprocal of cubic root     | ✓       |  0                                  |
| rem_euclid    | Compute Euclidean remainder          | ✓       |  0                                  |
| rhypot        | Compute reciprocal of Euclidean norm | ✓       |  0                                  |
| rint          | Round to nearest integer             | ✓       |  0                                  |
| rnorm         | Compute reciprocal of norm           | ✓       |  0                                  |
| rnorm3d       | Compute reciprocal of norm3d         | ✓       |  0                                  |
| rnorm4d       | Compute reciprocal of norm4d         | ✓       |  0                                  |
| round         | Round to nearest integer             | ✓       |  0                                  |
| roundeven     | Round to nearest even integer        | ✓       |  0                                  |
| rsqrt         | Compute reciprocal of square root    | ✓       |  0                                  |
| scalbn        | Compute x * 2^n                      | ✓       |  0                                  |
| sign          | Compute sign function                | ✓       |  0                                  |
| signum        | Compute sign function                | ✓       |  0                                  |
| sin           | Compute sine                         | ✓       |  3                                  |
| sinc          | Compute sinc function                | (TODO)  |  (TODO)                             |
| sincos        | Compute sine and cosine simultaneously | ✓       |  0                                |
| sincospi      | Compute sin(πx) and cos(πx) simultaneously | ✓       |  0                            |
| sinh          | Compute hyperbolic sine              | ✓       |  0                                  |
| sinhc         | Compute normalized hyperbolic sine   | (TODO)  |  (TODO)                             |
| sinpi         | Compute sin(πx)                      | ✓       |  3                                  |
| sqrt          | Compute square root                  | ✓       |  0                                  |
| sqrt1pm1      | Compute sqrt(1 + x) - 1              | ✓       |  0                                  |
| tan           | Compute tangent                      | ✓       |  0                                  |
| tanh          | Compute hyperbolic tangent           | ✓       |  0                                  |
| to_degrees    | Convert radians to degrees           | ✓       |  0                                  |
| to_radians    | Convert degrees to radians           | ✓       |  0                                  |
| trunc         | Truncate to integer part             | ✓       |  0                                  |
| y0            | Compute Bessel function of the second kind (0th order) | ✓       |  2                |
| y1            | Compute Bessel function of the second kind (1st order) | ✓       |  2                |
| yn            | Compute Bessel function of the second kind (nth order) | ✓       |  2                |
| zeta          | Compute Riemann zeta function        | ✓       |  (TODO)                             |

### Notes on Precision

- **ULP (Units in the Last Place)**: This metric measures the difference between the computed result and the true result in terms of the least significant bit of the floating-point representation. A lower ULP value indicates higher precision.
- **0 ULP**: Indicates that the function matches the glibc implementation exactly.
- **1 ULP**: Indicates that the function is within half a unit of the last place, which is considered very high precision.
- **2 ULP**: Indicates that the function is within one unit of the last place, which is still considered acceptable for most numerical applications.

## Usage Example

Here is a simple example demonstrating how to use the `sin` function from the Moonbit Math Library:

First add dependencies in `moon.pkg.json`:

```json
{
    "import" :[
        {
            "path":"Kaida-Amethyst/moonbit-math",
            "alias": "math"
        }
    ]
}
```

Or use `Kaida-Amethyst/math` if what you added is `Kaida-Amethyst/math`.

```json
{
    "import" :[
        "Kaida-Amethyst/math"
    ]
}
```

Then you can use math functions, for example:

```moonbit
fn main() {
    let angle = 1.0 // in radians
    let result = @math.sin(angle)
    println("The sine of \{angle} is \{result}")
}
```

## Contributing

We welcome contributions to the Moonbit Math Library! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on our [GitHub repository](https://github.com/Kaida-Amethyst/moonbit-math).

## License

The Moonbit Math Library is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for more details.

---

Thank you for using the Moonbit Math Library! We hope it serves you well in your numerical computing endeavors.
