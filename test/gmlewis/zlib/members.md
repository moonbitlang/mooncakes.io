# gmlewis/zlib
[![check](https://github.com/gmlewis/moonbit-zlib/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-zlib/actions/workflows/check.yml)

This is a simplified zlib format compressed data package based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.3:src/compress/zlib/reader.go
which has the copyright notice:

```
// Copyright 2009 The Go Authors. All rights reserved.
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
|[resetter](#resetter)| resetter resets a ReadCloser returned by \[Reader::new\] or \[Reader::new\_dict\]|

|Type|description|
|---|---|
|[Reader](#Reader)||
|[Writer](#Writer)||

|Value|description|
|---|---|
|[err\_checksum](#err_checksum)| err\_checksum is returned when reading ZLIB data that has an invalid checksum.|
|[err\_dictionary](#err_dictionary)| err\_dictionary is returned when reading ZLIB data that has an invalid dictionary.|
|[err\_header](#err_header)| err\_header is returned when reading ZLIB data that has an invalid header.|

## resetter

```moonbit
:::source,gmlewis/zlib/reader.mbt,57:::pub(open) trait resetter {
  reset(Self, <a href="gmlewis/io#Reader">@gmlewis/io.Reader</a>, <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
}
```
 resetter resets a ReadCloser returned by \[Reader::new\] or \[Reader::new\_dict\]
to switch to a new underlying Reader. This permits reusing a ReadCloser
instead of allocating a new one.

## Reader

```moonbit
:::source,gmlewis/zlib/reader.mbt,46:::type Reader
```


#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,gmlewis/zlib/reader.mbt,142:::fn <a href="gmlewis/zlib#Reader">Reader</a>::close(self : <a href="gmlewis/zlib#Reader">Reader</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  >  Calling close does not close the wrapped \[io.Reader\] originally passed to \[Reader::new\].
  > In order for the ZLIB checksum to be verified, the reader must be
  > fully consumed until the \[io.eof\].
- #### new
  ```moonbit
  :::source,gmlewis/zlib/reader.mbt,70:::fn <a href="gmlewis/zlib#Reader">Reader</a>::new(r : <a href="gmlewis/flate#Reader">@gmlewis/flate.Reader</a>) -> (<a href="gmlewis/io#ReadCloser">@gmlewis/io.ReadCloser</a>, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  >  Reader::new creates a new ReadCloser.
  > Reads from the returned ReadCloser read and decompress data from r.
  > If r does not implement \[io.ByteReader\], the decompressor may read more
  > data than necessary from r.
  > It is the caller's responsibility to call close on the ReadCloser when done.
  > 
  >  The \[io.ReadCloser\] returned by Reader::new also implements \[resetter\].
- #### new\_dict
  ```moonbit
  :::source,gmlewis/zlib/reader.mbt,79:::fn <a href="gmlewis/zlib#Reader">Reader</a>::new_dict(r : <a href="gmlewis/flate#Reader">@gmlewis/flate.Reader</a>, dict : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (<a href="gmlewis/io#ReadCloser">@gmlewis/io.ReadCloser</a>, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  >  Reader::new\_dict is like \[Reader::new\] but uses a preset dictionary.
  > Reader::new\_dict ignores the dictionary if the compressed data does not refer to it.
  > If the compressed data refers to a different dictionary, Reader::new\_dict returns \[err\_dictionary\].
  > 
  >  The ReadCloser returned by Reader::new\_dict also implements \[resetter\].
- #### read
  ```moonbit
  :::source,gmlewis/zlib/reader.mbt,95:::fn <a href="gmlewis/zlib#Reader">Reader</a>::read(self : <a href="gmlewis/zlib#Reader">Reader</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 
- #### reset
  ```moonbit
  :::source,gmlewis/zlib/reader.mbt,151:::fn <a href="gmlewis/zlib#Reader">Reader</a>::reset(self : <a href="gmlewis/zlib#Reader">Reader</a>, r : <a href="gmlewis/flate#Reader">@gmlewis/flate.Reader</a>, dict : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 

## Writer

```moonbit
:::source,gmlewis/zlib/writer.mbt,11:::type Writer
```


#### mooncakes-io-method-mark-Methods
- #### close
  ```moonbit
  :::source,gmlewis/zlib/writer.mbt,149:::fn <a href="gmlewis/zlib#Writer">Writer</a>::close(self : <a href="gmlewis/zlib#Writer">Writer</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 
- #### flush
  ```moonbit
  :::source,gmlewis/zlib/writer.mbt,135:::fn <a href="gmlewis/zlib#Writer">Writer</a>::flush(self : <a href="gmlewis/zlib#Writer">Writer</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/zlib/writer.mbt,28:::fn <a href="gmlewis/zlib#Writer">Writer</a>::new(w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>) -> <a href="gmlewis/zlib#Writer">Writer</a>
  ```
  > 
- #### new\_dict
  ```moonbit
  :::source,gmlewis/zlib/writer.mbt,34:::fn <a href="gmlewis/zlib#Writer">Writer</a>::new_dict(w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>, dict : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> <a href="gmlewis/zlib#Writer">Writer</a>
  ```
  > 
- #### reset
  ```moonbit
  :::source,gmlewis/zlib/writer.mbt,50:::fn <a href="gmlewis/zlib#Writer">Writer</a>::reset(self : <a href="gmlewis/zlib#Writer">Writer</a>, w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>) -> Unit
  ```
  > 
- #### write
  ```moonbit
  :::source,gmlewis/zlib/writer.mbt,114:::fn <a href="gmlewis/zlib#Writer">Writer</a>::write(self : <a href="gmlewis/zlib#Writer">Writer</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 

## err\_checksum

```moonbit
:::source,gmlewis/zlib/reader.mbt,37:::let err_checksum : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```
 err\_checksum is returned when reading ZLIB data that has an invalid checksum.

## err\_dictionary

```moonbit
:::source,gmlewis/zlib/reader.mbt,40:::let err_dictionary : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```
 err\_dictionary is returned when reading ZLIB data that has an invalid dictionary.

## err\_header

```moonbit
:::source,gmlewis/zlib/reader.mbt,43:::let err_header : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```
 err\_header is returned when reading ZLIB data that has an invalid header.
