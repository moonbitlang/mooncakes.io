# Documentation
|Value|description|
|---|---|
|[alloc](#alloc)| \`alloc\` allocates \`length\` bytes of data with host memory for use by the plugin|
|[config\_get](#config_get)| \`config\_get\` returns the host memory block offset for the "config" data associated with|
|[error\_set](#error_set)| \`error\_set\` sets the "error" data from the plugin to the host to be the memory that|
|[free](#free)| \`free\` releases the bytes previously allocated with \`alloc\` at the given \`offset\`.|
|[http\_request](#http_request)| \`http\_request\` sends the HTTP request to the Extism host and returns back the|
|[http\_status\_code](#http_status_code)| \`http\_status\_code\` returns the status code for the last-sent \`http\_request\` call.|
|[input\_length](#input_length)| \`input\_length\` returns the number of (unprocessed) bytes provided by the host via its input methods.|
|[input\_load\_u64](#input_load_u64)| \`input\_load\_u64\` returns the 64-bit unsigned integer of the "input" data from the host.|
|[input\_load\_u8](#input_load_u8)| \`input\_load\_u8\` returns the byte at location \`offset\` of the "input" data from the host.|
|[length](#length)| \`length\` returns the number of bytes associated with the block of host memory|
|[load\_u64](#load_u64)| \`load\_u64\` returns the 64-bit unsigned integer at location \`offset\` in the host memory block.|
|[load\_u8](#load_u8)| \`load\_u8\` returns the Byte located at \`offset\` in the host memory block.|
|[log\_debug](#log_debug)| \`log\_debug\` logs a "debug" string to the host from the previously-written UTF-8 string written to \`offset\`.|
|[log\_error](#log_error)| \`log\_error\` logs an "error" string to the host from the previously-written UTF-8 string written to \`offset\`.|
|[log\_info](#log_info)| \`log\_info\` logs an "info" string to the host from the previously-written UTF-8 string written to \`offset\`.|
|[log\_warn](#log_warn)| \`log\_warn\` logs a "warning" string to the host from the previously-written UTF-8 string written to \`offset\`.|
|[output\_set](#output_set)| \`output\_set\` sets the "output" data from the plugin to the host to be the memory that|
|[store\_u64](#store_u64)| \`store\_u64\` stores the Int64 value \`v\` at location \`offset\` in the host memory block.|
|[store\_u8](#store_u8)| \`store\_u8\` stores the Byte \`b\` at location \`offset\` in the host memory block.|
|[var\_get](#var_get)| \`var\_get\` returns the host memory block offset for the "var" data associated with|
|[var\_set](#var_set)| \`var\_set\` sets the host "var" memory keyed by the UTF-8 string located at \`offset\`|

## alloc

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,24:::fn alloc(length : Int64) -> Int64
```
 `alloc` allocates `length` bytes of data with host memory for use by the plugin
and returns its `offset` within the host memory block.
The user of this PDK will typically not call this method directly.

## config\_get

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,44:::fn config_get(offset : Int64) -> Int64
```
 `config_get` returns the host memory block offset for the "config" data associated with
the key which is represented by the UTF-8 string which as been previously
written at `offset`.
The user of this PDK will typically not call this method directly.

## error\_set

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,38:::fn error_set(offset : Int64) -> Unit
```
 `error_set` sets the "error" data from the plugin to the host to be the memory that
has been written at `offset`.
The user of this PDK will typically not call this method directly.

## free

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,28:::fn free(offset : Int64) -> Unit
```
 `free` releases the bytes previously allocated with `alloc` at the given `offset`.
The user of this PDK will typically not call this method directly.

## http\_request

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,81:::fn http_request(req : Int64, body : Int64) -> Int64
```
 `http_request` sends the HTTP request to the Extism host and returns back the
memory offset to the response body.

## http\_status\_code

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,84:::fn http_status_code() -> Int
```
 `http_status_code` returns the status code for the last-sent `http_request` call.

## input\_length

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,3:::fn input_length() -> Int64
```
 `input_length` returns the number of (unprocessed) bytes provided by the host via its input methods.
The user of this PDK will typically not call this method directly.

## input\_load\_u64

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,14:::fn input_load_u64(offset : Int64) -> Int64
```
 `input_load_u64` returns the 64-bit unsigned integer of the "input" data from the host.
Note that MoonBit has no unsigned integers,
so the result is returned as an Int64.
Also note that `offset` must lie on an 8-byte boundary.
The user of this PDK will typically not call this method directly.

## input\_load\_u8

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,7:::fn input_load_u8(offset : Int64) -> Byte
```
 `input_load_u8` returns the byte at location `offset` of the "input" data from the host.
The user of this PDK will typically not call this method directly.

## length

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,19:::fn length(offset : Int64) -> Int64
```
 `length` returns the number of bytes associated with the block of host memory
located at `offset`.
The user of this PDK will typically not call this method directly.

## load\_u64

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,77:::fn load_u64(offset : Int64) -> Int64
```
 `load_u64` returns the 64-bit unsigned integer at location `offset` in the host memory block.
Note that MoonBit has no unsigned integers,
so the result is returned as an Int64.
Also note that `offset` must lie on an 8-byte boundary.
The user of this PDK will typically not call this method directly.

## load\_u8

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,63:::fn load_u8(offset : Int64) -> Byte
```
 `load_u8` returns the Byte located at `offset` in the host memory block.
The user of this PDK will typically not call this method directly.

## log\_debug

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,96:::fn log_debug(offset : Int64) -> Unit
```
 `log_debug` logs a "debug" string to the host from the previously-written UTF-8 string written to `offset`.
The user of this PDK will typically not call this method directly.

## log\_error

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,100:::fn log_error(offset : Int64) -> Unit
```
 `log_error` logs an "error" string to the host from the previously-written UTF-8 string written to `offset`.
The user of this PDK will typically not call this method directly.

## log\_info

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,92:::fn log_info(offset : Int64) -> Unit
```
 `log_info` logs an "info" string to the host from the previously-written UTF-8 string written to `offset`.
The user of this PDK will typically not call this method directly.

## log\_warn

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,88:::fn log_warn(offset : Int64) -> Unit
```
 `log_warn` logs a "warning" string to the host from the previously-written UTF-8 string written to `offset`.
The user of this PDK will typically not call this method directly.

## output\_set

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,33:::fn output_set(offset : Int64, length : Int64) -> Unit
```
 `output_set` sets the "output" data from the plugin to the host to be the memory that
has been written at `offset` with the given `length`.
The user of this PDK will typically not call this method directly.

## store\_u64

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,70:::fn store_u64(offset : Int64, v : Int64) -> Unit
```
 `store_u64` stores the Int64 value `v` at location `offset` in the host memory block.
Note that MoonBit does not have unsigned integers, but the host interprets
the provided `v` value as an unsigned 64-bit integer.
Also note that `offset` must lie on an 8-byte boundary.
The user of this PDK will typically not call this method directly.

## store\_u8

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,59:::fn store_u8(offset : Int64, b : Byte) -> Unit
```
 `store_u8` stores the Byte `b` at location `offset` in the host memory block.
The user of this PDK will typically not call this method directly.

## var\_get

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,50:::fn var_get(offset : Int64) -> Int64
```
 `var_get` returns the host memory block offset for the "var" data associated with
the key which is represented by the UTF-8 string which as been previously
written at `offset`.
The user of this PDK will typically not call this method directly.

## var\_set

```moonbit
:::source,gmlewis/moonbit-pdk/pdk/extism/env.mbt,55:::fn var_set(offset : Int64, value_offset : Int64) -> Unit
```
 `var_set` sets the host "var" memory keyed by the UTF-8 string located at `offset`
to be the value which has been previously written at `value_offset`.
The user of this PDK will typically not call this method directly.
