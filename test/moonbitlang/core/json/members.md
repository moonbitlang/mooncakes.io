# Documentation
|Trait|description|
|---|---|
|[FromJson](#FromJson)||

|Type|description|
|---|---|
|[JsonDecodeError](#JsonDecodeError)||
|[JsonPath](#JsonPath)||
|[ParseError](#ParseError)||
|[Position](#Position)||
|[JsonValue](#JsonValue)||
|[Json](#Json)||
|[Token](#Token)||

|Value|description|
|---|---|
|[from\_json](#from_json)||
|[inspect](#inspect)||
|[parse](#parse)||
|[valid](#valid)||

## FromJson

```moonbit
:::source,moonbitlang/core/json/from_json.mbt,20:::pub(open) trait FromJson {
  from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Self!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
}
```

 Trait for types that can be converted from `Json`

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,94:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>, F : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D, E, F)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,200:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/json#Json">Json</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,424:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T14 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T15 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,63:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/double#Double">Double</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Double!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,160:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/option#Option">Option</a> with from_json[T : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> T?!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,31:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,304:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,118:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>, F : <a href="moonbitlang/core/json#FromJson">FromJson</a>, G : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D, E, F, G)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,169:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/result#Result">Result</a> with from_json[Ok : <a href="moonbitlang/core/json#FromJson">FromJson</a>, Err : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Ok, Err]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,234:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,139:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/builtin#Map">Map</a> with from_json[V : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, V]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,38:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/bool#Bool">Bool</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Bool!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,47:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/int#Int">Int</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Int!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,202:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,268:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,144:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,192:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/unit#Unit">Unit</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Unit!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,116:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/array#FixedArray">FixedArray</a> with from_json[X : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,79:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/char#Char">Char</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Char!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,382:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T14 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,342:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,52:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,16:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,172:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a> with from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,71:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/string#String">String</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> String!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,55:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Int64!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,72:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a> with from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D, E)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,100:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/array#Array">Array</a> with from_json[X : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[X]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,92:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/bigint#BigInt">BigInt</a> with from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 

## JsonDecodeError

```moonbit
:::source,moonbitlang/core/json/from_json.mbt,16:::pub(all) type! JsonDecodeError (<a href="moonbitlang/core/json#JsonPath">JsonPath</a>, String)

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,16:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a> with op_equal(<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>, <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a> with output(<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,16:::fn <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>::op_equal(<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>, <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,16:::fn <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>::output(<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/json/traits.mbt,85:::fn <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## JsonPath

```moonbit
:::source,moonbitlang/core/json/json_path.mbt,16:::type JsonPath
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/json_path.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#JsonPath">JsonPath</a> with op_equal(<a href="moonbitlang/core/json#JsonPath">JsonPath</a>, <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### add\_index
  ```moonbit
  :::source,moonbitlang/core/json/json_path.mbt,23:::fn <a href="moonbitlang/core/json#JsonPath">JsonPath</a>::add_index(self : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>, index : Int) -> <a href="moonbitlang/core/json#JsonPath">JsonPath</a>
  ```
  > 
- #### add\_key
  ```moonbit
  :::source,moonbitlang/core/json/json_path.mbt,28:::fn <a href="moonbitlang/core/json#JsonPath">JsonPath</a>::add_key(self : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>, key : String) -> <a href="moonbitlang/core/json#JsonPath">JsonPath</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/json/json_path.mbt,20:::fn <a href="moonbitlang/core/json#JsonPath">JsonPath</a>::op_equal(<a href="moonbitlang/core/json#JsonPath">JsonPath</a>, <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,moonbitlang/core/json/json_path.mbt,33:::fn <a href="moonbitlang/core/json#JsonPath">JsonPath</a>::output(self : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

## ParseError

```moonbit
:::source,moonbitlang/core/json/types.mbt,26:::pub(all) enum ParseError {
  InvalidChar(<a href="moonbitlang/core/json#Position">Position</a>, Char)
  InvalidEof
  InvalidNumber(<a href="moonbitlang/core/json#Position">Position</a>, String)
  InvalidIdentEscape(<a href="moonbitlang/core/json#Position">Position</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/types.mbt,31:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#ParseError">ParseError</a> with op_equal(<a href="moonbitlang/core/json#ParseError">ParseError</a>, <a href="moonbitlang/core/json#ParseError">ParseError</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/json/types.mbt,47:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/json#ParseError">ParseError</a> with output(self : <a href="moonbitlang/core/json#ParseError">ParseError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/json/types.mbt,31:::fn <a href="moonbitlang/core/json#ParseError">ParseError</a>::op_equal(<a href="moonbitlang/core/json#ParseError">ParseError</a>, <a href="moonbitlang/core/json#ParseError">ParseError</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,moonbitlang/core/json/types.mbt,47:::fn <a href="moonbitlang/core/json#ParseError">ParseError</a>::output(self : <a href="moonbitlang/core/json#ParseError">ParseError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/json/types.mbt,34:::fn <a href="moonbitlang/core/json#ParseError">ParseError</a>::to_string(self : <a href="moonbitlang/core/json#ParseError">ParseError</a>) -> String
  ```
  > 

## Position

```moonbit
:::source,moonbitlang/core/json/types.mbt,20:::pub(all) struct Position {
  line : Int
  column : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/types.mbt,23:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#Position">Position</a> with op_equal(<a href="moonbitlang/core/json#Position">Position</a>, <a href="moonbitlang/core/json#Position">Position</a>) -> Bool
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/json/types.mbt,23:::fn <a href="moonbitlang/core/json#Position">Position</a>::op_equal(<a href="moonbitlang/core/json#Position">Position</a>, <a href="moonbitlang/core/json#Position">Position</a>) -> Bool
  ```
  > automatically derived

## JsonValue

```moonbit
:::source,moonbitlang/core/json/types.mbt,17:::type JsonValue = <a href="moonbitlang/core/json#Json">Json</a>
```

 @alert deprecated "Definition of json is moved to builtin package, use `Json` instead"

## from\_json

```moonbit
:::source,moonbitlang/core/json/from_json.mbt,25:::fn from_json[T : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path~ : <a href="moonbitlang/core/json#JsonPath">JsonPath</a> = ..) -> T!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
```


## inspect

```moonbit
:::source,moonbitlang/core/json/json.mbt,217:::fn inspect(obj : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, content? : <a href="moonbitlang/core/json#Json">Json</a>, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _, args_loc~ : <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a> = _) -> Unit!<a href="moonbitlang/core/builtin#InspectError">InspectError</a>
```


## parse

```moonbit
:::source,moonbitlang/core/json/parse.mbt,26:::fn parse(input : String) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="moonbitlang/core/json#ParseError">ParseError</a>
```


## valid

```moonbit
:::source,moonbitlang/core/json/parse.mbt,16:::fn valid(input : String) -> Bool
```


## Json


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/types.mbt,52:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/json#Json">Json</a> with output(self : <a href="moonbitlang/core/json#Json">Json</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### as\_array
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,54:::fn <a href="moonbitlang/core/json#Json">Json</a>::as_array(self : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/json#Json">Json</a>]?
  ```
  > 
  >  Try to get this element as an Array
- #### as\_bool
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,26:::fn <a href="moonbitlang/core/json#Json">Json</a>::as_bool(self : <a href="moonbitlang/core/json#Json">Json</a>) -> Bool?
  ```
  > 
  >  Try to get this element as a Boolean
- #### as\_null
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,17:::fn <a href="moonbitlang/core/json#Json">Json</a>::as_null(self : <a href="moonbitlang/core/json#Json">Json</a>) -> Unit?
  ```
  > 
  >  Try to get this element as a Null
- #### as\_number
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,36:::fn <a href="moonbitlang/core/json#Json">Json</a>::as_number(self : <a href="moonbitlang/core/json#Json">Json</a>) -> Double?
  ```
  > 
  >  Try to get this element as a Number
- #### as\_object
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,72:::fn <a href="moonbitlang/core/json#Json">Json</a>::as_object(self : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/json#Json">Json</a>]?
  ```
  > 
  >  Try to get this element as an Object
- #### as\_string
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,45:::fn <a href="moonbitlang/core/json#Json">Json</a>::as_string(self : <a href="moonbitlang/core/json#Json">Json</a>) -> String?
  ```
  > 
  >  Try to get this element as a String
- #### from\_json
  ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,200:::fn <a href="moonbitlang/core/json#Json">Json</a>::from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
- #### item
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,63:::fn <a href="moonbitlang/core/json#Json">Json</a>::item(self : <a href="moonbitlang/core/json#Json">Json</a>, index : Int) -> <a href="moonbitlang/core/json#Json">Json</a>?
  ```
  > 
  >  Try to get this element as a Json Array and get the element at the `index` as a Json Value
- #### output
  ```moonbit
  :::source,moonbitlang/core/json/types.mbt,52:::fn <a href="moonbitlang/core/json#Json">Json</a>::output(self : <a href="moonbitlang/core/json#Json">Json</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### stringify
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,98:::fn <a href="moonbitlang/core/json#Json">Json</a>::stringify(self : <a href="moonbitlang/core/json#Json">Json</a>, escape_slash~ : Bool = .., indent~ : Int = ..) -> String
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,212:::fn <a href="moonbitlang/core/json#Json">Json</a>::to_json(self : <a href="moonbitlang/core/json#Json">Json</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
  >  Useful for json interpolation
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/json/traits.mbt,85:::fn <a href="moonbitlang/core/json#Json">Json</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### value
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,81:::fn <a href="moonbitlang/core/json#Json">Json</a>::value(self : <a href="moonbitlang/core/json#Json">Json</a>, key : String) -> <a href="moonbitlang/core/json#Json">Json</a>?
  ```
  > 
  >  Try to get this element as a Json Object and get the element with the `key` as a Json Value

## Token


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/json/traits.mbt,85:::fn <a href="moonbitlang/core/json#Token">Token</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
