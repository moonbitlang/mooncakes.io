
<div id="mod-info">
    <h1 id="mod-title"> quaternion <span id="mod-version">v0.1.0</span></h1>
    Quaternion math library
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>tiye</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/WebGPU-Art/quaternion">https://github.com/WebGPU-Art/quaternion</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>math</li>
                <li>quaternion</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add tiye/quaternion </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



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
