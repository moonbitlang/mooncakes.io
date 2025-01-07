
<div id="mod-info">
    <h1 id="mod-title"> mocket <span id="mod-version">v0.2.0</span></h1>
    A web framework for MoonBit.
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>oboard</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/oboard/mocket">https://github.com/oboard/mocket</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>http</li>
                <li>server</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add oboard/mocket </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# oboard/mocket

A web framework for MoonBit.

![logo](logo.jpg)

![screenshots](screenshots/1.png)

## Usage

Minimum Example: https://github.com/oboard/mocket_example

### MocketGo Runtime (Experimental)
Download the latest release from:
https://github.com/oboard/mocketgo/releases
#### Linux/MacOS:
```bash
chmod +x ./mocketgo
./mocketgo main.wasm
```

#### Windows:
```bat
mocketgo.exe main.wasm
```

### Node.js Runtime
#### Prerequisites

- MoonBit SDK installed
- Node.js installed

#### Linux/MacOS:

```bash
sudo chmod +x ./start.sh
./start.sh
```

OR run with make:

```bash
make serve
```

### Windows:

```bat
start.bat
```

## Example usage

```rust
// Example usage of mocket package in MoonBit

fn main {
  let port = 4000
  let server = @mocket.listen(get_context(), port)
  // readFile example
  // @mocket.readFile("./logo.jpg").finally(
  //   fn(data : Bytes) { println(data.length()) },
  // )
  // html response example
  server.get(
    "/",
    fn(_req : @mocket.HttpRequest, _res : @mocket.HttpResponse) {
      @mocket.html("<h1>Hello, World!</h1>")
    },
  )
  // string response example
  server.get(
    "/text",
    fn(_req : @mocket.HttpRequest, _res : @mocket.HttpResponse) {
      String("<h1>Hello, World!</h1>")
    },
  )
  // json data example
  server.get(
    "/data",
    fn(_req : @mocket.HttpRequest, _res : @mocket.HttpResponse) {
      { "name": "John Doe", "age": 30, "city": "New York" }
    },
  )
  // echo server example
  server.post(
    "/echo",
    fn(req : @mocket.HttpRequest, _res : @mocket.HttpResponse) {
      match req.body {
        Some(data) => data
        _ => String("No data received")
      }
    },
  )
  // file serving example
  server.get(
    "/image",
    fn(_req : @mocket.HttpRequest, _res : @mocket.HttpResponse) {
      @mocket.file("logo.jpg")
    },
  )

  // buffer serving example
  server.get(
    "/buffer",
    fn(_req : @mocket.HttpRequest, _res : @mocket.HttpResponse) {
      @mocket.buffer(
        [
          72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33, 32, 84, 104, 105,
          115, 32, 105, 115, 32, 97, 32, 116, 101, 115, 116, 32, 115, 116, 114, 105,
          110, 103, 32, 102, 111, 114, 32, 116, 101, 115, 116, 105, 110, 103, 32,
          112, 117, 114, 112, 111, 115, 101,
        ].map(fn(x) { x.to_byte() })
        |> Bytes::from_array,
      )
    },
  )

  // static file serving example
  // Example: http://localhost:4000/static/logo.jpg => ./logo.jpg
  server.static("/static/", "./")
}

```
