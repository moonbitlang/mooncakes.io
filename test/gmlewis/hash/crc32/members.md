# Documentation
|Type|description|
|---|---|
|[Digest](#Digest)||

|Value|description|
|---|---|
|[new](#new)| \`new\` returns a new, reset Digest, ready to sum.|

## Digest

```moonbit
:::source,gmlewis/hash/crc32/crc32.mbt,12:::type Digest
```


#### mooncakes-io-method-mark-Methods
- #### block\_size
  ```moonbit
  :::source,gmlewis/hash/crc32/crc32.mbt,63:::fn <a href="gmlewis/hash/crc32#Digest">Digest</a>::block_size(_self : <a href="gmlewis/hash/crc32#Digest">Digest</a>) -> Int
  ```
  > 
- #### reset
  ```moonbit
  :::source,gmlewis/hash/crc32/crc32.mbt,53:::fn <a href="gmlewis/hash/crc32#Digest">Digest</a>::reset(self : <a href="gmlewis/hash/crc32#Digest">Digest</a>) -> Unit
  ```
  > 
- #### size
  ```moonbit
  :::source,gmlewis/hash/crc32/crc32.mbt,58:::fn <a href="gmlewis/hash/crc32#Digest">Digest</a>::size(_self : <a href="gmlewis/hash/crc32#Digest">Digest</a>) -> Int
  ```
  > 
- #### sum
  ```moonbit
  :::source,gmlewis/hash/crc32/crc32.mbt,41:::fn <a href="gmlewis/hash/crc32#Digest">Digest</a>::sum(self : <a href="gmlewis/hash/crc32#Digest">Digest</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### sum32
  ```moonbit
  :::source,gmlewis/hash/crc32/crc32.mbt,26:::fn <a href="gmlewis/hash/crc32#Digest">Digest</a>::sum32(self : <a href="gmlewis/hash/crc32#Digest">Digest</a>) -> UInt
  ```
  >  `sum32` returns the final crc32 as a UInt.
- #### write
  ```moonbit
  :::source,gmlewis/hash/crc32/crc32.mbt,31:::fn <a href="gmlewis/hash/crc32#Digest">Digest</a>::write(self : <a href="gmlewis/hash/crc32#Digest">Digest</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  >  `write` writes `p` to the digest.

## new

```moonbit
:::source,gmlewis/hash/crc32/crc32.mbt,17:::fn new() -> <a href="gmlewis/hash/crc32#Digest">Digest</a>
```
 `new` returns a new, reset Digest, ready to sum.
