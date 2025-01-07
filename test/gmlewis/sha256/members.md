# gmlewis/sha256
[![check](https://github.com/gmlewis/moonbit-sha256/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-sha256/actions/workflows/check.yml)

This is a simple sha256 hash algorithm based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.0:src/crypto/sha256/sha256.go
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
|[HashFunc](#HashFunc)| \`HashFunc\` represents a hash algorithm like \`@crc32\`, \`@md5\`, or \`@sha256\`.|

|Type|description|
|---|---|
|[Digest](#Digest)| \`Digest\` represents the partial evaluation of a checksum.|
|[HMAC](#HMAC)||

|Value|description|
|---|---|
|[gen\_hmac](#gen_hmac)| \`gen\_hmac\` generates a base64-encoded String representing|

## HashFunc

```moonbit
:::source,gmlewis/sha256/hash-func.mbt,2:::pub(open) trait HashFunc {
  name(Self) -> String
  write(Self, Byte) -> Unit
  check_sum(Self) -> String
}
```
 `HashFunc` represents a hash algorithm like `@crc32`, `@md5`, or `@sha256`.

## Digest

```moonbit
:::source,gmlewis/sha256/sha256.mbt,43:::type Digest
```
 `Digest` represents the partial evaluation of a checksum.

#### mooncakes-io-method-mark-Methods
- #### check\_sum
  ```moonbit
  :::source,gmlewis/sha256/sha256.mbt,76:::fn <a href="gmlewis/sha256#Digest">Digest</a>::check_sum(self : <a href="gmlewis/sha256#Digest">Digest</a>) -> String
  ```
  >  `check_sum` returns the final sha256sum as a hex string.
- #### name
  ```moonbit
  :::source,gmlewis/sha256/sha256.mbt,71:::fn <a href="gmlewis/sha256#Digest">Digest</a>::name(self : <a href="gmlewis/sha256#Digest">Digest</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/sha256/sha256.mbt,54:::fn <a href="gmlewis/sha256#Digest">Digest</a>::new() -> <a href="gmlewis/sha256#Digest">Digest</a>
  ```
  >  `Digest::new` returns a new, reset Digest, ready to sum.
- #### reset
  ```moonbit
  :::source,gmlewis/sha256/sha256.mbt,124:::fn <a href="gmlewis/sha256#Digest">Digest</a>::reset(self : <a href="gmlewis/sha256#Digest">Digest</a>) -> Unit
  ```
  >  `reset` resets a digest for re-use.
- #### write
  ```moonbit
  :::source,gmlewis/sha256/sha256.mbt,138:::fn <a href="gmlewis/sha256#Digest">Digest</a>::write(self : <a href="gmlewis/sha256#Digest">Digest</a>, b : Byte) -> Unit
  ```
  >  `write` writes a byte to the digest.

## HMAC

```moonbit
:::source,gmlewis/sha256/hmac.mbt,21:::type HMAC
```


## gen\_hmac

```moonbit
:::source,gmlewis/sha256/hmac.mbt,11:::fn gen_hmac(body : Bytes, client_secret : Bytes) -> String
```
 `gen_hmac` generates a base64-encoded String representing
the SHA256 signature of the provided `body` using the provided
`client_secret` key.
