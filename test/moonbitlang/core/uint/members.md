# Documentation
|Type|description|
|---|---|
|[UInt](#UInt)||

|Value|description|
|---|---|
|[max\_value](#max_value)||
|[min\_value](#min_value)||

## max\_value

```moonbit
:::source,moonbitlang/core/uint/uint.mbt,19:::let max_value : UInt
```


## min\_value

```moonbit
:::source,moonbitlang/core/uint/uint.mbt,16:::let min_value : UInt
```


## UInt


#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,moonbitlang/core/uint/uint.mbt,27:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::default() -> UInt
  ```
  > 
- #### to\_be\_bytes
  ```moonbit
  :::source,moonbitlang/core/uint/uint.mbt,32:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_be_bytes(self : UInt) -> Bytes
  ```
  >  Converts the UInt to a Bytes in big-endian byte order.
- #### to\_int64
  ```moonbit
  :::source,moonbitlang/core/uint/uint.mbt,22:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_int64(self : UInt) -> Int64
  ```
  > 
- #### to\_le\_bytes
  ```moonbit
  :::source,moonbitlang/core/uint/uint.mbt,42:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_le_bytes(self : UInt) -> Bytes
  ```
  >  Converts the UInt to a Bytes in little-endian byte order.
