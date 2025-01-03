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
:::source,moonbitlang/core/int/int.mbt,16:::let max_value : Int
```


## min\_value

```moonbit
:::source,moonbitlang/core/int/int.mbt,19:::let min_value : Int
```


## Int


#### mooncakes-io-method-mark-Methods
- #### abs
  ```moonbit
  :::source,moonbitlang/core/int/int.mbt,37:::fn <a href="moonbitlang/core/int#Int">Int</a>::abs(self : Int) -> Int
  ```
  > 
  >  Returns the absolute value of an integer.
  >  
  >  #### Parameters
  >  
  >  - `self` : The integer whose absolute value is to be determined.
  >  
  >  #### Returns
  >  
  >  - The absolute value of the input integer.
  >  
  >  #### Examples
  >  
  >  ```
  >  inspect!(Int::abs(-10), content="10")
  >  ```
