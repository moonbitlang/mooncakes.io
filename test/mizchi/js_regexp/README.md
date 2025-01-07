
<div id="mod-info">
    <h1 id="mod-title"> js_regexp <span id="mod-version">v0.0.4</span></h1>
    JS RegExp binding
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
            <p><a href="https://github.com/mizchi/moonbit-libs/tree/main/moonbit_js_regexp">https://github.com/mizchi/moonbit-libs/tree/main/moonbit_js_regexp</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>regexp</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add mizchi/js_regexp </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# mizchi/js_regexp

JS RegExp Binding on moonbit

```bash
$ moon add mizchi/js_regexp
```

moon.pkg.json

```json
{
  "import": [
    "mizchi/js_regexp"
  ]
}
```

## Examples

include [js_regexp.js](./js_regexp.js) and [js_string.js](./js_string.js) to importObject

```js
// See https://github.com/moonbitlang/moonbit-docs/blob/main/examples/wasm-gc/index.html
import { js_string, spectest, flush, setMemory } from "./js_string.js";
import { js_regexp } from "./js_regexp.js";
const importObject = {
  js_regexp,
  js_string,
  spectest,
};
WebAssembly.instantiateStreaming(fetch("/target/wasm-gc/release/build/main/main.wasm"), importObject).then(
  (obj) => {
    const memory = obj.instance.exports["moonbit.memory"];
    setMemory(memory);
    obj.instance.exports._start();
    flush();
  }
)
```

Use it with `$ moon build --target wasm-gc`

```rust
// main/main.mbt
fn main {
  let re = @js_regexp.new("(\\w)(\\d+)", flags="im")
  let result1 = re.exec("H111")
  println("exec1: \(result1)") // Some([H111, H, 111])
  let result2 = re.exec("nop")
  println("exec2: \(result2)") // None
}
```

## with deno

Put `js_string.js` and `js_regexp.js`

```js
import { js_regexp } from "./js_regexp.js";
import { js_string, spectest, flush, setMemory } from "./js_string.js";

const { instance } = await WebAssembly.instantiateStreaming(
  fetch(new URL("./target/wasm-gc/release/build/main/main.wasm", import.meta.url)),
  { js_regexp, js_string, spectest }
);
const exports = instance.exports as any;
setMemory(instance.exports["moonbit.memory"]);
exports._start();
flush();
```

## LICENSE

MIT