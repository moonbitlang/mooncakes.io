# Moonbit/Core UUID

## Overview

The `@uuid` package provides an implementation of the Universally Unique
IDentifier per RFC 4122.

Currently, `@uuid` does not assume any random generation; you'll have to bring
your own random bytes to construct UUIDs.

## Usage

Construct a version 4 UUID:

```moonbit
let u = @uuid.from_hex("ddf99703-742f-7505-4c54-df36a9c243fe").as_version(@uuid.V4)
```

You can then use it as a key in mappings as it's immutable and implemented
Hash, Eq (and Compare for b-tree).

---
# Documentation
|Type|description|
|---|---|
|[UUID](#UUID)| UUID that complies with RFC 4122.|
|[Variant](#Variant)| The UUID variant.|
|[Version](#Version)| The UUID version number.|

|Value|description|
|---|---|
|[from\_bytes](#from_bytes)| Constructs a UUID with the given big-endian bytes.|
|[from\_hex](#from_hex)| Constructs a UUID with the given hexadecimal string.|

## UUID

```moonbit
:::source,moonbitlang/x/uuid/uuid.mbt,38:::type UUID
```
 UUID that complies with RFC 4122.

 UUID objects are immutable, hashable and usable as mapping keys.
The Display of UUIDs is like `12345678-1234-1234-1234-123456789abc`;
UUIDs can be constructed using such strings, or 16-bytes strings with big-
endian byte order.

 #### Usage

 ```moonbit
 let u = @uuid.from_hex("ddf99703-742f-7505-4c54-df36a9c243fe")
 let u2 = @uuid.from_bytes(Bytes.of([221, 249, 151, 3, 116, 47, 117, 5, 76, 84, 223, 54, 169, 194, 67, 254]))
 // assert_eq(u, u2) should be true
 ```

 Construct an RFC-4122-compliant v4 UUID:

 ```moonbit
 let u = @uuid
   .from_hex("9558cfadb48547c70f9adf1f75cdef29")
   .as_version(@uuid.V4)
 ```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,43:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/x/uuid#UUID">UUID</a> with compare(<a href="moonbitlang/x/uuid#UUID">UUID</a>, <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,43:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/uuid#UUID">UUID</a> with op_equal(<a href="moonbitlang/x/uuid#UUID">UUID</a>, <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,201:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/uuid#UUID">UUID</a> with output(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### as\_version
  ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,92:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::as_version(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>, version : <a href="moonbitlang/x/uuid#Version">Version</a>) -> <a href="moonbitlang/x/uuid#UUID">UUID</a>
  ```
  >  Converts this UUID to RFC-4122 with the given version number.
- #### compare
  ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,43:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::compare(<a href="moonbitlang/x/uuid#UUID">UUID</a>, <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> Int
  ```
  > automatically derived
- #### hash
  ```moonbit
  :::source,moonbitlang/x/uuid/ops.mbt,16:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::hash(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,43:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::op_equal(<a href="moonbitlang/x/uuid#UUID">UUID</a>, <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,201:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::output(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_bytes
  ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,68:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::to_bytes(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> Bytes
  ```
  >  The UUID as a 16-byte string.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/uuid/uuid.mbt,178:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::to_string(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> String
  ```
  > 
- #### variant
  ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,64:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::variant(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> <a href="moonbitlang/x/uuid#Variant">Variant</a>
  ```
  >  Retrieves the variant of the UUID.
- #### version
  ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,84:::fn <a href="moonbitlang/x/uuid#UUID">UUID</a>::version(self : <a href="moonbitlang/x/uuid#UUID">UUID</a>) -> <a href="moonbitlang/x/uuid#Version">Version</a>?
  ```
  >  Retrieves the version number of the UUID.
  > 
  >  If the variant of the UUID is not `RFC4122`, returns `None`.
  > 

## Variant

```moonbit
:::source,moonbitlang/x/uuid/variant.mbt,19:::pub(all) enum Variant {
  ReservedNCS
  RFC4122(<a href="moonbitlang/x/uuid#Version">Version</a>)
  ReservedMicrosoft
  ReservedFuture
}
```
 The UUID variant.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,24:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/uuid#Variant">Variant</a> with output(<a href="moonbitlang/x/uuid#Variant">Variant</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,24:::fn <a href="moonbitlang/x/uuid#Variant">Variant</a>::output(<a href="moonbitlang/x/uuid#Variant">Variant</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/uuid/traits.mbt,85:::fn <a href="moonbitlang/x/uuid#Variant">Variant</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Version

```moonbit
:::source,moonbitlang/x/uuid/variant.mbt,30:::pub(all) enum Version {
  V1
  V2
  V3
  V4
  V5
  Unknown(Int)
}
```
 The UUID version number.

 This is only used when the variant is `RFC4122`.


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/uuid#Version">Version</a> with output(<a href="moonbitlang/x/uuid#Version">Version</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/x/uuid/variant.mbt,37:::fn <a href="moonbitlang/x/uuid#Version">Version</a>::output(<a href="moonbitlang/x/uuid#Version">Version</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/uuid/traits.mbt,85:::fn <a href="moonbitlang/x/uuid#Version">Version</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## from\_bytes

```moonbit
:::source,moonbitlang/x/uuid/uuid.mbt,49:::fn from_bytes(bytes : Bytes) -> <a href="moonbitlang/x/uuid#UUID">UUID</a>!<a href="moonbitlang/core/error#Error">Error</a>
```
 Constructs a UUID with the given big-endian bytes.

 The produced UUID is not RFC-4122 compliant; see also `as_version()`.


## from\_hex

```moonbit
:::source,moonbitlang/x/uuid/uuid.mbt,121:::fn from_hex(hex : String) -> <a href="moonbitlang/x/uuid#UUID">UUID</a>!<a href="moonbitlang/core/error#Error">Error</a>
```
 Constructs a UUID with the given hexadecimal string.

 This function ignores dashes (`-`) in the given string. The remaining
letters must be exactly 32 hexadecimals, or an error will be raised.

