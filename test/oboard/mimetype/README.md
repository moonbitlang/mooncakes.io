
<div id="mod-info">
    <h1 id="mod-title"> mimetype <span id="mod-version">v0.1.4</span></h1>
    Mime types for MoonBit
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
            <p><a href="https://github.com/oboard/mimetype">https://github.com/oboard/mimetype</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>mimetype</li>
                <li>mime</li>
                <li>type</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add oboard/mimetype </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# oboard/mimetype

An API for MIME type information.

- All `mime-db` types

## Installation

```bash
moon add oboard/mimetype
```

## Quick Start

For the full version (800+ MIME types, 1,000+ extensions):

```rust
let mime = @mimetype.new()
mime.getType("txt")                    // ⇨ "text/plain"
mime.getExtension("text/plain")        // ⇨ "txt"
```

## API

### `mime.getType(pathOrExtension)`

Get mime type for the given file path or extension. E.g.

```rust
mime.getType("js") // ⇨ "text/javascript"
mime.getType("json") // ⇨ "application/json"

mime.getType("txt") // ⇨ "text/plain"
mime.getType("dir/text.txt") // ⇨ "text/plain"
mime.getType("dir\\text.txt") // ⇨ "text/plain"
mime.getType(".text.txt") // ⇨ "text/plain"
mime.getType(".txt") // ⇨ "text/plain"
```

`null` is returned in cases where an extension is not detected or recognized

```rust
mime.getType("foo/txt") // ⇨ null
mime.getType("bogus_type") // ⇨ null
```

### `mime.getExtension(type)`

Get file extension for the given mime type. Charset options (often included in Content-Type headers) are ignored.

```rust
mime.getExtension("text/plain") // ⇨ "txt"
mime.getExtension("application/json") // ⇨ "json"
mime.getExtension("text/html; charset=utf8") // ⇨ "html"
```

### `mime.getAllExtensions(type)`

Get all file extensions for the given mime type.

```rust
mime.getAllExtensions("image/jpeg") // ⇨ Set(3) { "jpeg", "jpg", "jpe" }
```
