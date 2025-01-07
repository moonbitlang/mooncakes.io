# Documentation
|Type|description|
|---|---|
|[Digest](#Digest)||

|Value|description|
|---|---|
|[checksum](#checksum)||
|[new](#new)||

## Digest

```moonbit
:::source,gmlewis/hash/adler32/adler32.mbt,38:::type Digest
```


#### mooncakes-io-method-mark-Methods
- #### block\_size
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,67:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::block_size(_self : <a href="gmlewis/hash/adler32#Digest">Digest</a>) -> Int
  ```
  > 
- #### marshal\_binary
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,78:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::marshal_binary(self : <a href="gmlewis/hash/adler32#Digest">Digest</a>) -> (<a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte], <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 
- #### reset
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,43:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::reset(self : <a href="gmlewis/hash/adler32#Digest">Digest</a>) -> Unit
  ```
  > 
- #### size
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,62:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::size(_self : <a href="gmlewis/hash/adler32#Digest">Digest</a>) -> Int
  ```
  > 
- #### sum
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,158:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::sum(self : <a href="gmlewis/hash/adler32#Digest">Digest</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### sum32
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,153:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::sum32(self : <a href="gmlewis/hash/adler32#Digest">Digest</a>) -> UInt
  ```
  > 
- #### unmarshal\_binary
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,106:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::unmarshal_binary(self : <a href="gmlewis/hash/adler32#Digest">Digest</a>, b : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 
- #### write
  ```moonbit
  :::source,gmlewis/hash/adler32/adler32.mbt,119:::fn <a href="gmlewis/hash/adler32#Digest">Digest</a>::write(self : <a href="gmlewis/hash/adler32#Digest">Digest</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 

## checksum

```moonbit
:::source,gmlewis/hash/adler32/adler32.mbt,170:::fn checksum(data : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> UInt
```


## new

```moonbit
:::source,gmlewis/hash/adler32/adler32.mbt,53:::fn new() -> <a href="gmlewis/hash/adler32#Digest">Digest</a>
```

