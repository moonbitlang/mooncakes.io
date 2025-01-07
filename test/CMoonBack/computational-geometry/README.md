
<div id="mod-info">
    <h1 id="mod-title"> computational-geometry <span id="mod-version">v0.2.0</span></h1>
    computational geometry library in moonbit
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>CMoonBack</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/CMoonBack/Computational-geometry">https://github.com/CMoonBack/Computational-geometry</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>math</li>
                <li>geometry</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add CMoonBack/computational-geometry </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# Computational Geometry library

This repository contains a library of computational geometry implemented in Moonbit. 
The library provides a variety of correlation operations for calculating geometry, 
and is expected to cover the following areas: point-line correlation, 
polygon correlation, triangle correlation, circle correlation, 
convex hull correlation, 3D geometric correlation, etc.

## Features

### 2D geometric

#### Point and line correlation

- **cross product**: Calculates the cross product of two vectors formed by three points.
- **dot product**: Calculates the dot product of two vectors formed by three points.
- **distance**: Calculates the distance between two points.
- **collinear**: Checks whether three points are collinear.
- **on segment1**: Checks whether a point is on a line segment,including the endpoints.
- **on segment2**: Checks whether a point is on a line segment,excluding the endpoints.
- **same side**: Determines whether two points lie on the same side of a line.
- **opposite side**: Determines whether two points lie on opposite sides of a line.
- **symmetric point**: Calculates the symmetric point (reflection) of a point with respect to a line.
- **intersected**: Checks whether two line segments intersect.
- **intersected point**: Calculates the intersection point of two line segments.
- **point to line**: Calculates the projection point of a given point onto a line defined by two points.
- **distance of point to line**: Calculates the distance between a point and a line.
- **point to line segment**: Calculates the projection point of a given point onto a line segment.

#### Polygon correlation

- **is sign**: Check the sign of floating-point numbers.
- **is convex**: Check whether a polygon is convex.
- **point inside convex**: Checks whether a point is inside a convex polygon.
- **point inside polygon**: Checks whether a point is inside a polygon.
- **segment inside polygon**: Checks whether a line segment is inside a polygon.

#### Triangle correlation

- **circumcenter**: Calculates the circumcenter of a triangle.
- **incenter**: Calculates the incenter of a triangle.
- **perpencenter**: Calculates the perpencenter of a triangle.

#### Circle correlation

- **intersect_line_circle**: Checks whether a line intersects with a circle.
- **intersect_segment_circle**: Checks whether a line segment intersects with a circle.
- **intersect_circle_circle**: Checks whether two circles intersect.
- **dot_to_circle**: Checks the closest point on a circle to a given point.
- **intersection_line_circle**: Calculates the intersection points of a line and a circle.
- **intersection_circle_circle**: Calculates the intersection points of two circles.

#### Sphere correlation

- **angle**: Give the latitude and longitude of the earth and calculate the central angle of the circle.
- **line_dist**: Knowing the latitude and longitude, calculate the straight-line distance between two points on the earth.
- **sphere_dist**: Knowing the latitude and longitude, calculate the spherical distance between two points on the earth.

### 3D geometric

#### Preparatory functions

- **cross product**: Calculates the cross product of two vectors.
- **dot product**: Calculates the dot product of two vectors.
- **subtract**: Subtracts two vectors.
- **pvec plane**: Calculates the normal vector of a plane using the cross product of two vectors formed from three points on the plane.
- **pvec point**: Calculates the cross product of two vectors formed by three points in 3D space.
- **distance3d**: Calculates the distance between two points.
- **vlen**: Calculates the length of a vector.


## Usages

For how to use,see the [core](https://github.com/CMoonBack/Computational-geometry/tree/main/src/lib) in the repository.

Specific usages are being written.

## License

This project is licensed under the Apache-2.0 License.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Contact

For any questions or suggestions, please contact [2214559347@qq.com].
