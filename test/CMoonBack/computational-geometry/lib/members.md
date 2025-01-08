# Documentation
|Type|description|
|---|---|
|[Circle](#Circle)||
|[Line](#Line)||
|[Line3d](#Line3d)||
|[Plane3d](#Plane3d)||
|[Point](#Point)||
|[Point3d](#Point3d)||

|Value|description|
|---|---|
|[new\_line](#new_line)| Creates a new line segment in a 2D coordinate system defined by two|
|[new\_line3d](#new_line3d)||
|[new\_plane\_3d](#new_plane_3d)||
|[new\_point](#new_point)| Creates a new point in a 2D coordinate system with the specified x and y|
|[new\_point3d](#new_point3d)||

## Circle

```moonbit
:::source,CMoonBack/computational-geometry/lib/circle.mbt,2:::type Circle
```


## Line

```moonbit
:::source,CMoonBack/computational-geometry/lib/line.mbt,51:::type Line
```


## Line3d

```moonbit
:::source,CMoonBack/computational-geometry/lib/3D_geometry_pre.mbt,9:::type Line3d
```


## Plane3d

```moonbit
:::source,CMoonBack/computational-geometry/lib/3D_geometry_pre.mbt,15:::type Plane3d
```


## Point

```moonbit
:::source,CMoonBack/computational-geometry/lib/line.mbt,26:::type Point
```


## Point3d

```moonbit
:::source,CMoonBack/computational-geometry/lib/3D_geometry_pre.mbt,2:::type Point3d
```


## new\_line

```moonbit
:::source,CMoonBack/computational-geometry/lib/line.mbt,802:::fn new_line(a_ : <a href="CMoonBack/computational-geometry/lib#Point">Point</a>, b_ : <a href="CMoonBack/computational-geometry/lib#Point">Point</a>) -> <a href="CMoonBack/computational-geometry/lib#Line">Line</a>
```
 Creates a new line segment in a 2D coordinate system defined by two
endpoints.

 Parameters:

 * `start_point` : The starting point of the line segment.
 * `end_point` : The ending point of the line segment.

 Returns a `Line` struct representing the line segment between the two points.

 Examples:

 ```moonbit
 test "new_line/horizontal" {
   let start = new_point(0.0, 0.0)
   let end = new_point(3.0, 0.0)
   let line = new_line(start, end)
   inspect!(line.a.x, content="0.0")
   inspect!(line.a.y, content="0.0")
   inspect!(line.b.x, content="3.0")
   inspect!(line.b.y, content="0.0")
 }
 
 test "new_line/vertical" {
   let start = new_point(1.0, 0.0)
   let end = new_point(1.0, 4.0)
   let line = new_line(start, end)
   inspect!(line.a.x, content="1.0")
   inspect!(line.a.y, content="0.0")
   inspect!(line.b.x, content="1.0")
   inspect!(line.b.y, content="4.0")
 }
 
 test "new_line/diagonal" {
   let start = new_point(-1.0, -1.0)
   let end = new_point(1.0, 1.0)
   let line = new_line(start, end)
   inspect!(line.a.x, content="-1.0")
   inspect!(line.a.y, content="-1.0")
   inspect!(line.b.x, content="1.0")
   inspect!(line.b.y, content="1.0")
 }
 ```

## new\_line3d

```moonbit
:::source,CMoonBack/computational-geometry/lib/3D_geometry_pre.mbt,319:::fn new_line3d(a_ : <a href="CMoonBack/computational-geometry/lib#Point3d">Point3d</a>, b_ : <a href="CMoonBack/computational-geometry/lib#Point3d">Point3d</a>) -> <a href="CMoonBack/computational-geometry/lib#Line3d">Line3d</a>
```

 Creates a new 3D line segment defined by two endpoints in a three-dimensional
coordinate system.

 Parameters:

 * `start_point` : The starting point of the line segment, represented as a
   `Point3d` structure with x, y, and z coordinates.
 * `end_point` : The ending point of the line segment, represented as a
   `Point3d` structure with x, y, and z coordinates.

 Returns a `Line3d` structure representing the line segment between the two
specified points.

 Example:

 ```moonbit
 test "new_line3d" {
   let start = new_point3d(1.0, 2.0, 3.0)
   let end = new_point3d(4.0, 5.0, 6.0)
   let line = new_line3d(start, end)
   inspect!(line.a.x, content="1.0")
   inspect!(line.b.z, content="6.0")
 }
 ```

## new\_plane\_3d

```moonbit
:::source,CMoonBack/computational-geometry/lib/3D_geometry_pre.mbt,352:::fn new_plane_3d(a_ : <a href="CMoonBack/computational-geometry/lib#Point3d">Point3d</a>, b_ : <a href="CMoonBack/computational-geometry/lib#Point3d">Point3d</a>, c_ : <a href="CMoonBack/computational-geometry/lib#Point3d">Point3d</a>) -> <a href="CMoonBack/computational-geometry/lib#Plane3d">Plane3d</a>
```

 Creates a new 3D plane defined by three non-collinear points. The plane is
represented in point-normal form, where the normal vector is determined by
the cross product of two vectors formed by these points.

 Parameters:

 * `point1` : The first point defining the plane.
 * `point2` : The second point defining the plane.
 * `point3` : The third point defining the plane.

 Returns a `plane3d` structure representing the plane passing through the
three given points.

 Example:

 ```moonbit
 test "new_plane_3d" {
   let p1 = new_point3d(0.0, 0.0, 0.0)
   let p2 = new_point3d(1.0, 0.0, 0.0)
   let p3 = new_point3d(0.0, 1.0, 0.0)
   let plane = new_plane_3d(p1, p2, p3)
   // Creates a plane with normal vector (0, 0, 1)
   inspect!(plane.a.x, content="0.0")
   inspect!(plane.b.x, content="1.0")
   inspect!(plane.c.y, content="1.0")
 }
 ```

## new\_point

```moonbit
:::source,CMoonBack/computational-geometry/lib/line.mbt,754:::fn new_point(x_ : Double, y_ : Double) -> <a href="CMoonBack/computational-geometry/lib#Point">Point</a>
```
 Creates a new point in a 2D coordinate system with the specified x and y
coordinates.

 Parameters:

 * `x` : The x-coordinate of the point.
 * `y` : The y-coordinate of the point.

 Returns a `Point` struct containing the specified coordinates.

 Examples:

 ```moonbit
 test "new_point" {
   let p = new_point(1.0, 2.0)
   inspect!(p.x, content="1.0")
   inspect!(p.y, content="2.0")
 }
 
 test "new_point/negative_coordinates" {
   let p = new_point(-3.0, -4.0)
   inspect!(p.x, content="-3.0")
   inspect!(p.y, content="-4.0")
 }
 
 test "new_point/zero_coordinates" {
   let p = new_point(0.0, 0.0)
   inspect!(p.x, content="0.0")
   inspect!(p.y, content="0.0")
 }
 ```

## new\_point3d

```moonbit
:::source,CMoonBack/computational-geometry/lib/3D_geometry_pre.mbt,289:::fn new_point3d(x_ : Double, y_ : Double, z_ : Double) -> <a href="CMoonBack/computational-geometry/lib#Point3d">Point3d</a>
```

 Creates a new point in a 3D coordinate system with the specified x, y, and z
coordinates.

 Parameters:

 * `x` : The x-coordinate of the point.
 * `y` : The y-coordinate of the point.
 * `z` : The z-coordinate of the point.

 Returns a `Point3d` struct containing the specified coordinates.

 Examples:

 ```moonbit
 test "new_point3d" {
   let p = new_point3d(1.0, 2.0, 3.0)
   inspect!(p.x, content="1.0")
   inspect!(p.y, content="2.0")
   inspect!(p.z, content="3.0")
 }
 
 test "new_point3d/negative_coordinates" {
   let p = new_point3d(-3.0, -4.0, -5.0)
   inspect!(p.x, content="-3.0")
   inspect!(p.y, content="-4.0")
   inspect!(p.z, content="-5.0")
 }
 ```
