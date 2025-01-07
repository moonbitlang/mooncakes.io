# Documentation
|Trait|description|
|---|---|
|[Clonable](#Clonable)||

|Type|description|
|---|---|
|[AffineMatrix](#AffineMatrix)| AffineMatrix represents a 2D affine transform that preserves parallel lines.|
|[Anchor](#Anchor)| Anchor represents a single point in a path. Two anchors form a segment.|
|[BoundingBox](#BoundingBox)| BoundingBox represents a minimum bounding box as an axis-aligned rectangle.|
|[Color](#Color)| Color represents a color in RGBA color space.|
|[CompoundPath](#CompoundPath)| CompoundPath represents one or more paths that typically make up a font glyph.|
|[DrawError](#DrawError)| DrawError represents an error that occured during graphic generation.|
|[Fill](#Fill)| Fill defines a fill style.|
|[Graphic](#Graphic)| Graphic represents a drawable graphic element.|
|[Group](#Group)| Group represents a collection of Graphics elements.|
|[Path](#Path)| Path represents an open or closed path that can be stroked as an outline|
|[Stroke](#Stroke)| Stroke defines a stroke style.|
|[StrokeAlignment](#StrokeAlignment)||
|[StrokeCap](#StrokeCap)||
|[StrokeJoin](#StrokeJoin)||
|[TextAlign](#TextAlign)||
|[Transform](#Transform)| Transform represents transform arguments.|
|[Vec2](#Vec2)| Vec2 represents a 2D vector.|

|Value|description|
|---|---|
|[bbox](#bbox)| bbox is a convenience function.|
|[fill](#fill)| fill is a helper function.|
|[group](#group)| group is a convenience function.|
|[rgba](#rgba)| rgba is a convenience function.|
|[stroke](#stroke)| stroke is a helper function.|
|[text](#text)| text generates a new Graphic (a Group of Group of compound\_paths) from a text|
|[unit\_circle](#unit_circle)| unit\_circle constructs a new Group representing a unit circle centered at the origin.|
|[unit\_square](#unit_square)| unit\_square constructs a new Group representing a unit square centered at the origin.|
|[vec2](#vec2)| vec2 returns a new Vec2.|

## Clonable

```moonbit
:::source,gmlewis/fonts/draw/path.mbt,46:::trait Clonable
```


## AffineMatrix

```moonbit
:::source,gmlewis/fonts/draw/affine-matrix.mbt,6:::pub(all) struct AffineMatrix {
  a : Double
  b : Double
  c : Double
  d : Double
  tx : Double
  ty : Double
}
```
 AffineMatrix represents a 2D affine transform that preserves parallel lines.
See: https://en.wikipedia.org/wiki/Affine\_transformation

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,13:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a> with op_equal(<a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,13:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a> with output(<a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,87:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::clone(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  clone returns a copy of this 2D affine matrix.
- #### copy
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,93:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::copy(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, other : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  copy copies another 2D affine matrix into itself and returns itself.
- #### determinant
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,249:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::determinant(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Double
  ```
  >  determinant returns the determinant of the 2D affine matrix.
- #### from\_center\_scale
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,73:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_center_scale(center : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, scale : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_center\_scale returns a new 2D affine matrix that scales
  > from the provided center point.
- #### from\_rotation
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,54:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_rotation(angle : Double) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_rotation returns a new 2D affine matrix from a rotation `angle`
  > in degrees.
- #### from\_scale
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,62:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_scale(v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_scale returns a new 2D affine matrix from scale `v`.
- #### from\_scale\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,67:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_scale_scalar(s : Double) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_scale\_scalar returns a new 2D affine matrix from uniform scale `s`.
- #### from\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,28:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_transform(transform : <a href="gmlewis/fonts/draw#Transform">Transform</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_transform returns a new 2D affine matrix from a Transform.
- #### from\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,39:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_translation(v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_translation returns a new 2D affine matrix from translation `v`.
- #### from\_translation\_points
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,45:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::from_translation_points(p1 : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, p2 : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::from\_translation\_points returns a new 2D affine matrix that
  > translates from p1 to p2.
- #### invert
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,104:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::invert(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  invert inverts this 2D affine matrix.
- #### is\_identity
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,285:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_identity(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  >  is\_identity returns true if this 2D affine matrix is the identity matrix.
- #### is\_inf
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,305:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_inf(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  >  is\_inf returns true if any elements of this 2D affine matrix are infinite.
- #### is\_invertible
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,265:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_invertible(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  >  is\_invertible returns true if this 2D affine matrix is invertible.
- #### is\_mirror
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,280:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_mirror(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  >  is\_mirror returns true if this 2D affine matrix mirrors either axis.
- #### is\_nan
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,295:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_nan(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  >  is\_nan returns true if any elements of this 2D affine matrix are NaN (not a number).
- #### is\_orthogonal
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,256:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_orthogonal(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, tolerance~ : Double = ..) -> Bool
  ```
  >  is\_orthogonal returns true if the two basis vectors of the 2D affine matrix
  > are orthogonal within the provided tolerance.
- #### is\_uniform\_scale
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,271:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::is_uniform_scale(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, tolerance~ : Double = ..) -> Bool
  ```
  >  is\_uniform\_scale returns true if both basis vectors of this 2D affine matrix
  > are of the same length.
- #### mul
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,118:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::mul(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, m : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  mul multiplies this 2D affine matrix with another.
- #### mul\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,138:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::mul_without_translation(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, m : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  mul\_without\_translation multiplies this 2D affine matrix with another,
  > discarding the transation.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,16:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::new(a~ : Double = .., b~ : Double = .., c~ : Double = .., d~ : Double = .., tx~ : Double = .., ty~ : Double = ..) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  AffineMatrix::new returns a new 2D affine matrix.
- #### normalize
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,231:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::normalize(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  normalize scales the basis vectors of this 2D affine matrix
  > so that they have unit length.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,13:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::op_equal(<a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> Bool
  ```
  > automatically derived
- #### op\_mul
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,131:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::op_mul(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, b : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  op\_mul multiplies two 2D affine matrices together, returning a new one.
- #### origin
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,222:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::origin(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  origin translates the matrix such that the center of future
  > scale, rotate, and skew transformations will be `v`.
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,13:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::output(<a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### pre\_mul
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,153:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::pre_mul(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, m : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  pre\_mul multiplies another matrix `m` by this 2D affine matrix, then
  > stores and returns the result.
- #### pre\_mul\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,167:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::pre_mul_without_translation(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, m : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  pre\_mul\_without\_translation multiplies another matrix `m` by this 2D affine matrix,
  > discarding the translate, then stores and returns the result.
- #### rotate
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,189:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::rotate(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, angle : Double) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  rotate rotates this 2D affine matrix by `angle` degrees.
- #### scale
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,203:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::scale(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  scale scales this 2D affine matrix by `v`.
- #### scale\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,212:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::scale_scalar(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, s : Double) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  scale\_scalar scales this 2D affine matrix uniformly by `s`.
- #### skew
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,194:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::skew(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, angle : Double) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  skew skews the Y basis vector of this 2D affine matrix by `angle` degrees.
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### to\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,329:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::to_transform(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Transform">Transform</a>
  ```
  >  to\_transform converts this 2D affine matrix to a Transform.
- #### translate
  ```moonbit
  :::source,gmlewis/fonts/draw/affine-matrix.mbt,181:::fn <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>::translate(self : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>
  ```
  >  translate translates this 2D affine matrix by position `v`.

## Anchor

```moonbit
:::source,gmlewis/fonts/draw/anchor.mbt,3:::pub(all) struct Anchor {
  position : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  handle_in : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  handle_out : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
}
```
 Anchor represents a single point in a path. Two anchors form a segment.
The position of an Anchor is absolute and the handles are both relative.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Anchor">Anchor</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#Anchor">Anchor</a> with op_equal(<a href="gmlewis/fonts/draw#Anchor">Anchor</a>, <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Anchor">Anchor</a> with output(<a href="gmlewis/fonts/draw#Anchor">Anchor</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Anchor">Anchor</a> with to_json(<a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### affine\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,29:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::affine_transform(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  affine\_transform transforms this Anchor by the provided `affine_matrix`.
- #### affine\_transform\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,38:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::affine_transform_without_translation(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  affine\_transform\_without\_translation transforms this Anchor's rotation, scale,
  > and skew, without affecting its translation.
- #### all\_anchors
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,142:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::all_anchors(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Anchor">Anchor</a>]
  ```
  >  all\_anchors returns all anchors.
- #### bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,70:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::bounding_box(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  bounding\_box returns a BoundingBox for this Anchor.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,20:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::clone(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  clone makes a new copy of this Anchor.
- #### closest\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,95:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::closest_point(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, area_of_interest? : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>?
  ```
  >  closest\_point returns the closest point to `point` or None if no point is found.
  > area\_of\_interest is used to focus the computation within a smaller region.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### has\_tangent\_handles
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,127:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::has_tangent_handles(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, tolerance~ : Double = ..) -> Bool
  ```
  >  has\_tangent\_handles returns true if this Anchor has handles that
  > are tangent to each other.
- #### has\_zero\_handles
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,137:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::has_zero_handles(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> Bool
  ```
  >  has\_zero\_handles returns true if this Anchor has handles that are both zero.
- #### is\_contained\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,75:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::is_contained_by_bounding_box(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_contained\_by\_bounding\_box returns true if this Anchor lies within `box`.
- #### is\_intersected\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,81:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::is_intersected_by_bounding_box(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_intersected\_by\_bounding\_box returns true if the Anchor lies on the
  > boundary of `box`.
- #### is\_overlapped\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,89:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::is_overlapped_by_bounding_box(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_overlapped\_by\_bounding\_box returns true if the Anchor is within `box`.
- #### loose\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,65:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::loose_bounding_box(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  loose\_bounding\_box is a simple computation that returns a BoundingBox which
  > may not be the smallest possible.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,11:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::new(position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., handle_in~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., handle_out~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  Anchor::new returns a new anchor. You must either create new Vec2 points
  > or clone them before passing them in.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::op_equal(<a href="gmlewis/fonts/draw#Anchor">Anchor</a>, <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::output(<a href="gmlewis/fonts/draw#Anchor">Anchor</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### reverse
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,112:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::reverse(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  reverse reverses this Anchor.
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,7:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::to_json(<a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transform
  ```moonbit
  :::source,gmlewis/fonts/draw/anchor.mbt,49:::fn <a href="gmlewis/fonts/draw#Anchor">Anchor</a>::transform(self : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>, position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  transform provides a convenient API for a common task.

## BoundingBox

```moonbit
:::source,gmlewis/fonts/draw/bounding-box.mbt,2:::pub(all) struct BoundingBox {
  min : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  max : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
}
```
 BoundingBox represents a minimum bounding box as an axis-aligned rectangle.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a> with op_equal(<a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a> with output(<a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### area
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,73:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::area(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Double
  ```
  >  area represents the signed area of the bounding box (width\*height).
  > If min \> max, the area will be negative.
- #### boolean\_intersect
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,145:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::boolean_intersect(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, boxes : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>]) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  boolean\_intersect returns a new BoundingBox representing the intersection
  > of this bounding box with one or more boxes if one exists.
- #### canonicalize
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,88:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::canonicalize(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  canonicalize ensures that min \< max.
- #### center
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,52:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::center(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  center returns the center point of the bounding box (the average of min and max).
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,47:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::clone(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  clone makes a copy of the bounding box.
- #### contains\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,125:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::contains_bounding_box(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  contains\_bounding\_box returns true if `box` is contained within this bounding box.
- #### contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,119:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::contains_point(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  contains\_point returns true if `point` is contained within this bounding box.
- #### expand\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,112:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::expand_scalar(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, distance : Double) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  expand\_scalar expands this bounding box by a scalar distance on all sides.
- #### expand\_to\_include\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,104:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::expand_to_include_bounding_box(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  expand\_to\_include\_bounding\_box expands this bounding box to also cover `box`.
- #### expand\_to\_include\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,97:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::expand_to_include_point(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  expand\_to\_include\_point expands this bounding box to include `point`.
- #### from\_points
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,36:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::from_points(points : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Vec2">Vec2</a>]) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  BoundingBox::from\_points constructs the minimum bounding box containing `points`.
- #### height
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,67:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::height(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Double
  ```
  >  height returns the height of the bounding box.
- #### is\_inf
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,78:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::is_inf(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_inf returns true if either min or max is\_inf.
- #### is\_nan
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,83:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::is_nan(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_nan returns true if either min or max is\_nan.
- #### max\_reversed
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,29:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::max_reversed() -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  BoundingBox::max\_reversed returns a new BoundingBox with min=+infinity
  > and max=-infinity.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,8:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::new(min~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., max~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
  ```
  >  BoundingBox::new returns a new empty BoundingBox.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,5:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::op_equal(<a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,5:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::output(<a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### overlaps\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,134:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::overlaps_bounding_box(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  overlaps\_bounding\_box returns true if any part of `box` overlaps this bounding box.
- #### size
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,57:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::size(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  size returns a vector representing the (width,height) of the bounding box.
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### width
  ```moonbit
  :::source,gmlewis/fonts/draw/bounding-box.mbt,62:::fn <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>::width(self : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Double
  ```
  >  width returns the width of the bounding box.

## Color

```moonbit
:::source,gmlewis/fonts/draw/color.mbt,2:::pub(all) struct Color {
  r : Double
  g : Double
  b : Double
  a : Double
}
```
 Color represents a color in RGBA color space.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Color">Color</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Color">Color</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#Color">Color</a> with op_equal(<a href="gmlewis/fonts/draw#Color">Color</a>, <a href="gmlewis/fonts/draw#Color">Color</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Color">Color</a> with output(<a href="gmlewis/fonts/draw#Color">Color</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Color">Color</a> with to_json(<a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### as\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,163:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::as_fill(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>?
  ```
  >  as\_fill is a convenience function for setting a fill color.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,168:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::clone(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="gmlewis/fonts/draw#Color">Color</a>
  ```
  >  clone returns a new copy of this Color.
- #### from\_css\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,90:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::from_css_string(css_string : String) -> <a href="gmlewis/fonts/draw#Color">Color</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Color::from\_css\_string returns a color from a CSS string.
- #### from\_hsva
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,25:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::from_hsva(hue : Double, saturation : Double, value : Double, alpha : Double) -> <a href="gmlewis/fonts/draw#Color">Color</a>
  ```
  >  Color::from\_hsva creates a color by converting HSVA space to RGBA.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Color">Color</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### from\_rgb8\_number
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,155:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::from_rgb8_number(value : UInt) -> <a href="gmlewis/fonts/draw#Color">Color</a>
  ```
  >  Color::from\_rgb8\_number returns a color from a bit-packed RGB8 format.
- #### luminance
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,197:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::luminance(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> Double
  ```
  >  luminance returns the relative luminance of this color for standard human vision.
- #### mix
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,188:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::mix(self : <a href="gmlewis/fonts/draw#Color">Color</a>, c : <a href="gmlewis/fonts/draw#Color">Color</a>, t : Double) -> <a href="gmlewis/fonts/draw#Color">Color</a>
  ```
  >  mix linearly interpolates between this Color and `c` with mixing factor `t`.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,10:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::new(r~ : Double = .., g~ : Double = .., b~ : Double = .., a~ : Double = ..) -> <a href="gmlewis/fonts/draw#Color">Color</a>
  ```
  >  Color::new returns a new color.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::op_equal(<a href="gmlewis/fonts/draw#Color">Color</a>, <a href="gmlewis/fonts/draw#Color">Color</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::output(<a href="gmlewis/fonts/draw#Color">Color</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### set
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,173:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::set(self : <a href="gmlewis/fonts/draw#Color">Color</a>, r : Double, g : Double, b : Double, a : Double) -> <a href="gmlewis/fonts/draw#Color">Color</a>
  ```
  >  set sets the RGBA components of this Color.
- #### to\_css\_hex\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,242:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_css_hex_string(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> String
  ```
  >  to\_css\_hex\_string returns a CSS-style hex string for this color.
- #### to\_css\_rgba\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,259:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_css_rgba_string(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> String
  ```
  >  to\_css\_rgba\_string returns a CSS-style "rgba()" string for this color.
- #### to\_css\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,202:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_css_string(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> String
  ```
  >  to\_css\_string returns a CSS-style string for this color.
- #### to\_hsva
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,277:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_hsva(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Double]
  ```
  >  to\_hsva converts this color to the HSVA color space, returning
  > \[hue, saturation, value, alpha\] in the range (0..1).
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,7:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_json(<a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_rgb8\_number
  ```moonbit
  :::source,gmlewis/fonts/draw/color.mbt,268:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_rgb8_number(self : <a href="gmlewis/fonts/draw#Color">Color</a>) -> UInt
  ```
  >  to\_rgb8\_number returns a bit-packed number in RGB8 format.
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Color">Color</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CompoundPath

```moonbit
:::source,gmlewis/fonts/draw/compound-path.mbt,2:::pub(all) struct CompoundPath {
  paths : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Path">Path</a>]
  fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?
  stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?
}
```
 CompoundPath represents one or more paths that typically make up a font glyph.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,6:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a> with output(<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,6:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a> with to_json(<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### affine\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,41:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::affine_transform(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  affine\_transform transforms this CompoundPath by `affine_matrix`.
- #### affine\_transform\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,53:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::affine_transform_without_translation(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  affine\_transform\_without\_translation transforms this CompoundPath by `affine_matrix`
  > without affecting translation.
- #### all\_anchors
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,306:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::all_anchors(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Anchor">Anchor</a>]
  ```
  >  all\_anchors returns a flattened array of all anchors in this CompoundPath.
- #### as\_graphic
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,18:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::as_graphic(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  as\_graphic returns a CompoundPath as a Graphic.
- #### assign\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,79:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::assign_fill(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  assign\_fill assigns a fill to this CompoundPath.
- #### assign\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,85:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::assign_stroke(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  assign\_stroke assigns a stroke to this CompoundPath.
- #### assign\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,91:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::assign_style(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  assign\_style assigns a stroke and fill style to this CompoundPath.
- #### bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,103:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::bounding_box(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  bounding\_box returns the smallest axis-aligned bounding box that contains
  > this CompoundPath or None.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,33:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::clone(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  clone makes a new copy of this CompoundPath.
- #### closest\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,120:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::closest_point(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, area_of_interest : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>?
  ```
  >  closest\_point returns the closest point to `point` that lies on this CompoundPath or None.
- #### contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,157:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::contains_point(_self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, _point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  contains\_point returns true if this CompoundPath contains `point`.
- #### copy\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,165:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::copy_style(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, graphic : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  copy\_style copies the fill and stroke from `graphic`.
- #### first\_styled
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,172:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::first_styled(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>?
  ```
  >  first\_styled returns this CompoundPath if it is styled or None.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,6:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### has\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,181:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::has_style(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> Bool
  ```
  >  has\_style returns true if this CompoundPath has fill or stroke.
- #### is\_contained\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,187:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::is_contained_by_bounding_box(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_contained\_by\_bounding\_box returns true if no part of this CompoundPath
  > lies beyond its min or max.
- #### is\_intersected\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,201:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::is_intersected_by_bounding_box(_self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, _box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_intersected\_by\_bounding\_box returns true if part of this CompoundPath crosses
  > the boundary between inside and outside of `box`.
- #### is\_overlapped\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,235:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::is_overlapped_by_bounding_box(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_overlapped\_by\_bounding\_box returns if true if a point can be chosen
  > that is inside both the CompoundPath and `box`.
- #### loose\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,245:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::loose_bounding_box(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  loose\_bounding\_box returns an approximate bounding box for this CompoundPath.
  > It may not be the smallest possible bounding box, but is cheaper to compute.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,9:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::new(paths~ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Path">Path</a>] = .., fill~ : <a href="gmlewis/fonts/draw#Fill">Fill</a>? = .., stroke~ : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>? = ..) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  CompoundPath::new creates a new CompoundPath.
- #### op\_get
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,23:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::op_get(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, index : Int) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  op\_get is a convenience function.
- #### op\_set
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,28:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::op_set(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, index : Int, path : <a href="gmlewis/fonts/draw#Path">Path</a>) -> Unit
  ```
  >  op\_set is a convenience function.
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,6:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::output(<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### primitives
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,262:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::primitives(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
  ```
  >  primitives returns a flattened array of Graphics primitives.
- #### remove\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,267:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::remove_fill(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  remove\_fill removes fill styling from this CompoundPath.
- #### remove\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,273:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::remove_stroke(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  remove\_stroke removes stroke styling from this CompoundPath.
- #### reverse
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,279:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::reverse(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  reverse reverses this CompoundPath.
- #### rotate
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,323:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::rotate(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, angle : Double) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  rotate rotates a CompoundPath clockwise by `angle` in degrees.
- #### scale
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,317:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::scale(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  scale scales a CompoundPath by `v`.
- #### scale\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,288:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::scale_stroke(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, scale_factor : Double) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  scale\_stroke scales the width of this stroke by `scale_factor`.
- #### style\_contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,297:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::style_contains_point(_self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, _point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  style\_contains\_point returns true if this path's style contains `point`.
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,6:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::to_json(<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transform
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,64:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::transform(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  transform provides a convenient API for a common task.
- #### translate
  ```moonbit
  :::source,gmlewis/fonts/draw/compound-path.mbt,311:::fn <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>::translate(self : <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>
  ```
  >  translate translates a CompoundPath by `v`.

## DrawError

```moonbit
:::source,gmlewis/fonts/draw/draw.mbt,5:::pub(all) type! DrawError String

```
 DrawError represents an error that occured during graphic generation.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/draw.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#DrawError">DrawError</a> with op_equal(<a href="gmlewis/fonts/draw#DrawError">DrawError</a>, <a href="gmlewis/fonts/draw#DrawError">DrawError</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/draw.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#DrawError">DrawError</a> with output(<a href="gmlewis/fonts/draw#DrawError">DrawError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/draw.mbt,5:::fn <a href="gmlewis/fonts/draw#DrawError">DrawError</a>::op_equal(<a href="gmlewis/fonts/draw#DrawError">DrawError</a>, <a href="gmlewis/fonts/draw#DrawError">DrawError</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/draw.mbt,5:::fn <a href="gmlewis/fonts/draw#DrawError">DrawError</a>::output(<a href="gmlewis/fonts/draw#DrawError">DrawError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#DrawError">DrawError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Fill

```moonbit
:::source,gmlewis/fonts/draw/fill.mbt,2:::pub(all) struct Fill {
  color : <a href="gmlewis/fonts/draw#Color">Color</a>
}
```
 Fill defines a fill style.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Fill">Fill</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#Fill">Fill</a> with op_equal(<a href="gmlewis/fonts/draw#Fill">Fill</a>, <a href="gmlewis/fonts/draw#Fill">Fill</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Fill">Fill</a> with output(<a href="gmlewis/fonts/draw#Fill">Fill</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Fill">Fill</a> with to_json(<a href="gmlewis/fonts/draw#Fill">Fill</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,17:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::clone(self : <a href="gmlewis/fonts/draw#Fill">Fill</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>
  ```
  >  clone returns a new copy of this Fill.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,7:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::new(color~ : <a href="gmlewis/fonts/draw#Color">Color</a> = ..) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>
  ```
  >  Fill::new returns a new fill style.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::op_equal(<a href="gmlewis/fonts/draw#Fill">Fill</a>, <a href="gmlewis/fonts/draw#Fill">Fill</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::output(<a href="gmlewis/fonts/draw#Fill">Fill</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/fill.mbt,4:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::to_json(<a href="gmlewis/fonts/draw#Fill">Fill</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Fill">Fill</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Graphic

```moonbit
:::source,gmlewis/fonts/draw/graphic.mbt,2:::pub(all) enum Graphic {
  CompoundPath(<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>)
  Group(<a href="gmlewis/fonts/draw#Group">Group</a>)
  Path(<a href="gmlewis/fonts/draw#Path">Path</a>)
}
```
 Graphic represents a drawable graphic element.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,402:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Graphic">Graphic</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Graphic">Graphic</a> with output(<a href="gmlewis/fonts/draw#Graphic">Graphic</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### affine\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,18:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::affine_transform(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  affine\_transform transforms this graphic by `affine_matrix`.
- #### affine\_transform\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,47:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::affine_transform_without_translation(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  affine\_transform\_without\_translation transforms this graphic by `affine_matrix`
  > without affecting the translation.
- #### all\_anchors
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,198:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::all_anchors(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Anchor">Anchor</a>]
  ```
  >  all\_anchors returns all Anchors in this Graphic.
- #### all\_compound\_paths
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,180:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::all_compound_paths(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>]
  ```
  >  all\_compound\_paths returns all CompoundPaths in this Graphic.
- #### all\_paths
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,189:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::all_paths(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Path">Path</a>]
  ```
  >  all\_paths returns all Paths in this Graphic.
- #### all\_paths\_and\_compound\_paths
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,207:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::all_paths_and_compound_paths(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
  ```
  >  all\_paths\_and\_compound\_paths returns all Paths and CompoundPaths in this Graphic.
- #### assign\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,225:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::assign_fill(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  assign\_fill assigns a fill to this Graphic.
- #### assign\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,245:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::assign_stroke(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  assign\_stroke assigns a stroke to this Graphic.
- #### assign\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,265:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::assign_style(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  assign\_style assigns a fill and stroke style to this Graphic.
- #### bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,73:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::bounding_box(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  bounding\_box returns the bounding box for this Graphic.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,9:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::clone(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  clone returns a new copy of Graphic.
- #### closest\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,148:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::closest_point(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, area_of_interest : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>?
  ```
  >  closest\_point returns the closest Anchor to `point` that lies on this Graphic
  > or None.
- #### contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,306:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::contains_point(point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> ((<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool)
  ```
  >  Graphic::contains\_point returns a function that returns true if this
  > Graphic contains `point`.
- #### copy\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,275:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::copy_style(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, graphic : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  copy\_style copies the fill and stroke style from `graphic`.
- #### every
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,82:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::every(items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>], func : (<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool) -> Bool
  ```
  >  Graphic::every returns true if all tests of `func` are true.
- #### first\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,329:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::first_fill(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>?
  ```
  >  first\_fill returns the first fill from this Graphic.
- #### first\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,338:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::first_stroke(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?
  ```
  >  first\_stroke returns the first stroke from this Graphic.
- #### first\_styled
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,296:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::first_styled(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>?
  ```
  >  first\_styled returns the first Path or CompoundPath in this Graphic
  > that has either a fill or a stroke, or None.
- #### fit\_to
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,374:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::fit_to(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  fit\_to scales and translates a Graphic to fix in `box`.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,402:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > 
- #### has\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,216:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::has_style(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool
  ```
  >  has\_style returns true if this Graphic has either a stroke or a fill.
- #### is\_contained\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,103:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::is_contained_by_bounding_box(box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> ((<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool)
  ```
  >  Graphic::is\_contained\_by\_bounding\_box returns a function that tests
  > if a graphic is contained by the box.
- #### is\_intersected\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,118:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::is_intersected_by_bounding_box(box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> ((<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool)
  ```
  >  Graphic::is\_intersected\_by\_bounding\_box returns a function that tests
  > if a graphic is intersected by the box.
- #### is\_overlapped\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,133:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::is_overlapped_by_bounding_box(box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> ((<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool)
  ```
  >  Graphic::is\_overlapped\_by\_bounding\_box returns a function that tests
  > if a graphic is overlapped by the box.
- #### loose\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,64:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::loose_bounding_box(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  loose\_bounding\_box returns an approximate bounding box for all items.
  > It may not be the smallest possible bounding box, but is cheaper to compute.
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,6:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::output(<a href="gmlewis/fonts/draw#Graphic">Graphic</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### primitives
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,162:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::primitives(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
  ```
  >  primitives returns an array of primitives.
- #### remove\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,235:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::remove_fill(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  remove\_fill a fill style from this Graphic.
- #### remove\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,255:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::remove_stroke(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  remove\_stroke a stroke style from this Graphic.
- #### reverse
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,171:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::reverse(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  reverse reverses this Graphic.
- #### rotate
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,365:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::rotate(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, angle : Double) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  rotate rotates a Graphic clockwise by `angle` in degrees.
- #### scale
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,356:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::scale(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  scale scales a Graphic by `v`.
- #### scale\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,285:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::scale_stroke(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, scale_factor : Double) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  scale\_stroke scales the stroke width of this Graphic by `scale_factor`.
- #### some
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,92:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::some(items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>], func : (<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool) -> Bool
  ```
  >  Graphic::some returns true if any calls to `func` are true.
- #### style\_contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,318:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::style_contains_point(point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> ((<a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Bool)
  ```
  >  Graphic::style\_contains\_point returns a function that returns true if this
  > Graphic's style contains `point`.
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,393:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::to_json(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transform
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,31:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::transform(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  transform provides a convenient API for a common task.
- #### translate
  ```moonbit
  :::source,gmlewis/fonts/draw/graphic.mbt,347:::fn <a href="gmlewis/fonts/draw#Graphic">Graphic</a>::translate(self : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  translate translates a Graphic by `v`.

## Group

```moonbit
:::source,gmlewis/fonts/draw/group.mbt,2:::pub(all) struct Group {
  items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
}
```
 Group represents a collection of Graphics elements.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,4:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Group">Group</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Group">Group</a> with output(<a href="gmlewis/fonts/draw#Group">Group</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,4:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Group">Group</a> with to_json(<a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### affine\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,37:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::affine_transform(self : <a href="gmlewis/fonts/draw#Group">Group</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  affine\_transform transforms this Group by `affine_matrix`.
- #### affine\_transform\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,46:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::affine_transform_without_translation(self : <a href="gmlewis/fonts/draw#Group">Group</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  affine\_transform\_without\_translation transforms this Group by `affine_matrix`
  > without affecting the translation.
- #### all\_anchors
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,224:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::all_anchors(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Anchor">Anchor</a>]
  ```
  >  all\_anchors returns all Anchors in this Group.
- #### all\_compound\_paths
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,211:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::all_compound_paths(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#CompoundPath">CompoundPath</a>]
  ```
  >  all\_compound\_paths returns all compound paths in this Group.
- #### all\_paths
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,219:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::all_paths(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Path">Path</a>]
  ```
  >  all\_paths returns all Paths in this Group.
- #### all\_paths\_and\_compound\_paths
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,229:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::all_paths_and_compound_paths(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
  ```
  >  all\_paths\_and\_compound\_paths returns all Paths and CompoundPaths in this Group.
- #### as\_graphic
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,12:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::as_graphic(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  as\_graphic returns a Group as a Graphic.
- #### assign\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,247:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::assign_fill(self : <a href="gmlewis/fonts/draw#Group">Group</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  assign\_fill assigns a fill to this Group.
- #### assign\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,263:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::assign_stroke(self : <a href="gmlewis/fonts/draw#Group">Group</a>, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  assign\_stroke assigns a stroke to this Group.
- #### assign\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,279:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::assign_style(self : <a href="gmlewis/fonts/draw#Group">Group</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  assign\_style assigns a fill and stroke style to this Group.
- #### bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,110:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::bounding_box(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  bounding\_box returns the bounding box for all items in the Group.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,32:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::clone(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  clone returns a new copy of this Group.
- #### closest\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,166:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::closest_point(self : <a href="gmlewis/fonts/draw#Group">Group</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, area_of_interest : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>?
  ```
  >  closest\_point returns the closest Anchor to `point` that lies on this Group
  > or None.
- #### contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,315:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::contains_point(self : <a href="gmlewis/fonts/draw#Group">Group</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  contains\_point returns true if this Group contains `point`.
- #### copy\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,287:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::copy_style(self : <a href="gmlewis/fonts/draw#Group">Group</a>, graphic : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  copy\_style copies the fill and stroke style from `graphic`.
- #### first\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,325:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::first_fill(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>?
  ```
  >  first\_fill returns the first fill from this Group.
- #### first\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,336:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::first_stroke(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?
  ```
  >  first\_stroke returns the first stroke from this Group.
- #### first\_styled
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,304:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::first_styled(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>?
  ```
  >  first\_styled returns the first Path or CompoundPath in this Group
  > that has either a fill or a stroke, or None.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,4:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### has\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,237:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::has_style(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> Bool
  ```
  >  has\_style returns true if this Group has either a stroke or a fill.
- #### is\_contained\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,147:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::is_contained_by_bounding_box(self : <a href="gmlewis/fonts/draw#Group">Group</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_contained\_by\_bounding\_box returns true if no part of the Group
  > lies beyond the box's min and max.
- #### is\_intersected\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,154:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::is_intersected_by_bounding_box(self : <a href="gmlewis/fonts/draw#Group">Group</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_intersected\_by\_bounding\_box returns true if any part of the Group
  > crosses the boundary between the inside and outside of `box`.
- #### is\_overlapped\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,160:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::is_overlapped_by_bounding_box(self : <a href="gmlewis/fonts/draw#Group">Group</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_overlapped\_by\_bounding\_box returns true if a point can be found that
  > is inside both the Graphic and the box.
- #### loose\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,74:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::loose_bounding_box(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  loose\_bounding\_box returns an approximate bounding box for all items
  > in the Group. It may not be the smallest possible bounding box, but
  > is cheaper to compute.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,7:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::new(items~ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>] = ..) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  Group::new returns a new group.
- #### op\_get
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,17:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::op_get(self : <a href="gmlewis/fonts/draw#Group">Group</a>, index : Int) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  op\_get is a convenience function.
- #### op\_set
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,22:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::op_set(self : <a href="gmlewis/fonts/draw#Group">Group</a>, index : Int, graphic : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> Unit
  ```
  >  op\_set is a convenience function.
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,4:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::output(<a href="gmlewis/fonts/draw#Group">Group</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### primitives
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,197:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::primitives(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
  ```
  >  primitives returns a flattened array of all Graphic primitives in this Group.
- #### remove\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,255:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::remove_fill(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  remove\_fill removes a fill style from this Group.
- #### remove\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,271:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::remove_stroke(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  remove\_stroke removes a stroke style from this Group.
- #### reverse
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,202:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::reverse(self : <a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  reverse reverses this Group.
- #### rotate
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,359:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::rotate(self : <a href="gmlewis/fonts/draw#Group">Group</a>, angle : Double) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  rotate rotates a Group clockwise by `angle` in degrees.
- #### scale
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,353:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::scale(self : <a href="gmlewis/fonts/draw#Group">Group</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  scale scales a Group by `v`.
- #### scale\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,295:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::scale_stroke(self : <a href="gmlewis/fonts/draw#Group">Group</a>, scale_factor : Double) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  scale\_stroke scales the stroke width of this Group by `scale_factor`.
- #### style\_contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,320:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::style_contains_point(self : <a href="gmlewis/fonts/draw#Group">Group</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  style\_contains\_point returns true if this Group's style contains `point`.
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,4:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::to_json(<a href="gmlewis/fonts/draw#Group">Group</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transform
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,57:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::transform(self : <a href="gmlewis/fonts/draw#Group">Group</a>, position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  transform provides a convenient API for a common task.
- #### translate
  ```moonbit
  :::source,gmlewis/fonts/draw/group.mbt,347:::fn <a href="gmlewis/fonts/draw#Group">Group</a>::translate(self : <a href="gmlewis/fonts/draw#Group">Group</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Group">Group</a>
  ```
  >  translate translates a Group by `v`.

## Path

```moonbit
:::source,gmlewis/fonts/draw/path.mbt,5:::pub(all) struct Path {
  anchors : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Anchor">Anchor</a>]
  closed : Bool
  clear : Bool
  fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?
  stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?
}
```
 Path represents an open or closed path that can be stroked as an outline
or filled. A 'clear' path is sub-path of a Path that defines
regions of the filled path where no fill is added, for example in the
center of the letter 'O'.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,11:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Path">Path</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,11:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Path">Path</a> with output(<a href="gmlewis/fonts/draw#Path">Path</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,11:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Path">Path</a> with to_json(<a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### affine\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,66:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::affine_transform(self : <a href="gmlewis/fonts/draw#Path">Path</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  affine\_transform transforms this Path by `affine_matrix`.
- #### affine\_transform\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,75:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::affine_transform_without_translation(self : <a href="gmlewis/fonts/draw#Path">Path</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  affine\_transform\_without\_translation transforms this Path by `affine_matrix`
  > without affecting translation.
- #### as\_graphic
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,25:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::as_graphic(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>
  ```
  >  as\_graphic returns a Path as a Graphic.
- #### assign\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,101:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::assign_fill(self : <a href="gmlewis/fonts/draw#Path">Path</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  assign\_fill assigns a fill to this Path.
- #### assign\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,107:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::assign_stroke(self : <a href="gmlewis/fonts/draw#Path">Path</a>, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  assign\_stroke assigns a stroke to this Path.
- #### assign\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,113:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::assign_style(self : <a href="gmlewis/fonts/draw#Path">Path</a>, fill : <a href="gmlewis/fonts/draw#Fill">Fill</a>?, stroke : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>?) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  assign\_style assigns a stroke and fill style to this Path.
- #### bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,197:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::bounding_box(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  bounding\_box returns the smallest axis-aligned bounding box that contains
  > this Path or None.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,56:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::clone(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  clone makes a new copy of this Path.
- #### closest\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,247:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::closest_point(self : <a href="gmlewis/fonts/draw#Path">Path</a>, point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, area_of_interest : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>?
  ```
  >  closest\_point returns the closest point to `point` that lies on this Path or None.
- #### contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,319:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::contains_point(_self : <a href="gmlewis/fonts/draw#Path">Path</a>, _point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  contains\_point returns true if this Path contains `point`.
- #### copy\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,324:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::copy_style(self : <a href="gmlewis/fonts/draw#Path">Path</a>, graphic : <a href="gmlewis/fonts/draw#Graphic">Graphic</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  copy\_style copies the fill and stroke from `graphic`.
- #### first\_styled
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,331:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::first_styled(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>?
  ```
  >  first\_styled returns this Path if it is styled or None.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,11:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### from\_points
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,40:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::from_points(points : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Vec2">Vec2</a>], closed~ : Bool = ..) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  Path::from\_points connects a series of points with lines to form a Path.
- #### has\_style
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,340:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::has_style(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> Bool
  ```
  >  has\_style returns true if this Path has fill or stroke.
- #### is\_contained\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,346:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::is_contained_by_bounding_box(self : <a href="gmlewis/fonts/draw#Path">Path</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_contained\_by\_bounding\_box returns true if no part of this Path
  > lies beyond its min or max.
- #### is\_intersected\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,357:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::is_intersected_by_bounding_box(_self : <a href="gmlewis/fonts/draw#Path">Path</a>, _box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_intersected\_by\_bounding\_box returns true if part of this Path crosses
  > the boundary between inside and outside of `box`.
- #### is\_overlapped\_by\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,391:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::is_overlapped_by_bounding_box(self : <a href="gmlewis/fonts/draw#Path">Path</a>, box : <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>) -> Bool
  ```
  >  is\_overlapped\_by\_bounding\_box returns if true if a point can be chosen
  > that is inside both the Path and `box`.
- #### loose\_bounding\_box
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,398:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::loose_bounding_box(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>?
  ```
  >  loose\_bounding\_box returns an approximate bounding box for this Path.
  > It may not be the smallest possible bounding box, but is cheaper to compute.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,14:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::new(anchors~ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Anchor">Anchor</a>] = .., closed~ : Bool = .., clear~ : Bool = .., fill~ : <a href="gmlewis/fonts/draw#Fill">Fill</a>? = .., stroke~ : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>? = ..) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  Path::new creates a new Path.
- #### op\_get
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,30:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::op_get(self : <a href="gmlewis/fonts/draw#Path">Path</a>, index : Int) -> <a href="gmlewis/fonts/draw#Anchor">Anchor</a>
  ```
  >  op\_get is a convenience function.
- #### op\_set
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,35:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::op_set(self : <a href="gmlewis/fonts/draw#Path">Path</a>, index : Int, anchor : <a href="gmlewis/fonts/draw#Anchor">Anchor</a>) -> Unit
  ```
  >  op\_set is a convenience function.
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,11:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::output(<a href="gmlewis/fonts/draw#Path">Path</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### primitives
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,456:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::primitives(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]
  ```
  >  primitives returns a flattened array of Graphics primitives.
- #### remove\_fill
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,461:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::remove_fill(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  remove\_fill removes fill styling from this Path.
- #### remove\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,467:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::remove_stroke(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  remove\_stroke removes stroke styling from this Path.
- #### reverse
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,473:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::reverse(self : <a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  reverse reverses this Path.
- #### rotate
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,509:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::rotate(self : <a href="gmlewis/fonts/draw#Path">Path</a>, angle : Double) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  rotate rotates a Path clockwise by `angle` in degrees.
- #### scale
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,503:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::scale(self : <a href="gmlewis/fonts/draw#Path">Path</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  scale scales a Path by `v`.
- #### scale\_stroke
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,482:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::scale_stroke(self : <a href="gmlewis/fonts/draw#Path">Path</a>, scale_factor : Double) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  scale\_stroke scales the width of this stroke by `scale_factor`.
- #### style\_contains\_point
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,491:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::style_contains_point(_self : <a href="gmlewis/fonts/draw#Path">Path</a>, _point : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  style\_contains\_point returns true if this path's style contains `point`.
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,11:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::to_json(<a href="gmlewis/fonts/draw#Path">Path</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transform
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,86:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::transform(self : <a href="gmlewis/fonts/draw#Path">Path</a>, position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  transform provides a convenient API for a common task.
- #### translate
  ```moonbit
  :::source,gmlewis/fonts/draw/path.mbt,497:::fn <a href="gmlewis/fonts/draw#Path">Path</a>::translate(self : <a href="gmlewis/fonts/draw#Path">Path</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Path">Path</a>
  ```
  >  translate translates a Path by `v`.

## Stroke

```moonbit
:::source,gmlewis/fonts/draw/stroke.mbt,2:::pub(all) struct Stroke {
  color : <a href="gmlewis/fonts/draw#Color">Color</a>
  width : Double
  alignment : <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>
  cap : <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>
  join : <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>
  miter_limit : Double
}
```
 Stroke defines a stroke style.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Stroke">Stroke</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#Stroke">Stroke</a> with op_equal(<a href="gmlewis/fonts/draw#Stroke">Stroke</a>, <a href="gmlewis/fonts/draw#Stroke">Stroke</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Stroke">Stroke</a> with output(<a href="gmlewis/fonts/draw#Stroke">Stroke</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Stroke">Stroke</a> with to_json(<a href="gmlewis/fonts/draw#Stroke">Stroke</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,50:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::clone(self : <a href="gmlewis/fonts/draw#Stroke">Stroke</a>) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>
  ```
  >  clone returns a new copy of this Stroke.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,33:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::new(color~ : <a href="gmlewis/fonts/draw#Color">Color</a> = .., width~ : Double = .., alignment~ : <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a> = .., cap~ : <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a> = .., join~ : <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a> = .., miter_limit~ : Double = ..) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>
  ```
  >  Stroke::new returns a new stroke style.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::op_equal(<a href="gmlewis/fonts/draw#Stroke">Stroke</a>, <a href="gmlewis/fonts/draw#Stroke">Stroke</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::output(<a href="gmlewis/fonts/draw#Stroke">Stroke</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,9:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::to_json(<a href="gmlewis/fonts/draw#Stroke">Stroke</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Stroke">Stroke</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## StrokeAlignment

```moonbit
:::source,gmlewis/fonts/draw/stroke.mbt,12:::pub(all) enum StrokeAlignment {
  Centered
  Inner
  Outer
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a> with op_equal(<a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>, <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a> with output(<a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a> with to_json(<a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::fn <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::fn <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>::op_equal(<a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>, <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::fn <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>::output(<a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,16:::fn <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>::to_json(<a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#StrokeAlignment">StrokeAlignment</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## StrokeCap

```moonbit
:::source,gmlewis/fonts/draw/stroke.mbt,19:::pub(all) enum StrokeCap {
  Butt
  Round
  Square
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a> with op_equal(<a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>, <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a> with output(<a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a> with to_json(<a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::fn <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::fn <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>::op_equal(<a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>, <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::fn <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>::output(<a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,23:::fn <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>::to_json(<a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#StrokeCap">StrokeCap</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## StrokeJoin

```moonbit
:::source,gmlewis/fonts/draw/stroke.mbt,26:::pub(all) enum StrokeJoin {
  Miter
  Round
  Bevel
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a> with op_equal(<a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>, <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a> with output(<a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a> with to_json(<a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::fn <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::fn <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>::op_equal(<a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>, <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::fn <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>::output(<a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/stroke.mbt,30:::fn <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>::to_json(<a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#StrokeJoin">StrokeJoin</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TextAlign

```moonbit
:::source,gmlewis/fonts/draw/text.mbt,5:::pub(all) enum TextAlign {
  Left
  Center
  Right
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/text.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a> with op_equal(<a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>, <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/text.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a> with output(<a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/text.mbt,9:::fn <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>::op_equal(<a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>, <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/text.mbt,9:::fn <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>::output(<a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Transform

```moonbit
:::source,gmlewis/fonts/draw/transform.mbt,2:::pub(all) struct Transform {
  position : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  rotation : Double
  scale : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  skew : Double
  origin : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
}
```
 Transform represents transform arguments.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/transform.mbt,8:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#Transform">Transform</a> with op_equal(<a href="gmlewis/fonts/draw#Transform">Transform</a>, <a href="gmlewis/fonts/draw#Transform">Transform</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/transform.mbt,8:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Transform">Transform</a> with output(<a href="gmlewis/fonts/draw#Transform">Transform</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/transform.mbt,11:::fn <a href="gmlewis/fonts/draw#Transform">Transform</a>::new(position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Transform">Transform</a>
  ```
  >  Transform::new returns a new identity transform.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/transform.mbt,8:::fn <a href="gmlewis/fonts/draw#Transform">Transform</a>::op_equal(<a href="gmlewis/fonts/draw#Transform">Transform</a>, <a href="gmlewis/fonts/draw#Transform">Transform</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/transform.mbt,8:::fn <a href="gmlewis/fonts/draw#Transform">Transform</a>::output(<a href="gmlewis/fonts/draw#Transform">Transform</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Transform">Transform</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Vec2

```moonbit
:::source,gmlewis/fonts/draw/vec2.mbt,2:::pub(all) struct Vec2 {
  x : Double
  y : Double
}
```
 Vec2 represents a 2D vector.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts/draw#Vec2">Vec2</a> with from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts/draw#Vec2">Vec2</a> with op_equal(<a href="gmlewis/fonts/draw#Vec2">Vec2</a>, <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts/draw#Vec2">Vec2</a> with output(<a href="gmlewis/fonts/draw#Vec2">Vec2</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts/draw#Vec2">Vec2</a> with to_json(<a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,105:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::add(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  add adds the vector `v` to this vector.
- #### add\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,118:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::add_scalar(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, s : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  add\_scalar adds scalar `s` to this vector.
- #### affine\_transform
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,66:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::affine_transform(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  affine\_transform transforms this Vec2 by the `affine_matrix`.
  > This is used when transforming a point or position.
- #### affine\_transform\_without\_translation
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,77:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::affine_transform_without_translation(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, affine_matrix : <a href="gmlewis/fonts/draw#AffineMatrix">AffineMatrix</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  affine\_transform\_without\_translation transforms this Vec2 by the `affine_matrix`
  > but without performing translation.
  > This is used when transforming a normal or tangent.
- #### almost\_equals
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,208:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::almost_equals(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, other : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, tolerance~ : Double = ..) -> Bool
  ```
  >  almost\_equals returns true if the vectors are equal within the provided tolerance.
- #### angle
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,354:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::angle(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  angle returns the angle of this vector in degrees.
- #### angle\_radians
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,359:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::angle_radians(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  angle\_radians returns the angle of this vector in radians.
- #### apply
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,218:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::apply(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, func : (Double) -> Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  apply applies the provided `func` to both components of this vector.
- #### ceil
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,230:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::ceil(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  ceil rounds the components of this vector to the next-higher integer.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,41:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::clone(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  clone returns a new copy of this Vec2.
- #### copy
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,53:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::copy(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  copy copies `v` into this Vec2.
- #### cross
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,296:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::cross(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  cross returns the cross product between this vector and the vector `v`.
- #### distance
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,380:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::distance(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  distance returns the distance from this vector to `v`.
- #### distance\_squared
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,385:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::distance_squared(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  distance\_squared returns the squared distance from this vector to `v`.
- #### div
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,165:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::div(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  div divides this vector by vector `v`.
- #### div\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,178:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::div_scalar(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, s : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  div\_scalar divides this vector by scalar `s`.
- #### dot
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,291:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::dot(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  dot returns the dot product between this vector and the vector `v`.
- #### floor
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,225:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::floor(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  floor rounds the components of this vector to the next-lower integer.
- #### from\_angle
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,28:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::from_angle(angle : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  Vec2::from\_angle returns a new unit vec2 from an angle in degrees.
- #### from\_angle\_radians
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,34:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::from_angle_radians(rad : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  Vec2::from\_angle\_radians returns a new unit vec2 from an angle in radians.
- #### from\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
  ```
  > automatically derived
- #### infinity
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,13:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::infinity() -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  Vec::infinity returns a new Vec2 with infinite x and y.
- #### is\_clockwise\_from
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,365:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::is_clockwise_from(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  is\_clockwise\_from returns true if this vector lies in the 180° region
  > clockwise from `v`.
- #### is\_inf
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,402:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::is_inf(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  is\_inf returns true if either component is infinite.
- #### is\_nan
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,397:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::is_nan(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  is\_nan returns true if either component is NaN (not a number).
- #### is\_valid
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,60:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::is_valid(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  is\_valid returns whether or not this Vec2 is valid.
- #### is\_zero
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,392:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::is_zero(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  >  is\_zero returns true if both components of this vector are 0.
- #### length
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,370:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::length(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  length returns the length of this vector.
- #### length\_squared
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,375:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::length_squared(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Double
  ```
  >  length\_squared returns the squared length of this vector.
- #### max
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,276:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::max(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  max compares the components of this vector and `v` and sets this vector's
  > components to the maximum of the two.
- #### min
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,268:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::min(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  min compares the components of this vector and `v` and sets this vector's
  > components to the minimum of the two.
- #### mix
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,284:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::mix(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, t : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  mix linearly interpolates this vector to the vector `v` by the mixing
  > factor `t` (0..1).
- #### mul
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,145:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::mul(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  mul multiplies the vector `v` to this vector.
- #### mul\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,158:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::mul_scalar(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, s : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  mul\_scalar multiplies scalar `s` to this vector.
- #### neg\_infinity
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,18:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::neg_infinity() -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  Vec::neg\_infinity returns a new Vec2 with negative infinite x and y.
- #### negate
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,185:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::negate(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  negate multiplies both components (in-place) by -1.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,8:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::new(x~ : Double = .., y~ : Double = ..) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  Vec2::new returns a new Vec2.
- #### normalize
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,302:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::normalize(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  normalize scales this vector so that its length is 1.
  > Note that this vector must already have a non-zero length.
- #### op\_add
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,113:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::op_add(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, other : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  op\_add adds vector `other` to this vector without modifying either one
  > and returns the result.
- #### op\_div
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,173:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::op_div(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, other : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  op\_div divides this vector by vector `other` without modifying either one
  > and returns the result.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::op_equal(<a href="gmlewis/fonts/draw#Vec2">Vec2</a>, <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> Bool
  ```
  > automatically derived
- #### op\_mul
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,153:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::op_mul(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, other : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  op\_mul multiplies vector `other` to this vector without modifying either one
  > and returns the result.
- #### op\_neg
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,192:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::op_neg(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  op\_neg returns a negated copy of Vec2.
- #### op\_sub
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,133:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::op_sub(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, other : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  op\_sub subtracts vector `other` from this vector without modifying either one
  > and returns the result.
- #### output
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::output(<a href="gmlewis/fonts/draw#Vec2">Vec2</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### project\_onto
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,343:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::project_onto(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  project\_onto projects this vector onto a non-zero vector `v`.
- #### rotate
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,311:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::rotate(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, angle : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  rotate rotates this vector clockwise by `angle` in degrees.
- #### rotate90
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,327:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::rotate90(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  rotate90 rotates this vector clockwise by 90°.
- #### rotate\_neg90
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,335:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::rotate_neg90(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  rotate\_neg90 rotates this vector counter-clockwise by 90°.
- #### rotate\_radians
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,317:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::rotate_radians(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, rad : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  rotate\_radians rotates this vector clockwise by `rad` in radians.
- #### round
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,235:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::round(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  round rounds the components of this vector to the next-higher integer.
- #### round\_to\_fixed
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,241:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::round_to_fixed(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, digits : Int) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  round\_to\_fixed rounds the components of this vector to the provided
  > number of digits.
- #### round\_to\_multiple
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,256:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::round_to_multiple(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  round\_to\_multiple rounds the components of this vector to the closes
  > multiple of `v`.
- #### set
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,46:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::set(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, x : Double, y : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  set sets the x and y components of this Vec2.
- #### sub
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,125:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::sub(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, v : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  sub subtracts the vector `v` from this vector.
- #### sub\_scalar
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,138:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::sub_scalar(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, s : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  sub\_scalar subtracts scalar `s` from this vector.
- #### to\_json
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,5:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::to_json(<a href="gmlewis/fonts/draw#Vec2">Vec2</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/draw/traits.mbt,85:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### transform
  ```moonbit
  :::source,gmlewis/fonts/draw/vec2.mbt,90:::fn <a href="gmlewis/fonts/draw#Vec2">Vec2</a>::transform(self : <a href="gmlewis/fonts/draw#Vec2">Vec2</a>, position~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., rotation~ : Double = .., scale~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = .., skew~ : Double = .., origin~ : <a href="gmlewis/fonts/draw#Vec2">Vec2</a> = ..) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
  ```
  >  transform provides a convenient API for a common task.

## bbox

```moonbit
:::source,gmlewis/fonts/draw/bounding-box.mbt,16:::fn bbox(minx : Double, miny : Double, maxx : Double, maxy : Double) -> <a href="gmlewis/fonts/draw#BoundingBox">BoundingBox</a>
```
 bbox is a convenience function.

## fill

```moonbit
:::source,gmlewis/fonts/draw/fill.mbt,12:::fn fill(color : <a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="gmlewis/fonts/draw#Fill">Fill</a>
```
 fill is a helper function.

## group

```moonbit
:::source,gmlewis/fonts/draw/group.mbt,27:::fn group(items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts/draw#Graphic">Graphic</a>]) -> <a href="gmlewis/fonts/draw#Group">Group</a>
```
 group is a convenience function.

## rgba

```moonbit
:::source,gmlewis/fonts/draw/color.mbt,20:::fn rgba(r : Double, g : Double, b : Double, a : Double) -> <a href="gmlewis/fonts/draw#Color">Color</a>
```
 rgba is a convenience function.

## stroke

```moonbit
:::source,gmlewis/fonts/draw/stroke.mbt,45:::fn stroke(color : <a href="gmlewis/fonts/draw#Color">Color</a>) -> <a href="gmlewis/fonts/draw#Stroke">Stroke</a>
```
 stroke is a helper function.

## text

```moonbit
:::source,gmlewis/fonts/draw/text.mbt,13:::fn text(text~ : String, font~ : <a href="gmlewis/fonts#Font">@gmlewis/fonts.Font</a>, align~ : <a href="gmlewis/fonts/draw#TextAlign">TextAlign</a> = .., size~ : Double = ..) -> <a href="gmlewis/fonts/draw#Graphic">Graphic</a>!<a href="gmlewis/fonts/draw#DrawError">DrawError</a>
```
 text generates a new Graphic (a Group of Group of compound\_paths) from a text
string and a font.

## unit\_circle

```moonbit
:::source,gmlewis/fonts/draw/unit-circle.mbt,2:::fn unit_circle() -> <a href="gmlewis/fonts/draw#Group">Group</a>
```
 unit\_circle constructs a new Group representing a unit circle centered at the origin.

## unit\_square

```moonbit
:::source,gmlewis/fonts/draw/unit-square.mbt,2:::fn unit_square() -> <a href="gmlewis/fonts/draw#Group">Group</a>
```
 unit\_square constructs a new Group representing a unit square centered at the origin.

## vec2

```moonbit
:::source,gmlewis/fonts/draw/vec2.mbt,23:::fn vec2(x : Double, y : Double) -> <a href="gmlewis/fonts/draw#Vec2">Vec2</a>
```
 vec2 returns a new Vec2.
