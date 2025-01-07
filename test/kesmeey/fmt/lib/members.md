# Documentation
|Type|description|
|---|---|
|[Args\_Type](#Args_Type)||
|[FMT\_Type](#FMT_Type)||
|[Formatter](#Formatter)||

|Value|description|
|---|---|
|[format\_decimal](#format_decimal)||
|[max](#max)||
|[to\_base](#to_base)||

## Args\_Type

```moonbit
:::source,kesmeey/fmt/lib/fmt.mbt,39:::pub(all) enum Args_Type {
  String(String)
  Int(Int)
  UInt(UInt)
  Double(Double)
}
```


## FMT\_Type

```moonbit
:::source,kesmeey/fmt/lib/fmt.mbt,8:::pub(all) enum FMT_Type {
  Text(String)
  Int(Int, Bool, Bool, Bool)
  Double(Int, Int, Bool, Bool, Bool, Bool)
  String(Int, Bool)
  HexLower(Int, Bool, Bool)
  HexUpper(Int, Bool, Bool)
  Octal(Int, Bool, Bool)
  Scientific(Int, Int, Bool, Bool)
  General(Int, Int, Bool, Bool)
  Unsigned(Int, Bool, Bool)
}
```


## Formatter

```moonbit
:::source,kesmeey/fmt/lib/fmt.mbt,3:::pub(all) struct Formatter {
  types : <a href="moonbitlang/core/array#Array">Array</a>[<a href="kesmeey/fmt/lib#FMT_Type">FMT_Type</a>]
}
```


#### mooncakes-io-method-mark-Methods
- #### fmt
  ```moonbit
  :::source,kesmeey/fmt/lib/fmt.mbt,305:::fn <a href="kesmeey/fmt/lib#Formatter">Formatter</a>::fmt(self : <a href="kesmeey/fmt/lib#Formatter">Formatter</a>, args : <a href="moonbitlang/core/array#Array">Array</a>[<a href="kesmeey/fmt/lib#Args_Type">Args_Type</a>]) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,kesmeey/fmt/lib/fmt.mbt,165:::fn <a href="kesmeey/fmt/lib#Formatter">Formatter</a>::new(fmt : String) -> <a href="kesmeey/fmt/lib#Formatter">Formatter</a>
  ```
  > 

## format\_decimal

```moonbit
:::source,kesmeey/fmt/lib/fmt.mbt,137:::fn format_decimal(num : Double, precision : Int, mode : Bool) -> String
```


## max

```moonbit
:::source,kesmeey/fmt/lib/fmt.mbt,58:::fn max(a : Int, b : Int) -> Int
```


## to\_base

```moonbit
:::source,kesmeey/fmt/lib/fmt.mbt,95:::fn to_base(val : Int, base : Int, uppercase : Bool) -> String
```

