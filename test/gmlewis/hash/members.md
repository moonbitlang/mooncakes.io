# gmlewis/hash
[![check](https://github.com/gmlewis/moonbit-hash/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-hash/actions/workflows/check.yml)

This package provides hash functions based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.3:src/hash/hash.go;l=26
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
|Trait|description|
|---|---|
|[@gmlewis/hash.Hash](#@gmlewis/hash.Hash)| Hash is the common interface implemented by all hash functions.|
|[@gmlewis/hash.Hash32](#@gmlewis/hash.Hash32)| Hash32 is the common interface implemented by all 32-bit hash functions.|
|[@gmlewis/hash.Hash64](#@gmlewis/hash.Hash64)| Hash64 is the common interface implemented by all 64-bit hash functions.|

## @gmlewis/hash.Hash

```moonbit
:::source,gmlewis/hash/hash.mbt,30:::pub(open) trait @gmlewis/hash.Hash {
  write(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  sum(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  reset(Self) -> Unit
  size(Self) -> Int
  block_size(Self) -> Int
}
```
 Hash is the common interface implemented by all hash functions.

 Hash implementations in the standard library (e.g. \[hash/crc32\] and
\[crypto/sha256\]) implement the \[encoding.BinaryMarshaler\] and
\[encoding.BinaryUnmarshaler\] interfaces. Marshaling a hash implementation
allows its internal state to be saved and used for additional processing
later, without having to re-write the data previously written to the hash.
The hash state may contain portions of the input in its original form,
which users are expected to handle for any possible security implications.

 Compatibility: Any future changes to hash or crypto packages will endeavor
to maintain compatibility with state encoded using previous versions.
That is, any released versions of the packages should be able to
decode data written with any previously released version,
subject to issues such as security fixes.
See the Go compatibility document for background: https://golang.org/doc/go1compat

## @gmlewis/hash.Hash32

```moonbit
:::source,gmlewis/hash/hash.mbt,54:::pub(open) trait @gmlewis/hash.Hash32 {
  sum32(Self) -> UInt
  write(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  sum(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  reset(Self) -> Unit
  size(Self) -> Int
  block_size(Self) -> Int
}
```
 Hash32 is the common interface implemented by all 32-bit hash functions.

## @gmlewis/hash.Hash64

```moonbit
:::source,gmlewis/hash/hash.mbt,65:::pub(open) trait @gmlewis/hash.Hash64 {
  sum64() -> UInt64
  write(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  sum(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  reset(Self) -> Unit
  size(Self) -> Int
  block_size(Self) -> Int
}
```
 Hash64 is the common interface implemented by all 64-bit hash functions.
