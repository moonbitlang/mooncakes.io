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