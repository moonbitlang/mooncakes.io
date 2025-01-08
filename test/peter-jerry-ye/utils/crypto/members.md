# Documentation
|Type|description|
|---|---|
|[HashAlgorithm](#HashAlgorithm)||
|[RSAPrivKey](#RSAPrivKey)||
|[RSAPubKey](#RSAPubKey)||
|[X690](#X690)||
|[X690Class](#X690Class)||
|[X690Construction](#X690Construction)||
|[X690Type](#X690Type)||

|Value|description|
|---|---|
|[hmac](#hmac)||
|[oid\_to\_bytes](#oid_to_bytes)||
|[rsassa\_pkcs1\_v1\_5\_sign](#rsassa_pkcs1_v1_5_sign)||
|[rsassa\_pkcs1\_v1\_5\_verify](#rsassa_pkcs1_v1_5_verify)||

## HashAlgorithm

```moonbit
:::source,peter-jerry-ye/utils/crypto/hash.mbt,16:::pub(all) enum HashAlgorithm {
  MD5
  SHA224
  SHA256
}
```


#### mooncakes-io-method-mark-Methods
- #### hash
  ```moonbit
  :::source,peter-jerry-ye/utils/crypto/hash.mbt,42:::fn <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>::hash(self : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>, input : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Bytes
  ```
  > 
- #### oid
  ```moonbit
  :::source,peter-jerry-ye/utils/crypto/hash.mbt,23:::fn <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>::oid(self : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Int]
  ```
  > 
- #### oid\_with\_rsa\_encryption
  ```moonbit
  :::source,peter-jerry-ye/utils/crypto/hash.mbt,32:::fn <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>::oid_with_rsa_encryption(self : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Int]
  ```
  > 
- #### pkcs1\_v1\_5\_digest\_algorithms
  ```moonbit
  :::source,peter-jerry-ye/utils/crypto/hash.mbt,51:::fn <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>::pkcs1_v1_5_digest_algorithms(self : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>) -> <a href="peter-jerry-ye/utils/crypto#X690">X690</a>
  ```
  > 

## RSAPrivKey

```moonbit
:::source,peter-jerry-ye/utils/crypto/rsa.mbt,25:::pub(all) enum RSAPrivKey {
  Pair(<a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, Int)
  Quintuple(<a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/array#Array">Array</a>[(<a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, <a href="moonbitlang/core/bigint#BigInt">BigInt</a>)], Int)
}
```


## RSAPubKey

```moonbit
:::source,peter-jerry-ye/utils/crypto/rsa.mbt,18:::pub(all) struct RSAPubKey {
  modulus : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  exponent : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  length : Int
}
```


## X690

```moonbit
:::source,peter-jerry-ye/utils/crypto/ber.mbt,192:::pub(all) struct X690 {
  tag : <a href="peter-jerry-ye/utils/crypto#X690Type">X690Type</a>
  construction : <a href="peter-jerry-ye/utils/crypto#X690Construction">X690Construction</a>
  class : <a href="peter-jerry-ye/utils/crypto#X690Class">X690Class</a>
  content : Bytes
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,peter-jerry-ye/utils/crypto/ber.mbt,197:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="peter-jerry-ye/utils/crypto#X690">X690</a>
  ```
  > 
  * ```moonbit
    :::source,peter-jerry-ye/utils/crypto/ber.mbt,197:::fn output(<a href="peter-jerry-ye/utils/crypto#X690">X690</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from\_iter
  ```moonbit
  :::source,peter-jerry-ye/utils/crypto/ber.mbt,317:::fn <a href="peter-jerry-ye/utils/crypto#X690">X690</a>::from_iter(bytes : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="peter-jerry-ye/utils/crypto#X690">X690</a>]
  ```
  > 
- #### to\_bytes
  ```moonbit
  :::source,peter-jerry-ye/utils/crypto/ber.mbt,266:::fn <a href="peter-jerry-ye/utils/crypto#X690">X690</a>::to_bytes(self : <a href="peter-jerry-ye/utils/crypto#X690">X690</a>) -> Bytes
  ```
  >  Assuming length is definite

## X690Class

```moonbit
:::source,peter-jerry-ye/utils/crypto/ber.mbt,24:::pub(all) enum X690Class {
  Universal
  Application
  ContextSpecific
  Private
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,peter-jerry-ye/utils/crypto/ber.mbt,29:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="peter-jerry-ye/utils/crypto#X690Class">X690Class</a>
  ```
  > 
  * ```moonbit
    :::source,peter-jerry-ye/utils/crypto/ber.mbt,29:::fn output(<a href="peter-jerry-ye/utils/crypto#X690Class">X690Class</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## X690Construction

```moonbit
:::source,peter-jerry-ye/utils/crypto/ber.mbt,18:::pub(all) enum X690Construction {
  Primitive
  Constructed
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,peter-jerry-ye/utils/crypto/ber.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="peter-jerry-ye/utils/crypto#X690Construction">X690Construction</a>
  ```
  > 
  * ```moonbit
    :::source,peter-jerry-ye/utils/crypto/ber.mbt,21:::fn output(<a href="peter-jerry-ye/utils/crypto#X690Construction">X690Construction</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## X690Type

```moonbit
:::source,peter-jerry-ye/utils/crypto/ber.mbt,70:::pub(all) enum X690Type {
  Boolean
  Integer
  BitString
  OctetString
  Null
  ObjectIdentifier
  ObjectDescriptor
  External
  Real
  Enumerated
  EmbeddedPDV
  UTF8String
  RelativeOID
  Time
  Sequence
  Set
  NumericString
  PrintableString
  TeletexString
  VideotexString
  IA5String
  UTCTime
  GeneralizedTime
  GraphicString
  VisibleString
  GeneralString
  UniversalString
  CharacterString
  BMPString
  Date
  TimeOfDay
  DateTime
  Duration
  OID_IRI
  Relative_OID_IRI
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,peter-jerry-ye/utils/crypto/ber.mbt,106:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="peter-jerry-ye/utils/crypto#X690Type">X690Type</a>
  ```
  > 
  * ```moonbit
    :::source,peter-jerry-ye/utils/crypto/ber.mbt,106:::fn output(<a href="peter-jerry-ye/utils/crypto#X690Type">X690Type</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## hmac

```moonbit
:::source,peter-jerry-ye/utils/crypto/hmac.mbt,18:::fn hmac(content : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte], hash~ : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a>, secret~ : Bytes) -> Bytes
```


## oid\_to\_bytes

```moonbit
:::source,peter-jerry-ye/utils/crypto/ber.mbt,255:::fn oid_to_bytes(tree : <a href="moonbitlang/core/array#Array">Array</a>[Int]) -> Bytes
```


## rsassa\_pkcs1\_v1\_5\_sign

```moonbit
:::source,peter-jerry-ye/utils/crypto/rsa.mbt,39:::fn rsassa_pkcs1_v1_5_sign(bytes : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte], priv_key : <a href="peter-jerry-ye/utils/crypto#RSAPrivKey">RSAPrivKey</a>, hash~ : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a> = ..) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
```


## rsassa\_pkcs1\_v1\_5\_verify

```moonbit
:::source,peter-jerry-ye/utils/crypto/rsa.mbt,82:::fn rsassa_pkcs1_v1_5_verify(bytes : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte], modulus : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, exponent : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, signature : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, hash~ : <a href="peter-jerry-ye/utils/crypto#HashAlgorithm">HashAlgorithm</a> = .., length~ : Int = ..) -> Bool
```

