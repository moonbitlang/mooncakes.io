# Documentation
|Type|description|
|---|---|
|[QuatError](#QuatError)||
|[Quaternion](#Quaternion)| Quaternion {w, x, y, z}|

|Value|description|
|---|---|
|[max\_value](#max_value)||
|[q](#q)||
|[qi](#qi)||

## QuatError

```moonbit
:::source,tiye/quaternion/lib/quaternion.mbt,729:::pub(all) type! QuatError String

```


## Quaternion

```moonbit
:::source,tiye/quaternion/lib/quaternion.mbt,2:::pub(all) struct Quaternion {
  w : Float
  x : Float
  y : Float
  z : Float
}
```
 Quaternion {w, x, y, z}

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,378:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/quaternion/lib/quaternion.mbt,378:::fn default() -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
    ```
    > 
- ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,7:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/quaternion/lib/quaternion.mbt,7:::fn op_equal(<a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,36:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  * ```moonbit
    :::source,tiye/quaternion/lib/quaternion.mbt,36:::fn output(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### conjugate
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,304:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::conjugate(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Returns a new quaternion that is the conjugate of the given quaternion. A
  > quaternion conjugate is formed by negating the vector part (x, y, z
  > components) while keeping the scalar part (w component) unchanged.
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be conjugated.
  > 
  >  Returns a new quaternion that is the conjugate of the input quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::conjugate" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    inspect!(
  >      q.conjugate(),
  >      content="Quaternion { w: 1.0, x: -2.0, y: -3.0, z: -4.0 }",
  >    )
  >  }
  >  ```
- #### conjugate\_mut
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,327:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::conjugate_mut(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Unit
  ```
  > 
  >  Modifies the quaternion in-place by negating its x, y, and z components while
  > keeping the w component unchanged. The conjugate of a quaternion represents
  > the same rotation in the opposite direction.
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be modified. The quaternion will be changed
  >    in-place.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::conjugate_mut" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    q.conjugate_mut()
  >    inspect!(q, content="Quaternion { w: 1.0, x: -2.0, y: -3.0, z: -4.0 }")
  >  }
  >  ```
- #### dot
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,278:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::dot(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Float
  ```
  > 
  >  Computes the dot product (scalar product) of two quaternions. The dot product
  > is calculated as the sum of the products of corresponding components.
  > 
  >  Parameters:
  > 
  >  * `self` : The first quaternion.
  >  * `other` : The second quaternion.
  > 
  >  Returns a float value representing the dot product of the two quaternions.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::dot" {
  >    let q1 = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let q2 = Quaternion::{ w: 2.0, x: 3.0, y: 4.0, z: 5.0 }
  >    inspect!(q1.dot(q2), content="40.0")
  >  }
  >  ```
- #### from\_euler\_angles
  ```moonbit
  :::source,tiye/quaternion/lib/euler.mbt,3:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::from_euler_angles(x : Float, y : Float, z : Float) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  >  Construct a quaternion representing the given euler angle rotations (in radians)
  > Notice: this function is not well tested yet
- #### from\_wxyz
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,732:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::from_wxyz(arr : <a href="moonbitlang/core/array#Array">Array</a>[Float]) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>!<a href="tiye/quaternion/lib#QuatError">QuatError</a>
  ```
  > 
- #### from\_xyzw\_array
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,740:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::from_xyzw_array(arr : <a href="moonbitlang/core/array#Array">Array</a>[Float]) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>!<a href="tiye/quaternion/lib#QuatError">QuatError</a>
  ```
  >  from\_xyzw\_array
- #### id
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,114:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::id() -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Returns an identity quaternion, which is a quaternion with w=1 and x=y=z=0.
  > An identity quaternion represents no rotation in 3D space and acts as a
  > multiplicative identity for quaternion multiplication.
  > 
  >  Returns a quaternion representing the identity rotation.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::id" {
  >    let q = Quaternion::id()
  >    inspect!(q, content="Quaternion { w: 1.0, x: 0.0, y: 0.0, z: 0.0 }")
  >  
  >    // demonstrate identity property
  >    let p = Quaternion::{ w: 2.0, x: 3.0, y: 4.0, z: 5.0 }
  >    inspect!(p * q, content=p.to_string())
  >  }
  >  ```
- #### inverse
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,230:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::inverse(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Returns a new quaternion that represents the multiplicative inverse of the
  > input quaternion. The inverse of a quaternion q satisfies q \* q^(-1) =
  > q^(-1) \* q = 1 (identity quaternion).
  > 
  >  Parameters:
  > 
  >  * `quaternion`: The input quaternion to be inverted. Must have non-zero
  >    length.
  > 
  >  Returns a new quaternion that is the inverse of the input quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::inverse" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let q_inv = q.inverse()
  >    inspect!((q * q_inv).roughly_eq(Quaternion::id()), content="true")
  >  }
  >  ```
- #### inverse\_mut
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,253:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::inverse_mut(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Unit
  ```
  > 
  >  Mutates the quaternion by computing its inverse (reciprocal).
  > 
  >  For a quaternion q = w + xi + yj + zk, its inverse is q⁻¹ =
  > conjugate(q)/\|q\|², where \|q\| is the length of the quaternion.
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be inverted in-place.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::inverse_mut" {
  >    let q = Quaternion::{ w: 2.0, x: 0.0, y: 0.0, z: 0.0 }
  >    q.inverse_mut()
  >    inspect!(q, content="Quaternion { w: 0.5, x: 0.0, y: 0.0, z: 0.0 }")
  >  }
  >  ```
- #### length
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,373:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::length(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Float
  ```
  > 
  >  Computes the Euclidean length (magnitude) of a quaternion by taking the
  > square root of the sum of squares of its components.
  > 
  >  Parameters:
  > 
  >  * `quaternion`: The quaternion whose length is to be computed.
  > 
  >  Returns a floating-point number representing the length of the quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::length" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 2.0, z: 1.0 }
  >    inspect!(q.length(), content="3.316624790355399")
  >  }
  >  ```
- #### new
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,144:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::new(w? : Float, x? : Float, y? : Float, z? : Float) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Creates a new quaternion with optional components. If any component is not
  > provided, it defaults to 0.0.
  > 
  >  Parameters:
  > 
  >  * `w` : The scalar (real) component of the quaternion. Defaults to 0.0.
  >  * `x` : The first vector (imaginary) component of the quaternion. Defaults to
  >    0\.0.
  >  * `y` : The second vector (imaginary) component of the quaternion. Defaults
  >    to 0.0.
  >  * `z` : The third vector (imaginary) component of the quaternion. Defaults to
  >    0\.0.
  > 
  >  Returns a new `Quaternion` instance with the specified or default components.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::new" {
  >    let q1 = Quaternion::new()
  >    let q2 = Quaternion::new(w=1.0, x=2.0)
  >    inspect!(q1, content="Quaternion { w: 0.0, x: 0.0, y: 0.0, z: 0.0 }")
  >    inspect!(q2, content="Quaternion { w: 1.0, x: 2.0, y: 0.0, z: 0.0 }")
  >  }
  >  ```
- #### normalize
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,748:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::normalize(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
- #### normalize\_mut
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,757:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::normalize_mut(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Unit!<a href="tiye/quaternion/lib#QuatError">QuatError</a>
  ```
  >  normalize mutable
- #### op\_add
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,464:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_add(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Adds two quaternions component-wise.
  > 
  >  Parameters:
  > 
  >  * `self` : The first quaternion.
  >  * `other` : The second quaternion.
  > 
  >  Returns a new quaternion where each component is the sum of the corresponding
  > components of the input quaternions.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_add" {
  >    let q1 = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let q2 = Quaternion::{ w: 5.0, x: 6.0, y: 7.0, z: 8.0 }
  >    inspect!(q1 + q2, content="Quaternion { w: 6.0, x: 8.0, y: 10.0, z: 12.0 }")
  >  }
  >  ```
- #### op\_add\_assign
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,492:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_add_assign(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Unit
  ```
  > 
  >  Performs in-place addition of two quaternions by adding their corresponding
  > components.
  > 
  >  Parameters:
  > 
  >  * `self` : The quaternion to be modified.
  >  * `other` : The quaternion to be added to `self`.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_add_assign" {
  >    let q1 = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let q2 = Quaternion::{ w: 5.0, x: 6.0, y: 7.0, z: 8.0 }
  >    q1.op_add_assign(q2)
  >    inspect!(q1, content="Quaternion { w: 6.0, x: 8.0, y: 10.0, z: 12.0 }")
  >  }
  >  ```
- #### op\_div
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,597:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_div(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, b : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Divides two quaternions by multiplying the first quaternion with the inverse
  > of the second quaternion.
  > 
  >  Parameters:
  > 
  >  * `self` : The dividend quaternion.
  >  * `divisor` : The quaternion to divide by.
  > 
  >  Returns a new quaternion representing the quotient of the division operation.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_div" {
  >    let a = Quaternion::{ w: 1.0, x: 0.0, y: 0.0, z: 0.0 }
  >    let b = Quaternion::{ w: 2.0, x: 0.0, y: 0.0, z: 0.0 }
  >    let result = a / b
  >    inspect!(result, content="Quaternion { w: 0.5, x: 0.0, y: 0.0, z: 0.0 }")
  >  }
  >  ```
- #### op\_eq
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,409:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_eq(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Bool
  ```
  > 
  >  Determines whether two quaternions are approximately equal by comparing their
  > squared difference with a small epsilon value. This method is necessary
  > because direct floating-point comparisons may not work correctly due to
  > numerical precision issues.
  > 
  >  Parameters:
  > 
  >  * `self`: The first quaternion to compare.
  >  * `other`: The second quaternion to compare.
  > 
  >  Returns `true` if the squared distance between the two quaternions is less
  > than the epsilon value (which is the reciprocal of the maximum representable
  > float value), `false` otherwise.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_eq" {
  >    let q1 = Quaternion::{ w: 1.0, x: 0.0, y: 0.0, z: 0.0 }
  >    let q2 = Quaternion::{ w: 1.0, x: 0.0000000001, y: 0.0, z: 0.0 }
  >    inspect!(q1.op_eq(q2), content="true")
  >  }
  >  ```
- #### op\_mul
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,522:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_mul(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Performs quaternion multiplication (Hamilton product) of two quaternions. The
  > operation is non-commutative, meaning `a * b` is not necessarily equal to \`b
  >  * a\`. This operation can be used to combine rotations represented by
  >    quaternions.
  > 
  >  Parameters:
  > 
  >  * `self`: The first quaternion operand.
  >  * `other`: The second quaternion operand.
  > 
  >  Returns a new quaternion representing the product of the multiplication.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_mul" {
  >    let q1 = Quaternion::{ w: 1.0, x: 0.0, y: 0.0, z: 0.0 }
  >    let q2 = Quaternion::{ w: 0.0, x: 1.0, y: 0.0, z: 0.0 }
  >    let result = q1 * q2
  >    inspect!(result, content="Quaternion { w: 0.0, x: 1.0, y: 0.0, z: 0.0 }")
  >  }
  >  ```
- #### op\_mul\_assign
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,553:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_mul_assign(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Unit
  ```
  > 
  >  Performs in-place multiplication of two quaternions using the Hamilton
  > product rule. The result is stored in the first quaternion.
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be modified.
  >  * `other`: The quaternion to multiply with.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_mul_assign" {
  >    let q1 = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let q2 = Quaternion::{ w: 2.0, x: -1.0, y: -2.0, z: -3.0 }
  >    q1.op_mul_assign(q2)
  >    inspect!(
  >      q1.to_string(),
  >      content="Quaternion { w: 12.0, x: 1.0, y: 0.0, z: -1.0 }",
  >    )
  >  }
  >  ```
- #### op\_neg
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,679:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_neg(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Returns a new quaternion with all components negated. Equivalent to
  > multiplying all components by -1.
  > 
  >  Parameters:
  > 
  >  * `quaternion`: The quaternion to be negated.
  > 
  >  Returns a new quaternion where each component (w, x, y, z) is the negation of
  > the corresponding component in the input quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_neg" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    inspect!(
  >      q.op_neg(),
  >      content="Quaternion { w: -1.0, x: -2.0, y: -3.0, z: -4.0 }",
  >    )
  >  }
  >  ```
- #### op\_sub
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,622:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_sub(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Performs element-wise subtraction of two quaternions.
  > 
  >  Parameters:
  > 
  >  * `self`: The minuend quaternion.
  >  * `other`: The subtrahend quaternion.
  > 
  >  Returns a new quaternion where each component is the difference of the
  > corresponding components of the input quaternions.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_sub" {
  >    let q1 = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let q2 = Quaternion::{ w: 0.5, x: 1.0, y: 1.5, z: 2.0 }
  >    let result = q1 - q2
  >    inspect!(result, content="Quaternion { w: 0.5, x: 1.0, y: 1.5, z: 2.0 }")
  >  }
  >  ```
- #### op\_sub\_assign
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,650:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::op_sub_assign(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Unit
  ```
  > 
  >  Subtracts another quaternion from this quaternion in place, modifying the
  > original quaternion.
  > 
  >  Parameters:
  > 
  >  * `self` : The quaternion to be modified.
  >  * `other` : The quaternion to subtract from `self`.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::op_sub_assign" {
  >    let q1 = Quaternion::{ w: 2.0, x: 3.0, y: 4.0, z: 5.0 }
  >    let q2 = Quaternion::{ w: 1.0, x: 1.0, y: 1.0, z: 1.0 }
  >    q1.op_sub_assign(q2)
  >    inspect!(q1, content="Quaternion { w: 1.0, x: 2.0, y: 3.0, z: 4.0 }")
  >  }
  >  ```
- #### roughly\_eq
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,436:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::roughly_eq(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, other : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, epsilon? : Float) -> Bool
  ```
  > 
  >  Determines if two quaternions are approximately equal within a specified
  > epsilon value.
  > 
  >  Parameters:
  > 
  >  * `self`: The first quaternion to compare.
  >  * `other`: The second quaternion to compare.
  >  * `epsilon`: Optional threshold value for comparison. Defaults to
  >    0\.00000000001 if not provided.
  > 
  >  Returns true if the squared difference between the two quaternions is less
  > than the epsilon value, false otherwise.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::roughly_eq" {
  >    let q1 = Quaternion::{ w: 1.0, x: 0.0, y: 0.0, z: 0.0 }
  >    let q2 = Quaternion::{ w: 0.9999999999, x: 0.0, y: 0.0, z: 0.0 }
  >    inspect!(q1.roughly_eq(q2), content="true")
  >  }
  >  ```
- #### scale
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,179:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::scale(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, t : Float) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
  ```
  > 
  >  Performs element-wise multiplication of a quaternion with a scalar value,
  > producing a new quaternion.
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be scaled.
  >  * `scalar`: A floating-point value to scale the quaternion with.
  > 
  >  Returns a new quaternion where each component (w, x, y, z) is multiplied by
  > the scalar value.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::scale" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    let scaled = q.scale(2.0)
  >    inspect!(scaled, content="Quaternion { w: 2.0, x: 4.0, y: 6.0, z: 8.0 }")
  >  }
  >  ```
- #### scale\_mut
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,202:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::scale_mut(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>, t : Float) -> Unit
  ```
  > 
  >  Scales a quaternion by multiplying each component with a scalar value
  > in-place.
  > 
  >  Parameters:
  > 
  >  * `self` : The quaternion to be scaled.
  >  * `scalar` : The scaling factor to multiply with each component of the
  >    quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::scale_mut" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    q.scale_mut(2.0)
  >    inspect!(q, content="Quaternion { w: 2.0, x: 4.0, y: 6.0, z: 8.0 }")
  >  }
  >  ```
- #### square\_length
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,351:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::square_length(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> Float
  ```
  > 
  >  Computes the squared length (or squared norm) of a quaternion by summing up
  > the squares of its components (w² + x² + y² + z²).
  > 
  >  Parameters:
  > 
  >  * `quaternion`: The quaternion whose squared length is to be computed.
  > 
  >  Returns the squared length of the quaternion as a floating-point number.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::square_length" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 2.0, z: 1.0 }
  >    inspect!(q.square_length(), content="10.0")
  >  }
  >  ```
- #### to\_string
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,31:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::to_string(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> String
  ```
  > 
  >  Converts a quaternion to its string representation in the format "Quaternion
  > { w: <w>, x: <x>, y: <y>, z: <z> }".
  > 
  >  Parameters:
  > 
  >  * `quaternion`: The quaternion to be converted to string.
  > 
  >  Returns a string representation of the quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::to_string" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    inspect!(
  >      q.to_string(),
  >      content="Quaternion { w: 1.0, x: 2.0, y: 3.0, z: 4.0 }",
  >    )
  >  }
  >  ```
- #### to\_wxyz
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,701:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::to_wxyz(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Float]
  ```
  > 
  >  Converts a quaternion to an array of floats in the order \[w, x, y, z\].
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be converted.
  > 
  >  Returns an array of four floating-point numbers representing the components
  > of the quaternion.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::to_array" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    inspect!(q.to_array(), content="[1.0, 2.0, 3.0, 4.0]")
  >  }
  >  ```
- #### to\_xyzw
  ```moonbit
  :::source,tiye/quaternion/lib/quaternion.mbt,724:::fn <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>::to_xyzw(self : <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Float]
  ```
  > 
  >  Converts a quaternion to an array of floats in the order \[x, y, z, w\], which
  > is a common format used in graphics programming.
  > 
  >  Parameters:
  > 
  >  * `self`: The quaternion to be converted.
  > 
  >  Returns an array of four floating-point numbers representing the components
  > of the quaternion in XYZW order.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Quaternion::to_xyzw" {
  >    let q = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 }
  >    inspect!(q.to_xyzw(), content="[2.0, 3.0, 4.0, 1.0]")
  >  }
  >  ```

## max\_value

```moonbit
:::source,tiye/quaternion/lib/quaternion.mbt,383:::let max_value : Float
```


## q

```moonbit
:::source,tiye/quaternion/lib/quaternion.mbt,64:::fn q(w : Float, x : Float, y : Float, z : Float) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
```

 Creates a new quaternion with the given components. This is a shorter
alternative to using the `Quaternion` constructor directly.

 Parameters:

 * `w` : The scalar (real) component of the quaternion.
 * `x` : The first vector (imaginary) component of the quaternion.
 * `y` : The second vector (imaginary) component of the quaternion.
 * `z` : The third vector (imaginary) component of the quaternion.

 Returns a new `Quaternion` instance with the specified components.

 Example:

 ```moonbit
 test "q" {
   let quaternion = q(1.0, 2.0, 3.0, 4.0)
   inspect!(
     quaternion.to_string(),
     content="Quaternion { w: 1.0, x: 2.0, y: 3.0, z: 4.0 }",
   )
 }
 ```

## qi

```moonbit
:::source,tiye/quaternion/lib/quaternion.mbt,91:::fn qi(w : Int, x : Int, y : Int, z : Int) -> <a href="tiye/quaternion/lib#Quaternion">Quaternion</a>
```

 Creates a quaternion from four integer components by converting them to
floating-point numbers. Serves as a convenient shortcut when working with
integer values.

 Parameters:

 * `w` : The real (scalar) component of the quaternion.
 * `x` : The first imaginary component (i coefficient).
 * `y` : The second imaginary component (j coefficient).
 * `z` : The third imaginary component (k coefficient).

 Returns a new quaternion with the integer components converted to
floating-point numbers.

 Example:

 ```moonbit
 test "qi" {
   let quaternion = qi(1, 2, 3, 4)
   inspect!(quaternion, content="Quaternion { w: 1.0, x: 2.0, y: 3.0, z: 4.0 }")
 }
 ```
