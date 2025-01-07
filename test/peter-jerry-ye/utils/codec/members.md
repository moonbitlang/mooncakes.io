# Documentation
|Trait|description|
|---|---|
|[Bytes\_](#Bytes_)||
|[Chars](#Chars)||

|Type|description|
|---|---|
|[Base64Decoder](#Base64Decoder)||
|[Base64Encoder](#Base64Encoder)||

|Value|description|
|---|---|
|[base64\_decode](#base64_decode)| |
|[base64\_encode](#base64_encode)| Encode binary to ascii text following Base64 defined in RFC 4648|

## Bytes\_

```moonbit
:::source,peter-jerry-ye/utils/codec/base64.mbt,118:::pub(open) trait Bytes_ {
  iter(Self) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]
}
```


## Chars

```moonbit
:::source,peter-jerry-ye/utils/codec/base64.mbt,123:::pub(open) trait Chars {
  iter(Self) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]
}
```


## Base64Decoder

```moonbit
:::source,peter-jerry-ye/utils/codec/base64.mbt,153:::type Base64Decoder
```


#### mooncakes-io-method-mark-Methods
- #### decode
  ```moonbit
  :::source,peter-jerry-ye/utils/codec/base64.mbt,164:::fn <a href="peter-jerry-ye/utils/codec#Base64Decoder">Base64Decoder</a>::decode(self : <a href="peter-jerry-ye/utils/codec#Base64Decoder">Base64Decoder</a>, input : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char], url_safe~ : Bool = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[Byte]
  ```
  > 
- #### new
  ```moonbit
  :::source,peter-jerry-ye/utils/codec/base64.mbt,159:::fn <a href="peter-jerry-ye/utils/codec#Base64Decoder">Base64Decoder</a>::new() -> <a href="peter-jerry-ye/utils/codec#Base64Decoder">Base64Decoder</a>
  ```
  > 

## Base64Encoder

```moonbit
:::source,peter-jerry-ye/utils/codec/base64.mbt,59:::type Base64Encoder
```


#### mooncakes-io-method-mark-Methods
- #### encode
  ```moonbit
  :::source,peter-jerry-ye/utils/codec/base64.mbt,70:::fn <a href="peter-jerry-ye/utils/codec#Base64Encoder">Base64Encoder</a>::encode(self : <a href="peter-jerry-ye/utils/codec#Base64Encoder">Base64Encoder</a>, bytes : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte], url_safe~ : Bool = .., padding~ : Bool = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[Char]
  ```
  > 
- #### new
  ```moonbit
  :::source,peter-jerry-ye/utils/codec/base64.mbt,65:::fn <a href="peter-jerry-ye/utils/codec#Base64Encoder">Base64Encoder</a>::new() -> <a href="peter-jerry-ye/utils/codec#Base64Encoder">Base64Encoder</a>
  ```
  > 

## base64\_decode

```moonbit
:::source,peter-jerry-ye/utils/codec/base64.mbt,206:::fn base64_decode[T : <a href="peter-jerry-ye/utils/codec#Chars">Chars</a>](input : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], url_safe~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]
```
 
 Decode ascii text to binary following Base64 defined in RFC 4648

 If the string is not padded correctly, an empty `Bytes` will be returned

## base64\_encode

```moonbit
:::source,peter-jerry-ye/utils/codec/base64.mbt,128:::fn base64_encode[T : <a href="peter-jerry-ye/utils/codec#Bytes_">Bytes_</a>](bytes : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], url_safe~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]
```
 Encode binary to ascii text following Base64 defined in RFC 4648
