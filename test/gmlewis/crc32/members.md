# gmlewis/crc32
[![check](https://github.com/gmlewis/moonbit-crc32/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-crc32/actions/workflows/check.yml)

This is a simple crc32 hash algorithm based on the Go Rosetta Stone implementation found here:
https://rosettacode.org/wiki/CRC-32
which has the copyright notice:

```
Content is available under GNU Free Document License 1.3 unless otherwise noted.
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
|[@gmlewis/crc32.HashFunc](#@gmlewis/crc32.HashFunc)| \`HashFunc\` represents a hash algorithm like \`@crc32\`, \`@md5\`, or \`@sha256\`.|

|Type|description|
|---|---|
|[Digest](#Digest)| \`@crc32.Digest\` implements the 32-bit cyclic redundancy check, or CRC-32,|

## @gmlewis/crc32.HashFunc

```moonbit
:::source,gmlewis/crc32/hash-func.mbt,2:::pub(open) trait @gmlewis/crc32.HashFunc {
  name(Self) -> String
  write(Self, Byte) -> Unit
  check_sum(Self) -> String
}
```
 `HashFunc` represents a hash algorithm like `@crc32`, `@md5`, or `@sha256`.

## Digest

```moonbit
:::source,gmlewis/crc32/crc32.mbt,6:::pub(all) struct Digest {
  crc : UInt
  name : String
}
```
 `@crc32.Digest` implements the 32-bit cyclic redundancy check, or CRC-32,
checksum. See https://en.wikipedia.org/wiki/Cyclic\_redundancy\_check for
information.
This package is based on the Go Rosetta Stone implementation found here:
https://rosettacode.org/wiki/CRC-32

#### mooncakes-io-method-mark-Methods
- #### check\_sum
  ```moonbit
  :::source,gmlewis/crc32/crc32.mbt,30:::fn <a href="gmlewis/crc32#Digest">Digest</a>::check_sum(self : <a href="gmlewis/crc32#Digest">Digest</a>) -> String
  ```
  >  `check_sum` returns the final crc32 as a hex string.
- #### digest
  ```moonbit
  :::source,gmlewis/crc32/crc32.mbt,25:::fn <a href="gmlewis/crc32#Digest">Digest</a>::digest(self : <a href="gmlewis/crc32#Digest">Digest</a>) -> UInt
  ```
  >  `digest` returns the final crc32 as a UInt.
- #### name
  ```moonbit
  :::source,gmlewis/crc32/crc32.mbt,20:::fn <a href="gmlewis/crc32#Digest">Digest</a>::name(self : <a href="gmlewis/crc32#Digest">Digest</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/crc32/crc32.mbt,12:::fn <a href="gmlewis/crc32#Digest">Digest</a>::new() -> <a href="gmlewis/crc32#Digest">Digest</a>
  ```
  >  `Digest::new` returns a new, reset Digest, ready to sum.
- #### write
  ```moonbit
  :::source,gmlewis/crc32/crc32.mbt,55:::fn <a href="gmlewis/crc32#Digest">Digest</a>::write(self : <a href="gmlewis/crc32#Digest">Digest</a>, b : Byte) -> Unit
  ```
  >  `write` writes a byte to the digest.
