# gmlewis/gzip
[![check](https://github.com/gmlewis/moonbit-gzip/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-gzip/actions/workflows/check.yml)

This is a simplified gzip/gunzip algorithm based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.0:src/compress/gzip/gzip.go
which has the copyright notice:

```
// Copyright 2010 The Go Authors. All rights reserved.
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
|Type|description|
|---|---|
|[CompressionLevel](#CompressionLevel)||
|[Header](#Header)| The gzip file stores a header giving metadata about the compressed file.|
|[Reader](#Reader)||
|[Writer](#Writer)| Writes to a Writer are compressed and written to w.|

|Value|description|
|---|---|
|[best\_speed](#best_speed)||
|[err\_checksum](#err_checksum)||
|[err\_header](#err_header)||
|[err\_unexpected\_eof](#err_unexpected_eof)||
|[ioeof](#ioeof)||

## CompressionLevel

```moonbit
:::source,gmlewis/gzip/gzip.mbt,11:::pub(all) type CompressionLevel Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,11:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a> with compare(<a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>, <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,11:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a> with op_equal(<a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>, <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,11:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a> with output(<a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,11:::fn <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>::compare(<a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>, <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,11:::fn <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>::op_equal(<a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>, <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,11:::fn <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>::output(<a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/gzip/traits.mbt,85:::fn <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Header

```moonbit
:::source,gmlewis/gzip/gunzip.mbt,69:::pub(all) struct Header {
  comment : String
  extra : <a href="moonbitlang/core/array#Array">Array</a>[Byte]
  mod_time : <a href="moonbitlang/x/time#PlainDateTime">@moonbitlang/x/time.PlainDateTime</a>?
  name : String
  os : Byte
}
```
 The gzip file stores a header giving metadata about the compressed file.
That header is exposed as the fields of the \[Writer\] and \[Reader\] structs.

 Strings must be UTF-8 encoded and may only contain Unicode code points
U+0001 through U+00FF, due to limitations of the GZIP file format.

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/gzip/gunzip.mbt,78:::fn <a href="gmlewis/gzip#Header">Header</a>::new() -> <a href="gmlewis/gzip#Header">Header</a>
  ```
  > 

## Reader

```moonbit
:::source,gmlewis/gzip/gunzip.mbt,97:::pub(all) struct Reader {
  header : <a href="gmlewis/gzip#Header">Header</a>
  // private fields
}
```


#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,gmlewis/gzip/gunzip.mbt,425:::fn <a href="gmlewis/gzip#Reader">Reader</a>::close(self : <a href="gmlewis/gzip#Reader">Reader</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 
- #### multistream
  ```moonbit
  :::source,gmlewis/gzip/gunzip.mbt,162:::fn <a href="gmlewis/gzip#Reader">Reader</a>::multistream(self : <a href="gmlewis/gzip#Reader">Reader</a>, ok : Bool) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/gzip/gunzip.mbt,114:::fn <a href="gmlewis/gzip#Reader">Reader</a>::new(r : <a href="gmlewis/flate#Reader">@gmlewis/flate.Reader</a>) -> (<a href="gmlewis/gzip#Reader">Reader</a>, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 
- #### read
  ```moonbit
  :::source,gmlewis/gzip/gunzip.mbt,364:::fn <a href="gmlewis/gzip#Reader">Reader</a>::read(self : <a href="gmlewis/gzip#Reader">Reader</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 
- #### reset
  ```moonbit
  :::source,gmlewis/gzip/gunzip.mbt,133:::fn <a href="gmlewis/gzip#Reader">Reader</a>::reset(self : <a href="gmlewis/gzip#Reader">Reader</a>, r : <a href="gmlewis/flate#Reader">@gmlewis/flate.Reader</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 

## Writer

```moonbit
:::source,gmlewis/gzip/gzip.mbt,25:::pub(all) struct Writer {
  header : <a href="gmlewis/gzip#Header">Header</a>
  w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>
  level : <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>
  wrote_header : Bool
  closed : Bool
  buf : <a href="moonbitlang/core/array#Array">Array</a>[Byte]
  compressor : <a href="gmlewis/io#WriteCloser">@gmlewis/io.WriteCloser</a>
  digest : UInt
  size : UInt
  err : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
}
```
 Writes to a Writer are compressed and written to w.

#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,260:::fn <a href="gmlewis/gzip#Writer">Writer</a>::close(self : <a href="gmlewis/gzip#Writer">Writer</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  >  close closes the \[Writer\] by flushing any unwritten data to the underlying
  > \[io.Writer\] and writing the GZIP footer.
  > It does not close the underlying \[io.Writer\].
- #### flush
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,241:::fn <a href="gmlewis/gzip#Writer">Writer</a>::flush(self : <a href="gmlewis/gzip#Writer">Writer</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  >  flush flushes any pending compressed data to the underlying writer.
  > 
  >  It is useful mainly in compressed network protocols, to ensure that
  > a remote reader has enough data to reconstruct a packet. Flush does
  > not return until the data has been written. If the underlying
  > writer returns an error, Flush returns that error.
  > 
  >  In the terminology of the zlib library, Flush is equivalent to Z\_SYNC\_FLUSH.
- #### new
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,52:::fn <a href="gmlewis/gzip#Writer">Writer</a>::new(w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>) -> <a href="gmlewis/gzip#Writer">Writer</a>
  ```
  >  Writer::new returns a new \[IOWriter\] using the optional compression level
  > (or `default_compression`).
  > Writes to the returned writer are compressed and written to w.
  > 
  >  It is the caller's responsibility to call Close on the \[Writer\] when done.
  > Writes may be buffered and not flushed until Close.
  > 
  >  Callers that wish to set the fields in Writer.Header must do so before
  > the first call to Write, Flush, or Close.
- #### write
  ```moonbit
  :::source,gmlewis/gzip/gzip.mbt,142:::fn <a href="gmlewis/gzip#Writer">Writer</a>::write(self : <a href="gmlewis/gzip#Writer">Writer</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 

## best\_speed

```moonbit
:::source,gmlewis/gzip/gzip.mbt,20:::let best_speed : <a href="gmlewis/gzip#CompressionLevel">CompressionLevel</a>
```


## err\_checksum

```moonbit
:::source,gmlewis/gzip/gunzip.mbt,43:::let err_checksum : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```


## err\_header

```moonbit
:::source,gmlewis/gzip/gunzip.mbt,47:::let err_header : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```


## err\_unexpected\_eof

```moonbit
:::source,gmlewis/gzip/gunzip.mbt,50:::let err_unexpected_eof : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```


## ioeof

```moonbit
:::source,gmlewis/gzip/gunzip.mbt,53:::let ioeof : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```

