
<div id="mod-info">
    <h1 id="mod-title"> linalg <span id="mod-version">v0.2.7</span></h1>
    Linear Algebra Library
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>xunyoyo</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/xunyoyo/linalg">https://github.com/xunyoyo/linalg</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>algebra</li>
                <li>math</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add xunyoyo/linalg </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# Linear Algebra Library

This repository contains a linear algebra library implemented in Moonbit. The library provides various matrix operations such as addition, subtraction, multiplication, determinant calculation, and matrix inversion.

## Features

- **Matrix Addition**: Add two matrices of the same dimensions.
- **Matrix Subtraction**: Subtract one matrix from another of the same dimensions.
- **Matrix Multiplication**: Multiply two matrices with compatible dimensions.
- **Determinant Calculation**: Compute the determinant of a square matrix.
- **Matrix Inversion**: Compute the inverse of a non-singular square matrix.
- **Matrix Transposition**: Transpose a given matrix.
- **Scalar Multiplication**: Multiply each element of a matrix by a scalar.
- **Trace Calculation**: Compute the trace of a square matrix.
- **Dot Product**: Calculate the dot product of two matrices of the same shape.
- **Identity Matrix**: Create an identity matrix of a given size.
- **Diagonal Matrix**: Create a diagonal matrix from a given array.
- **Zero Matrix**: Create a matrix filled with zeros.
- **Matrix Norms**: Calculate various norms for matrices and vectors.
- **Matrix Slicing**: Extract submatrices from a given matrix.
- **Matrix Reshaping**: Reshape a matrix to new dimensions.
- **System of Linear Equations**: Solve systems of linear equations.
... And So On
See More in [Mooncakes](https://mooncakes.io/docs/#/xunyoyo/linalg/)

## Usage

### Matrix Addition

```moonbit
let a = new_matrix([[1.0, 2.0], [3.0, 4.0]])
let b = new_matrix([[5.0, 6.0], [7.0, 8.0]])
let c = a + b
```

### Matrix Inversion

```moonbit
let mat = new_matrix([[4.0, 7.0], [2.0, 6.0]])
let inverse = mat.inv()
```

### Determinant Calculation

```moonbit
let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
let determinant = m.det()
```

## Examples

### Matrix Multiplication

```moonbit
let a = new_matrix([[1.0, 2.0], [3.0, 4.0]])
let b = new_matrix([[2.0, 0.0], [1.0, 2.0]])
let c = a * b
```

### Transpose

```moonbit
let m = new_matrix([[1, 2], [3, 4]])
let mt = m.transpose()
```

### Scalar Multiplication

```moonbit
let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
let scaled = m.k(2.0)
```
See More Details in [Mooncakes](https://mooncakes.io/docs/#/xunyoyo/linalg/)

## License

This project is licensed under the Apache-2.0 License.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Contact

For any questions or suggestions, please contact [1279416582@qq.com].
