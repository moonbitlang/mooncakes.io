# gmlewis/sha1
[![check](https://github.com/gmlewis/moonbit-sha1/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-sha1/actions/workflows/check.yml)

This is a simple sha1 hash algorithm based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.0:src/crypto/sha1/sha1.go
which has the copyright notice:

```
// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
```

## Status

The code has been updated to support compiler:

```bash
$ moon version --all
moon 0.1.20241216 (b57ed1c 2024-12-16) ~/.moon/bin/moon
moonc v0.1.20241216+68e710374 ~/.moon/bin/moonc
moonrun 0.1.20241216 (b57ed1c 2024-12-16) ~/.moon/bin/moonrun
```

Use `moonup` to manage `moon` compiler versions:
https://github.com/chawyehsu/moonup

---
# Documentation
|Type|description|
|---|---|
|[Digest](#Digest)| \`Digest\` represents the partial evaluation of a checksum.|

## Digest

```moonbit
:::source,gmlewis/sha1/sha1.mbt,34:::type Digest
```
 `Digest` represents the partial evaluation of a checksum.

#### mooncakes-io-method-mark-Methods
- #### check\_sum
  ```moonbit
  :::source,gmlewis/sha1/sha1.mbt,52:::fn <a href="gmlewis/sha1#Digest">Digest</a>::check_sum(self : <a href="gmlewis/sha1#Digest">Digest</a>) -> String
  ```
  >  `check_sum` returns the final sha1sum as a hex string.
- #### new
  ```moonbit
  :::source,gmlewis/sha1/sha1.mbt,42:::fn <a href="gmlewis/sha1#Digest">Digest</a>::new() -> <a href="gmlewis/sha1#Digest">Digest</a>
  ```
  >  `Digest::new` returns a new, reset Digest, ready to sum.
- #### reset
  ```moonbit
  :::source,gmlewis/sha1/sha1.mbt,97:::fn <a href="gmlewis/sha1#Digest">Digest</a>::reset(self : <a href="gmlewis/sha1#Digest">Digest</a>) -> Unit
  ```
  >  `reset` resets a digest for re-use.
- #### write
  ```moonbit
  :::source,gmlewis/sha1/sha1.mbt,111:::fn <a href="gmlewis/sha1#Digest">Digest</a>::write(self : <a href="gmlewis/sha1#Digest">Digest</a>, buf : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  >  `write` writes a slice of bytes to the digest.
- #### write\_byte
  ```moonbit
  :::source,gmlewis/sha1/sha1.mbt,119:::fn <a href="gmlewis/sha1#Digest">Digest</a>::write_byte(self : <a href="gmlewis/sha1#Digest">Digest</a>, b : Byte) -> Unit
  ```
  >  `write_byte` writes a byte to the digest.
