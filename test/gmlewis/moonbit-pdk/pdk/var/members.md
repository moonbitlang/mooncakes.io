# Documentation
|Value|description|
|---|---|
|[get\_bytes](#get_bytes)| \`get\_bytes\` returns the (unprocessed) host Memory block for the "var" data associated with|
|[get\_int](#get_int)| \`get\_int\` returns the host's "var" Int associated with the provided \`key\`.|
|[get\_memory](#get_memory)| \`get\_memory\` returns the (unprocessed) host Memory block for the "var" data associated with|
|[get\_string](#get_string)| \`get\_string\` returns the host's "var" String associated with the provided \`key\`.|
|[remove](#remove)| \`remove\` deletes the value in the host's "var" memory associated with the provided \`key\`.|
|[set\_bytes](#set_bytes)| \`set\_bytes\` sets the (unprocessed) host Memory block for the "var" data associated with|
|[set\_int](#set_int)| \`set\_int\` sets the host's "var" Int associated with the provided \`key\`.|
|[set\_string](#set_string)| \`set\_string\` sets the host Memory block for the "var" data associated with|

## get\_bytes

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,19:::fn get_bytes(key : String) -> Bytes?
```
 `get_bytes` returns the (unprocessed) host Memory block for the "var" data associated with
the provided `key`.

## get\_int

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,27:::fn get_int(key : String) -> Int?
```
 `get_int` returns the host's "var" Int associated with the provided `key`.

## get\_memory

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,3:::fn get_memory(key : String) -> <a href="gmlewis/moonbit-pdk/pdk/host#Memory">@gmlewis/moonbit-pdk/pdk/host.Memory</a>?
```
 `get_memory` returns the (unprocessed) host Memory block for the "var" data associated with
the provided `key`.

## get\_string

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,37:::fn get_string(key : String) -> String?
```
 `get_string` returns the host's "var" String associated with the provided `key`.
Note that the Extism host string is UTF-8 and the string is converted to
a MoonBit (UTF-16) String.

## remove

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,81:::fn remove(key : String) -> Unit
```
 `remove` deletes the value in the host's "var" memory associated with the provided `key`.

## set\_bytes

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,46:::fn set_bytes(key : String, value : Bytes) -> Unit
```
 `set_bytes` sets the (unprocessed) host Memory block for the "var" data associated with
the provided `key`.

## set\_int

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,55:::fn set_int(key : String, value : Int) -> Unit
```
 `set_int` sets the host's "var" Int associated with the provided `key`.

## set\_string

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/var/var.mbt,72:::fn set_string(key : String, value : String) -> Unit
```
 `set_string` sets the host Memory block for the "var" data associated with
the provided `key`.
Note that the MoonBit String is UTF-16 and the string is converted to
a UTF-8 string for the Extism host.
