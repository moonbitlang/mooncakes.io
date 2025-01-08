# Documentation
|Type|description|
|---|---|
|[Int](#Int)||

|Value|description|
|---|---|
|[max\_value](#max_value)||
|[min\_value](#min_value)||

## max\_value

```moonbit
:::source,moonbitlang/core/int/int.mbt,17:::let max_value : Int
```

 Maximum value of an integer.

## min\_value

```moonbit
:::source,moonbitlang/core/int/int.mbt,21:::let min_value : Int
```

 Minimum value of an integer.

## Int


#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/int/int.mbt,41:::fn <a href="moonbitlang/core/int#Int">Int</a>::abs(self : Int) -> Int
  ```
  > 
  >  Computes the absolute value of an integer.
  > 
  >  Parameters:
  > 
  >  * `self` : The integer whose absolute value is to be computed.
  > 
  >  Returns the absolute value of the integer.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "abs" {
  >    inspect!(@int.abs(42), content="42")
  >    inspect!(@int.abs(-42), content="42")
  >    inspect!(@int.abs(0), content="0")
  >  }
  >  ```
- #### to\_be\_bytes
  ```moonbit
  :::source,moonbitlang/core/int/int.mbt,50:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_be_bytes(self : Int) -> Bytes
  ```
  >  Converts the Int to a Bytes in big-endian byte order.
- #### to\_le\_bytes
  ```moonbit
  :::source,moonbitlang/core/int/int.mbt,55:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_le_bytes(self : Int) -> Bytes
  ```
  >  Converts the Int to a Bytes in little-endian byte order.
