# Documentation
|Trait|description|
|---|---|
|[IBinBlit](#IBinBlit)| binary blit|
|[IBinReader](#IBinReader)| binary reader|
|[IBinWriter](#IBinWriter)| binary writer|
|[IString](#IString)| utf16 string interface|

|Type|description|
|---|---|
|[BigEndian](#BigEndian)||
|[BinaryView](#BinaryView)| share memory binary|
|[BsonParser](#BsonParser)| |
|[BsonParserError](#BsonParserError)| |
|[CompValueType](#CompValueType)||
|[ConvertError](#ConvertError)||
|[KeyInfo](#KeyInfo)||
|[LittleEndian](#LittleEndian)||
|[MoonValue](#MoonValue)||
|[MsgPackParser](#MsgPackParser)| msgpack parser|
|[MsgPackParserError](#MsgPackParserError)| msgpack parse error|
|[MsgpackEncoder](#MsgpackEncoder)||
|[StringView](#StringView)| share memory string|
|[ValueData](#ValueData)| data of moonvalue|
|[IBinReader](#IBinReader)||
|[IString](#IString)||
|[MsgPackFormatCode](#MsgPackFormatCode)||

|Value|description|
|---|---|
|[utf16\_utf8](#utf16_utf8)||
|[utf8\_utf16](#utf8_utf16)||

## IBinBlit

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,714:::pub(open) trait IBinBlit : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> + <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> {
  newBlit() -> Self
  as_binwriter(Self) -> <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>
  as_binreader(Self) -> <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>
  blit(Self, Int, Self, Int, Int) -> Unit
  append_data(Self, Self) -> Unit
}
```
 binary blit

## IBinReader

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,292:::pub(open) trait IBinReader : <a href="moonbitlang/core/builtin#Show">Show</a> {
  length(Self) -> Int
  read_byte(Self, Int) -> Byte
  read_bool(Self, Int) -> Bool
  read_int16(Self, Int, Bool) -> Int
  read_int32(Self, Int, Bool) -> Int
  read_int64(Self, Int, Bool) -> Int64
  read_float(Self, Int) -> float
  read_double(Self, Int) -> Double
}
```
 binary reader

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,693:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="moonbitlang/core/array#Array">Array</a> with length(self : <a href="moonbitlang/core/array#Array">Array</a>[Byte]) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,581:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a> with length(self : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[<a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>]) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,552:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with length(self : Bytes) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,378:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="#$default_impl">$default_impl</a> with read_bool[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int) -> Bool
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,586:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a> with read_bool(self : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[<a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>], offset : Int) -> Bool
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,594:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a> with read_byte(self : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[<a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>], offset : Int) -> Byte
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,555:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with read_byte(self : Bytes, offset : Int) -> Byte
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,696:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="moonbitlang/core/array#Array">Array</a> with read_byte(self : <a href="moonbitlang/core/array#Array">Array</a>[Byte], offset : Int) -> Byte
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,329:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="#$default_impl">$default_impl</a> with read_double[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int) -> Double
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,324:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="#$default_impl">$default_impl</a> with read_float[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int) -> float
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,334:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="#$default_impl">$default_impl</a> with read_int16[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int, littleEndian : Bool) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,344:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="#$default_impl">$default_impl</a> with read_int32[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int, littleEndian : Bool) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,359:::impl <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> for <a href="#$default_impl">$default_impl</a> with read_int64[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int, littleEndian : Bool) -> Int64
  ```
  > 

## IBinWriter

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,392:::pub(open) trait IBinWriter {
  write_byte(Self, Int, Byte) -> Unit
  write_bool(Self, Int, Bool) -> Unit
  write_bytes(Self, Int, Bytes) -> Unit
  write_int16(Self, Int, Int, Bool) -> Unit
  write_int32(Self, Int, Int, Bool) -> Unit
  write_int64(Self, Int, Int64, Bool) -> Unit
  write_double(Self, Int, Double) -> Unit
  write_float(Self, Int, float) -> Unit
  append_byte(Self, Byte) -> Unit
  append_bool(Self, Bool) -> Unit
  append_int16(Self, Int, Bool) -> Unit
  append_int32(Self, Int, Bool) -> Unit
  append_int64(Self, Int64, Bool) -> Unit
  append_double(Self, Double) -> Unit
  append_float(Self, float) -> Unit
  write_utf8(Self, <a href="suiyunonghen/moonvalue#IString">IString</a>) -> Unit!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
}
```
 binary writer

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,439:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_bool[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, b : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,434:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_byte[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, b : Byte) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,502:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_double[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, value : Double) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,507:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_float[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, value : float) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,487:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_int16[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, value : Int, littleEndian : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,492:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_int32[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, value : Int, littleEndian : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,497:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with append_int64[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, value : Int64, littleEndian : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,448:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_bool[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, value : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,701:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="moonbitlang/core/array#Array">Array</a> with write_byte(self : <a href="moonbitlang/core/array#Array">Array</a>[Byte], offset : Int, byte : Byte) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,560:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with write_byte(self : Bytes, offset : Int, value : Byte) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,457:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_bytes[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, b : Bytes) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,542:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_double[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, v : Double) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,547:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_float[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, v : float) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,472:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_int16[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, value : Int, littleEndian : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,512:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_int32[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, value : Int, littleEndian : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,527:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_int64[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, offset : Int, value : Int64, littleEndian : Bool) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,412:::impl <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> for <a href="#$default_impl">$default_impl</a> with write_utf8[Self : <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a>](self : Self, str : <a href="suiyunonghen/moonvalue#IString">IString</a>) -> Unit!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
  ```
  > 

## IString

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,2:::pub(open) trait IString {
  charCodeAt(Self, Int) -> Int
  length(Self) -> Int
  to_string(Self) -> String
  to_utf8(Self) -> <a href="moonbitlang/core/array#Array">Array</a>[Byte]!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
}
```
 utf16 string interface

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,61:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="moonbitlang/core/string#String">String</a> with charCodeAt(self : String, idx : Int) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,645:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="suiyunonghen/moonvalue#StringView">StringView</a> with charCodeAt(self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[String, Bytes], index : Int) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,66:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="moonbitlang/core/string#String">String</a> with length(self : String) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,663:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="suiyunonghen/moonvalue#StringView">StringView</a> with length(self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[String, Bytes]) -> Int
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,44:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="#$default_impl">$default_impl</a> with to_string[Self : <a href="suiyunonghen/moonvalue#IString">IString</a>](self : Self) -> String
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,678:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="suiyunonghen/moonvalue#StringView">StringView</a> with to_string(self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[String, Bytes]) -> String
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,69:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="moonbitlang/core/string#String">String</a> with to_string(self : String) -> String
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,10:::impl <a href="suiyunonghen/moonvalue#IString">IString</a> for <a href="#$default_impl">$default_impl</a> with to_utf8[Self : <a href="suiyunonghen/moonvalue#IString">IString</a>](self : Self) -> <a href="moonbitlang/core/array#Array">Array</a>[Byte]!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
  ```
  > 

## BigEndian

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,182:::type BigEndian
```


#### mooncakes-io-method-mark-Methods
- #### uint16
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,185:::fn <a href="suiyunonghen/moonvalue#BigEndian">BigEndian</a>::uint16(bytes : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> UInt
  ```
  > 
- #### uint16Bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,194:::fn <a href="suiyunonghen/moonvalue#BigEndian">BigEndian</a>::uint16Bytes(v : UInt) -> Bytes
  ```
  > 
- #### uint32
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,202:::fn <a href="suiyunonghen/moonvalue#BigEndian">BigEndian</a>::uint32(bytes : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> UInt
  ```
  > 
- #### uint32Bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,220:::fn <a href="suiyunonghen/moonvalue#BigEndian">BigEndian</a>::uint32Bytes(v : UInt) -> Bytes
  ```
  > 
- #### uint64
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,230:::fn <a href="suiyunonghen/moonvalue#BigEndian">BigEndian</a>::uint64(bytes : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> UInt64
  ```
  > 
- #### uint64Bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,278:::fn <a href="suiyunonghen/moonvalue#BigEndian">BigEndian</a>::uint64Bytes(v : UInt64) -> Bytes
  ```
  > 

## BinaryView

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,565:::type BinaryView
```
 share memory binary

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,569:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a> with output[B : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### length
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,581:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::length(self : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[<a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>]) -> Int
  ```
  > 
- #### newBinaryView
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,572:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::newBinaryView[B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](src : B, from : Int, len : Int) -> <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B]
  ```
  > 
- #### output
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,569:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::output[B : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### read\_bool
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,586:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_bool(self : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[<a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>], offset : Int) -> Bool
  ```
  > 
- #### read\_byte
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,594:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_byte(self : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[<a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>], offset : Int) -> Byte
  ```
  > 
- #### read\_double
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,329:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_double[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int) -> Double
  ```
  > 
- #### read\_float
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,324:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_float[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int) -> float
  ```
  > 
- #### read\_int16
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,334:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_int16[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int, littleEndian : Bool) -> Int
  ```
  > 
- #### read\_int32
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,344:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_int32[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int, littleEndian : Bool) -> Int
  ```
  > 
- #### read\_int64
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,359:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::read_int64[Self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self, offset : Int, littleEndian : Bool) -> Int64
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,85:::fn <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## BsonParser

```moonbit
:::source,suiyunonghen/moonvalue/bson.mbt,42:::type BsonParser
```
 
 Bson parser

#### mooncakes-io-method-mark-Methods
- #### newparser\_with\_str\_array
  ```moonbit
  :::source,suiyunonghen/moonvalue/bson.mbt,569:::fn <a href="suiyunonghen/moonvalue#BsonParser">BsonParser</a>::newparser_with_str_array(shareBinary : Bool, binary : <a href="moonbitlang/core/array#Array">Array</a>[Byte]) -> <a href="suiyunonghen/moonvalue#BsonParser">BsonParser</a>[String, <a href="moonbitlang/core/array#Array">Array</a>[Byte]]
  ```
  > 
- #### newparser\_with\_str\_bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/bson.mbt,583:::fn <a href="suiyunonghen/moonvalue#BsonParser">BsonParser</a>::newparser_with_str_bytes(shareBinary : Bool, binary : Bytes) -> <a href="suiyunonghen/moonvalue#BsonParser">BsonParser</a>[String, Bytes]
  ```
  > 
- #### parse
  ```moonbit
  :::source,suiyunonghen/moonvalue/bson.mbt,67:::fn <a href="suiyunonghen/moonvalue#BsonParser">BsonParser</a>::parse[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#BsonParser">BsonParser</a>[T, B]) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]!<a href="suiyunonghen/moonvalue#BsonParserError">BsonParserError</a>
  ```
  > 

## BsonParserError

```moonbit
:::source,suiyunonghen/moonvalue/bson.mbt,31:::pub(all) enum BsonParserError {
  BsonEof
  InvalidateBsonDoc(String)
  InvalidateBsonDataType(String)
  InvalidateBsonKey(String)
  InvalidateStringValue(String)
  InvalidateBsonBin(String)
}
```
 
 msgpack parse error

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/bson.mbt,38:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/moonvalue#BsonParserError">BsonParserError</a> with output(<a href="suiyunonghen/moonvalue#BsonParserError">BsonParserError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,suiyunonghen/moonvalue/bson.mbt,38:::fn <a href="suiyunonghen/moonvalue#BsonParserError">BsonParserError</a>::output(<a href="suiyunonghen/moonvalue#BsonParserError">BsonParserError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,85:::fn <a href="suiyunonghen/moonvalue#BsonParserError">BsonParserError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## CompValueType

```moonbit
:::source,suiyunonghen/moonvalue/moonvalue.mbt,926:::pub(all) enum CompValueType {
  StrMap
  IntMap
  Array
}
```


## ConvertError

```moonbit
:::source,suiyunonghen/moonvalue/utf8.mbt,21:::pub(all) type! ConvertError String

```


## KeyInfo

```moonbit
:::source,suiyunonghen/moonvalue/msgpack.mbt,221:::type KeyInfo
```


## LittleEndian

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,72:::type LittleEndian
```


#### mooncakes-io-method-mark-Methods
- #### uint16
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,75:::fn <a href="suiyunonghen/moonvalue#LittleEndian">LittleEndian</a>::uint16(bytes : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> UInt
  ```
  > 
- #### uint16Bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,84:::fn <a href="suiyunonghen/moonvalue#LittleEndian">LittleEndian</a>::uint16Bytes(v : UInt) -> Bytes
  ```
  > 
- #### uint32
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,92:::fn <a href="suiyunonghen/moonvalue#LittleEndian">LittleEndian</a>::uint32(bytes : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> UInt
  ```
  > 
- #### uint32Bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,110:::fn <a href="suiyunonghen/moonvalue#LittleEndian">LittleEndian</a>::uint32Bytes(v : UInt) -> Bytes
  ```
  > 
- #### uint64
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,120:::fn <a href="suiyunonghen/moonvalue#LittleEndian">LittleEndian</a>::uint64(bytes : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> UInt64
  ```
  > 
- #### uint64Bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,168:::fn <a href="suiyunonghen/moonvalue#LittleEndian">LittleEndian</a>::uint64Bytes(v : UInt64) -> Bytes
  ```
  > 

## MoonValue

```moonbit
:::source,suiyunonghen/moonvalue/moonvalue.mbt,25:::type MoonValue
```


#### mooncakes-io-method-mark-Methods
- #### add\_arr\_object
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1205:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::add_arr_object[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], valueType : <a href="suiyunonghen/moonvalue#CompValueType">CompValueType</a>) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]
  ```
  > 
- #### add\_intkey\_object
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1073:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::add_intkey_object[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, valueType : <a href="suiyunonghen/moonvalue#CompValueType">CompValueType</a>) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]
  ```
  > 
- #### add\_key\_object
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,933:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::add_key_object[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, valueType : <a href="suiyunonghen/moonvalue#CompValueType">CompValueType</a>) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]
  ```
  > 
- #### as\_bool
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,408:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::as_bool[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], default~ : Bool) -> Bool
  ```
  > 
- #### as\_datetime
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,84:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::as_datetime[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], default~ : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a> = ..) -> <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>
  ```
  > 
- #### as\_double
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,59:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::as_double[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], default~ : Double = ..) -> Double
  ```
  > 
- #### as\_int
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,383:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::as_int[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], default~ : Int64 = ..) -> Int64
  ```
  > 
- #### as\_str
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,361:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::as_str[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], default~ : String) -> String
  ```
  > 
- #### as\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,345:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::as_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], default~ : T) -> T
  ```
  > 
- #### bool\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,309:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::bool_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, default : Bool) -> Bool
  ```
  > 
- #### bool\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,261:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::bool_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, default : Bool) -> Bool
  ```
  > 
- #### convert2Array
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1477:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::convert2Array[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> Unit
  ```
  > 
- #### convert2IntKV
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1411:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::convert2IntKV[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> Unit
  ```
  > 
- #### convert2KV
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1404:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::convert2KV[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> Unit
  ```
  > 
- #### datetime\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,333:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::datetime_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, default : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>) -> <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>
  ```
  > 
- #### datetime\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,285:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::datetime_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, default : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>) -> <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>
  ```
  > 
- #### double\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,321:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::double_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, default : Double) -> Double
  ```
  > 
- #### double\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,273:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::double_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, default : Double) -> Double
  ```
  > 
- #### int\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,297:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::int_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, default : Int64) -> Int64
  ```
  > 
- #### int\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,249:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::int_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, default : Int64) -> Int64
  ```
  > 
- #### iter
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1575:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::iter[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]]
  ```
  > 
  >  iterate all childs
- #### iter2
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1616:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::iter2[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[T, <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]]
  ```
  > 
  >  only iterate on map\[IString,moonvalue\]
- #### iter\_intmap\_array
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1639:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::iter_intmap_array[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int64, <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]]
  ```
  > 
  >  only iterate on arrays or intmap
- #### new\_array
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,38:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::new_array[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](arr : <a href="moonbitlang/core/array#Array">Array</a>[<a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]]) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]
  ```
  > 
- #### new\_object
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,31:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::new_object[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](data : <a href="moonbitlang/core/builtin#Map">Map</a>[T, <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]]) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,466:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::op_get[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]?
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,434:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::op_set[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, val : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> Unit
  ```
  > 
- #### parent
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,52:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::parent[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]?
  ```
  > 
- #### set\_bool
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1418:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_bool[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], value : Bool) -> Unit
  ```
  > 
- #### set\_datetime
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1461:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_datetime[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], value : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>) -> Unit
  ```
  > 
- #### set\_double
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1445:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_double[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], value : Double) -> Unit
  ```
  > 
- #### set\_float
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1453:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_float[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], value : float) -> Unit
  ```
  > 
- #### set\_index\_bin
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1279:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_bin[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : B) -> Unit
  ```
  > 
- #### set\_index\_bool
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1364:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_bool[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : Bool) -> Unit
  ```
  > 
- #### set\_index\_datetime
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1313:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_datetime[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>) -> Unit
  ```
  > 
- #### set\_index\_double
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1347:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_double[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : Double) -> Unit
  ```
  > 
- #### set\_index\_ext
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,683:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_ext[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : B, extType : Int) -> Unit
  ```
  > 
- #### set\_index\_float
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1330:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_float[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : float) -> Unit
  ```
  > 
- #### set\_index\_int64
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1387:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_int64[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : Int64) -> Unit
  ```
  > 
- #### set\_index\_share\_bin
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1296:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_share_bin[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B]) -> Unit
  ```
  > 
- #### set\_index\_share\_ext
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,701:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_share_ext[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B], extType : Int) -> Unit
  ```
  > 
- #### set\_index\_share\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1262:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_share_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B]) -> Unit
  ```
  > 
- #### set\_index\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1245:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_index_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, v : T) -> Unit
  ```
  > 
- #### set\_int
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1430:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_int[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], value : Int64) -> Unit
  ```
  > 
- #### set\_intkey\_bin
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,735:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_bin[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : B) -> Unit
  ```
  > 
- #### set\_intkey\_bool
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,865:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_bool[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : Bool) -> Unit
  ```
  > 
- #### set\_intkey\_datetime
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,767:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_datetime[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>) -> Unit
  ```
  > 
- #### set\_intkey\_double
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,783:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_double[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : Double) -> Unit
  ```
  > 
- #### set\_intkey\_ext
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,644:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_ext[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : B, extType : Int) -> Unit
  ```
  > 
- #### set\_intkey\_float
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,719:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_float[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : float) -> Unit
  ```
  > 
- #### set\_intkey\_int64
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,894:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_int64[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : Int64) -> Unit
  ```
  > 
- #### set\_intkey\_share\_bin
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,751:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_share_bin[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B]) -> Unit
  ```
  > 
- #### set\_intkey\_share\_ext
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,662:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_share_ext[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B], extType : Int) -> Unit
  ```
  > 
- #### set\_intkey\_share\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,848:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_share_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B]) -> Unit
  ```
  > 
- #### set\_intkey\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,832:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_intkey_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : Int64, v : T) -> Unit
  ```
  > 
- #### set\_key\_bin
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,557:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_bin[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : B) -> Unit
  ```
  > 
- #### set\_key\_bool
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,496:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_bool[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, bool : Bool) -> Unit
  ```
  > 
- #### set\_key\_datetime
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,589:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_datetime[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : <a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>) -> Unit
  ```
  > 
- #### set\_key\_double
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,541:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_double[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : Double) -> Unit
  ```
  > 
- #### set\_key\_ext
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,605:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_ext[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : B, extType : Int) -> Unit
  ```
  > 
- #### set\_key\_float
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,525:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_float[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : float) -> Unit
  ```
  > 
- #### set\_key\_int
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,487:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_int[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : Int) -> Unit
  ```
  > 
- #### set\_key\_int64
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,910:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_int64[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : Int64) -> Unit
  ```
  > 
- #### set\_key\_share\_bin
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,573:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_share_bin[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B]) -> Unit
  ```
  > 
- #### set\_key\_share\_ext
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,623:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_share_ext[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : <a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B], extType : Int) -> Unit
  ```
  > 
- #### set\_key\_share\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,815:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_share_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B]) -> Unit
  ```
  > 
- #### set\_key\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,799:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_key_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, v : T) -> Unit
  ```
  > 
- #### set\_nil
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1438:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_nil[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> Unit
  ```
  > 
- #### set\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1469:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::set_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], value : T) -> Unit
  ```
  > 
- #### str\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,201:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::str_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, default : String) -> String
  ```
  > 
- #### str\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,174:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::str_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, default : String) -> String
  ```
  > 
- #### string\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,228:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::string_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int, default : T) -> T
  ```
  > 
- #### string\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,153:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::string_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T, default : T) -> T
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,1494:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::to_string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> String
  ```
  > 
- #### value
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,45:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::value[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> <a href="suiyunonghen/moonvalue#ValueData">ValueData</a>[T, B]
  ```
  > 
- #### value\_by\_index
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,136:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::value_by_index[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], index : Int) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]?
  ```
  > 
- #### value\_by\_key
  ```moonbit
  :::source,suiyunonghen/moonvalue/moonvalue.mbt,110:::fn <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>::value_by_key[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B], key : T) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]?
  ```
  > 

## MsgPackParser

```moonbit
:::source,suiyunonghen/moonvalue/msgpack.mbt,43:::type MsgPackParser
```
 msgpack parser

#### mooncakes-io-method-mark-Methods
- #### newparser\_with\_str\_array
  ```moonbit
  :::source,suiyunonghen/moonvalue/msgpack.mbt,716:::fn <a href="suiyunonghen/moonvalue#MsgPackParser">MsgPackParser</a>::newparser_with_str_array(shareBinary : Bool, binary : <a href="moonbitlang/core/array#Array">Array</a>[Byte]) -> <a href="suiyunonghen/moonvalue#MsgPackParser">MsgPackParser</a>[String, <a href="moonbitlang/core/array#Array">Array</a>[Byte]]
  ```
  > 
- #### newparser\_with\_str\_bytes
  ```moonbit
  :::source,suiyunonghen/moonvalue/msgpack.mbt,773:::fn <a href="suiyunonghen/moonvalue#MsgPackParser">MsgPackParser</a>::newparser_with_str_bytes(shareBinary : Bool, binary : Bytes) -> <a href="suiyunonghen/moonvalue#MsgPackParser">MsgPackParser</a>[String, Bytes]
  ```
  > 
- #### parse
  ```moonbit
  :::source,suiyunonghen/moonvalue/msgpack.mbt,214:::fn <a href="suiyunonghen/moonvalue#MsgPackParser">MsgPackParser</a>::parse[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MsgPackParser">MsgPackParser</a>[T, B]) -> <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]!<a href="suiyunonghen/moonvalue#MsgPackParserError">MsgPackParserError</a>
  ```
  >  parse msgpack

## MsgPackParserError

```moonbit
:::source,suiyunonghen/moonvalue/msgpack.mbt,228:::pub(all) enum MsgPackParserError {
  InvalidateMsgPackMapType(String)
  ErrorUtf8String(String)
  ErrorExtError(String)
  ErrorKey(String)
  ErrorIntKey(String)
}
```
 msgpack parse error

## MsgpackEncoder

```moonbit
:::source,suiyunonghen/moonvalue/msgpack.mbt,787:::type MsgpackEncoder
```


#### mooncakes-io-method-mark-Methods
- #### encode
  ```moonbit
  :::source,suiyunonghen/moonvalue/msgpack.mbt,1027:::fn <a href="suiyunonghen/moonvalue#MsgpackEncoder">MsgpackEncoder</a>::encode[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinBlit">IBinBlit</a> + <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> + <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#MsgpackEncoder">MsgpackEncoder</a>[B], value : <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,suiyunonghen/moonvalue/msgpack.mbt,792:::fn <a href="suiyunonghen/moonvalue#MsgpackEncoder">MsgpackEncoder</a>::new[B : <a href="suiyunonghen/moonvalue#IBinBlit">IBinBlit</a> + <a href="suiyunonghen/moonvalue#IBinWriter">IBinWriter</a> + <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](writer : B) -> <a href="suiyunonghen/moonvalue#MsgpackEncoder">MsgpackEncoder</a>[B]
  ```
  > 

## StringView

```moonbit
:::source,suiyunonghen/moonvalue/traits.mbt,602:::type StringView
```
 share memory string

#### mooncakes-io-method-mark-Methods
- #### charCodeAt
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,645:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::charCodeAt(self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[String, Bytes], index : Int) -> Int
  ```
  > 
- #### length
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,663:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::length(self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[String, Bytes]) -> Int
  ```
  > 
- #### newStringView
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,611:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::newStringView[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](source : B, from : Int, len : Int, stringReader : (B, Int, Int) -> T!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>) -> <a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B]
  ```
  > 
- #### string
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,631:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::string[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B]) -> String
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,678:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::to_string(self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[String, Bytes]) -> String
  ```
  > 
- #### to\_utf8
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,10:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::to_utf8[Self : <a href="suiyunonghen/moonvalue#IString">IString</a>](self : Self) -> <a href="moonbitlang/core/array#Array">Array</a>[Byte]!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
  ```
  > 
- #### value
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,621:::fn <a href="suiyunonghen/moonvalue#StringView">StringView</a>::value[T : <a href="suiyunonghen/moonvalue#IString">IString</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B]) -> T!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
  ```
  > 

## ValueData

```moonbit
:::source,suiyunonghen/moonvalue/moonvalue.mbt,5:::pub(all) enum ValueData {
  VT_Null
  VT_True
  VT_False
  VT_Int(Int64)
  VT_Double(Double)
  VT_DateTime(<a href="suiyunonghen/datetime#DateTime">@suiyunonghen/datetime.DateTime</a>)
  VT_Float(float)
  VT_String(T)
  VT_ShareString(<a href="suiyunonghen/moonvalue#StringView">StringView</a>[T, B])
  VT_Bin(B)
  VT_ShareBin(<a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B])
  VT_Ext(B, Int)
  VT_ShareExt(<a href="suiyunonghen/moonvalue#BinaryView">BinaryView</a>[B], Int)
  VT_Obj(<a href="moonbitlang/core/builtin#Map">Map</a>[T, <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]])
  VT_Array(<a href="moonbitlang/core/array#Array">Array</a>[<a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]])
  VT_IntKeyObj(<a href="moonbitlang/core/builtin#Map">Map</a>[Int64, <a href="suiyunonghen/moonvalue#MoonValue">MoonValue</a>[T, B]])
}
```
 data of moonvalue

## utf16\_utf8

```moonbit
:::source,suiyunonghen/moonvalue/utf8.mbt,24:::fn utf16_utf8(str : String) -> <a href="moonbitlang/core/array#Array">Array</a>[Byte]!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
```


## utf8\_utf16

```moonbit
:::source,suiyunonghen/moonvalue/utf8.mbt,47:::fn utf8_utf16(utf8Arr : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[Byte]) -> String!<a href="suiyunonghen/moonvalue#ConvertError">ConvertError</a>
```


## IBinReader


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,304:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a> with output(self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### op\_get
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,383:::fn <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>::op_get(self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>, offset : Int) -> Byte
  ```
  > 
- #### output
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,304:::fn <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>::output(self : <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,85:::fn <a href="suiyunonghen/moonvalue#IBinReader">IBinReader</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IString


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,39:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="suiyunonghen/moonvalue#IString">IString</a> with hash_combine(self : <a href="suiyunonghen/moonvalue#IString">IString</a>, hash : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,34:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="suiyunonghen/moonvalue#IString">IString</a> with op_equal(self : <a href="suiyunonghen/moonvalue#IString">IString</a>, other : <a href="suiyunonghen/moonvalue#IString">IString</a>) -> Bool
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### hash
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,40:::fn <a href="suiyunonghen/moonvalue#IString">IString</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,39:::fn <a href="suiyunonghen/moonvalue#IString">IString</a>::hash_combine(self : <a href="suiyunonghen/moonvalue#IString">IString</a>, hash : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,34:::fn <a href="suiyunonghen/moonvalue#IString">IString</a>::op_equal(self : <a href="suiyunonghen/moonvalue#IString">IString</a>, other : <a href="suiyunonghen/moonvalue#IString">IString</a>) -> Bool
  ```
  > 

## MsgPackFormatCode


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/moonvalue/traits.mbt,85:::fn <a href="suiyunonghen/moonvalue#MsgPackFormatCode">MsgPackFormatCode</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
