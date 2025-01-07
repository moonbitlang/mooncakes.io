# moonbitlang/x/crypto

## Overview

A collection of cryptographic hash functions and utilities.

## Usage

> Strings in MoonBit are UTF-16 LE encoded.

### SHA-1

```moonbit
let input = "The quick brown fox jumps over the lazy dog"
println(bytes_to_hex_string(sha1(input.to_bytes())))
// => bd136cb58899c93173c33a90dde95ead0d0cf6df
```

### MD5

```moonbit
let input = "The quick brown fox jumps over the lazy dog"
println(bytes_to_hex_string(md5(input.to_bytes())))
// => b0986ae6ee1eefee8a4a399090126837

// buffered
let ctx = MD5Context::new()
ctx.update(b"a") 
ctx.update(b"b") 
ctx.update(b"c") 
println(bytes_to_hex_string(ctx.finalize())) // or `ctx.compute()`
// => ce1473cf80c6b3fda8e3dfc006adc315
```

### SM3

```moonbit
let input = "The quick brown fox jumps over the lazy dog"
println(bytes_to_hex_string(sm3(input.to_bytes())))
// => fc2b31896629e88652ca1e3be449ec7ec93f7e5e29769f273fb973bc1858c66d


//buffered
let ctx = SM3Context::new()
ctx.update(b"a") 
ctx.update(b"b") 
ctx.update(b"c") 
println(bytes_to_hex_string(ctx.finalize()))
// => 66c7f0f462eeedd9d1f2d46bdc10e4e24167c4875cf2f7a2297da02b8f4ba8e0
```

---
# Documentation
|Type|description|
|---|---|
|[MD5Context](#MD5Context)||
|[SM3Context](#SM3Context)||
|[Sha256Context](#Sha256Context)||

|Value|description|
|---|---|
|[bytes\_to\_hex\_string](#bytes_to_hex_string)| print a sequence of byte in hex representation|
|[chacha12](#chacha12)| Encrypts a block of data using the ChaCha12 algorithm.|
|[chacha20](#chacha20)| Encrypts a block of data using the ChaCha20 algorithm.|
|[chacha8](#chacha8)| Encrypts a block of data using the ChaCha8 algorithm.|
|[md5](#md5)| Compute the MD5 digest of some \`data\` based on \[RFC1321\](https://www.ietf.org/rfc/rfc1321.txt).|
|[sha1](#sha1)||
|[sha224](#sha224)||
|[sha224\_from\_iter](#sha224_from_iter)||
|[sha256](#sha256)| Compute the Sha256 digest in \`Bytes\` of some \`data\`. Note that Sha256 is big-endian.|
|[sha256\_from\_iter](#sha256_from_iter)||
|[sm3](#sm3)| Compute the SM3 digest in \`Bytes\` of some \`data\`. Note that SM3 is big-endian.|
|[sm3\_from\_iter](#sm3_from_iter)||
|[uints\_to\_hex\_string](#uints_to_hex_string)| print a sequence of uint in hex representation|

## MD5Context

```moonbit
:::source,moonbitlang/x/crypto/md5.mbt,20:::type MD5Context
```


#### mooncakes-io-method-mark-Methods
- #### finalize
  ```moonbit
  :::source,moonbitlang/x/crypto/md5.mbt,35:::fn <a href="moonbitlang/x/crypto#MD5Context">MD5Context</a>::finalize(self : <a href="moonbitlang/x/crypto#MD5Context">MD5Context</a>) -> Bytes
  ```
  >  an alias of `MD5Context::compute()`
- #### new
  ```moonbit
  :::source,moonbitlang/x/crypto/md5.mbt,40:::fn <a href="moonbitlang/x/crypto#MD5Context">MD5Context</a>::new() -> <a href="moonbitlang/x/crypto#MD5Context">MD5Context</a>
  ```
  >  Instantiate a MD5 context
- #### update
  ```moonbit
  :::source,moonbitlang/x/crypto/md5.mbt,30:::fn <a href="moonbitlang/x/crypto#MD5Context">MD5Context</a>::update(self : <a href="moonbitlang/x/crypto#MD5Context">MD5Context</a>, data : Bytes) -> Unit
  ```
  >  update the state of given context from new `data`

## SM3Context

```moonbit
:::source,moonbitlang/x/crypto/sm3.mbt,20:::type SM3Context
```


#### mooncakes-io-method-mark-Methods
- #### finalize
  ```moonbit
  :::source,moonbitlang/x/crypto/sm3.mbt,248:::fn <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>::finalize(self : <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>) -> Bytes
  ```
  >  Compute the SM3 digest from given SM3Context
- #### new
  ```moonbit
  :::source,moonbitlang/x/crypto/sm3.mbt,28:::fn <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>::new() -> <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>
  ```
  >  Instantiate a SM3 context
- #### update
  ```moonbit
  :::source,moonbitlang/x/crypto/sm3.mbt,212:::fn <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>::update(self : <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>, data : Bytes) -> Unit
  ```
  >  update the state of given context from new `data`
- #### update\_from\_iter
  ```moonbit
  :::source,moonbitlang/x/crypto/sm3.mbt,198:::fn <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>::update_from_iter(self : <a href="moonbitlang/x/crypto#SM3Context">SM3Context</a>, data : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Unit
  ```
  > 

## Sha256Context

```moonbit
:::source,moonbitlang/x/crypto/sha256.mbt,16:::type Sha256Context
```


#### mooncakes-io-method-mark-Methods
- #### finalize
  ```moonbit
  :::source,moonbitlang/x/crypto/sha256.mbt,181:::fn <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>::finalize(self : <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>) -> Bytes
  ```
  >  Compute the Sha256 digest from given Sha256Context
- #### new
  ```moonbit
  :::source,moonbitlang/x/crypto/sha256.mbt,25:::fn <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>::new(reg~ : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt] = ..) -> <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>
  ```
  >  Instantiate a Sha256 context
  > `reg` is the initial hash value. Defaults to Sha256's.
- #### update
  ```moonbit
  :::source,moonbitlang/x/crypto/sha256.mbt,145:::fn <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>::update(self : <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>, data : Bytes) -> Unit
  ```
  >  update the state of given context from new `data`
- #### update\_from\_iter
  ```moonbit
  :::source,moonbitlang/x/crypto/sha256.mbt,131:::fn <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>::update_from_iter(self : <a href="moonbitlang/x/crypto#Sha256Context">Sha256Context</a>, data : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Unit
  ```
  > 

## bytes\_to\_hex\_string

```moonbit
:::source,moonbitlang/x/crypto/utils.mbt,21:::fn bytes_to_hex_string(input : Bytes) -> String
```
 print a sequence of byte in hex representation

## chacha12

```moonbit
:::source,moonbitlang/x/crypto/chacha.mbt,319:::fn chacha12(key : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt], counter : UInt, block : Bytes, nonce~ : UInt = ..) -> Bytes!<a href="moonbitlang/core/error#Error">Error</a>
```
 Encrypts a block of data using the ChaCha12 algorithm.
 - \[key\] must be 8 32-bit unsigned integers.
 - \[counter\] is the counter value.
 - \[block\] is the block of data to be encrypted.
 - \[nonce\] is default to 0
 - Returns the encrypted block of data.

## chacha20

```moonbit
:::source,moonbitlang/x/crypto/chacha.mbt,337:::fn chacha20(key : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt], counter : UInt, block : Bytes, nonce~ : UInt = ..) -> Bytes!<a href="moonbitlang/core/error#Error">Error</a>
```
 Encrypts a block of data using the ChaCha20 algorithm.
 - \[key\] must be 8 32-bit unsigned integers.
 - \[counter\] is the counter value.
 - \[block\] is the block of data to be encrypted.
 - \[nonce\] is default to 0
 - Returns the encrypted block of data.

## chacha8

```moonbit
:::source,moonbitlang/x/crypto/chacha.mbt,301:::fn chacha8(key : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt], counter : UInt, block : Bytes, nonce~ : UInt = ..) -> Bytes!<a href="moonbitlang/core/error#Error">Error</a>
```
 Encrypts a block of data using the ChaCha8 algorithm.
 - \[key\] must be 8 32-bit unsigned integers.
 - \[counter\] is the counter value.
 - \[block\] is the block of data to be encrypted.
 - \[nonce\] is default to 0
 - Returns the encrypted block of data.

## md5

```moonbit
:::source,moonbitlang/x/crypto/md5.mbt,231:::fn md5(data : Bytes) -> Bytes
```
 Compute the MD5 digest of some `data` based on [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
 - Note that MD5 is considered _cryptographically broken_.
   Unless mandated, more secure alternatives should be preferred.

## sha1

```moonbit
:::source,moonbitlang/x/crypto/sha1.mbt,16:::fn sha1(input : Bytes) -> Bytes
```


## sha224

```moonbit
:::source,moonbitlang/x/crypto/sha224.mbt,16:::fn sha224(data : Bytes) -> Bytes
```


## sha224\_from\_iter

```moonbit
:::source,moonbitlang/x/crypto/sha224.mbt,26:::fn sha224_from_iter(data : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Bytes
```


## sha256

```moonbit
:::source,moonbitlang/x/crypto/sha256.mbt,186:::fn sha256(data : Bytes) -> Bytes
```
 Compute the Sha256 digest in `Bytes` of some `data`. Note that Sha256 is big-endian.

## sha256\_from\_iter

```moonbit
:::source,moonbitlang/x/crypto/sha256.mbt,193:::fn sha256_from_iter(data : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Bytes
```


## sm3

```moonbit
:::source,moonbitlang/x/crypto/sm3.mbt,253:::fn sm3(data : Bytes) -> Bytes
```
 Compute the SM3 digest in `Bytes` of some `data`. Note that SM3 is big-endian.

## sm3\_from\_iter

```moonbit
:::source,moonbitlang/x/crypto/sm3.mbt,260:::fn sm3_from_iter(data : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Bytes
```


## uints\_to\_hex\_string

```moonbit
:::source,moonbitlang/x/crypto/utils.mbt,46:::fn uints_to_hex_string(input : <a href="moonbitlang/core/builtin#Iter">Iter</a>[UInt]) -> String
```
 print a sequence of uint in hex representation
