
<div id="mod-info">
    <h1 id="mod-title"> js_io <span id="mod-version">v0.1.1</span></h1>
    
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>mizchi</p>
        </div>
        <div>
            <p>License</p>
            <p>MIT</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/mizchi/moonbit-libs/tree/main/js_io">https://github.com/mizchi/moonbit-libs/tree/main/js_io</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>js</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add mizchi/js_io </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# mizchi/js_io

Create simple shared buffer io both js and moonbit.

```bash
$ moon add mizchi/js_io
```

(I will provide high level ffi on this later)

## Why

I need structured data api but not ready https://github.com/moonbitlang/moonbit-RFCs/pull/5

## API

Moonbit API

```rust
@js_io.read_buffer()
@js_io.write_buffer(bytes)
@js_io.read_string()
@js_io.write_string(string)
// Optional
@js_io.set_buffer_offset(0xFF)
```

JS API

```js
import { js_string, spectest, flush, setMemory, readBuffer, writeBuffer } from "./.mooncakes/mizchi/js_io/dist/mod.js"

// write
writeBuffer(new Uint8Array([1, 2, 3, 4, 5]));
// read
const buffer = readBuffer();
```

## Usage

```rust
// Usage
pub fn write_bytes_test() -> Unit {
  let bytes = @js_io.read_buffer()
  for i = 0; i < bytes.length(); i = i + 1 {
    bytes[i] = bytes[i] + 1
  }
  @js_io.write_buffer(bytes)
  ()
}

// Optional
pub fn set_buffer_offset(offset : Int) -> Unit {
  @js_io.set_buffer_offset(offset)
  ()
}
```

from js

```js
import { js_string, spectest, flush, setMemory, readBuffer, writeBuffer, setBufferOffset } from "./.mooncakes/mizchi/js_io/dist/mod.js"

const { instance } = await WebAssembly.instantiateStreaming(
  fetch(new URL("./target/wasm-gc/release/build/echo.wasm", import.meta.url)),
  { js_string, spectest }
);
setMemory(instance.exports["moonbit.memory"]);
const exports = instance.exports as any;
exports._start();

// Optional
// default js_string uses first page 0~ in memory
// and js_io uses 32768~ in memory
// use twice
{
  memory.grow(1); // to 128kb
  exports.set_buffer_offset(0xFF)
  set_buffer_offset(0xFF)
}

// echo
writeBuffer(new Uint8Array([1, 2, 3, 4, 5]));
exports.write_bytes_test();
const result = readBuffer();
console.log(result) // Uint8Array([2, 3, 4, 5, 6])
flush();
```

## How to develop

```bash
$ deno run -A script/build.ts
$ deno run -A script/test.ts
```

## TODO

- structured data protocol like json

## LICENSE

MIT