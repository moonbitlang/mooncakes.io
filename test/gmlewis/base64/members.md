# gmlewis/base64
[![check](https://github.com/gmlewis/moonbit-base64/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-base64/actions/workflows/check.yml)

This is a simple base64 encoder based on Go's implementation:
https://cs.opensource.google/go/go/+/master:src/encoding/base64/base64.go
which has the copyright notice:

```
// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
```

The UTF-16 / UTF-8 encoder/decoders are provided with permission by
@peter-jerry-ye from this repo: https://github.com/peter-jerry-ye/jstream

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
|[CorruptInputError](#CorruptInputError)| This package is based on the Go implementation found here:|

|Value|description|
|---|---|
|[bytes2str](#bytes2str)| \`bytes2str\` decodes a UTF-8 \`Bytes\` to a UTF-16 \`String\`.|
|[std\_decode2bytes](#std_decode2bytes)| \`std\_decode2bytes\` base64-decodes the provided bytes using Standard encoding.|
|[std\_decode2str](#std_decode2str)| \`std\_decode2str\` base64-decodes the provided bytes using Standard encoding and returns a String.|
|[std\_encode2bytes](#std_encode2bytes)| \`std\_encode2bytes\` base64-encodes the provided bytes using Standard encoding.|
|[std\_encode2str](#std_encode2str)| \`std\_encode2str\` base64-encodes the provided bytes using Standard encoding and returns a String.|
|[str2bytes](#str2bytes)| \`str2bytes\` encodes a UTF-16 \`String\` as a UTF-8 \`Bytes\`.|
|[url\_decode2bytes](#url_decode2bytes)| \`url\_decode2bytes\` base64-decodes the provided bytes using URL encoding.|
|[url\_decode2str](#url_decode2str)| \`url\_decode2str\` base64-decodes the provided bytes using URL encoding and returns a String.|
|[url\_encode2bytes](#url_encode2bytes)| \`url\_encode2bytes\` base64-encodes the provided bytes using URL encoding.|
|[url\_encode2str](#url_encode2str)| \`url\_encode2str\` base64-encodes the provided bytes using URL encoding and returns a String.|

## CorruptInputError

```moonbit
:::source,gmlewis/base64/base64-decode.mbt,7:::pub(all) type! CorruptInputError String

```
 This package is based on the Go implementation found here:
https://cs.opensource.google/go/go/+/master:src/encoding/base64/base64.go
which has the copyright notice:
Copyright 2009 The Go Authors. All rights reserved.
Use of this source code is governed by a BSD-style
license that can be found in the LICENSE file.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/base64/base64-decode.mbt,7:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/base64#CorruptInputError">CorruptInputError</a> with output(<a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,gmlewis/base64/base64-decode.mbt,7:::fn <a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>::output(<a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/base64/traits.mbt,85:::fn <a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## bytes2str

```moonbit
:::source,gmlewis/base64/bytes-2-str.mbt,2:::fn bytes2str(b : Bytes) -> String
```
 `bytes2str` decodes a UTF-8 `Bytes` to a UTF-16 `String`.

## std\_decode2bytes

```moonbit
:::source,gmlewis/base64/base64-decode.mbt,11:::fn std_decode2bytes(src : String, no_padding~ : Bool = ..) -> Bytes!<a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>
```
 `std_decode2bytes` base64-decodes the provided bytes using Standard encoding.
Setting `no_padding=true` is used for raw decoding.

## std\_decode2str

```moonbit
:::source,gmlewis/base64/base64-decode.mbt,26:::fn std_decode2str(src : String, no_padding~ : Bool = ..) -> String!<a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>
```
 `std_decode2str` base64-decodes the provided bytes using Standard encoding and returns a String.
Setting `no_padding=true` is used for raw decoding.

## std\_encode2bytes

```moonbit
:::source,gmlewis/base64/base64-encode.mbt,10:::fn std_encode2bytes(src : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], no_padding~ : Bool = ..) -> Bytes
```
 `std_encode2bytes` base64-encodes the provided bytes using Standard encoding.
Setting `no_padding=true` is used for raw encoding.

## std\_encode2str

```moonbit
:::source,gmlewis/base64/base64-encode.mbt,24:::fn std_encode2str(src : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], no_padding~ : Bool = ..) -> String
```
 `std_encode2str` base64-encodes the provided bytes using Standard encoding and returns a String.
Setting `no_padding=true` is used for raw encoding.

## str2bytes

```moonbit
:::source,gmlewis/base64/str-2-bytes.mbt,2:::fn str2bytes(s : String) -> Bytes
```
 `str2bytes` encodes a UTF-16 `String` as a UTF-8 `Bytes`.

## url\_decode2bytes

```moonbit
:::source,gmlewis/base64/base64-decode.mbt,35:::fn url_decode2bytes(src : String, no_padding~ : Bool = ..) -> Bytes!<a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>
```
 `url_decode2bytes` base64-decodes the provided bytes using URL encoding.
Setting `no_padding=true` is used for raw decoding.

## url\_decode2str

```moonbit
:::source,gmlewis/base64/base64-decode.mbt,50:::fn url_decode2str(src : String, no_padding~ : Bool = ..) -> String!<a href="gmlewis/base64#CorruptInputError">CorruptInputError</a>
```
 `url_decode2str` base64-decodes the provided bytes using URL encoding and returns a String.
Setting `no_padding=true` is used for raw decoding.

## url\_encode2bytes

```moonbit
:::source,gmlewis/base64/base64-encode.mbt,33:::fn url_encode2bytes(src : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], no_padding~ : Bool = ..) -> Bytes
```
 `url_encode2bytes` base64-encodes the provided bytes using URL encoding.
Setting `no_padding=true` is used for raw encoding.

## url\_encode2str

```moonbit
:::source,gmlewis/base64/base64-encode.mbt,47:::fn url_encode2str(src : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], no_padding~ : Bool = ..) -> String
```
 `url_encode2str` base64-encodes the provided bytes using URL encoding and returns a String.
Setting `no_padding=true` is used for raw encoding.
