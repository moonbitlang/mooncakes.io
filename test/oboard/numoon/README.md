
<div id="mod-info">
    <h1 id="mod-title"> numoon <span id="mod-version">v0.3.2</span></h1>
    MoonBit Mathematical Operation
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>oboard</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/oboard/numoon">https://github.com/oboard/numoon</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>moonbit</li>
                <li>numoon</li>
                <li>matrix</li>
                <li>math</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add oboard/numoon </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# oboard/numoon

## 📖Table of Contents

- [Introduction](#-introduction)
- [Getting Started](#-getting-started)
- [Contributing](#-contributing)
- [License](#-license)

## ✨Introduction

**Numoon** is an open-source MoonBit library that provides support for multi-dimensional array objects and functions for efficiently operating on these arrays.

<!-- The core of Numoon is its N-dimensional array object NMArray, which is very similar to basic MoonBit lists but can store any data type and perform vectorized mathematical operations. This makes Numoon highly suitable for numerical computations. -->

Here are some key features of Numoon:

1. Multi-dimensional Array Objects: Numoon provides a powerful N-dimensional array NMArray, which is the foundation for scientific computing.

2. Derived Objects (such as Masked Arrays and Matrices): Numoon allows users to create special arrays, like masked arrays, which handle missing or invalid data.

3. Extensive Mathematical Function Library: Numoon has a vast array of mathematical functions, including linear algebra, Fourier transforms, and random number generation.
<!--
4. Vectorized Operations: Numoon's array operations are vectorized, meaning you can perform operations on arrays without explicit loops.

5. Support for Various Data Types: Numoon supports a wide range of data types, including integers, floating-point numbers, complex numbers, and more.

6. Operation Broadcasting: Numoon offers a powerful mechanism that allows arithmetic operations between arrays of different sizes.

7. Memory Efficiency: Numoon arrays store data more efficiently than native MoonBit data structures.

8. Tool Integration: Numoon is the foundation for many other scientific computing libraries, such as SciMoon, Moondas, and MoonPlotlib. -->

Numoon is an indispensable tool for scientific computing and data analysis in MoonBit, widely used in fields such as physics, biology, engineering, and more.

## 🚀Getting Started

To get started with Numoon, you can simply install it using the following command:

```bash
moon add oboard/numoon
```

Configure your MoonBit project `moon.pkg.json` file:
```json
{
  "import": [
    {
      "path": "oboard/numoon/lib",
      "alias": "nm"
    } 
  ]
}
```

This will install the latest version of Numoon and its dependencies.

To use Numoon in your MoonBit program, simply import the library using the following code:

You can then create an NMArray object using the following code:

### Creating Arrays

```moonbit
a = @nm.array([1, 2, 3])
b = @nm.array([1, 2, 3])
println(a + b)
// Output: [2, 4, 6]
```

# Array Operations

```moonbit
a = @nm.array([1, 2, 3])
println(a.sum())
println(a.prod())
// Output: 6 6
```

### Reshape

```moonbit
let a = @nm.array([[1, 2, 3], [4, 5, 6]])
println(a.reshape(3, 2))
// Output: [[1, 2], [3, 4], [5, 6]]
```

### Random Number Generation

```moonbit
let list1 = @nm.rand(6)
println(list1)
// Output: [[0.2893123275883688, 0.33959090191249325, 0.1521095035725017],
//  0.9314055834969763, 0.8561914513327412, 0.7919828439328577]
```

### Matrix

```moonbit
let list1 = @nm.array([[1, 2, 3], [4, 5, 6]])
```

#### Matrix Operations

```moonbit
let m2 = @nm.array([[1, 2, 3], [4, 5, 6]])
let m1 = @nm.array([[7, 8], [9, 10], [11, 12]])

let result = @nm.dot(m1, m2)
println(result)

// Output: [[121.0 136.0 151.0]
//  [153.0 172.0 191.0]
//  [185.0 208.0 231.0]]
```

#### Matrix Transpose

```moonbit
let a = @nm.array([[1, 2], [3, 4]])

println(a.transpose())

// Output: [[1 3]
//  [2 4]]
```

### linspace

start: The starting value of the sequence.

stop: The ending value of the sequence.

~num: The number of samples to generate, inclusive of both start and stop. Default is 50.

```moonbit
let a = @nm.linspace(0.0, 10.0, num=11)
println(a)

// Output: [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
```

## 🤝Contributing

We welcome contributions to Numoon! Please read our [contribution guide](CONTRIBUTING.md) to learn more.

## 👨‍💻Authors

- @oboard
- @Yorkin

## 📝License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
