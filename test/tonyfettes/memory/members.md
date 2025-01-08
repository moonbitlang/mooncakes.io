# Documentation
|Value|description|
|---|---|
|[byte\_array2ptr](#byte_array2ptr)| Converts a fixed-size byte array into a raw memory pointer by allocating|
|[double\_array2ptr](#double_array2ptr)| Converts a fixed array of doubles to a pointer, adjusting the pointer by 8|
|[extend16](#extend16)| Extends a 32-bit signed integer to a 64-bit signed integer by sign-extending|
|[extend8](#extend8)| Extends a 32-bit integer to a 64-bit integer by sign-extending the lower 8|
|[f32\_to\_i32](#f32_to_i32)| Converts a 32-bit floating-point number to a 32-bit signed integer.|
|[f32\_to\_i64](#f32_to_i64)| Converts a 32-bit floating-point number to a 64-bit signed integer.|
|[float\_array2ptr](#float_array2ptr)| Converts a fixed-size array of floats to a pointer in WebAssembly memory.|
|[free](#free)| De-allocates a block of memory at the specified address.|
|[int64\_array2ptr](#int64_array2ptr)| Converts a fixed array of 64-bit integers to a pointer.|
|[int\_array2ptr](#int_array2ptr)| Converts a fixed-size integer array to a pointer.|
|[load16](#load16)| Loads a 16-bit signed integer from memory at the specified \`offset\`.|
|[load16\_u](#load16_u)| Loads a 16-bit unsigned integer from memory at the specified offset.|
|[load32](#load32)| Loads a 32-bit integer from memory at the specified offset.|
|[load64](#load64)| Loads a 64-bit integer from memory at the specified offset.|
|[load8](#load8)| Loads a signed 8-bit integer from memory at the specified offset.|
|[load8\_u](#load8_u)| Loads an unsigned 8-bit integer from memory at the specified offset.|
|[loadf32](#loadf32)| Loads a 32-bit floating-point number from memory at the specified offset.|
|[loadf64](#loadf64)| Loads a 64-bit floating-point number from memory at the specified offset.|
|[malloc](#malloc)| Allocates a block of memory of the specified \`size\` and returns the address|
|[ptr2byte\_array](#ptr2byte_array)| Converts a memory region pointed by a pointer into a fixed-size array of|
|[ptr2double\_array](#ptr2double_array)| Converts a pointer to a double array. Sets the 64-bit header and then|
|[ptr2float\_array](#ptr2float_array)| Converts a pointer to a WebAssembly memory buffer into a fixed-length array|
|[ptr2int64\_array](#ptr2int64_array)| Converts a pointer to an array of 64-bit integers. Sets the 64-bit header|
|[ptr2int\_array](#ptr2int_array)| Converts a pointer to an integer array in WebAssembly memory to a fixed-size|
|[ptr2str](#ptr2str)| Converts a pointer and length to a string.|
|[ptr2uint64\_array](#ptr2uint64_array)| Converts a pointer to an array of \`UInt64\` values. Sets the 64-bit header and|
|[ptr2uint\_array](#ptr2uint_array)| Converts a pointer and length to a fixed-size array of unsigned integers.|
|[realloc](#realloc)| Reallocate memory at the given \`address\` to the specified \`size\`.|
|[store16](#store16)| Stores a 16-bit integer value at a specified memory offset in WebAssembly|
|[store32](#store32)| Stores a 32-bit integer value at a specified memory offset.|
|[store64](#store64)| Stores a 64-bit integer value at a specified memory offset in WebAssembly|
|[store8](#store8)| Stores a single byte at the specified memory offset in a WebAssembly memory.|
|[storef32](#storef32)| Stores a 32-bit floating-point value at a specified memory offset in the|
|[storef64](#storef64)| Stores a 64-bit floating-point value at a specified memory offset in|
|[str2ptr](#str2ptr)| Converts a string to a pointer suitable for WebAssembly memory.|
|[uint64\_array2ptr](#uint64_array2ptr)| Converts a fixed array of \`UInt64\` values to a pointer in WebAssembly memory.|
|[uint\_array2ptr](#uint_array2ptr)| Converts a fixed array of unsigned integers to a pointer.|

## byte\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,44:::fn byte_array2ptr(bytes : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]) -> Int
```
 Converts a fixed-size byte array into a raw memory pointer by allocating
memory and copying the bytes.

 Parameters:

 * `bytes`: A fixed-size array of bytes to be converted to a pointer.

 Returns an integer representing the memory address (pointer) where the bytes
are stored.

## double\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,255:::fn double_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Double]) -> Int
```
 Converts a fixed array of doubles to a pointer, adjusting the pointer by 8
bytes.

 Parameters:

 - `array` : A fixed array of doubles (`FixedArray[Double]`).

 Returns an integer representing the adjusted pointer.

## extend16

```moonbit
:::source,tonyfettes/memory/wasm.mbt,10:::fn extend16(value : Int) -> Int
```
 Extends a 32-bit signed integer to a 64-bit signed integer by sign-extending
the lower 16 bits.

 Parameters:

 - `value` : The 32-bit signed integer to be extended.

 Returns the 64-bit signed integer resulting from the sign-extension of the
lower 16 bits of the input.

## extend8

```moonbit
:::source,tonyfettes/memory/wasm.mbt,21:::fn extend8(value : Int) -> Int
```
 Extends a 32-bit integer to a 64-bit integer by sign-extending the lower 8
bits.

 Parameters:

 - `value` : The 32-bit integer to be extended.

 Returns a 64-bit integer with the lower 8 bits sign-extended.

## f32\_to\_i32

```moonbit
:::source,tonyfettes/memory/wasm.mbt,185:::fn f32_to_i32(value : Float) -> Int
```
 Converts a 32-bit floating-point number to a 32-bit signed integer.

 Parameters:

 - `value` : The 32-bit floating-point number to be converted.

 Returns the 32-bit signed integer representation of the input floating-point
number.

## f32\_to\_i64

```moonbit
:::source,tonyfettes/memory/wasm.mbt,195:::fn f32_to_i64(value : Float) -> Int64
```
 Converts a 32-bit floating-point number to a 64-bit signed integer.

 Parameters:

 - `value` : A 32-bit floating-point number to be converted.

 Returns a 64-bit signed integer.

## float\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,218:::fn float_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Float]) -> Int
```
 Converts a fixed-size array of floats to a pointer in WebAssembly memory.

 Parameters:

 - `array` : A fixed-size array of floats (`FixedArray[Float]`) to be
   converted.

 Returns an integer representing the pointer to the array in WebAssembly
memory.

## free

```moonbit
:::source,tonyfettes/memory/malloc.wasm-gc.mbt,316:::fn free(address : Int) -> Unit
```
 De-allocates a block of memory at the specified address.

 Parameters:

 - `address` : The address of the memory block to be deallocated.

## int64\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,181:::fn int64_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int64]) -> Int
```
 Converts a fixed array of 64-bit integers to a pointer.

 Parameters:

 - `array` : A fixed array of 64-bit integers (`FixedArray[Int64]`).

 Returns an integer representing the pointer to the array.

## int\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,145:::fn int_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int]) -> Int
```
 Converts a fixed-size integer array to a pointer.

 Parameters:

 - `array` : A fixed-size array of integers (`FixedArray[Int]`).

 Returns the pointer to the array as an integer.

## load16

```moonbit
:::source,tonyfettes/memory/wasm.mbt,71:::fn load16(offset : Int) -> Int
```
 Loads a 16-bit signed integer from memory at the specified `offset`.

 Parameters:

 - `offset` : The memory offset from which to load the 16-bit signed integer.

 Returns the loaded 16-bit signed integer.

## load16\_u

```moonbit
:::source,tonyfettes/memory/wasm.mbt,82:::fn load16_u(offset : Int) -> Int
```
 Loads a 16-bit unsigned integer from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset from which to load the 16-bit unsigned
   integer.

 Returns the 16-bit unsigned integer loaded from memory.

## load32

```moonbit
:::source,tonyfettes/memory/wasm.mbt,104:::fn load32(offset : Int) -> Int
```
 Loads a 32-bit integer from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset from which to load the 32-bit integer.

 Returns the 32-bit integer loaded from memory at the specified offset.

## load64

```moonbit
:::source,tonyfettes/memory/wasm.mbt,126:::fn load64(offset : Int) -> Int64
```
 Loads a 64-bit integer from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset from which to load the 64-bit integer.

 Returns the 64-bit integer loaded from memory at the given offset.

## load8

```moonbit
:::source,tonyfettes/memory/wasm.mbt,51:::fn load8(offset : Int) -> Int
```
 Loads a signed 8-bit integer from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset from which to load the 8-bit integer.

 Returns the signed 8-bit integer value at the specified memory offset.

## load8\_u

```moonbit
:::source,tonyfettes/memory/wasm.mbt,41:::fn load8_u(offset : Int) -> Int
```
 Loads an unsigned 8-bit integer from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset from which to load the unsigned 8-bit integer.

 Returns the unsigned 8-bit integer value at the specified memory offset.

## loadf32

```moonbit
:::source,tonyfettes/memory/wasm.mbt,149:::fn loadf32(offset : Int) -> Float
```
 Loads a 32-bit floating-point number from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset from which to load the 32-bit floating-point
   number.

 Returns the 32-bit floating-point number loaded from memory.

## loadf64

```moonbit
:::source,tonyfettes/memory/wasm.mbt,174:::fn loadf64(offset : Int) -> Double
```
 Loads a 64-bit floating-point number from memory at the specified offset.

 Parameters:

 - `offset` : The memory offset (in bytes) from which to load the 64-bit
   floating-point number.

 Returns the 64-bit floating-point number loaded from memory.

## malloc

```moonbit
:::source,tonyfettes/memory/malloc.wasm-gc.mbt,307:::fn malloc(size : Int) -> Int
```
 Allocates a block of memory of the specified `size` and returns the address
of the allocated memory.

 Parameters:

 - `size`: The size of the memory block to allocate, in bytes.

 Returns the address of the allocated memory block as an integer.

## ptr2byte\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,62:::fn ptr2byte_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte]
```
 Converts a memory region pointed by a pointer into a fixed-size array of
bytes and frees the memory afterwards.

 Parameters:

 * `pointer` : An integer representing the memory address of the source data.
 * `length` : The number of bytes to read from the memory address.

 Returns a fixed-size array of bytes containing the data read from the memory
address.

## ptr2double\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,272:::fn ptr2double_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Double]
```
 Converts a pointer to a double array. Sets the 64-bit header and then
retrieves the double array gfrom the pointer.

 Parameters:

 - `ptr` : The integer pointer to the start of the double array.
 - `len` : The length of the double array (unused in the function).

 Returns a `FixedArray[Double]` containing the double values from the pointer.

## ptr2float\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,238:::fn ptr2float_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Float]
```
 Converts a pointer to a WebAssembly memory buffer into a fixed-length array
of floating-point numbers.

 Parameters:

 - `ptr` : An integer representing the memory address of the buffer containing
   the floating-point numbers.
 - `len` : An integer representing the number of floating-point numbers in the
   buffer.

 Returns a `FixedArray[Float]` containing the floating-point numbers from the
specified memory buffer.

## ptr2int64\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,200:::fn ptr2int64_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int64]
```
 Converts a pointer to an array of 64-bit integers. Sets the 64-bit header
using an FFI call and then retrieves the array using another FFI call.

 Parameters:

 - `ptr` : The pointer to the memory location where the array starts.
 - `len` : The length of the array. This parameter is currently unused in the
   function.

 Returns a `FixedArray[Int64]` containing the 64-bit integers from the memory
location pointed to by `ptr`.

## ptr2int\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,165:::fn ptr2int_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int]
```
 Converts a pointer to an integer array in WebAssembly memory to a fixed-size
array of integers.

 Parameters:

 - `ptr` : The pointer to the start of the integer array in WebAssembly
   memory.
 - `len` : The length of the integer array.

 Returns a `FixedArray[Int]` containing the integers from the specified memory
location.

## ptr2str

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,26:::fn ptr2str(ptr : Int, len : Int) -> String
```
 Converts a pointer and length to a string.

 Parameters:

 - `ptr` : The integer pointer to the start of the string in memory.
 - `len` : The length of the string in bytes.

 Returns the string constructed from the memory pointed to by `ptr` with the
specified `len`.

## ptr2uint64\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,129:::fn ptr2uint64_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt64]
```
 Converts a pointer to an array of `UInt64` values. Sets the 64-bit header and
then retrieves the array from the pointer.

 Parameters:

 - `ptr` : The integer representing the pointer to the array.
 - `len` : The length of the array. This parameter is currently unused in the
   function.

 Returns a `FixedArray[UInt64]` containing the values from the pointer.

## ptr2uint\_array

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,95:::fn ptr2uint_array(ptr : Int, len : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt]
```
 Converts a pointer and length to a fixed-size array of unsigned integers.

 Parameters:

 - `ptr` : The pointer to the memory location where the array data starts.
 - `len` : The length of the array to be created.

 Returns a `FixedArray[UInt]` containing the data from the specified memory
location.

## realloc

```moonbit
:::source,tonyfettes/memory/malloc.wasm-gc.mbt,328:::fn realloc(address : Int, size : Int) -> Int
```
 Reallocate memory at the given `address` to the specified `size`.

 Parameters:

 - `address`: The memory address to reallocate.
 - `size`: The new size for the memory block.

 Returns the new memory address after reallocation.

## store16

```moonbit
:::source,tonyfettes/memory/wasm.mbt,61:::fn store16(offset : Int, value : Int) -> Unit
```
 Stores a 16-bit integer value at a specified memory offset in WebAssembly
memory.

 Parameters:

 - `offset` : The memory offset where the value will be stored.
 - `value` : The 16-bit integer value to be stored at the specified offset.

## store32

```moonbit
:::source,tonyfettes/memory/wasm.mbt,94:::fn store32(offset : Int, value : Int) -> Unit
```
 Stores a 32-bit integer value at a specified memory offset.

 Parameters:

 - `offset` : The memory offset where the value will be stored, represented as
   an integer.
 - `value` : The 32-bit integer value to be stored at the specified offset.

 Returns nothing.

## store64

```moonbit
:::source,tonyfettes/memory/wasm.mbt,116:::fn store64(offset : Int, value : Int64) -> Unit
```
 Stores a 64-bit integer value at a specified memory offset in WebAssembly
memory.

 Parameters:

 - `offset` : The memory offset (in bytes) where the 64-bit integer will be
   stored.
 - `value` : The 64-bit integer value to be stored at the specified memory
   offset.

## store8

```moonbit
:::source,tonyfettes/memory/wasm.mbt,31:::fn store8(offset : Int, value : Int) -> Unit
```
 Stores a single byte at the specified memory offset in a WebAssembly memory.

 Parameters:

 - `offset` : The memory offset (in bytes) where the value will be stored.
 - `value` : The integer value (0-255) to be stored as a byte at the specified
   offset.

## storef32

```moonbit
:::source,tonyfettes/memory/wasm.mbt,138:::fn storef32(offset : Int, value : Float) -> Unit
```
 Stores a 32-bit floating-point value at a specified memory offset in the
WebAssembly linear memory.

 Parameters:

 - `offset` : The memory offset (in bytes) where the 32-bit floating-point
   value will be stored.
 - `value` : The 32-bit floating-point value to be stored at the specified
   memory offset.

## storef64

```moonbit
:::source,tonyfettes/memory/wasm.mbt,163:::fn storef64(offset : Int, value : Double) -> Unit
```
 Stores a 64-bit floating-point value at a specified memory offset in
WebAssembly memory.

 Parameters:

 - `offset` : The memory offset (in bytes) where the 64-bit floating-point
   value will be stored.
 - `value` : The 64-bit floating-point value to be stored at the specified
   memory offset.

 Returns nothing.

## str2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,8:::fn str2ptr(str : String) -> Int
```
 Converts a string to a pointer suitable for WebAssembly memory.

 Parameters:

 - `str` : The string to be converted.

 Returns the pointer to the string in WebAssembly memory.

## uint64\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,111:::fn uint64_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt64]) -> Int
```
 Converts a fixed array of `UInt64` values to a pointer in WebAssembly memory.

 Parameters:

 - `array` : A fixed array of `UInt64` values to be converted.

 Returns the pointer to the WebAssembly memory where the array is stored.

## uint\_array2ptr

```moonbit
:::source,tonyfettes/memory/conv.wasm-gc.mbt,78:::fn uint_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt]) -> Int
```
 Converts a fixed array of unsigned integers to a pointer.

 Parameters:

 - `array` : A fixed array of unsigned integers (`FixedArray[UInt]`).

 Returns an integer representing the pointer to the array.
