# Documentation
|Type|description|
|---|---|
|[Bool](#Bool)||

## Bool


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/bool/bool.mbt,119:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for Bool
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/bool/bool.mbt,119:::fn hash(self : Bool) -> Int
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/core/bool/bool.mbt,122:::fn hash_combine(self : Bool, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/bool/bool.mbt,32:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::to_int(self : Bool) -> Int
  ```
  > 
  >  Converts a boolean value to its integer representation.
  > 
  >  Parameters:
  > 
  >  * `self` : The boolean value to convert.
  > 
  >  Returns 1 if the boolean is `true`, 0 if it is `false`.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "to_int" {
  >    inspect!(true.to_int(), content="1")
  >    inspect!(false.to_int(), content="0")
  >  }
  >  ```
- #### to\_int64
  ```moonbit
  :::source,moonbitlang/core/bool/bool.mbt,58:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::to_int64(self : Bool) -> Int64
  ```
  > 
  >  Converts a boolean value to a 64-bit integer. Returns 1 for `true` and 0 for
  > `false`.
  > 
  >  Parameters:
  > 
  >  * `bool` : The boolean value to be converted.
  > 
  >  Returns a 64-bit integer representation of the boolean value.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "to_int64" {
  >    inspect!(true.to_int64(), content="1")
  >    inspect!(false.to_int64(), content="0")
  >  }
  >  ```
- #### to\_uint
  ```moonbit
  :::source,moonbitlang/core/bool/bool.mbt,84:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::to_uint(self : Bool) -> UInt
  ```
  > 
  >  Converts a boolean value to an unsigned integer.
  > 
  >  Parameters:
  > 
  >  * `value` : The boolean value to be converted.
  > 
  >  Returns an unsigned integer, where `true` is converted to 1 and `false` is
  > converted to 0.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "to_uint" {
  >    inspect!(true.to_uint(), content="1")
  >    inspect!(false.to_uint(), content="0")
  >  }
  >  ```
- #### to\_uint64
  ```moonbit
  :::source,moonbitlang/core/bool/bool.mbt,110:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::to_uint64(self : Bool) -> UInt64
  ```
  > 
  >  Converts a boolean value to an unsigned 64-bit integer. Returns 1 for `true`
  > and 0 for `false`.
  > 
  >  Parameters:
  > 
  >  * `bool` : The boolean value to convert.
  > 
  >  Returns an unsigned 64-bit integer representation of the boolean value.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "to_uint64" {
  >    inspect!(true.to_uint64(), content="1")
  >    inspect!(false.to_uint64(), content="0")
  >  }
  >  ```
