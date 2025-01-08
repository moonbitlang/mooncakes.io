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
