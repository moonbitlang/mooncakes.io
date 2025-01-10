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
