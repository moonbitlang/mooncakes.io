# Quaternion Library for MoonBit

MoonBit does not have `num_traits::Float` so this library is only using `Float`(i.e.`f32`).

```bash
moon add tiye/quaternion
```

Find docs on [Mooncakes](https://mooncakes.io/docs/#/tiye/quaternion/lib/members).

```moonbit
let a = Quaternion::{ w: 1.0, x: 2.0, y: 3.0, z: 4.0 };
a.w;

// quick creates
let b1 = q(1.0, 2.0, 3.0, 4.0);
//
// quick creates with integers
let b2 = qi(1, 2, 3, 4);

b1 + b2;
b1 - b2;
b1 * b2;
b1 / b2;
b1.conjugate();
b1.scale(1.5);
b1.square_length();
b1.length();
b1.inverse();

a.to_array();
a.to_xyzw()

Quaternion::from_array([1.0, 2.0, 3.0, 4.0]);
Quaternion::from_xyzw_array(1.0, 2.0, 3.0, 4.0);
```

There are also mutable APIs:

```moonbit
let mut c = Quaternion::id();
let b = qi(1, 2, 3, 4);

c += b;
c -= b;
c *= b;
// no division

c.inverse_mut();
c.conjugate_mut();
c.scale_mut(1.5);
```
