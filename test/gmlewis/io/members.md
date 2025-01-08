# gmlewis/io
[![check](https://github.com/gmlewis/moonbit-io/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-io/actions/workflows/check.yml)

This is a simplified io package based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.2:src/io/io.go
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
|[@gmlewis/io.ByteReader](#@gmlewis/io.ByteReader)| ByteReader is the interface that wraps the read\_byte method.|
|[@gmlewis/io.ByteScanner](#@gmlewis/io.ByteScanner)| ByteScanner is the interface that adds the unread\_byte method to the|
|[@gmlewis/io.ByteWriter](#@gmlewis/io.ByteWriter)| ByteWriter is the interface that wraps the write\_byte method.|
|[@gmlewis/io.Closer](#@gmlewis/io.Closer)| Closer is the interface that wraps the basic Close method.|
|[@gmlewis/io.ReadCloser](#@gmlewis/io.ReadCloser)| ReadCloser is the interface that groups the basic Read and Close methods.|
|[@gmlewis/io.ReadSeekCloser](#@gmlewis/io.ReadSeekCloser)| ReadSeekCloser is the interface that groups the basic Read, Seek and Close|
|[@gmlewis/io.ReadSeeker](#@gmlewis/io.ReadSeeker)| ReadSeeker is the interface that groups the basic Read and Seek methods.|
|[@gmlewis/io.ReadWriteCloser](#@gmlewis/io.ReadWriteCloser)| ReadWriteCloser is the interface that groups the basic Read, Write and Close methods.|
|[@gmlewis/io.ReadWriteSeeker](#@gmlewis/io.ReadWriteSeeker)| ReadWriteSeeker is the interface that groups the basic Read, Write and Seek methods.|
|[@gmlewis/io.ReadWriter](#@gmlewis/io.ReadWriter)| ReadWriter is the interface that groups the basic Read and Write methods.|
|[@gmlewis/io.Reader](#@gmlewis/io.Reader)| Reader is the interface that wraps the basic Read method.|
|[@gmlewis/io.ReaderAt](#@gmlewis/io.ReaderAt)| ReaderAt is the interface that wraps the basic read\_at method.|
|[@gmlewis/io.ReaderFrom](#@gmlewis/io.ReaderFrom)| ReaderFrom is the interface that wraps the read\_from method.|
|[@gmlewis/io.Seeker](#@gmlewis/io.Seeker)| Seeker is the interface that wraps the basic Seek method.|
|[@gmlewis/io.WriteCloser](#@gmlewis/io.WriteCloser)| WriteCloser is the interface that groups the basic Write and Close methods.|
|[@gmlewis/io.WriteSeeker](#@gmlewis/io.WriteSeeker)| WriteSeeker is the interface that groups the basic Write and Seek methods.|
|[@gmlewis/io.Writer](#@gmlewis/io.Writer)| Writer is the interface that wraps the basic Write method.|
|[@gmlewis/io.WriterAt](#@gmlewis/io.WriterAt)| WriterAt is the interface that wraps the basic write\_at method.|
|[@gmlewis/io.WriterTo](#@gmlewis/io.WriterTo)| WriterTo is the interface that wraps the write\_to method.|

|Type|description|
|---|---|
|[Buffer](#Buffer)||
|[Discard](#Discard)||
|[IOError](#IOError)| An IOError can be tested with equality checks.|
|[LimitedReader](#LimitedReader)| A LimitedReader reads from R but limits the amount of|
|[NopCloser](#NopCloser)||
|[OffsetWriter](#OffsetWriter)| An OffsetWriter maps writes at offset base to offset base+off in the underlying writer.|
|[SectionReader](#SectionReader)||
|[Slice](#Slice)| A \`Slice\` is a slice of an \`Array\`.|
|[TeeReader](#TeeReader)||
|[Whence](#Whence)| Seek whence values.|

|Value|description|
|---|---|
|[copy](#copy)| copy copies from src to dst until either eof is reached|
|[copy\_buffer](#copy_buffer)| copy\_buffer is identical to copy except that it stages through the|
|[copy\_n](#copy_n)| copy\_n copies n bytes (or until an error) from src to dst.|
|[discard](#discard)| discard is a \[Writer\] on which all Write calls succeed|
|[eof](#eof)| eof is the error returned by Read when no more input is available.|
|[err\_invalid\_write](#err_invalid_write)| err\_invalid\_write means that a write returned an impossible count.|
|[err\_no\_progress](#err_no_progress)| err\_no\_progress is returned by some clients of a \[Reader\] when|
|[err\_offset](#err_offset)||
|[err\_short\_buffer](#err_short_buffer)| err\_short\_buffer means that a read required a longer buffer than was provided.|
|[err\_short\_write](#err_short_write)| err\_short\_write means that a write accepted fewer bytes than requested|
|[err\_unexpected\_eof](#err_unexpected_eof)| err\_unexpected\_eof means that eof was encountered in the|
|[err\_whence](#err_whence)||
|[read\_all](#read_all)| read\_all reads from r until an error or eof and returns the data it read.|
|[read\_full](#read_full)| read\_full reads exactly len(buf) bytes from r into buf.|

## @gmlewis/io.ByteReader

```moonbit
:::source,gmlewis/io/io.mbt,264:::pub(open) trait @gmlewis/io.ByteReader {
  read_byte(Self) -> (Byte, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 ByteReader is the interface that wraps the read\_byte method.

 read\_byte reads and returns the next byte from the input or
any error encountered. If read\_byte returns an error, no input
byte was consumed, and the returned byte value is undefined.

 read\_byte provides an efficient interface for byte-at-time
processing. A \[Reader\] that does not implement  ByteReader
can be wrapped using bufio.NewReader to add this method.

## @gmlewis/io.ByteScanner

```moonbit
:::source,gmlewis/io/io.mbt,276:::pub(open) trait @gmlewis/io.ByteScanner {
  read_byte(Self) -> (Byte, <a href="gmlewis/io#IOError">IOError</a>?)
  unread_byte(Self) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 ByteScanner is the interface that adds the unread\_byte method to the
basic read\_byte method.

 unread\_byte causes the next call to read\_byte to return the last byte read.
If the last operation was not a successful call to read\_byte, unread\_byte may
return an error, unread the last byte read (or the byte prior to the
last-unread byte), or (in implementations that support the \[Seeker\] interface)
seek to one byte before the current offset.

## @gmlewis/io.ByteWriter

```moonbit
:::source,gmlewis/io/io.mbt,282:::pub(open) trait @gmlewis/io.ByteWriter {
  write_byte(Self, Byte) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 ByteWriter is the interface that wraps the write\_byte method.

## @gmlewis/io.Closer

```moonbit
:::source,gmlewis/io/io.mbt,109:::pub(open) trait @gmlewis/io.Closer {
  close(Self) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 Closer is the interface that wraps the basic Close method.

 The behavior of Close after the first call is undefined.
Specific implementations may document their own behavior.

## @gmlewis/io.ReadCloser

```moonbit
:::source,gmlewis/io/io.mbt,139:::pub(open) trait @gmlewis/io.ReadCloser {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  close(Self) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 ReadCloser is the interface that groups the basic Read and Close methods.

## @gmlewis/io.ReadSeekCloser

```moonbit
:::source,gmlewis/io/io.mbt,165:::pub(open) trait @gmlewis/io.ReadSeekCloser {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  seek(Self, Int64, <a href="gmlewis/io#Whence">Whence</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
  close(Self) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 ReadSeekCloser is the interface that groups the basic Read, Seek and Close
methods.

## @gmlewis/io.ReadSeeker

```moonbit
:::source,gmlewis/io/io.mbt,158:::pub(open) trait @gmlewis/io.ReadSeeker {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  seek(Self, Int64, <a href="gmlewis/io#Whence">Whence</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 ReadSeeker is the interface that groups the basic Read and Seek methods.

## @gmlewis/io.ReadWriteCloser

```moonbit
:::source,gmlewis/io/io.mbt,151:::pub(open) trait @gmlewis/io.ReadWriteCloser {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  write(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  close(Self) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 ReadWriteCloser is the interface that groups the basic Read, Write and Close methods.

## @gmlewis/io.ReadWriteSeeker

```moonbit
:::source,gmlewis/io/io.mbt,178:::pub(open) trait @gmlewis/io.ReadWriteSeeker {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  write(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  seek(Self, Int64, <a href="gmlewis/io#Whence">Whence</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 ReadWriteSeeker is the interface that groups the basic Read, Write and Seek methods.

## @gmlewis/io.ReadWriter

```moonbit
:::source,gmlewis/io/io.mbt,133:::pub(open) trait @gmlewis/io.ReadWriter {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  write(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 ReadWriter is the interface that groups the basic Read and Write methods.

## @gmlewis/io.Reader

```moonbit
:::source,gmlewis/io/io.mbt,88:::pub(open) trait @gmlewis/io.Reader {
  read(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 Reader is the interface that wraps the basic Read method.

 Read reads up to len(p) bytes into p. It returns the number of bytes
read (0 \<= n \<= len(p)) and any error encountered. Even if Read
returns n \< len(p), it may use all of p as scratch space during the call.
If some data is available but not len(p) bytes, Read conventionally
returns what is available instead of waiting for more.

 When Read encounters an error or end-of-file condition after
successfully reading n \> 0 bytes, it returns the number of
bytes read. It may return the (non-None) error from the same call
or return the error (and n == 0) from a subsequent call.
An instance of this general case is that a Reader returning
a non-zero number of bytes at the end of the input stream may
return either err == eof or err == None. The next Read should
return 0, eof.

 Callers should always process the n \> 0 bytes returned before
considering the error err. Doing so correctly handles I/O errors
that happen after reading some bytes and also both of the
allowed eof behaviors.

 If len(p) == 0, Read should always return n == 0. It may return a
non-None error if some error condition is known, such as eof.

 Implementations of Read are discouraged from returning a
zero byte count with a None error, except when len(p) == 0.
Callers should treat a return of 0 and None as indicating that
nothing happened; in particular it does not indicate eof.

 Implementations must not retain p.

## @gmlewis/io.ReaderAt

```moonbit
:::source,gmlewis/io/io.mbt,232:::pub(open) trait @gmlewis/io.ReaderAt {
  read_at(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte], Int64) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 ReaderAt is the interface that wraps the basic read\_at method.

 read\_at reads len(p) bytes into p starting at offset off in the
underlying input source. It returns the number of bytes
read (0 \<= n \<= len(p)) and any error encountered.

 When read\_at returns n \< len(p), it returns a non-None error
explaining why more bytes were not returned. In this respect,
read\_at is stricter than Read.

 Even if read\_at returns n \< len(p), it may use all of p as scratch
space during the call. If some data is available but not len(p) bytes,
read\_at blocks until either all the data is available or an error occurs.
In this respect read\_at is different from Read.

 If the n = len(p) bytes returned by read\_at are at the end of the
input source, read\_at may return either err == eof or err == None.

 If read\_at is reading from an input source with a seek offset,
read\_at should not affect nor be affected by the underlying
seek offset.

 Clients of read\_at can execute parallel read\_at calls on the
same input source.

 Implementations must not retain p.

## @gmlewis/io.ReaderFrom

```moonbit
:::source,gmlewis/io/io.mbt,191:::pub(open) trait @gmlewis/io.ReaderFrom {
  read_from(Self, <a href="gmlewis/io#Reader">Reader</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 ReaderFrom is the interface that wraps the read\_from method.

 read\_from reads data from r until eof or error.
The return value n is the number of bytes read.
Any error except eof encountered during the read is also returned.

 The \[copy\] function uses \[ReaderFrom\] if available.

## @gmlewis/io.Seeker

```moonbit
:::source,gmlewis/io/io.mbt,128:::pub(open) trait @gmlewis/io.Seeker {
  seek(Self, Int64, <a href="gmlewis/io#Whence">Whence</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 Seeker is the interface that wraps the basic Seek method.

 Seek sets the offset for the next Read or Write to offset,
interpreted according to whence:
\[SeekStart\] means relative to the start of the file,
\[SeekCurrent\] means relative to the current offset, and
\[SeekEnd\] means relative to the end
(for example, offset = -2 specifies the penultimate byte of the file).
Seek returns the new offset relative to the start of the
file or an error, if any.

 Seeking to an offset before the start of the file is an error.
Seeking to any positive offset may be allowed, but if the new offset exceeds
the size of the underlying object the behavior of subsequent I/O operations
is implementation-dependent.

## @gmlewis/io.WriteCloser

```moonbit
:::source,gmlewis/io/io.mbt,145:::pub(open) trait @gmlewis/io.WriteCloser {
  write(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  close(Self) -> <a href="gmlewis/io#IOError">IOError</a>?
}
```
 WriteCloser is the interface that groups the basic Write and Close methods.

## @gmlewis/io.WriteSeeker

```moonbit
:::source,gmlewis/io/io.mbt,172:::pub(open) trait @gmlewis/io.WriteSeeker {
  write(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  seek(Self, Int64, <a href="gmlewis/io#Whence">Whence</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 WriteSeeker is the interface that groups the basic Write and Seek methods.

## @gmlewis/io.Writer

```moonbit
:::source,gmlewis/io/io.mbt,101:::pub(open) trait @gmlewis/io.Writer {
  write(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 Writer is the interface that wraps the basic Write method.

 Write writes len(p) bytes from p to the underlying data stream.
It returns the number of bytes written from p (0 \<= n \<= len(p))
and any error encountered that caused the write to stop early.
Write must return a non-None error if it returns n \< len(p).
Write must not modify the slice data, even temporarily.

 Implementations must not retain p.

## @gmlewis/io.WriterAt

```moonbit
:::source,gmlewis/io/io.mbt,251:::pub(open) trait @gmlewis/io.WriterAt {
  write_at(Self, <a href="gmlewis/io#Slice">Slice</a>[Byte], Int64) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 WriterAt is the interface that wraps the basic write\_at method.

 write\_at writes len(p) bytes from p to the underlying data stream
at offset off. It returns the number of bytes written from p (0 \<= n \<= len(p))
and any error encountered that caused the write to stop early.
write\_at must return a non-None error if it returns n \< len(p).

 If write\_at is writing to a destination with a seek offset,
write\_at should not affect nor be affected by the underlying
seek offset.

 Clients of write\_at can execute parallel write\_at calls on the same
destination if the ranges do not overlap.

 Implementations must not retain p.

## @gmlewis/io.WriterTo

```moonbit
:::source,gmlewis/io/io.mbt,202:::pub(open) trait @gmlewis/io.WriterTo {
  write_to(Self, <a href="gmlewis/io#Writer">Writer</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
}
```
 WriterTo is the interface that wraps the write\_to method.

 write\_to writes data to w until there's no more data to write or
when an error occurs. The return value n is the number of bytes
written. Any error encountered during the write is also returned.

 The copy function uses WriterTo if available.

## Buffer

```moonbit
:::source,gmlewis/io/buffer.mbt,2:::type Buffer
```


#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,20:::fn <a href="gmlewis/io#Buffer">Buffer</a>::from(s : <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> <a href="gmlewis/io#Buffer">Buffer</a>
  ```
  > 
- #### length
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,108:::fn <a href="gmlewis/io#Buffer">Buffer</a>::length(self : <a href="gmlewis/io#Buffer">Buffer</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,8:::fn <a href="gmlewis/io#Buffer">Buffer</a>::new() -> <a href="gmlewis/io#Buffer">Buffer</a>
  ```
  > 
- #### read
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,61:::fn <a href="gmlewis/io#Buffer">Buffer</a>::read(self : <a href="gmlewis/io#Buffer">Buffer</a>, buf : <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  > 
- #### read\_byte
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,73:::fn <a href="gmlewis/io#Buffer">Buffer</a>::read_byte(self : <a href="gmlewis/io#Buffer">Buffer</a>) -> (Byte, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  > 
- #### read\_from
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,84:::fn <a href="gmlewis/io#Buffer">Buffer</a>::read_from(self : <a href="gmlewis/io#Buffer">Buffer</a>, r : <a href="gmlewis/io#Reader">Reader</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  > 
- #### reset
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,26:::fn <a href="gmlewis/io#Buffer">Buffer</a>::reset(self : <a href="gmlewis/io#Buffer">Buffer</a>) -> Unit
  ```
  > 
- #### to\_bytes
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,98:::fn <a href="gmlewis/io#Buffer">Buffer</a>::to_bytes(self : <a href="gmlewis/io#Buffer">Buffer</a>) -> Bytes
  ```
  > 
- #### to\_slice
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,103:::fn <a href="gmlewis/io#Buffer">Buffer</a>::to_slice(self : <a href="gmlewis/io#Buffer">Buffer</a>) -> <a href="gmlewis/io#Slice">Slice</a>[Byte]
  ```
  > 
- #### write
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,32:::fn <a href="gmlewis/io#Buffer">Buffer</a>::write(self : <a href="gmlewis/io#Buffer">Buffer</a>, buf : <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  > 
- #### write\_bytes
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,48:::fn <a href="gmlewis/io#Buffer">Buffer</a>::write_bytes(self : <a href="gmlewis/io#Buffer">Buffer</a>, buf : Bytes) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  > 
- #### write\_string
  ```moonbit
  :::source,gmlewis/io/buffer.mbt,55:::fn <a href="gmlewis/io#Buffer">Buffer</a>::write_string(self : <a href="gmlewis/io#Buffer">Buffer</a>, s : String) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  > 

## Discard

```moonbit
:::source,gmlewis/io/io.mbt,672:::type Discard
```


#### mooncakes-io-method-mark-Methods
- #### write
  ```moonbit
  :::source,gmlewis/io/io.mbt,682:::fn <a href="gmlewis/io#Discard">Discard</a>::write(_self : <a href="gmlewis/io#Discard">Discard</a>, p : <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
  ```
  >  Discard implements ReaderFrom as an optimization so copy to
  > io.Discard can avoid doing unnecessary work.
  > let \_ : \&ReaderFrom = discard

## IOError

```moonbit
:::source,gmlewis/io/io.mbt,25:::pub(all) type! IOError String

```
 An IOError can be tested with equality checks.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/io/io.mbt,25:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/io#IOError">IOError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/io/io.mbt,25:::fn op_equal(<a href="gmlewis/io#IOError">IOError</a>, <a href="gmlewis/io#IOError">IOError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/io/io.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/io#IOError">IOError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/io/io.mbt,25:::fn output(<a href="gmlewis/io#IOError">IOError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## LimitedReader

```moonbit
:::source,gmlewis/io/io.mbt,452:::type LimitedReader
```
 A LimitedReader reads from R but limits the amount of
data returned to just N bytes. Each call to Read
updates N to reflect the new amount remaining.
Read returns eof when N \<= 0 or when the underlying R returns eof.

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/io/io.mbt,441:::fn <a href="gmlewis/io#LimitedReader">LimitedReader</a>::new(r : <a href="gmlewis/io#Reader">Reader</a>, n : Int64) -> <a href="gmlewis/io#LimitedReader">LimitedReader</a>
  ```
  >  LimitedReader::new returns a Reader that reads from r
  > but stops with eof after n bytes.
  > The underlying implementation is a LimitedReader.

## NopCloser

```moonbit
:::source,gmlewis/io/io.mbt,726:::type NopCloser
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/io/io.mbt,708:::fn <a href="gmlewis/io#NopCloser">NopCloser</a>::new(r : <a href="gmlewis/io#Reader">Reader</a>) -> <a href="gmlewis/io#NopCloser">NopCloser</a>
  ```
  >  NopCloser::new returns a \[ReadCloser\] with a no-op Close method wrapping
  > the provided \[Reader\] r.
  > If r implements \[WriterTo\], the returned \[ReadCloser\] will implement \[WriterTo\]
  > by forwarding calls to r.

## OffsetWriter

```moonbit
:::source,gmlewis/io/io.mbt,579:::type OffsetWriter
```
 An OffsetWriter maps writes at offset base to offset base+off in the underlying writer.

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/io/io.mbt,588:::fn <a href="gmlewis/io#OffsetWriter">OffsetWriter</a>::new(w : <a href="gmlewis/io#WriterAt">WriterAt</a>, off : Int64) -> <a href="gmlewis/io#OffsetWriter">OffsetWriter</a>
  ```
  > 

## SectionReader

```moonbit
:::source,gmlewis/io/io.mbt,492:::type SectionReader
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/io/io.mbt,473:::fn <a href="gmlewis/io#SectionReader">SectionReader</a>::new(r : <a href="gmlewis/io#ReaderAt">ReaderAt</a>, off : Int64, n : Int64) -> <a href="gmlewis/io#SectionReader">SectionReader</a>
  ```
  >  SectionReader::new returns a \[SectionReader\] that reads from r
  > starting at offset off and stops with eof after n bytes.

## Slice

```moonbit
:::source,gmlewis/io/slice.mbt,23:::type Slice
```
 A `Slice` is a slice of an `Array`.

 A separate Slice type was needed because of this issue:
https://github.com/moonbitlang/core/issues/1063

 This struct is based on MoonBit's "ArrayView" implementation here:
https://github.com/moonbitlang/core/blob/main/builtin/arrayview.mbt
which has the following copyright:

 Copyright 2024 International Digital Economy Academy

 Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/io/slice.mbt,221:::impl[X : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/io#Slice">Slice</a>[X]
  ```
  > 
  * ```moonbit
    :::source,gmlewis/io/slice.mbt,221:::fn output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="gmlewis/io#Slice">Slice</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### append
  ```moonbit
  :::source,gmlewis/io/slice.mbt,105:::fn <a href="gmlewis/io#Slice">Slice</a>::append[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], s : <a href="gmlewis/io#Slice">Slice</a>[T]) -> <a href="gmlewis/io#Slice">Slice</a>[T]
  ```
  >  append appends `s` to the end of the slice, reallocating the underlying
  > array if necessary, then returns the new slice.
- #### as\_array\_view
  ```moonbit
  :::source,gmlewis/io/slice.mbt,80:::fn <a href="gmlewis/io#Slice">Slice</a>::as_array_view[T](self : <a href="gmlewis/io#Slice">Slice</a>[T]) -> <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]
  ```
  > 
- #### cap
  ```moonbit
  :::source,gmlewis/io/slice.mbt,99:::fn <a href="gmlewis/io#Slice">Slice</a>::cap[T](self : <a href="gmlewis/io#Slice">Slice</a>[T]) -> Int
  ```
  >  cap returns the total capacity of the slice regardless of the current length.
- #### each
  ```moonbit
  :::source,gmlewis/io/slice.mbt,239:::fn <a href="gmlewis/io#Slice">Slice</a>::each[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
- #### fold
  ```moonbit
  :::source,gmlewis/io/slice.mbt,166:::fn <a href="gmlewis/io#Slice">Slice</a>::fold[A, B](self : <a href="gmlewis/io#Slice">Slice</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  >  Fold out values from an Slice according to certain rules.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].fold(init=0, fn { sum, elem => sum + elem })
  >  sum // 15
  >  ```
- #### foldi
  ```moonbit
  :::source,gmlewis/io/slice.mbt,196:::fn <a href="gmlewis/io#Slice">Slice</a>::foldi[A, B](self : <a href="gmlewis/io#Slice">Slice</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  >  Fold out values from an Slice according to certain rules with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].foldi(init=0, fn { index, sum, elem => sum + index })
  >  sum // 10
  >  ```
- #### iter
  ```moonbit
  :::source,gmlewis/io/slice.mbt,134:::fn <a href="gmlewis/io#Slice">Slice</a>::iter[A](self : <a href="gmlewis/io#Slice">Slice</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,gmlewis/io/slice.mbt,147:::fn <a href="gmlewis/io#Slice">Slice</a>::iter2[A](self : <a href="gmlewis/io#Slice">Slice</a>[A]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, A]
  ```
  > 
- #### length
  ```moonbit
  :::source,gmlewis/io/slice.mbt,30:::fn <a href="gmlewis/io#Slice">Slice</a>::length[T](self : <a href="gmlewis/io#Slice">Slice</a>[T]) -> Int
  ```
  >  length returns the length of the slice.
- #### new
  ```moonbit
  :::source,gmlewis/io/slice.mbt,67:::fn <a href="gmlewis/io#Slice">Slice</a>::new[T](buf : <a href="moonbitlang/core/array#Array">Array</a>[T], start~ : Int = .., end? : Int) -> <a href="gmlewis/io#Slice">Slice</a>[T]
  ```
  > 
- #### op\_as\_view
  ```moonbit
  :::source,gmlewis/io/slice.mbt,86:::fn <a href="gmlewis/io#Slice">Slice</a>::op_as_view[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], start~ : Int = .., end? : Int) -> <a href="gmlewis/io#Slice">Slice</a>[T]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,gmlewis/io/slice.mbt,246:::fn <a href="gmlewis/io#Slice">Slice</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="gmlewis/io#Slice">Slice</a>[T], other : <a href="gmlewis/io#Slice">Slice</a>[T]) -> Bool
  ```
  >  Compares two slices for equality.
- #### op\_get
  ```moonbit
  :::source,gmlewis/io/slice.mbt,35:::fn <a href="gmlewis/io#Slice">Slice</a>::op_get[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], index : Int) -> T
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/io/slice.mbt,45:::fn <a href="gmlewis/io#Slice">Slice</a>::op_set[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], index : Int, value : T) -> Unit
  ```
  > 
- #### push
  ```moonbit
  :::source,gmlewis/io/slice.mbt,129:::fn <a href="gmlewis/io#Slice">Slice</a>::push[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], e : T) -> <a href="gmlewis/io#Slice">Slice</a>[T]
  ```
  >  push appends `e` to the end of the slice, reallocating the underlying
  > array if necessary, then returns the new slice.
- #### rev\_fold
  ```moonbit
  :::source,gmlewis/io/slice.mbt,181:::fn <a href="gmlewis/io#Slice">Slice</a>::rev_fold[A, B](self : <a href="gmlewis/io#Slice">Slice</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  >  Fold out values from an Slice according to certain rules in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].rev_fold(init=0, fn { sum, elem => sum + elem })
  >  sum // 15
  >  ```
- #### rev\_foldi
  ```moonbit
  :::source,gmlewis/io/slice.mbt,211:::fn <a href="gmlewis/io#Slice">Slice</a>::rev_foldi[A, B](self : <a href="gmlewis/io#Slice">Slice</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  >  Fold out values from an Slice according to certain rules in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].rev_foldi(~init=0, fn { index, sum, elem => sum + index })
  >  sum // 10
  >  ```
- #### rev\_inplace
  ```moonbit
  :::source,gmlewis/io/slice.mbt,230:::fn <a href="gmlewis/io#Slice">Slice</a>::rev_inplace[T](self : <a href="gmlewis/io#Slice">Slice</a>[T]) -> Unit
  ```
  > 
- #### swap
  ```moonbit
  :::source,gmlewis/io/slice.mbt,55:::fn <a href="gmlewis/io#Slice">Slice</a>::swap[T](self : <a href="gmlewis/io#Slice">Slice</a>[T], i : Int, j : Int) -> Unit
  ```
  > 
- #### to\_bytes
  ```moonbit
  :::source,gmlewis/io/slice.mbt,261:::fn <a href="gmlewis/io#Slice">Slice</a>::to_bytes(self : <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> Bytes
  ```
  >  to\_bytes returns slice as Bytes.

## TeeReader

```moonbit
:::source,gmlewis/io/io.mbt,641:::type TeeReader
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,gmlewis/io/io.mbt,636:::fn <a href="gmlewis/io#TeeReader">TeeReader</a>::new(r : <a href="gmlewis/io#Reader">Reader</a>, w : <a href="gmlewis/io#Writer">Writer</a>) -> <a href="gmlewis/io#TeeReader">TeeReader</a>
  ```
  >  TeeReader::new returns a \[Reader\] that writes to w what it reads from r.
  > All reads from r performed through it are matched with
  > corresponding writes to w. There is no internal buffering -
  > the write must complete before the read completes.
  > Any error encountered while writing is reported as a read error.

## Whence

```moonbit
:::source,gmlewis/io/io.mbt,18:::pub(all) enum Whence {
  SeekStart
  SeekCurrent
  SeekEnd
}
```
 Seek whence values.

## copy

```moonbit
:::source,gmlewis/io/io.mbt,356:::fn copy(dst : <a href="gmlewis/io#Writer">Writer</a>, src : <a href="gmlewis/io#Reader">Reader</a>) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
```
 copy copies from src to dst until either eof is reached
on src or an error occurs. It returns the number of bytes
copied and the first error encountered while copying, if any.

 A successful copy returns err == None, not err == eof.
Because copy is defined to read from src until eof, it does
not treat an eof from Read as an error to be reported.

 If src implements \[WriterTo\],
the copy is implemented by calling src.write\_to(dst).
Otherwise, if dst implements \[ReaderFrom\],
the copy is implemented by calling dst.read\_from(src).

## copy\_buffer

```moonbit
:::source,gmlewis/io/io.mbt,367:::fn copy_buffer(dst : <a href="gmlewis/io#Writer">Writer</a>, src : <a href="gmlewis/io#Reader">Reader</a>, buf : <a href="gmlewis/io#Slice">Slice</a>[Byte]?) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
```
 copy\_buffer is identical to copy except that it stages through the
provided buffer (if one is required) rather than allocating a
temporary one. If buf is None, one is allocated; otherwise if it has
zero length, copy\_buffer panics.

 If either src implements \[WriterTo\] or dst implements \[ReaderFrom\],
buf will not be used to perform the copy.

## copy\_n

```moonbit
:::source,gmlewis/io/io.mbt,330:::fn copy_n(dst : <a href="gmlewis/io#Writer">Writer</a>, src : <a href="gmlewis/io#Reader">Reader</a>, n : Int64) -> (Int64, <a href="gmlewis/io#IOError">IOError</a>?)
```
 copy\_n copies n bytes (or until an error) from src to dst.
It returns the number of bytes copied and the earliest
error encountered while copying.
On return, written == n if and only if err == None.

 If dst implements \[ReaderFrom\], the copy is implemented using it.

## discard

```moonbit
:::source,gmlewis/io/io.mbt,663:::let discard : <a href="gmlewis/io#Discard">Discard</a>
```
 discard is a \[Writer\] on which all Write calls succeed
without doing anything.

## eof

```moonbit
:::source,gmlewis/io/io.mbt,44:::let eof : <a href="gmlewis/io#IOError">IOError</a>
```
 eof is the error returned by Read when no more input is available.
(Read must return eof itself, not an error wrapping eof,
because callers will test for eof using ==.)
Functions should return eof only to signal a graceful end of input.
If the eof occurs unexpectedly in a structured data stream,
the appropriate error is either \[err\_unexpected\_eof\] or some other error
giving more detail.

## err\_invalid\_write

```moonbit
:::source,gmlewis/io/io.mbt,32:::let err_invalid_write : <a href="gmlewis/io#IOError">IOError</a>
```
 err\_invalid\_write means that a write returned an impossible count.

## err\_no\_progress

```moonbit
:::source,gmlewis/io/io.mbt,53:::let err_no_progress : <a href="gmlewis/io#IOError">IOError</a>
```
 err\_no\_progress is returned by some clients of a \[Reader\] when
many calls to Read have failed to return any data or error,
usually the sign of a broken \[Reader\] implementation.

## err\_offset

```moonbit
:::source,gmlewis/io/io.mbt,519:::let err_offset : <a href="gmlewis/io#IOError">IOError</a>
```


## err\_short\_buffer

```moonbit
:::source,gmlewis/io/io.mbt,35:::let err_short_buffer : <a href="gmlewis/io#IOError">IOError</a>
```
 err\_short\_buffer means that a read required a longer buffer than was provided.

## err\_short\_write

```moonbit
:::source,gmlewis/io/io.mbt,29:::let err_short_write : <a href="gmlewis/io#IOError">IOError</a>
```
 err\_short\_write means that a write accepted fewer bytes than requested
but failed to return an explicit error.

## err\_unexpected\_eof

```moonbit
:::source,gmlewis/io/io.mbt,48:::let err_unexpected_eof : <a href="gmlewis/io#IOError">IOError</a>
```
 err\_unexpected\_eof means that eof was encountered in the
middle of reading a fixed-size block or data structure.

## err\_whence

```moonbit
:::source,gmlewis/io/io.mbt,516:::let err_whence : <a href="gmlewis/io#IOError">IOError</a>
```


## read\_all

```moonbit
:::source,gmlewis/io/io.mbt,756:::fn read_all(r : <a href="gmlewis/io#Reader">Reader</a>) -> (<a href="gmlewis/io#Slice">Slice</a>[Byte], <a href="gmlewis/io#IOError">IOError</a>?)
```
 read\_all reads from r until an error or eof and returns the data it read.
A successful call returns err == None, not err == eof. Because read\_all is
defined to read from src until eof, it does not treat an eof from Read
as an error to be reported.

## read\_full

```moonbit
:::source,gmlewis/io/io.mbt,320:::fn read_full(r : <a href="gmlewis/io#Reader">Reader</a>, buf : <a href="gmlewis/io#Slice">Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">IOError</a>?)
```
 read\_full reads exactly len(buf) bytes from r into buf.
It returns the number of bytes copied and an error if fewer bytes were read.
The error is eof only if no bytes were read.
If an eof happens after reading some but not all the bytes,
read\_full returns \[err\_unexpected\_eof\].
On return, n == len(buf) if and only if err == None.
If r returns an error having read at least len(buf) bytes, the error is dropped.
