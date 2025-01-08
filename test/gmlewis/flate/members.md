# gmlewis/flate
[![check](https://github.com/gmlewis/moonbit-flate/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-flate/actions/workflows/check.yml)

This is a simplified flate compression algorithm based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.1:src/compress/flate/deflatefast.go
which has the copyright notice:

```
// Copyright 2016 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
```

## Status

The code has been updated to support compiler:

```bash
$ moon version --all
moon 0.1.20241216 (b57ed1c 2024-12-16) ~/.moon/bin/moon
moonc v0.1.20241216+68e710374 ~/.moon/bin/moonc
moonrun 0.1.20241216 (b57ed1c 2024-12-16) ~/.moon/bin/moonrun
```

Use `moonup` to manage `moon` compiler versions:
https://github.com/chawyehsu/moonup

---
# Documentation
|Trait|description|
|---|---|
|[@gmlewis/flate.Reader](#@gmlewis/flate.Reader)| The actual read interface needed by \[Decompressor::new\].|

|Type|description|
|---|---|
|[Compressor](#Compressor)||
|[Decompressor](#Decompressor)||
|[DeflateFast](#DeflateFast)||
|[DictDecoder](#DictDecoder)| DictDecoder implements the LZ77 sliding dictionary as used in decompression.|
|[DictWriter](#DictWriter)||
|[HCode](#HCode)||
|[HuffmanBitWriter](#HuffmanBitWriter)||
|[HuffmanDecoder](#HuffmanDecoder)||
|[HuffmanEncoder](#HuffmanEncoder)||
|[LevelInfo](#LevelInfo)||
|[LiteralNode](#LiteralNode)||
|[StepFunc](#StepFunc)||
|[StepState](#StepState)||
|[TableEntry](#TableEntry)||
|[Token](#Token)||
|[Writer](#Writer)||
|[Reader](#Reader)||

|Value|description|
|---|---|
|[ioeof](#ioeof)||
|[writer\_closed\_error](#writer_closed_error)||

## @gmlewis/flate.Reader

```moonbit
:::source,gmlewis/flate/inflate.mbt,220:::pub(open) trait @gmlewis/flate.Reader {
  read(Self, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  read_byte(Self) -> (Byte, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
}
```
 The actual read interface needed by \[Decompressor::new\].

## Compressor

```moonbit
:::source,gmlewis/flate/deflate.mbt,44:::type Compressor
```


## Decompressor

```moonbit
:::source,gmlewis/flate/inflate.mbt,229:::type Decompressor
```


#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,gmlewis/flate/inflate.mbt,381:::fn <a href="gmlewis/flate#Decompressor">Decompressor</a>::close(self : <a href="gmlewis/flate#Decompressor">Decompressor</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 
- #### read
  ```moonbit
  :::source,gmlewis/flate/inflate.mbt,353:::fn <a href="gmlewis/flate#Decompressor">Decompressor</a>::read(self : <a href="gmlewis/flate#Decompressor">Decompressor</a>, b : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 

## DeflateFast

```moonbit
:::source,gmlewis/flate/deflate-fast.mbt,103:::type DeflateFast
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/flate/deflate-fast.mbt,107:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/flate#DeflateFast">DeflateFast</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/deflate-fast.mbt,107:::fn op_equal(<a href="gmlewis/flate#DeflateFast">DeflateFast</a>, <a href="gmlewis/flate#DeflateFast">DeflateFast</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/flate/deflate-fast.mbt,107:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/flate#DeflateFast">DeflateFast</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/deflate-fast.mbt,107:::fn output(<a href="gmlewis/flate#DeflateFast">DeflateFast</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## DictDecoder

```moonbit
:::source,gmlewis/flate/dict-decoder.mbt,28:::type DictDecoder
```
 DictDecoder implements the LZ77 sliding dictionary as used in decompression.
LZ77 decompresses data through sequences of two forms of commands:

   - Literal insertions: Runs of one or more symbols are inserted into the data
     stream as is. This is accomplished through the write\_byte method for a
     single symbol, or combinations of write\_slice/write\_mark for multiple symbols.
     Any valid stream must start with a literal insertion if no preset dictionary
     is used.
     
   - Backward copies: Runs of one or more symbols are copied from previously
     emitted data. Backward copies come as the tuple (dist, length) where dist
     determines how far back in the stream to copy from and length determines how
     many bytes to copy. Note that it is valid for the length to be greater than
     the distance. Since LZ77 uses forward copies, that situation is used to
     perform a form of run-length encoding on repeated runs of symbols.
     The write\_copy and try\_write\_copy are used to implement this command.

 For performance reasons, this implementation performs little to no sanity
checks about the arguments. As such, the invariants documented for each
method call must be respected.

## DictWriter

```moonbit
:::source,gmlewis/flate/writer.mbt,32:::type DictWriter
```


## HCode

```moonbit
:::source,gmlewis/flate/huffman-code.mbt,36:::type HCode
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/flate/huffman-code.mbt,39:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/flate#HCode">HCode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/huffman-code.mbt,39:::fn op_equal(<a href="gmlewis/flate#HCode">HCode</a>, <a href="gmlewis/flate#HCode">HCode</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/flate/huffman-code.mbt,39:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/flate#HCode">HCode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/huffman-code.mbt,39:::fn output(<a href="gmlewis/flate#HCode">HCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## HuffmanBitWriter

```moonbit
:::source,gmlewis/flate/huffman-bit-writer.mbt,78:::type HuffmanBitWriter
```


## HuffmanDecoder

```moonbit
:::source,gmlewis/flate/inflate.mbt,79:::type HuffmanDecoder
```


## HuffmanEncoder

```moonbit
:::source,gmlewis/flate/huffman-code.mbt,9:::type HuffmanEncoder
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/flate/huffman-code.mbt,13:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/flate#HuffmanEncoder">HuffmanEncoder</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/huffman-code.mbt,13:::fn op_equal(<a href="gmlewis/flate#HuffmanEncoder">HuffmanEncoder</a>, <a href="gmlewis/flate#HuffmanEncoder">HuffmanEncoder</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/flate/huffman-code.mbt,13:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/flate#HuffmanEncoder">HuffmanEncoder</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/huffman-code.mbt,13:::fn output(<a href="gmlewis/flate#HuffmanEncoder">HuffmanEncoder</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## LevelInfo

```moonbit
:::source,gmlewis/flate/huffman-code.mbt,43:::type LevelInfo
```


## LiteralNode

```moonbit
:::source,gmlewis/flate/huffman-code.mbt,29:::type LiteralNode
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/flate/huffman-code.mbt,32:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/flate#LiteralNode">LiteralNode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/huffman-code.mbt,32:::fn op_equal(<a href="gmlewis/flate#LiteralNode">LiteralNode</a>, <a href="gmlewis/flate#LiteralNode">LiteralNode</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/flate/huffman-code.mbt,32:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/flate#LiteralNode">LiteralNode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/huffman-code.mbt,32:::fn output(<a href="gmlewis/flate#LiteralNode">LiteralNode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## StepFunc

```moonbit
:::source,gmlewis/flate/inflate.mbt,272:::type StepFunc
```


## StepState

```moonbit
:::source,gmlewis/flate/inflate.mbt,266:::type StepState
```


## TableEntry

```moonbit
:::source,gmlewis/flate/deflate-fast.mbt,95:::type TableEntry
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/flate/deflate-fast.mbt,98:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/flate#TableEntry">TableEntry</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/deflate-fast.mbt,98:::fn op_equal(<a href="gmlewis/flate#TableEntry">TableEntry</a>, <a href="gmlewis/flate#TableEntry">TableEntry</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/flate/deflate-fast.mbt,98:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/flate#TableEntry">TableEntry</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/deflate-fast.mbt,98:::fn output(<a href="gmlewis/flate#TableEntry">TableEntry</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Token

```moonbit
:::source,gmlewis/flate/token.mbt,62:::type Token
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/flate/token.mbt,62:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/flate#Token">Token</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/flate/token.mbt,62:::fn output(<a href="gmlewis/flate#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Writer

```moonbit
:::source,gmlewis/flate/writer.mbt,2:::type Writer
```


#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,gmlewis/flate/writer.mbt,50:::fn <a href="gmlewis/flate#Writer">Writer</a>::close(self : <a href="gmlewis/flate#Writer">Writer</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  >  `close` closes the input to the flate Writer.
  > After closing the Writer, the compressed data can be read
  > from the `@io.Writer` provided to `new`.
- #### new
  ```moonbit
  :::source,gmlewis/flate/writer.mbt,9:::fn <a href="gmlewis/flate#Writer">Writer</a>::new(buf : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>) -> <a href="gmlewis/flate#Writer">Writer</a>
  ```
  >  `Writer::new` returns a new \[@io.WriteCloser\] compressing data at the "BestSpeed" level.
  > It writes its (compressed) data to the provided `buf`.
- #### new\_dict
  ```moonbit
  :::source,gmlewis/flate/writer.mbt,23:::fn <a href="gmlewis/flate#Writer">Writer</a>::new_dict(w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>, dict : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/flate#Writer">Writer</a>
  ```
  > 
- #### write
  ```moonbit
  :::source,gmlewis/flate/writer.mbt,42:::fn <a href="gmlewis/flate#Writer">Writer</a>::write(self : <a href="gmlewis/flate#Writer">Writer</a>, data : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  >  `write` writes the provided data to the flate Writer.

## ioeof

```moonbit
:::source,gmlewis/flate/inflate.mbt,19:::let ioeof : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```


## writer\_closed\_error

```moonbit
:::source,gmlewis/flate/deflate.mbt,151:::let writer_closed_error : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```


## Reader


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/flate/inflate.mbt,276:::fn <a href="gmlewis/flate#Reader">Reader</a>::new(r : <a href="gmlewis/flate#Reader">Reader</a>) -> <a href="gmlewis/flate#Decompressor">Decompressor</a>
  ```
  >  `Reader::new` returns a new \[@io.ReadCloser\] that can be used
  > to read the uncompressed version of r.
- #### new\_dict
  ```moonbit
  :::source,gmlewis/flate/inflate.mbt,285:::fn <a href="gmlewis/flate#Reader">Reader</a>::new_dict(r : <a href="gmlewis/flate#Reader">Reader</a>, dict : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/flate#Decompressor">Decompressor</a>
  ```
  >  `Reader::new_dict` is like \[NewReader\] but initializes the reader
  > with a preset dictionary. The returned \[Reader\] behaves as if
  > the uncompressed data stream started with the given dictionary,
  > which has already been read. NewReaderDict is typically used
  > to read data compressed by NewWriterDict.
