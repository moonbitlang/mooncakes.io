# Documentation
|Trait|description|
|---|---|
|[@yamajik/wasi-bindings/ffi.Any](#@yamajik/wasi-bindings/ffi.Any)||

|Type|description|
|---|---|
|[Cleanup](#Cleanup)||

|Value|description|
|---|---|
|[bytes2ptr](#bytes2ptr)||
|[copy](#copy)||
|[double\_array2ptr](#double_array2ptr)||
|[extend16](#extend16)||
|[extend8](#extend8)||
|[f32\_to\_i32](#f32_to_i32)||
|[f32\_to\_i64](#f32_to_i64)||
|[float\_array2ptr](#float_array2ptr)||
|[free](#free)||
|[int64\_array2ptr](#int64_array2ptr)||
|[int\_array2ptr](#int_array2ptr)||
|[load16](#load16)||
|[load16\_u](#load16_u)||
|[load32](#load32)||
|[load64](#load64)||
|[load8](#load8)||
|[load8\_u](#load8_u)||
|[loadf32](#loadf32)||
|[loadf64](#loadf64)||
|[malloc](#malloc)||
|[ptr2bytes](#ptr2bytes)||
|[ptr2double\_array](#ptr2double_array)||
|[ptr2float\_array](#ptr2float_array)||
|[ptr2int64\_array](#ptr2int64_array)||
|[ptr2int\_array](#ptr2int_array)||
|[ptr2str](#ptr2str)||
|[ptr2uint64\_array](#ptr2uint64_array)||
|[ptr2uint\_array](#ptr2uint_array)||
|[store16](#store16)||
|[store32](#store32)||
|[store64](#store64)||
|[store8](#store8)||
|[storef32](#storef32)||
|[storef64](#storef64)||
|[str2ptr](#str2ptr)||
|[uint64\_array2ptr](#uint64_array2ptr)||
|[uint\_array2ptr](#uint_array2ptr)||

## @yamajik/wasi-bindings/ffi.Any

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,197:::pub(open) trait @yamajik/wasi-bindings/ffi.Any {
}
```


## Cleanup

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,200:::pub(all) struct Cleanup {
  address : Int
  size : Int
  align : Int
}
```


## bytes2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,116:::fn bytes2ptr(bytes : Bytes) -> Int
```


## copy

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,94:::fn copy(dest : Int, src : Int) -> Unit
```


## double\_array2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,144:::fn double_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Double]) -> Int
```


## extend16

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,4:::fn extend16(value : Int) -> Int
```


## extend8

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,8:::fn extend8(value : Int) -> Int
```


## f32\_to\_i32

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,68:::fn f32_to_i32(value : Float) -> Int
```


## f32\_to\_i64

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,72:::fn f32_to_i64(value : Float) -> Int64
```


## float\_array2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,140:::fn float_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Float]) -> Int
```


## free

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,90:::fn free(position : Int) -> Unit
```


## int64\_array2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,136:::fn int64_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int64]) -> Int
```


## int\_array2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,132:::fn int_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int]) -> Int
```


## load16

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,28:::fn load16(offset : Int) -> Int
```


## load16\_u

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,32:::fn load16_u(offset : Int) -> Int
```


## load32

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,40:::fn load32(offset : Int) -> Int
```


## load64

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,48:::fn load64(offset : Int) -> Int64
```


## load8

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,20:::fn load8(offset : Int) -> Int
```


## load8\_u

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,16:::fn load8_u(offset : Int) -> Int
```


## loadf32

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,56:::fn loadf32(offset : Int) -> Float
```


## loadf64

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,64:::fn loadf64(offset : Int) -> Double
```


## malloc

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,80:::fn malloc(size : Int) -> Int
```


## ptr2bytes

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,120:::fn ptr2bytes(ptr : Int) -> Bytes
```


## ptr2double\_array

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,184:::fn ptr2double_array(ptr : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Double]
```


## ptr2float\_array

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,156:::fn ptr2float_array(ptr : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Float]
```


## ptr2int64\_array

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,174:::fn ptr2int64_array(ptr : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int64]
```


## ptr2int\_array

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,152:::fn ptr2int_array(ptr : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Int]
```


## ptr2str

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,112:::fn ptr2str(ptr : Int) -> String
```


## ptr2uint64\_array

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,164:::fn ptr2uint64_array(ptr : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt64]
```


## ptr2uint\_array

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,148:::fn ptr2uint_array(ptr : Int) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt]
```


## store16

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,24:::fn store16(offset : Int, value : Int) -> Unit
```


## store32

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,36:::fn store32(offset : Int, value : Int) -> Unit
```


## store64

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,44:::fn store64(offset : Int, value : Int64) -> Unit
```


## store8

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,12:::fn store8(offset : Int, value : Int) -> Unit
```


## storef32

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,52:::fn storef32(offset : Int, value : Float) -> Unit
```


## storef64

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,60:::fn storef64(offset : Int, value : Double) -> Unit
```


## str2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,108:::fn str2ptr(str : String) -> Int
```


## uint64\_array2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,128:::fn uint64_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt64]) -> Int
```


## uint\_array2ptr

```moonbit
:::source,yamajik/wasi-bindings/ffi/top.mbt,124:::fn uint_array2ptr(array : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt]) -> Int
```

