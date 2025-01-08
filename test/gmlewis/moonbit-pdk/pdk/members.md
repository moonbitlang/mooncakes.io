# Documentation
|Trait|description|
|---|---|
|[@gmlewis/moonbit-pdk/pdk.ToUtf16](#@gmlewis/moonbit-pdk/pdk.ToUtf16)| ToUtf16 is a workaround since the standard library does not make|
|[@gmlewis/moonbit-pdk/pdk.ToUtf8](#@gmlewis/moonbit-pdk/pdk.ToUtf8)| ToUtf8 is a workaround since the standard library does not make|

## @gmlewis/moonbit-pdk/pdk.ToUtf16

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/string.mbt,23:::pub(open) trait @gmlewis/moonbit-pdk/pdk.ToUtf16 {
  to_utf16(Self) -> String
}
```
 ToUtf16 is a workaround since the standard library does not make
it easy to write a standard UTF-16 string from UTF-8.
https://github.com/moonbitlang/core/issues/484

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/string.mbt,28:::impl <a href="gmlewis/moonbit-pdk/pdk#ToUtf16">ToUtf16</a> for Bytes
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/string.mbt,28:::fn to_utf16(b : Bytes) -> String
    ```
    >  `to_utf16` converts a UTF-8 encoded `Bytes` to a MoonBit (UTF-16) `String`.

## @gmlewis/moonbit-pdk/pdk.ToUtf8

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/string.mbt,4:::pub(open) trait @gmlewis/moonbit-pdk/pdk.ToUtf8 {
  to_utf8(Self) -> Bytes
}
```
 ToUtf8 is a workaround since the standard library does not make
it easy to write a standard UTF-8 string.
https://github.com/moonbitlang/core/issues/484

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/string.mbt,9:::impl <a href="gmlewis/moonbit-pdk/pdk#ToUtf8">ToUtf8</a> for String
  ```
  > 
  * ```moonbit
    :::source,gmlewis/moonbit-pdk/pdk/string.mbt,9:::fn to_utf8(s : String) -> Bytes
    ```
    >  `to_utf8` converts the MoonBit (UTF-16) `String` to a UTF-8 encoded `Bytes`.
