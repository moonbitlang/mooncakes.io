
<div id="mod-info">
    <h1 id="mod-title"> wasm4 <span id="mod-version">v0.2.4</span></h1>
    An opinionated binding for WASM-4, a retro game framework using WebAssembly
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>moonbitlang</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/moonbitlang/wasm4">https://github.com/moonbitlang/wasm4</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>game</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add moonbitlang/wasm4 </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# Wasm4 Binding for MoonBit

This is an opinionated binding for [Wasm4](https://wasm4.org) in MoonBit.

## Prerequisites

- MoonBit toolchain
- [Node.js](https://nodejs.org/en)

## Usage

- Add this package: `moon add moonbitlang/wasm4`
- Develop with this package as other packages
- Optionally export a function called `start` that will be executed once on
  initialization and export a function called `update` that will be executed at
  60Hz for the expected backend
- Import a memory with the module of `env` and name of `memory`
- Build with `moon build --target <wasm-gc or wasm>` with the respective backend
- Execute `npx wasm4 run <target>.wasm`. The target should be located in
  `target/wasm/release/build/<package path>/<package name>.wasm` for wasm
  backend, or `target/wasm-gc/release/build/<package path>/<package name>.wasm`
  for wasm-gc backend. The browser should open automatically and display the
  game. Enjoy

## Examples

The snake example (adapted from the Wasm4 documentation) demonstrates the usage. You may execute

```bash
moon build --source-dir example/snake --target wasm
npx wasm4 run example/snake/target/wasm/release/build/snake.wasm
```

and enjoy the game.

## References

- For more information about MoonBit, visit:
  [MoonBit official website](https://www.moonbitlang.com/docs/syntax)
- For more information about Wasm4 and how to play, visit:
  [WASM-4 Documentation](https://wasm4.org/docs/)
