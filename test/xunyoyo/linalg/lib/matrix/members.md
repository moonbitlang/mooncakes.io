# Documentation
|Type|description|
|---|---|
|[Matrix](#Matrix)||
|[NormType](#NormType)||
|[Type](#Type)||

|Value|description|
|---|---|
|[diag](#diag)| Creates a square diagonal matrix from a given array, where the diagonal|
|[diagonal](#diagonal)||
|[eye](#eye)| Creates a square identity matrix of the specified size.|
|[lstsq](#lstsq)| Computes the least-squares solution to a linear matrix equation.|
|[new\_matrix](#new_matrix)| Creates a new matrix from a 2D array of Double values. If rows and cols are|
|[solve](#solve)| Solves a system of linear equations represented by matrices A and B in the|
|[zero](#zero)| Creates a new matrix of the specified size with all elements initialized to|

## Matrix

```moonbit
:::source,xunyoyo/linalg/lib/matrix/matrix.mbt,2:::type Matrix
```


#### mooncakes-io-method-mark-Methods
- #### apply
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,544:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::apply(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, f : (Double) -> Double) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  >  Applies a function to every element in the matrix, modifying the matrix
  > in-place.
  > 
  >  Parameters:
  > 
  >  * `matrix`: The matrix to be modified.
  >  * `transform`: A function that takes a `Double` and returns a `Double`, which
  >    will be applied to each element in the matrix.
  > 
  >  Returns the modified matrix.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "matrix/apply" {
  >    let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
  >    let square = fn(x: Double) -> Double { x * x }
  >    
  >    let result = m.apply(square)
  >    inspect!(result.data, content="[[1.0, 4.0], [9.0, 16.0]]")
  >  }
  >  
  >  test "matrix/apply_with_negative" {
  >    let m = ew_matrix([[1.0, -2.0], [-3.0, 4.0]])
  >    let abs = fn(x: Double) -> Double { 
  >      if x < 0.0 { -x } else { x }
  >    }
  >    
  >    let result = m.apply(abs)
  >    inspect!(result.data, content="[[1.0, 2.0], [3.0, 4.0]]")
  >  }
  >  ```
- #### cholesky
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/cholesky.mbt,33:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::cholesky(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  > 
  >  Performs Cholesky decomposition of a positive-definite matrix.
  > Decomposes a matrix A into the product L·L^T where L is a lower triangular matrix.
  > 
  >  Parameters:
  >  * `matrix`: Input matrix to decompose. Must be positive-definite.
  > 
  >  Returns a lower triangular matrix L such that A = L·L^T.
  > 
  >  Throws:
  >  * `MatrixShapeError` if the input matrix is not square.
  >  * `MatrixError` if the input matrix is not positive-definite.
  > 
  >  Example:
  >  ```moonbit
  >  test "cholesky/basic" {
  >    let a = new_matrix([[4.0, 12.0, -16.0], [12.0, 37.0, -43.0], [-16.0, -43.0, 98.0]])
  >    let l = a.cholesky()
  >    
  >    // Verify L is lower triangular
  >    for i = 0; i < l.rows; i = i + 1 {
  >      for j = i + 1; j < l.cols; j = j + 1 {
  >        inspect!(l.data[i][j], content="0.0")
  >      }
  >    }
  >    
  >    // Verify A = L·L^T
  >    let lt = l.transpose()
  >    let a2 = l * lt
  >    inspect!(a2.approx_eq(a), content="true")
  >  }
  >  ```
- #### copy
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,822:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::copy(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  > 
  >  Creates a new matrix from a two-dimensional array of double-precision
  > floating-point numbers. If the dimensions are not explicitly specified, they
  > will be inferred from the input array.
  > 
  >  Parameters:
  > 
  >  * `data` : A two-dimensional array of type `Array[Array[Double]]` containing
  >    the matrix elements.
  >  * `rows` : Optional. The number of rows in the matrix. Defaults to the number
  >    of arrays in `data`.
  >  * `cols` : Optional. The number of columns in the matrix. Defaults to the
  >    length of the first array in `data`.
  > 
  >  Returns a new `Matrix` instance containing a deep copy of the input data.
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "new_matrix/default_dimensions" {
  >    // Create a 2x2 matrix with default dimensions
  >    let data = [[1.0, 2.0], [3.0, 4.0]]
  >    let matrix = new_matrix(data)
  >    inspect!(matrix.shape(), content="(2, 2)")
  >    inspect!(matrix.data[0][0], content="1.0")
  >  }
  >  
  >  test "new_matrix/explicit_dimensions" {
  >    // Create a matrix with explicit dimensions
  >    let data = [[1.0, 2.0, 3.0]]
  >    let matrix = new_matrix(data, rows=1, cols=3)
  >    inspect!(matrix.shape(), content="(1, 3)")
  >  }
  >  ```
- #### det
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/det.mbt,26:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::det(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> Double
  ```
  >  Calculates the determinant of a square matrix using the Laplace expansion
  > along the first row.
  > 
  >  Parameters:
  > 
  >  * `matrix`: A square matrix whose determinant needs to be calculated.
  > 
  >  Returns a Double value representing the determinant of the matrix.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "determinant" {
  >    let m1 = Matrix::new(1, 1)
  >    m1.data[0][0] = 5.0
  >    inspect!(m1.det(), content="5.0")
  >  
  >    let m2 = Matrix::new(2, 2)
  >    m2.data[0][0] = 1.0
  >    m2.data[0][1] = 2.0
  >    m2.data[1][0] = 3.0
  >    m2.data[1][1] = 4.0
  >    inspect!(m2.det(), content="-2.0") // 1*4 - 2*3 = -2
  >  }
  >  ```
- #### dot
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,131:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::dot(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, b : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> Double
  ```
  >  Calculates the dot product of two matrices. If matrices have different shapes,
  > they will be flattened into 1D vectors first.
  > 
  >  Parameters:
  > 
  >  * `first`: First matrix operand
  >  * `second`: Second matrix operand
  > 
  >  Returns the scalar dot product of the two matrices after flattening.
  > 
  >  Throws an error if the total number of elements in matrices are different,
  > with the message "MatrixShapeError: Matrices must have same total number of elements
  > after flattening for dot product".
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  // same shape vectors
  >  let a = new_matrix([1, 2, 3])
  >  let b = new_matrix([2, 3, 4])
  >  // answer is 1*2 + 2*3 + 3*4 = 20
  >  println(dot(a, b)) // 20
  >  println(a.dot(b))  // 20
  >  
  >  // different shapes but same total elements
  >  let c = new_matrix([[1, 2], [3, 4]])  // 2x2 matrix
  >  let d = new_matrix([1, 2, 3, 4])      // 1x4 vector
  >  // flattened: [1,2,3,4] · [1,2,3,4] = 30
  >  println(dot(c, d)) // 30
  >  
  >  // higher dimensions
  >  let e = new_matrix([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])  // 2x2x2 tensor
  >  let f = new_matrix([1, 2, 3, 4, 5, 6, 7, 8])              // 1x8 vector
  >  println(dot(e, f)) // 204
  >  
  >  // error case - different total elements
  >  let g = new_matrix([1, 2, 3])
  >  let h = new_matrix([1, 2, 3, 4])
  >  println(dot(g, h)) // throws MatrixShapeError
  >  ```
- #### eigen
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/eigen.mbt,41:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::eigen(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, max_iterations~ : Int = .., tol~ : Double = ..) -> (<a href="moonbitlang/core/array#Array">Array</a>[Double], <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>)
  ```
  > 
  >  Computes eigenvalues and eigenvectors of a square matrix using QR algorithm
  > with implicit shifts. The QR algorithm iteratively decomposes the matrix into
  > a product of an orthogonal matrix Q and an upper triangular matrix R,
  > converging to a diagonal matrix containing eigenvalues.
  > 
  >  Parameters:
  > 
  >  * `matrix` : A square matrix whose eigenvalues and eigenvectors are to be
  >    computed.
  >  * `max_iterations` : Maximum number of iterations for the QR algorithm.
  >    Defaults to 1000.
  >  * `tolerance` : Convergence tolerance for off-diagonal elements. The
  >    algorithm stops when the Frobenius norm of off-diagonal elements is less than
  >    this value. Defaults to 1e-10.
  > 
  >  Returns a tuple `(eigenvalues, eigenvectors)` where:
  > 
  >  * `eigenvalues` : An array of Double values representing the eigenvalues of
  >    the matrix
  >  * `eigenvectors` : A matrix whose columns are the corresponding eigenvectors
  > 
  >  Throws "MatrixShapeError" if the input matrix is not square.
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "eigen/symmetric" {
  >    // Create a 2x2 symmetric matrix
  >    let a = new_matrix([[3.0, 0.0], [0.0, 4.0]])
  >    let (eigenvalues, eigenvectors) = a.eigen()
  >    // Eigenvalues should be 3.0 and 4.0
  >    inspect!(eigenvalues, content="[3.0, 4.0]")
  >  }
  >  
  >  test "panic eigen/non_square" {
  >    let a = new_matrix([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
  >    panic!(a.eigen())
  >  }
  >  ```
- #### flat
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,739:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::flat(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  >  Flattens a matrix into a 1 x (m\*n) matrix by concatenating all rows
  > horizontally.
  > 
  >  Parameters:
  > 
  >  * `matrix` : A Matrix object to be flattened.
  > 
  >  Returns a new Matrix with dimensions 1 x (m\*n), where m and n are the number
  > of rows and columns of the input matrix respectively.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "matrix/flat" {
  >    let m = Matrix::new(2, 3)
  >    m.data[0][0] = 1
  >    m.data[0][1] = 2
  >    m.data[0][2] = 3
  >    m.data[1][0] = 4
  >    m.data[1][1] = 5
  >    m.data[1][2] = 6
  >    
  >    let flattened = m.flat()
  >    inspect!(flattened.rows, content="1")
  >    inspect!(flattened.cols, content="6")
  >    inspect!(flattened.data[0], content="[1, 2, 3, 4, 5, 6]")
  >  }
  >  ```
- #### get
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,508:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::get(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, i : Int, j : Int) -> Double
  ```
  >  Retrieves the element at the specified row and column indices in a matrix.
  > 
  >  Parameters:
  > 
  >  * `matrix`: The matrix from which to retrieve the element.
  >  * `row`: The row index of the element (zero-based).
  >  * `column`: The column index of the element (zero-based).
  > 
  >  Returns a `Double` value representing the element at the specified position
  > in the matrix.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "matrix/get" {
  >    // Create a 2x2 matrix with elements [[1.0, 2.0], [3.0, 4.0]]
  >    let matrix = new_matrix([[1.0, 2.0], [3.0, 4.0]])
  >    
  >    // Get elements at different positions
  >    inspect!(matrix.get(0, 0), content="1.0")
  >    inspect!(matrix.get(0, 1), content="2.0")
  >    inspect!(matrix.get(1, 0), content="3.0")
  >    inspect!(matrix.get(1, 1), content="4.0")
  >  }
  >  ```
- #### inv
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/inv.mbt,51:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::inv(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  >  Computes the inverse of a square matrix using Gauss-Jordan elimination
  > method.
  > 
  >  Parameters:
  > 
  >  * `matrix` : A square matrix to be inverted. Must be a non-singular matrix
  >    with equal number of rows and columns.
  > 
  >  Returns a new matrix that is the inverse of the input matrix.
  > 
  >  Throws a runtime error if:
  > 
  >  * The input matrix is not square (rows ≠ columns)
  >  * The input matrix is singular (determinant = 0)
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "matrix_inverse" {
  >    // Create a 2x2 matrix
  >    let mat = new_matrix([[4.0, 7.0], [2.0, 6.0]])
  >    let inverse = mat.inv()
  >    
  >    // Expected inverse matrix
  >    let expected = new_matrix([[0.6, -0.7], [-0.2, 0.4]])
  >    
  >    // Check if the inverse is correct by multiplying with original matrix
  >    let product = mat * inverse
  >    let identity = eye(2)
  >    
  >    // The product should be approximately the identity matrix
  >    inspect!(product.approx_eq(identity), content="true")
  >  }
  >  
  >  test "matrix_inverse_error" {
  >    // Create a non-square matrix
  >    let mat = new_matrix([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
  >    
  >    // Attempting to invert a non-square matrix should panic
  >    panic!(mat.inv())
  >  }
  >  
  >  test "matrix_inverse_singular" {
  >    // Create a singular matrix
  >    let mat = new_matrix([[1.0, 2.0], [2.0, 4.0]])
  >    
  >    // Attempting to invert a singular matrix should panic
  >    panic!(mat.inv())
  >  }
  >  ```
- #### k
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,235:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::k(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, k : Double) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  >  Multiplies each element of a matrix by a scalar value, modifying the matrix
  > in place.
  > 
  >  Parameters:
  > 
  >  * `matrix`: The matrix to be scaled. The operation will modify this matrix
  >    directly.
  >  * `scalar`: A floating-point number to multiply with each element of the
  >    matrix.
  > 
  >  Returns the modified matrix after scaling.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "matrix_scalar_multiplication" {
  >    let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
  >    let result = m.k(2.0)
  >    inspect!(result.data, content="[[2.0, 4.0], [6.0, 8.0]]")
  >    // The original matrix is modified
  >    inspect!(m.data, content="[[2.0, 4.0], [6.0, 8.0]]")
  >  }
  >  ```
- #### new
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,871:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::new(rows : Int, cols : Int) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  > 
- #### norm
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/norm.mbt,207:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::norm(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, ord~ : <a href="xunyoyo/linalg/lib/matrix#NormType">NormType</a> = .., axis~ : <a href="xunyoyo/linalg/lib/matrix#Type">Type</a> = ..) -> Double
  ```
  > 
  >  Calculates various types of norms for matrices and vectors. For vectors, the
  > matrix is first flattened into a 1D array. For matrices, different matrix
  > norms are computed based on the specified norm type.
  > 
  >  Parameters:
  > 
  >  * `matrix`: The input matrix for which to calculate the norm.
  >  * `norm_type`: The type of norm to calculate (default: `NormType::Two`).
  >    Available options:
  >   * For vectors (when `axis` is `Vector`):
  >   * `Zero`: Counts the number of non-zero elements
  >   * `One`: Manhattan/Taxicab norm (sum of absolute values)
  >   * `Two`: Euclidean norm (square root of sum of squares)
  >   * `P(p)`: p-norm where p is a positive real number
  >   * `Infinity`: Maximum absolute value
  >   * For matrices (when `axis` is `Matrix`):
  >   * `One`: Maximum absolute column sum
  >   * `Two`: Spectral norm (square root of largest eigenvalue of A^T A)
  >   * `Frobenius`: Square root of sum of squared elements
  >   * `Infinity`: Maximum absolute row sum
  >  * `axis`: Specifies whether to treat the input as a vector or matrix
  >    (default: `Vector`)
  > 
  >  Returns a `Double` value representing the calculated norm.
  > 
  >  Throws an error with message "NormType: Invalid norm type" if an unsupported
  > norm type is specified for the chosen axis.
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "norm/vector" {
  >    // Vector norms
  >    let v = new_matrix([[1.0, -2.0, 3.0]])
  >  
  >    // L1 norm (Manhattan)
  >    inspect!(v.norm(ord=NormType::One), content="6.0")
  >  
  >    // L2 norm (Euclidean)
  >    inspect!(v.norm(ord=NormType::Two), content="3.7416573867739413")
  >  
  >    // L∞ norm (Maximum)
  >    inspect!(v.norm(ord=NormType::Infinity), content="3.0")
  >  }
  >  
  >  test "norm/matrix" {
  >    // Matrix norms
  >    let m = new_matrix([[1.0, 2.0], [-3.0, 4.0]])
  >  
  >    // Frobenius norm
  >    inspect!(
  >      m.norm(ord=NormType::Frobenius, axis=Matrix),
  >      content="5.477225575051661",
  >    )
  >  
  >    // Maximum absolute row sum (infinity norm)
  >    inspect!(m.norm(ord=NormType::Infinity, axis=Matrix), content="7.0")
  >  }
  >  
  >  test "panic norm/invalid" {
  >    let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
  >    // Zero norm is not defined for matrices
  >    panic!(m.norm(ord=NormType::Zero, axis=Matrix))
  >  }
  >  ```
- #### print
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,426:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::print(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> Unit
  ```
  >  Prints each element of the matrix to the standard output, with each element
  > on a new line.
  > 
  >  Parameters:
  > 
  >  * `matrix`: A `Matrix` instance to be printed.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "print_matrix" {
  >    let m = new_matrix(2, 2)
  >    print(m)
  >  }
  >  ```
- #### qr
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/qr.mbt,61:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::qr(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> (<a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>)
  ```
  > 
  >  Performs QR decomposition on a matrix using the Gram-Schmidt
  > orthogonalization process. Decomposes a matrix A into a product of an
  > orthogonal matrix Q and an upper triangular matrix R, such that A = QR.
  > 
  >  Parameters:
  > 
  >  * `matrix`: The input matrix to be decomposed. Must have at least as many
  >    rows as columns.
  > 
  >  Returns a tuple (Q, R) where:
  > 
  >  * Q is an m×n orthogonal matrix (Q^T Q = I)
  >  * R is an n×n upper triangular matrix
  > 
  >  Throws:
  > 
  >  * `MatrixShapeError` if the input matrix has fewer rows than columns
  >  * `MatrixError` if the input matrix is rank deficient (i.e., not full column
  >    rank)
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "qr/basic" {
  >    let a = Matrix::new_matrix(
  >      [[12.0, -51.0, 4.0], [6.0, 167.0, -68.0], [-4.0, 24.0, -41.0]],
  >    )
  >    let (q, r) = a.qr()
  >  
  >    // Verify Q is orthogonal (Q^T Q ≈ I)
  >    let qt = q.transpose()
  >    let qtq = qt * q
  >    let i = eye(3)
  >    inspect!(qtq.approx_eq(i), content="true")
  >  
  >    // Verify R is upper triangular
  >    for i = 1; i < 3; i = i + 1 {
  >      for j = 0; j < i; j = j + 1 {
  >        inspect!(r.data[i][j], content="0.0")
  >      }
  >    }
  >  
  >    // Verify A = QR
  >    let a2 = q * r
  >    inspect!(a2.approx_eq(a), content="true")
  >  }
  >  
  >  test "panic qr/invalid_shape" {
  >    // Matrix with more columns than rows
  >    let a = Matrix::new_matrix([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
  >    panic!(a.qr())
  >  }
  >  
  >  test "panic qr/rank_deficient" {
  >    // Rank deficient matrix
  >    let a = Matrix::new_matrix([[1.0, 1.0], [2.0, 2.0]])
  >    panic!(a.qr())
  >  }
  >  ```
- #### rank
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,597:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::rank(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> Int
  ```
  > 
  >  Calculates the rank of a matrix using Gaussian elimination method. The rank
  > is defined as the number of linearly independent rows or columns in the
  > matrix.
  > 
  >  Parameters:
  > 
  >  * `matrix`: A matrix whose rank needs to be calculated.
  > 
  >  Returns an integer representing the rank of the matrix.
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "rank/full_rank" {
  >    // Create a 2x2 matrix with full rank
  >    let m = new_matrix([[1.0, 0.0], [0.0, 1.0]])
  >    inspect!(m.rank(), content="2")
  >  }
  >  
  >  test "rank/not_full_rank" {
  >    // Create a 3x3 matrix with rank 2
  >    let m = new_matrix(
  >      [
  >        [1.0, 2.0, 3.0],
  >        [2.0, 4.0, 6.0], // This row is twice the first row
  >        [0.0, 1.0, 0.0],
  >      ],
  >    )
  >    inspect!(m.rank(), content="2")
  >  }
  >  
  >  test "rank/zero_matrix" {
  >    // Create a zero matrix
  >    let m = zero(3, 3)
  >    inspect!(m.rank(), content="0")
  >  }
  >  
  >  test "rank/rectangular" {
  >    // Create a 2x3 matrix
  >    let m = new_matrix([[1.0, 0.0, 2.0], [0.0, 3.0, 4.0]])
  >    inspect!(m.rank(), content="2")
  >  }
  >  ```
- #### reshape
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,776:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::reshape(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, rows : Int, cols : Int) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  >  Reshapes a matrix into a new matrix with specified dimensions, preserving the
  > elements in row-major order.
  > 
  >  Parameters:
  > 
  >  * `matrix` : The original matrix to be reshaped.
  >  * `rows` : The number of rows in the new matrix.
  >  * `cols` : The number of columns in the new matrix.
  > 
  >  Returns a new matrix with the specified dimensions containing all elements
  > from the input matrix.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "reshape" {
  >    // Create a 2x3 matrix
  >    let m = new_matrix([[1, 2, 3], [4, 5, 6]])
  >    
  >    // Reshape to 3x2 matrix
  >    let reshaped = m.reshape(3, 2)
  >    
  >    // The elements are preserved in row-major order
  >    inspect!(reshaped.data, content="[[1, 2], [3, 4], [5, 6]]")
  >  }
  >  
  >  test "reshape/identity" {
  >    // Reshaping to same dimensions should return equivalent matrix
  >    let m = new_matrix([[1, 2], [3, 4]])
  >    let reshaped = m.reshape(2, 2)
  >    inspect!(reshaped.data, content="[[1, 2], [3, 4]]")
  >  }
  >  ```
- #### shape
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,163:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::shape(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> (Int, Int)
  ```
  >  Returns the dimensions of a matrix as a tuple of (rows, columns).
  > 
  >  Parameters:
  > 
  >  * `matrix`: A Matrix instance whose dimensions are to be retrieved.
  > 
  >  Returns a tuple `(Int, Int)` where the first element is the number of rows
  > and the second element is the number of columns in the matrix.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "matrix_shape" {
  >    let m = Matrix::new(2, 3, 0) // Create a 2x3 matrix filled with zeros
  >    inspect!(m.shape(), content="(2, 3)")
  >  }
  >  ```
- #### slice
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,684:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::slice(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, row_start : Int, row_end : Int, col_start : Int, col_end : Int) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  > 
  >  Creates a submatrix by extracting a rectangular region from an existing
  > matrix using specified row and column ranges.
  > 
  >  Parameters:
  > 
  >  * `matrix`: The source matrix from which to extract the slice.
  >  * `row_start`: The starting row index (inclusive) of the slice.
  >  * `row_end`: The ending row index (exclusive) of the slice.
  >  * `col_start`: The starting column index (inclusive) of the slice.
  >  * `col_end`: The ending column index (exclusive) of the slice.
  > 
  >  Returns a new matrix containing the specified slice of the original matrix.
  > 
  >  Throws an error with message "SliceError: Invalid row indices" if:
  > 
  >  * `row_start` is negative
  >  * `row_end` exceeds the number of rows in the matrix
  >  * `row_start` is greater than `row_end`
  > 
  >  Throws an error with message "SliceError: Invalid column indices" if:
  > 
  >  * `col_start` is negative
  >  * `col_end` exceeds the number of columns in the matrix
  >  * `col_start` is greater than `col_end`
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "slice/basic" {
  >    let m = new_matrix([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]])
  >  
  >    // Extract 2x2 submatrix from the middle
  >    let slice = m.slice(0, 2, 1, 3)
  >    inspect!(slice.rows, content="2")
  >    inspect!(slice.cols, content="2")
  >    inspect!(slice.data, content="[[2.0, 3.0], [5.0, 6.0]]")
  >  }
  >  
  >  test "panic slice/invalid_row_indices" {
  >    let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
  >    // Should panic with "SliceError: Invalid row indices"
  >    m.slice(-1, 2, 0, 2)
  >  }
  >  
  >  test "panic slice/invalid_column_indices" {
  >    let m = new_matrix([[1.0, 2.0], [3.0, 4.0]])
  >    // Should panic with "SliceError: Invalid column indices"
  >    m.slice(0, 2, 0, 3)
  >  }
  >  ```
- #### svd
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/svd.mbt,34:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::svd(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> (<a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>)
  ```
  >  Performs Singular Value Decomposition (SVD) of a matrix.
  > Decomposes a matrix A into the product U·Σ·V^T where:
  >  - U is an orthogonal matrix
  >  - Σ is a diagonal matrix with non-negative real numbers (singular values)
  >  - V^T is the transpose of an orthogonal matrix V
  > 
  >  Parameters:
  >  * `matrix`: Input matrix to decompose
  > 
  >  Returns a tuple (U, Σ, V) containing the three component matrices
  > 
  >  Example:
  >  ```moonbit
  >  test "svd/basic" {
  >    let a = Matrix::new_matrix([[3.0, 1.0], [1.0, 3.0]])
  >    let (u, s, v) = a.svd()
  >    
  >    // Verify A = U·Σ·V^T
  >    let vt = v.transpose()
  >    let usv = u * (s * vt)
  >    inspect!(usv.approx_eq(a), content="true")
  >    
  >    // Verify U and V are orthogonal
  >    let ut = u.transpose()
  >    let utu = ut * u
  >    let i = eye(2)
  >    inspect!(utu.approx_eq(i), content="true")
  >    
  >    let vt = v.transpose()
  >    let vtv = vt * v 
  >    inspect!(vtv.approx_eq(i), content="true")
  >  }
  >  ```
- #### to\_string
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/traits.mbt,85:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### tr
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,201:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::tr(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> Double
  ```
  >  Computes the trace of a square matrix, which is the sum of elements on the
  > main diagonal (from top-left to bottom-right).
  > 
  >  Parameters:
  > 
  >  * `matrix` : A square matrix represented as a `Matrix` instance. The number
  >    of rows must equal the number of columns.
  > 
  >  Returns the trace of the matrix as a `Double`.
  > 
  >  Throws:
  > The function aborts with a "MatrixShapeError" message if the input matrix is
  > not square (i.e., number of rows != number of columns).
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "matrix_trace" {
  >    let m = new_matrix(2, 2)
  >    m.data[0][0] = 1.0
  >    m.data[0][1] = 2.0
  >    m.data[1][0] = 3.0
  >    m.data[1][1] = 4.0
  >    
  >    // Trace should be 1.0 + 4.0 = 5.0
  >    inspect!(m.tr(), content="5.0")
  >  }
  >  
  >  test "panic_non_square_matrix" {
  >    let m = new_matrix(2, 3)
  >    // Should panic when matrix is not square
  >    inspect!(m.tr(), content="MatrixShapeError: Matrix must be square to compute trace")
  >  }
  >  ```
- #### transpose
  ```moonbit
  :::source,xunyoyo/linalg/lib/matrix/matrix.mbt,271:::fn <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>::transpose(self : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
  ```
  >  Transposes a matrix by swapping its rows and columns.
  > 
  >  Parameters:
  > 
  >  * `matrix`: A matrix to be transposed. The input matrix must be valid, i.e.,
  >    all rows must have the same length.
  > 
  >  Returns a new matrix where rows and columns are swapped from the input
  > matrix.
  > 
  >  Examples:
  > 
  >  ```moonbit
  >  test "transpose/square" {
  >    let m = new_matrix([[1, 2], [3, 4]])
  >    let mt = transpose(m)
  >    inspect!(mt.data, content="[[1, 3], [2, 4]]")
  >  }
  >  
  >  test "transpose/rectangular" {
  >    let m = new_matrix([[1, 2, 3], [4, 5, 6]])
  >    let mt = transpose(m)
  >    inspect!(mt.data, content="[[1, 4], [2, 5], [3, 6]]")
  >  }
  >  
  >  test "transpose/twice" {
  >    // Transposing a matrix twice returns the original matrix
  >    let m = new_matrix([[1, 2], [3, 4]])
  >    let mtt = transpose(transpose(m))
  >    inspect!(mtt.data, content="[[1, 2], [3, 4]]")
  >  }
  >  ```

## NormType

```moonbit
:::source,xunyoyo/linalg/lib/matrix/norm.mbt,2:::type NormType
```


## Type

```moonbit
:::source,xunyoyo/linalg/lib/matrix/norm.mbt,12:::type Type
```


## diag

```moonbit
:::source,xunyoyo/linalg/lib/matrix/matrix.mbt,396:::fn diag(arr : <a href="moonbitlang/core/array#Array">Array</a>[Double]) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
```
 Creates a square diagonal matrix from a given array, where the diagonal
elements are taken from the array and all other elements are set to zero.

 Parameters:

 * `array` : An array of double-precision floating-point numbers that will
   form the diagonal elements of the matrix.

 Returns a `Matrix` structure where:

 * The diagonal elements are filled with values from the input array
 * All non-diagonal elements are set to 0.0
 * The dimensions (rows and columns) are equal to the length of the input
   array

 Example:

 ```moonbit
 test "diagonal_matrix" {
   let arr = [1.0, 2.0, 3.0]
   let matrix = diag(arr)
   
   // Check dimensions
   inspect!(matrix.rows, content="3")
   inspect!(matrix.cols, content="3")
   
   // Check diagonal elements
   inspect!(matrix.data[0][0], content="1.0")
   inspect!(matrix.data[1][1], content="2.0")
   inspect!(matrix.data[2][2], content="3.0")
   
   // Check non-diagonal elements
   inspect!(matrix.data[0][1], content="0.0")
   inspect!(matrix.data[1][0], content="0.0")
   inspect!(matrix.data[1][2], content="0.0")
   inspect!(matrix.data[2][1], content="0.0")
 }
 ```

## diagonal

```moonbit
:::source,xunyoyo/linalg/lib/matrix/diagonal.mbt,1:::fn diagonal(matrix : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, offset~ : Int = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[Double]
```


## eye

```moonbit
:::source,xunyoyo/linalg/lib/matrix/matrix.mbt,344:::fn eye(size : Int) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
```
 Creates a square identity matrix of the specified size.

 Parameters:

 * `size`: The dimension of the square matrix. Must be a positive integer.

 Returns a `Matrix` representing an identity matrix where all elements are 0.0
except for the diagonal elements which are 1.0.

 Examples:

 ```moonbit
 test "eye/2x2" {
   let matrix = eye(2)
   inspect!(matrix[0][0], content="1.0")
   inspect!(matrix[0][1], content="0.0")
   inspect!(matrix[1][0], content="0.0")
   inspect!(matrix[1][1], content="1.0")
 }
 
 test "eye/3x3" {
   let matrix = eye(3)
   // Check diagonal elements
   inspect!(matrix[0][0], content="1.0")
   inspect!(matrix[1][1], content="1.0")
   inspect!(matrix[2][2], content="1.0")
   // Check non-diagonal elements
   inspect!(matrix[0][1], content="0.0")
   inspect!(matrix[1][2], content="0.0")
   inspect!(matrix[2][0], content="0.0")
 }
 ```

## lstsq

```moonbit
:::source,xunyoyo/linalg/lib/matrix/lstsq.mbt,30:::fn lstsq(a : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, b : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
```
 Computes the least-squares solution to a linear matrix equation.

 Parameters:
 * `a`: (M, N) array - "Coefficient" matrix
 * `b`: (M,) array - Ordinate ("dependent variable") values

 Returns:
 * The least-squares solution to the equation ax = b

 Example:
 ```moonbit
 test "lstsq/basic" {  
   // Solve the overdetermined system:
   // 1x + 1y = 2
   // 2x + 1y = 3
   // 1x + 2y = 4
   let a = new_matrix([
     [1.0, 1.0],
     [2.0, 1.0],
     [1.0, 2.0]
   ])
   let b = new_matrix([[2.0], [3.0], [4.0]])
   
   let x = lstsq(a, b)
   // Expected solution: x ≈ 1, y ≈ 1.5
   inspect!(x.data[0][0], content="1.0000000000000002") 
   inspect!(x.data[1][0], content="1.4999999999999998")
 }
 ```

## new\_matrix

```moonbit
:::source,xunyoyo/linalg/lib/matrix/matrix.mbt,861:::fn new_matrix(data_ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[Double]], rows~ : Int = .., cols~ : Int = ..) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
```
 Creates a new matrix from a 2D array of Double values. If rows and cols are
not specified, they will be inferred from the input array dimensions.

 Parameters:

 * `data`: A 2D array of Double values representing the matrix elements. The
   array must be rectangular (all rows must have the same length).
 * `rows`: (Optional) The number of rows in the matrix. Defaults to the length
   of the input array.
 * `cols`: (Optional) The number of columns in the matrix. Defaults to the
   length of the first row in the input array.

 Returns a new Matrix instance containing a copy of the input data.

 Examples:

 ```moonbit
 test "new_matrix/default_dimensions" {
   let data = [[1.0, 2.0], [3.0, 4.0]]
   let matrix = new_matrix(data)
   inspect!(matrix.rows, content="2")
   inspect!(matrix.cols, content="2")
   inspect!(matrix.data[0][0], content="1")
   inspect!(matrix.data[1][1], content="4")
 }
 
 test "new_matrix/explicit_dimensions" {
   let data = [[1.0, 2.0, 3.0]]
   let matrix = new_matrix(data, rows=1, cols=3)
   inspect!(matrix.rows, content="1")
   inspect!(matrix.cols, content="3")
   inspect!(matrix.data[0][2], content="3")
 }
 ```

## solve

```moonbit
:::source,xunyoyo/linalg/lib/matrix/matrix.mbt,474:::fn solve(a : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>, b : <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
```
 Solves a system of linear equations represented by matrices A and B in the
form AX = B, where X is the solution matrix.
Returns the solution matrix X by computing X = A^(-1)B.

 Parameters:

 * `coefficient_matrix`: A square matrix A containing the coefficients of the
   system of linear equations.
 * `constant_matrix`: A matrix B containing the constant terms of the system.

 Returns the solution matrix X that satisfies AX = B.

 Throws an error with message "MatrixShapeError: Incompatible dimensions for
solving the system of equations" if:

 * The coefficient matrix is not square (rows ≠ columns)
 * The dimensions of the constant matrix are incompatible with the coefficient
   matrix

 Example:

 ```moonbit
 test "solve/simple_system" {
   // Solve the system:
   // 2x + y = 5
   // x + 3y = 10
   let a = new_matrix([
     [2.0, 1.0],
     [1.0, 3.0]
   ])
   let b = new_matrix([
     [5.0],
     [10.0]
   ])
   let x = solve(a, b)
   // Expected solution: x = 1, y = 3
   inspect!(x.rows, content="2")
   inspect!(x.cols, content="1")
   inspect!(x.data[0][0], content="1.0")
   inspect!(x.data[0][1], content="3.0")
 }
 ```

## zero

```moonbit
:::source,xunyoyo/linalg/lib/matrix/matrix.mbt,302:::fn zero(rows : Int, cols : Int) -> <a href="xunyoyo/linalg/lib/matrix#Matrix">Matrix</a>
```
 Creates a new matrix of the specified size with all elements initialized to
zero.

 Parameters:

 * `rows`: The number of rows in the matrix.
 * `cols`: The number of columns in the matrix.

 Returns a new `Matrix` with all elements set to zero.

 Example:

 ```moonbit
 test "zero matrix" {
   let m = zero(2, 3)
   inspect!(m.rows(), content="2")
   inspect!(m.cols(), content="3")
   inspect!(m[0][0], content="0")
   inspect!(m[1][2], content="0")
 }
 ```
