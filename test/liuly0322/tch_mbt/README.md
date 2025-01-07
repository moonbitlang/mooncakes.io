
<div id="mod-info">
    <h1 id="mod-title"> tch_mbt <span id="mod-version">v0.0.1</span></h1>
    libtorch FFI bindings(WIP) for MoonBit
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>liuly0322</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/liuly0322/tch-mbt">https://github.com/liuly0322/tch-mbt</a></p>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add liuly0322/tch_mbt </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# tch_mbt

A PoC of using libtorch in MoonBit.

## Installation

Currently, only Linux is supported.

- Install libtorch: <https://pytorch.org/cppdocs/installing.html>
- Build shared library to proxy libtorch:
   ```bash
   cd libtorch_proxy
   mkdir build
   cmake -DCMAKE_PREFIX_PATH=/your/path/to/libtorch ..
   make -j
   cp libtchproxy.so ../../torch        # torch/libtchproxy.so
   ```
- Run:
   ```bash
   cd ../../torch
   LD_LIBRARY_PATH=. moon test --target native
   # output should be like:
   0.2852  0.4572  0.6752
   0.3008  0.8896  0.6998
   [ CPUFloatType{2,3} ]
   Total tests: 1, passed: 1, failed: 0.
   ```

## How it works

First we need to make MoonBit work with C++. We replace the default `tcc` with `g++` to enable C++ support.

```json
"link": {
    "native": {
       "cc": "g++",
       "cc-flags": "./native_stub.cpp",
       "cc-link-flags": "-L. -ltchproxy -lm"
    }
}
```

However, libtorch not only needs C++ compiler support, but also requires a build system like CMake. We offload the CMake build to a separate directory `libtorch_proxy` and then copy the shared library to the MoonBit project, which is the final FFI solution.

## TODO

- [ ] Build an real inference model demo.
- [ ] Enhance build experience.
- [ ] Support more APIs and make them public.

## License

Apache 2.0