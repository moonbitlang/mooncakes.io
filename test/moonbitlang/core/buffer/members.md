# Documentation
|Type|description|
|---|---|
|[T](#T)||
|[Buffer](#Buffer)| Extensible buffer.|

## T

```moonbit
:::source,moonbitlang/core/buffer/buffer.mbt,35:::type T
```

 Extensible buffer.

 It provides accumulative concatenation of bytes in linear time.
The capacity of buffer will automatically expand as necessary.

 Note: StringBuilder is recommended for string concatenation in favor of
Buffer, since it is optimized for all targets.
 #### Usage

 ```
 let buf = @buffer.new(size_hint=100)
 buf.write_string("Tes")
 buf.write_char('t')
 assert_eq!(buf.to_unchecked_string(), "Test")
 ```

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,229:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/buffer#T">T</a> with output(self : <a href="moonbitlang/core/buffer#T">T</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### contents
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,76:::fn <a href="moonbitlang/core/buffer#T">T</a>::contents(self : <a href="moonbitlang/core/buffer#T">T</a>) -> Bytes
  ```
  >  Return the contents of the buffer as a Bytes.
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,71:::fn <a href="moonbitlang/core/buffer#T">T</a>::is_empty(self : <a href="moonbitlang/core/buffer#T">T</a>) -> Bool
  ```
  > 
  >  Return whether the given buffer is empty.
- #### length
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,65:::fn <a href="moonbitlang/core/buffer#T">T</a>::length(self : <a href="moonbitlang/core/buffer#T">T</a>) -> Int
  ```
  > 
  >  Return the given buffer's length in bytes.
- #### new
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,81:::fn <a href="moonbitlang/core/buffer#T">T</a>::new(size_hint~ : Int = ..) -> <a href="moonbitlang/core/buffer#T">T</a>
  ```
  >  Create a buffer with initial capacity (in bytes).
- #### output
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,229:::fn <a href="moonbitlang/core/buffer#T">T</a>::output(self : <a href="moonbitlang/core/buffer#T">T</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### reset
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,218:::fn <a href="moonbitlang/core/buffer#T">T</a>::reset(self : <a href="moonbitlang/core/buffer#T">T</a>) -> Unit
  ```
  > 
- #### to\_bytes
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,224:::fn <a href="moonbitlang/core/buffer#T">T</a>::to_bytes(self : <a href="moonbitlang/core/buffer#T">T</a>) -> Bytes
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/buffer/deprecated.mbt,19:::fn <a href="moonbitlang/core/buffer#T">T</a>::to_string(self : <a href="moonbitlang/core/buffer#T">T</a>) -> String
  ```
  > 
  >  Return a new string contains the data in buffer.
  >  
  >  @alert deprecated "Use `Buffer::contents` to read the contents of the buffer"
- #### to\_unchecked\_string
  ```moonbit
  :::source,moonbitlang/core/buffer/deprecated.mbt,29:::fn <a href="moonbitlang/core/buffer#T">T</a>::to_unchecked_string(self : <a href="moonbitlang/core/buffer#T">T</a>) -> String
  ```
  > 
  >  Return a new unchecked string contains the data in buffer.
  > Note this function does not validate the encoding of the byte sequence,
  > it simply copy the bytes into a new String.
  >  
  >  @alert deprecated "Use `Buffer::contents` to read the contents of the buffer"
- #### write\_byte
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,211:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_byte(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Byte) -> Unit
  ```
  > 
  >  Write a byte into buffer.
- #### write\_bytes
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,180:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_bytes(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Bytes) -> Unit
  ```
  > 
- #### write\_char
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,203:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_char(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Char) -> Unit
  ```
  > 
  >  Write a char into buffer.
- #### write\_double\_be
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,155:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_double_be(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Double) -> Unit
  ```
  >  Write a Double into buffer in big endian format.
- #### write\_double\_le
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,160:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_double_le(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Double) -> Unit
  ```
  >  Write a Double into buffer in little endian format.
- #### write\_float\_be
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,165:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_float_be(self : <a href="moonbitlang/core/buffer#T">T</a>, value : float) -> Unit
  ```
  >  Write a Float into buffer in big endian format.
- #### write\_float\_le
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,170:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_float_le(self : <a href="moonbitlang/core/buffer#T">T</a>, value : float) -> Unit
  ```
  >  Write a Float into buffer in little endian format.
- #### write\_int64\_be
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,119:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_int64_be(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Int64) -> Unit
  ```
  >  Write an Int64 into buffer in big endian format.
- #### write\_int64\_le
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,124:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_int64_le(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Int64) -> Unit
  ```
  >  Write an Int64 into buffer in little endian format.
- #### write\_int\_be
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,145:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_int_be(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Int) -> Unit
  ```
  >  Write an Int into buffer in big endian format.
- #### write\_int\_le
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,150:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_int_le(self : <a href="moonbitlang/core/buffer#T">T</a>, value : Int) -> Unit
  ```
  >  Write an Int into buffer in little endian format.
- #### write\_object
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,175:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_object(self : <a href="moonbitlang/core/buffer#T">T</a>, value : <a href="moonbitlang/core/builtin#Show">Show</a>) -> Unit
  ```
  > 
- #### write\_string
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,88:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_string(self : <a href="moonbitlang/core/buffer#T">T</a>, value : String) -> Unit
  ```
  >  Write a string into buffer in little endian format.
- #### write\_sub\_string
  ```moonbit
  :::source,moonbitlang/core/buffer/deprecated.mbt,36:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_sub_string(self : <a href="moonbitlang/core/buffer#T">T</a>, value : String, start : Int, len : Int) -> Unit
  ```
  > 
  >  Write a sub-string into buffer.
  > @alert deprecated "Use `Buffer::write_substring` instead"
- #### write\_substring
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,189:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_substring(self : <a href="moonbitlang/core/buffer#T">T</a>, value : String, start : Int, len : Int) -> Unit
  ```
  > 
  >  Write a sub-string into buffer.
- #### write\_uint64\_be
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,95:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_uint64_be(self : <a href="moonbitlang/core/buffer#T">T</a>, value : UInt64) -> Unit
  ```
  >  Write an UInt64 into buffer in big endian format.
- #### write\_uint64\_le
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,107:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_uint64_le(self : <a href="moonbitlang/core/buffer#T">T</a>, value : UInt64) -> Unit
  ```
  >  Write a UInt64 into buffer in little endian format.
- #### write\_uint\_be
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,129:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_uint_be(self : <a href="moonbitlang/core/buffer#T">T</a>, value : UInt) -> Unit
  ```
  >  Write an UInt into buffer in big endian format.
- #### write\_uint\_le
  ```moonbit
  :::source,moonbitlang/core/buffer/buffer.mbt,137:::fn <a href="moonbitlang/core/buffer#T">T</a>::write_uint_le(self : <a href="moonbitlang/core/buffer#T">T</a>, value : UInt) -> Unit
  ```
  >  Write an UInt into buffer in little endian format.

## Buffer

```moonbit
:::source,moonbitlang/core/buffer/buffer.mbt,17:::type Buffer = <a href="moonbitlang/core/buffer#T">T</a>
```
 Extensible buffer.
@alert deprecated "Use type `T` instead"
