# Documentation
|Type|description|
|---|---|
|[BytesLenErr](#BytesLenErr)| Error type for Chungshan contains a Int indicating an incorrect bytes array length|

|Value|description|
|---|---|
|[byte\_array\_to\_double](#byte_array_to_double)| Convert a 8 bytes long FixedArray\[Byte\] into an Double \*\*with\* a length check.|
|[byte\_array\_to\_double\_raw](#byte_array_to_double_raw)| Convert a 8 bytes long FixedArray\[Byte\] into an Double \*\*without\*\* a length check.|
|[byte\_array\_to\_float](#byte_array_to_float)| Convert a 4 bytes long FixedArray\[Byte\] into an Float \*\*with\*\* a length check.|
|[byte\_array\_to\_float\_raw](#byte_array_to_float_raw)| Convert a 4 bytes long FixedArray\[Byte\] into an Float \*\*without\*\* a length check.|
|[byte\_array\_to\_int](#byte_array_to_int)| Convert a 4 bytes long FixedArray\[Byte\] into an Int \*\*with\*\* a length check.|
|[byte\_array\_to\_int64](#byte_array_to_int64)| Convert a 8 bytes long FixedArray\[Byte\] into an Int64 \*\*with\* a length check.|
|[byte\_array\_to\_int64\_raw](#byte_array_to_int64_raw)| Convert a 8 bytes long FixedArray\[Byte\] into an Int64 \*\*without\*\* a length check.|
|[byte\_array\_to\_int\_raw](#byte_array_to_int_raw)| Convert a 4 bytes long FixedArray\[Byte\] into an Int \*\*without\*\* a length check.|
|[byte\_array\_to\_uint](#byte_array_to_uint)| Convert a 4 bytes long FixedArray\[Byte\] into an UInt \*\*with\*\* a length check.|
|[byte\_array\_to\_uint64](#byte_array_to_uint64)| Convert a 8 bytes long FixedArray\[Byte\] into an UInt64 \*\*with\* a length check.|
|[byte\_array\_to\_uint64\_raw](#byte_array_to_uint64_raw)| Convert a 8 bytes long FixedArray\[Byte\] into an UInt64 \*\*without\*\* a length check.|
|[byte\_array\_to\_uint\_raw](#byte_array_to_uint_raw)| Convert a 4 bytes long FixedArray\[Byte\] into an UInt \*\*without\*\* a length check.|
|[double\_to\_byte\_array](#double_to_byte_array)| Convert a Double into a 8 bytes long FixedArray\[Byte\]|
|[float\_to\_byte\_array](#float_to_byte_array)| Convert a Float into a 4 bytes long FixedArray\[Byte\]|
|[int64\_to\_byte\_array](#int64_to_byte_array)| Convert an Int64 into a 8 bytes long FixedArray\[Byte\].|
|[int\_to\_byte\_array](#int_to_byte_array)| Convert an Int into a 4 bytes long FixedArray\[Byte\].|
|[uint64\_to\_byte\_array](#uint64_to_byte_array)| Convert an UInt64 into a 8 bytes long FixedArray\[Byte\].|
|[uint\_to\_byte\_array](#uint_to_byte_array)| Convert an UInt into a 4 bytes long FixedArray\[Byte\].|

## BytesLenErr

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,2:::type BytesLenErr
```
 Error type for Chungshan contains a Int indicating an incorrect bytes array length

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,2:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a> with output(<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,2:::fn <a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>::output(<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,SyoujyoujiNaiki/chungshan/lib/traits.mbt,85:::fn <a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## byte\_array\_to\_double

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,151:::fn byte_array_to_double(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Double!<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>
```
 Convert a 8 bytes long FixedArray\[Byte\] into an Double \**with* a length check.
The result is either an Double or an BytesLenErr which requires error handling.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_double
 ```

## byte\_array\_to\_double\_raw

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,167:::fn byte_array_to_double_raw(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Double
```
 Convert a 8 bytes long FixedArray\[Byte\] into an Double **without** a length check.
This function does not check the input so take the risk at your own.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_double_raw
 ```

## byte\_array\_to\_float

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,190:::fn byte_array_to_float(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> float!<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>
```
 Convert a 4 bytes long FixedArray\[Byte\] into an Float **with** a length check.
The result is either an Float or an BytesLenErr which requires error handling.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_float
 ```

## byte\_array\_to\_float\_raw

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,206:::fn byte_array_to_float_raw(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> float
```
 Convert a 4 bytes long FixedArray\[Byte\] into an Float **without** a length check.
This function does not check the input so take the risk at your own.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_float_raw
 ```

## byte\_array\_to\_int

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,229:::fn byte_array_to_int(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Int!<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>
```
 Convert a 4 bytes long FixedArray\[Byte\] into an Int **with** a length check.
The result is either an Int or an BytesLenErr which requires error handling.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_int
 ```

## byte\_array\_to\_int64

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,268:::fn byte_array_to_int64(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Int64!<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>
```
 Convert a 8 bytes long FixedArray\[Byte\] into an Int64 \**with* a length check.
The result is either an Int64 or an BytesLenErr which requires error handling.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_int64
 ```

## byte\_array\_to\_int64\_raw

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,284:::fn byte_array_to_int64_raw(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Int64
```
 Convert a 8 bytes long FixedArray\[Byte\] into an Int64 **without** a length check.
This function does not check the input so take the risk at your own.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_int64_raw
 ```

## byte\_array\_to\_int\_raw

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,245:::fn byte_array_to_int_raw(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Int
```
 Convert a 4 bytes long FixedArray\[Byte\] into an Int **without** a length check.
This function does not check the input so take the risk at your own.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_int_raw
 ```

## byte\_array\_to\_uint

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,104:::fn byte_array_to_uint(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> UInt!<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>
```
 Convert a 4 bytes long FixedArray\[Byte\] into an UInt **with** a length check.
The result is either an UInt or an BytesLenErr which requires error handling.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_uint
 ```

## byte\_array\_to\_uint64

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,31:::fn byte_array_to_uint64(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> UInt64!<a href="SyoujyoujiNaiki/chungshan/lib#BytesLenErr">BytesLenErr</a>
```
 Convert a 8 bytes long FixedArray\[Byte\] into an UInt64 \**with* a length check.
The result is either an UInt64 or an BytesLenErr which requires error handling.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_uint64
 ```

## byte\_array\_to\_uint64\_raw

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,62:::fn byte_array_to_uint64_raw(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> UInt64
```
 Convert a 8 bytes long FixedArray\[Byte\] into an UInt64 **without** a length check.
This function does not check the input so take the risk at your own.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_uint64_raw
 ```

## byte\_array\_to\_uint\_raw

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,124:::fn byte_array_to_uint_raw(bs : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> UInt
```
 Convert a 4 bytes long FixedArray\[Byte\] into an UInt **without** a length check.
This function does not check the input so take the risk at your own.
 
 #### Example
 
 ```
 [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_uint_raw
 ```

## double\_to\_byte\_array

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,139:::fn double_to_byte_array(f : Double) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Convert a Double into a 8 bytes long FixedArray\[Byte\]
 
 #### Example
 
 ```
 double_number |> double_to_byte_array
 ```

## float\_to\_byte\_array

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,178:::fn float_to_byte_array(f : float) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Convert a Float into a 4 bytes long FixedArray\[Byte\]
 
 #### Example
 
 ```
 float_number |> float_to_byte_array
 ```

## int64\_to\_byte\_array

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,256:::fn int64_to_byte_array(i : Int64) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Convert an Int64 into a 8 bytes long FixedArray\[Byte\].
 
 #### Example
 
 ```
 int64_number |> int64_to_byte_array
 ```

## int\_to\_byte\_array

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,217:::fn int_to_byte_array(i : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Convert an Int into a 4 bytes long FixedArray\[Byte\].
 
 #### Example
 
 ```
 int_number |> int_to_byte_array
 ```

## uint64\_to\_byte\_array

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,11:::fn uint64_to_byte_array(i : UInt64) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Convert an UInt64 into a 8 bytes long FixedArray\[Byte\].
 
 #### Example
 
 ```
 uint64_number |> uint64_to_byte_array
 ```

## uint\_to\_byte\_array

```moonbit
:::source,SyoujyoujiNaiki/chungshan/lib/chungshan.mbt,88:::fn uint_to_byte_array(i : UInt) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Convert an UInt into a 4 bytes long FixedArray\[Byte\].
 
 #### Example
 
 ```
 uint_number |> uint_to_byte_array
 ```
