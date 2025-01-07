
<div id="mod-info">
    <h1 id="mod-title"> mmhttp <span id="mod-version">v0.3.0</span></h1>
    MoonBit 的 HTTP 工具包
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>fantix</p>
        </div>
        <div>
            <p>License</p>
            <p>MulanPSL-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://gitee.com/fantix/mmhttp">https://gitee.com/fantix/mmhttp</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>http</li>
                <li>parser</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add fantix/mmhttp </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# mmhttp

MoonBit 的 HTTP 工具包，可用来进一步实现 HTTP 客户端或者服务器。

**⚠️注意⚠️：h11_ffi 目前是挂的，参见 [binaryen 的问题](https://github.com/WebAssembly/binaryen/issues/6407#issuecomment-2068196198)。**

## HTTP 1.x

[llhttp](https://github.com/nodejs/llhttp) 是 Node.js 使用的一个极速 HTTP 1.0/1.1
解析器，由 TypeScript 定义解析逻辑并生成 C 代码用于执行解析。本项目有两个包，对其进行了不同的封装：

1. `h11_ffi` 是用 [wasm-merge](https://github.com/WebAssembly/binaryen?tab=readme-ov-file#wasm-merge)
将 llhttp 基于 WASI 编译出来的 .wasm 文件，与 MoonBit 写的接口封装打包在一起；
2. `h11_native` 是修改了 `llparse` 直接生成了原生 MoonBit 解析代码。

## 构建与开发

需要先安装以下构建依赖关系：

 * [MoonBit](https://www.moonbitlang.cn/)
 * [Node.js](https://nodejs.org/)

构建 `h11_ffi` 还需以下额外工具（可参考或使用 `Dockerfile`）：

 * [Rust](https://www.rust-lang.org/)
 * [Clang](https://clang.llvm.org/)
 * [wasi-libc](https://github.com/WebAssembly/wasi-libc)
 * [wasi-compiler-rt](https://compiler-rt.llvm.org/)
 * [WABT](https://github.com/WebAssembly/wabt)
 * [binaryen](https://github.com/WebAssembly/binaryen)

执行 `h11_ffi` 的单元测试：

```
$ make test
```

## 使用指南

MoonBit 构建工具暂不支持非标流程和依赖导出，因此要使用 mmhttp/h11_ffi，需要手动完成以下步骤：

1. `moon add fantix/mmhttp`
2. 在 `moon.pkg.json` 中增加引用：

   ```json
   {
     "is_main": true,
     "import": {"fantix/mmhttp/h11_ffi": "h11"}
   }
   ```

3. 创建 `exports.mbt`，重新导出 `mmhttp/h11_ffi/exports.mbt` 中的所有公共函数：

   ```moonbit
   pub fn on_message_begin(ptr : Int) -> Int {
     @h11.on_message_begin(ptr)
   }
   ...
   ```

4. 将 `mmhttp/h11_ffi/env.wat` 复制到自己项目中，并将 `fantix/mmhttp/h11_ffi`
   改成自己的包名
5. 按照 `mmhttp/Makefile` 中的做法，构建 `llhttp.wasm` 和 `env.wasm`，并将二者用
   `wasm-merge` 与自己项目的 .wasm 文件合并

## 实现说明

`h11_ffi` 直接使用了用 `llhttp` 生成的 C 代码依托 WASI 编译出的
.wasm，其内存与 MoonBit 并不相通。为了实现零内存拷贝，mmhttp
的封装本身尽量不去碰 `llhttp`/WASI 的内存，而是用指针封装出诸如
`MemoryBuffer` 和 `Memory` 这样的懒加载结构，由用户选择何时去操作
`llhttp` 的内存。

实现上，因为 MoonBit 的 FFI 暂不支持不安全内存指针，因此虽然
mmhttp 在 `h11_ffi/env.wat` 中使用了 WASM 的 Multiple
Memory 提议实现了批量内存拷贝，但实际上并没有用到，目前仍是用
`load8_u` 和 `store8` 一个字节一个字节的读写。因此在使用
`h11_ffi` 时，大量读写 `llhttp` 的内存时，性能并不是最优的。
