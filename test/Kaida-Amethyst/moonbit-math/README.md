
<div id="mod-info">
    <h1 id="mod-title"> moonbit-math <span id="mod-version">v0.1.10</span></h1>
    High-precision Math library
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>Kaida-Amethyst</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/Kaida-Amethyst/Moonbit-Math">https://github.com/Kaida-Amethyst/Moonbit-Math</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>math</li>
                <li>numeric</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add Kaida-Amethyst/moonbit-math </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



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
