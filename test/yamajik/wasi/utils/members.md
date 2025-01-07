# Documentation
|Type|description|
|---|---|
|[Lazy](#Lazy)||

|Value|description|
|---|---|
|[decode\_from\_wasi](#decode_from_wasi)||
|[encode\_to\_wasi](#encode_to_wasi)||
|[utf16\_to\_utf8](#utf16_to_utf8)||
|[utf8\_to\_utf16](#utf8_to_utf16)||

## Lazy

```moonbit
:::source,yamajik/wasi/utils/lazy.mbt,5:::type Lazy
```


#### mooncakes-io-method-mark-Methods
- #### calc
  ```moonbit
  :::source,yamajik/wasi/utils/lazy.mbt,16:::fn <a href="yamajik/wasi/utils#Lazy">Lazy</a>::calc[T](self : <a href="yamajik/wasi/utils#Lazy">Lazy</a>[T]) -> T
  ```
  > 
- #### get
  ```moonbit
  :::source,yamajik/wasi/utils/lazy.mbt,21:::fn <a href="yamajik/wasi/utils#Lazy">Lazy</a>::get[T](self : <a href="yamajik/wasi/utils#Lazy">Lazy</a>[T]) -> T
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/wasi/utils/lazy.mbt,11:::fn <a href="yamajik/wasi/utils#Lazy">Lazy</a>::new[T](init : () -> T) -> <a href="yamajik/wasi/utils#Lazy">Lazy</a>[T]
  ```
  > 

## decode\_from\_wasi

```moonbit
:::source,yamajik/wasi/utils/encoding.mbt,98:::fn decode_from_wasi(bytes : Bytes) -> String
```


## encode\_to\_wasi

```moonbit
:::source,yamajik/wasi/utils/encoding.mbt,107:::fn encode_to_wasi(string : String) -> Bytes
```


## utf16\_to\_utf8

```moonbit
:::source,yamajik/wasi/utils/encoding.mbt,2:::fn utf16_to_utf8(bytes : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]
```


## utf8\_to\_utf16

```moonbit
:::source,yamajik/wasi/utils/encoding.mbt,50:::fn utf8_to_utf16(string : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Bytes]
```

