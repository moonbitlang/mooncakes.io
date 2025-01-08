# Documentation
|Type|description|
|---|---|
|[DecodeError](#DecodeError)||
|[Encoding](#Encoding)||
|[LossyChars](#LossyChars)||
|[StrictChars](#StrictChars)||

|Value|description|
|---|---|
|[decode\_lossy](#decode_lossy)||
|[decode\_strict](#decode_strict)||
|[encode](#encode)||
|[to\_utf16\_bytes](#to_utf16_bytes)||
|[to\_utf16be\_bytes](#to_utf16be_bytes)||
|[to\_utf16le\_bytes](#to_utf16le_bytes)||
|[to\_utf8\_bytes](#to_utf8_bytes)||
|[write\_utf16\_char](#write_utf16_char)||
|[write\_utf16be\_char](#write_utf16be_char)||
|[write\_utf16le\_char](#write_utf16le_char)||
|[write\_utf8\_char](#write_utf8_char)||

## DecodeError

```moonbit
:::source,moonbitlang/x/encoding/types.mbt,138:::pub(all) type! DecodeError Bytes

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,141:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/encoding#DecodeError">DecodeError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/encoding/types.mbt,141:::fn output(self : <a href="moonbitlang/x/encoding#DecodeError">DecodeError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## Encoding

```moonbit
:::source,moonbitlang/x/encoding/types.mbt,19:::pub(all) enum Encoding {
  UTF8
  UTF16
  UTF16LE
  UTF16BE
}
```


## LossyChars

```moonbit
:::source,moonbitlang/x/encoding/types.mbt,100:::type LossyChars
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,130:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/encoding/types.mbt,130:::fn output(self : <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### iter
  ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,103:::fn <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>::iter(self : <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,124:::fn <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>::to_string(self : <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>) -> String
  ```
  > 

## StrictChars

```moonbit
:::source,moonbitlang/x/encoding/types.mbt,135:::type StrictChars
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,182:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/encoding/types.mbt,182:::fn output(self : <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### iter
  ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,148:::fn <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>::iter(self : <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/core/result#Result">Result</a>[Char, <a href="moonbitlang/x/encoding#DecodeError">DecodeError</a>]]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/encoding/types.mbt,170:::fn <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>::to_string(self : <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>) -> String!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 

## decode\_lossy

```moonbit
:::source,moonbitlang/x/encoding/decoding.mbt,60:::fn decode_lossy(encoding : <a href="moonbitlang/x/encoding#Encoding">Encoding</a>, src : Bytes) -> <a href="moonbitlang/x/encoding#LossyChars">LossyChars</a>
```

 Decodes bytes from a specified encoding into lossily decoded characters.

 #### Parameters
 - `encoding`: The character encoding of the input `bytes`.
 - `src`: A `bytes` representing the encoded string in the specified format.

 #### Returns

 A `LossyChars` iterator representing the decoded characters, with invalid byte sequences replaced by a replacement character.

 #### Behavior

 - Any invalid sequences in the `bytes` are replaced with a replacement character (`\u{FFFD}`), preventing decoding errors.

 #### Examples

 ```moonbit
 let buf = @buffer.T::new(size_hint=10)
 buf.write_bytes(b"\xe4\xbd\xa0") // "你" in UTF8
 buf.write_bytes(b"\xe5\xa5\xbd") // "好" in UTF8
 buf.write_bytes(b"\xf0\x9f\x91\x80") // "👀" in UTF8
 let chars = @encoding.decode_lossy(UTF8, buf.to_bytes())
 let arr = chars.iter().collect() // Array of unicode point code: `['你', '好', '👀']`
 let str = String::from_array(arr) // MoonBit String, representing as UTF16LE: `"你好👀"`
 // or
 let str = chars.to_string()
 ```

## decode\_strict

```moonbit
:::source,moonbitlang/x/encoding/decoding.mbt,92:::fn decode_strict(encoding : <a href="moonbitlang/x/encoding#Encoding">Encoding</a>, src : Bytes) -> <a href="moonbitlang/x/encoding#StrictChars">StrictChars</a>
```

 Decodes bytes from a specified encoding into strictly decoded characters.

 #### Parameters

 - `encoding`: The character encoding of the input `bytes`.
 - `src`: A `bytes` representing the encoded string in the specified format.

 #### Returns

 A `StrictChars` iterator representing the decoded characters.

 #### Behavior

 - Assumes all sequences in the `bytes` are valid and will raise errors if invalid sequences are encountered.

 #### Examples

 ```moonbit
 let buf = @buffer.T::new(size_hint=10)
 buf.write_bytes(b"\xe4\xbd\xa0") // "你" in UTF8
 buf.write_bytes(b"\xe5\xa5\xbd") // "好" in UTF8
 buf.write_bytes(b"\xf0\x9f\x91\x80") // "👀" in UTF8
 let chars = @encoding.decode_strict(UTF8, buf.to_bytes())
 let arr = chars.iter().collect() // Array of unicode point code: `[Ok('你'), Ok('好'), Ok('👀')]`
 let str = chars.to_string() // MoonBit String, representing as UTF16LE: `"你好👀"`
 ```

## encode

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,33:::fn encode(encoding : <a href="moonbitlang/x/encoding#Encoding">Encoding</a>, src : String) -> Bytes
```

 Encode a given string to the specified character encoding and returns the resulting bytes.

 #### Parameters

 - `encoding` : The target encoding format.
 - `src`: The input string to be encoded.

 #### Returns

 A `bytes` representing the encoded string in the selected format.

 #### Examples

 ```moonbit
 let src = "Hello, World!"
 let encoded_bytes = encode(UTF8, src)
 ```

## to\_utf16\_bytes

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,70:::fn to_utf16_bytes(value : Char) -> Bytes
```

 Converts a Char to UTF-16LE bytes.

 Alias for `to_utf16le_bytes`.

 Note that this function incurs allocation overhead
due to the intermediate creation of new buffers.

## to\_utf16be\_bytes

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,90:::fn to_utf16be_bytes(value : Char) -> Bytes
```

 Converts a Char to UTF-16BE bytes.

 Note that this function incurs allocation overhead
due to the intermediate creation of new buffers.

## to\_utf16le\_bytes

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,79:::fn to_utf16le_bytes(value : Char) -> Bytes
```

 Converts a Char to UTF-16LE bytes.

 Note that this function incurs allocation overhead
due to the intermediate creation of new buffers.

## to\_utf8\_bytes

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,57:::fn to_utf8_bytes(value : Char) -> Bytes
```

 Converts a Char to UTF-8 bytes.

 Note that this function incurs allocation overhead
due to the intermediate creation of new buffers.

## write\_utf16\_char

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,136:::fn write_utf16_char(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, value : Char) -> Unit
```

 Write a char into buffer as UTF16LE.
Alias for `write_utf16le_char`

## write\_utf16be\_char

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,168:::fn write_utf16be_char(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, value : Char) -> Unit
```

 Write a char into buffer as UTF16BE.

## write\_utf16le\_char

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,142:::fn write_utf16le_char(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, value : Char) -> Unit
```

 Write a char into buffer as UTF16LE.

## write\_utf8\_char

```moonbit
:::source,moonbitlang/x/encoding/encoding.mbt,98:::fn write_utf8_char(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, value : Char) -> Unit
```

 Write a char into buffer as UTF8.
