The insecure interface for insecure pseudo-random numbers.

It is intended to be portable at least between Unix-family platforms and
Windows.
---
# Documentation
|Value|description|
|---|---|
|[get\_insecure\_random\_bytes](#get_insecure_random_bytes)| Return \`len\` insecure pseudo-random bytes.|
|[get\_insecure\_random\_u64](#get_insecure_random_u64)| Return an insecure pseudo-random \`u64\` value.|

## get\_insecure\_random\_bytes

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/random/insecure/top.mbt,10:::fn get_insecure_random_bytes(len : UInt64) -> Bytes
```
 Return `len` insecure pseudo-random bytes.

 This function is not cryptographically secure. Do not use it for
anything related to security.

 There are no requirements on the values of the returned bytes, however
implementations are encouraged to return evenly distributed values with
a long period.

## get\_insecure\_random\_u64

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/random/insecure/top.mbt,23:::fn get_insecure_random_u64() -> UInt64
```
 Return an insecure pseudo-random `u64` value.

 This function returns the same type of pseudo-random data as
`get-insecure-random-bytes`, represented as a `u64`.
