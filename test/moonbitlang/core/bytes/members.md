# Documentation
|Type|description|
|---|---|
|[Bytes](#Bytes)||

## Bytes


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/bytes/xxhash.mbt,45:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with hash(self : Bytes) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/bytes/xxhash.mbt,48:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with hash_combine(self : Bytes, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,107:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::default() -> Bytes
  ```
  > 
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,25:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::from_array(arr : <a href="moonbitlang/core/array#Array">Array</a>[Byte]) -> Bytes
  ```
  > 
  >  Makes a new Bytes with the given byte array.
  >  
  >  #### Usage
  >  
  >  ```
  >  let b = @bytes.from_array([b'\x41', b'\x42'])
  >  assert_eq!(b, b"AB")
  >  ```
  >  
- #### from\_fixedarray
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,35:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::from_fixedarray(arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], len? : Int) -> Bytes
  ```
  > 
  >  Makes a new Bytes from a fixedarray.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,62:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::from_iter(iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]) -> Bytes
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/bytes/xxhash.mbt,45:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::hash(self : Bytes) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/bytes/xxhash.mbt,48:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::hash_combine(self : Bytes, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### iter
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,94:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::iter(self : Bytes) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Byte]
  ```
  > 
- #### of
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,76:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::of(arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Bytes
  ```
  > 
  >  Makes a new Bytes with the given byte fixedarray.
  >  
  >  #### Usage
  >  
  >  ```
  >  let b = @bytes.of([b'\x41', b'\x42'])
  >  assert_eq!(b, b"AB")
  >  ```
  >  TODO: marked as intrinsic, inline if it is constant
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,85:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::to_array(self : Bytes) -> <a href="moonbitlang/core/array#Array">Array</a>[Byte]
  ```
  > 
- #### to\_fixedarray
  ```moonbit
  :::source,moonbitlang/core/bytes/bytes.mbt,49:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::to_fixedarray(self : Bytes, len? : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
  ```
  > 
  >  Converts a Bytes to a fixedarray.
