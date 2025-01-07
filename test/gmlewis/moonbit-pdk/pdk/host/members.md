# Documentation
|Type|description|
|---|---|
|[Memory](#Memory)| \`Memory\` represents memory allocated by (and shared with) the host.|

|Value|description|
|---|---|
|[find\_memory](#find_memory)| \`find\_memory\` returns a \`Memory\` struct from an offset provided by the host.|
|[input](#input)| \`input\` returns a sequence of (unprocessed) bytes from the host.|
|[input\_string](#input_string)| \`input\_string\` returns a (UTF-16) String from the host.|
|[log\_debug\_str](#log_debug_str)| \`log\_debug\_str\` is a helper function to log a debug string to the host.|
|[log\_error\_str](#log_error_str)| \`log\_error\_str\` is a helper function to log an error string to the host.|
|[log\_info\_str](#log_info_str)| \`log\_info\_str\` is a helper function to log an info string to the host.|
|[log\_warn\_str](#log_warn_str)| \`log\_warn\_str\` is a helper function to log a warn string to the host.|
|[output](#output)| \`output\` sends a sequence of (unprocessed) bytes to the host as the plugin's "output".|
|[output\_json\_value](#output_json_value)| \`output\_json\_value\` converts a MoonBit \`Json\` to an Extism JSON string|
|[output\_string](#output_string)| \`output\_string\` converts a MoonBit String (UTF-16) to an Extism string (UTF-8)|
|[set\_error](#set_error)| \`set\_error\` converts a MoonBit String (UTF-16) to an Extism string (UTF-8)|

## Memory

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,3:::pub(all) struct Memory {
  offset : Int64
  length : Int64
}
```
 `Memory` represents memory allocated by (and shared with) the host.
TODO: What kind of error checking needs to happen here?

#### mooncakes-io-method-mark-Methods
- #### allocate
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,21:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::allocate(length : Int64) -> <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>
  ```
  >  `Memory::allocate` allocates an uninitialized (determined by host)
  > area of shared memory on the host.
- #### allocate\_bytes
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,27:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::allocate_bytes(bytes : Bytes) -> <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>
  ```
  >  `Memory::allocate_bytes` allocates and initializes host memory
  > with the provided (unprocessed) bytes.
- #### allocate\_json\_value
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,49:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::allocate_json_value(j : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>
  ```
  >  `Memory::allocate_json_value` allocates and initializes a UTF-8 string
  > in host memory that is converted from this `Json`.
- #### allocate\_string
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,43:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::allocate_string(s : String) -> <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>
  ```
  >  `Memory::allocate_string` allocates and initializes a UTF-8 string
  > in host memory that is converted from this UTF-16 MoonBit String.
- #### free
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,15:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::free(self : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>) -> Unit
  ```
  >  `free` releases this Memory from the host.
- #### output\_memory
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,37:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::output_memory(self : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>) -> Unit
  ```
  >  `output_memory` sets the host's "output" to be the contents of this Memory data.
- #### to\_bytes
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,71:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::to_bytes(self : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>) -> Bytes
  ```
  >  `to_bytes` reads the (unprocessed) bytes residing in the host memory
  > to a MoonBit Bytes.
- #### to\_int
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,61:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::to_int(self : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>) -> Int
  ```
  >  `to_int` reads and converts the u32 residing in the host memory
  > to a MoonBit Int.
- #### to\_string
  ```moonbit
  :::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,55:::fn <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>::to_string(self : <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>) -> String
  ```
  >  `to_string` reads and converts the UTF-8 string residing in the host memory
  > to a UTF-16 MoonBit String.

## find\_memory

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/memory.mbt,9:::fn find_memory(offset : Int64) -> <a href="gmlewis/moonbit-pdk/pdk/host#Memory">Memory</a>
```
 `find_memory` returns a `Memory` struct from an offset provided by the host.

## input

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,2:::fn input() -> Bytes
```
 `input` returns a sequence of (unprocessed) bytes from the host.

## input\_string

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,12:::fn input_string() -> String
```
 `input_string` returns a (UTF-16) String from the host.

## log\_debug\_str

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,82:::fn log_debug_str(s : String) -> Unit
```
 `log_debug_str` is a helper function to log a debug string to the host.

## log\_error\_str

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,89:::fn log_error_str(s : String) -> Unit
```
 `log_error_str` is a helper function to log an error string to the host.

## log\_info\_str

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,75:::fn log_info_str(s : String) -> Unit
```
 `log_info_str` is a helper function to log an info string to the host.

## log\_warn\_str

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,68:::fn log_warn_str(s : String) -> Unit
```
 `log_warn_str` is a helper function to log a warn string to the host.

## output

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,28:::fn output(b : Bytes) -> Unit
```
 `output` sends a sequence of (unprocessed) bytes to the host as the plugin's "output".

## output\_json\_value

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,44:::fn output_json_value(j : <a href="moonbitlang/core/json#Json">Json</a>) -> Unit
```
 `output_json_value` converts a MoonBit `Json` to an Extism JSON string
and sends it to the host.

## output\_string

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,38:::fn output_string(s : String) -> Unit
```
 `output_string` converts a MoonBit String (UTF-16) to an Extism string (UTF-8)
and sends it to the host.

## set\_error

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/host/host.mbt,63:::fn set_error(s : String) -> Unit
```
 `set_error` converts a MoonBit String (UTF-16) to an Extism string (UTF-8)
and sends it to the host as its error output.
