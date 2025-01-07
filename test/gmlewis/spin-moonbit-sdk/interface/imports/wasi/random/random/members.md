WASI Random is a random data API.

It is intended to be portable at least between Unix-family platforms and
Windows.
---
# Documentation
|Value|description|
|---|---|
|[get\_random\_bytes](#get_random_bytes)| Return \`len\` cryptographically-secure random or pseudo-random bytes.|
|[get\_random\_u64](#get_random_u64)| Return a cryptographically-secure random or pseudo-random \`u64\` value.|

## get\_random\_bytes

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/random/random/top.mbt,15:::fn get_random_bytes(len : UInt64) -> Bytes
```
 Return `len` cryptographically-secure random or pseudo-random bytes.

 This function must produce data at least as cryptographically secure and
fast as an adequately seeded cryptographically-secure pseudo-random
number generator (CSPRNG). It must not block, from the perspective of
the calling program, under any circumstances, including on the first
request and on requests for numbers of bytes. The returned data must
always be unpredictable.

 This function must always return fresh data. Deterministic environments
must omit this function, rather than implementing it with deterministic
data.

## get\_random\_u64

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/random/random/top.mbt,27:::fn get_random_u64() -> UInt64
```
 Return a cryptographically-secure random or pseudo-random `u64` value.

 This function returns the same type of data as `get-random-bytes`,
represented as a `u64`.
