
<div id="mod-info">
    <h1 id="mod-title"> unstable_io <span id="mod-version">v0.1.3</span></h1>
    Unstable IO package for MoonBit
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>lijunchen</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/lijunchen/unstable-io-mbt">https://github.com/lijunchen/unstable-io-mbt</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>io</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add lijunchen/unstable_io </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# Unstable IO for MoonBit

Currently, it only works with the `wasm-gc` backend in `moonrun`.

⚠️ **Warning**: The current API is provisional, not well designed, and only
intended for basic functionality. Use it at your own risk.

## Usage

Assume you have already created a MoonBit project by `moon new`. Use the
following command to add this package to your project:

```bash
$ moon add lijunchen/unstable_io
```

### File & Stdio

`./main/moon.pkg.json`:

```json
{
    "is-main": true,
    "import": [
        "lijunchen/unstable_io/io",
        "lijunchen/unstable_io/fs"
    ]
}
```

`./main/main.mbt`:

```moonbit
fn main {
  @io.print("Enter your name: ")
  @io.flush(Stdout)
  let name = @io.read_line_from_stdin().unwrap()
  @fs.write_to_string("test.txt", name)
  let exist = @fs.exists("test.txt")
  @io.println("test.txt exists: \(exist)")
  let content = @fs.read_to_string("test.txt")
  @io.println("content of test.txt: \(content)")
}
```

```
$ moon run main
```

### CLI args

`./main/moon.pkg.json`:

```json
{
    "is-main": true,
    "import": [
        "lijunchen/unstable_io/env"
    ]
}
```

`./main/main.mbt`:

```moonbit
fn main {
  let args = @env.get_args()
  println("args: \(args)")
}
```

```bash
$ moon run main -- a b c
args: [a, b, c]
```

### Environment Variables

`./main/moon.pkg.json`:

```json
{
    "is-main": true,
    "import": [
        "lijunchen/unstable_io/env"
    ]
}
```

`./main/main.mbt`:

```moonbit
fn main {
  let env_var = @env.get_env_var("TEST")
  println("TEST: \(env_var)")
}
```

```bash
$ TEST=123 moon run main
TEST: Some(123)
```
