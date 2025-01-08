# Documentation
|Trait|description|
|---|---|
|[@moonbitlang/core/json.FromJson](#@moonbitlang/core/json.FromJson)||

|Type|description|
|---|---|
|[JsonDecodeError](#JsonDecodeError)||
|[JsonPath](#JsonPath)||
|[ParseError](#ParseError)||
|[Position](#Position)||
|[JsonValue](#JsonValue)||
|[Json](#Json)||

|Value|description|
|---|---|
|[from\_json](#from_json)||
|[inspect](#inspect)||
|[parse](#parse)||
|[valid](#valid)||

## @moonbitlang/core/json.FromJson

```moonbit
:::source,moonbitlang/core/json/from_json.mbt,20:::pub(open) trait @moonbitlang/core/json.FromJson {
  from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Self!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
}
```

 Trait for types that can be converted from `Json`

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,192:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for Unit
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,192:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Unit!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,38:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for Bool
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,38:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Bool!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,79:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for Char
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,79:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Char!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,47:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for Int
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,47:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Int!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,55:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,55:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Int64!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,63:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for Double
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,63:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Double!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,71:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for String
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,71:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> String!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,160:::impl[T : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for T?
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,160:::fn from_json[T : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> T?!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,169:::impl[Ok : <a href="moonbitlang/core/json#FromJson">FromJson</a>, Err : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/result#Result">Result</a>[Ok, Err]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,169:::fn from_json[Ok : <a href="moonbitlang/core/json#FromJson">FromJson</a>, Err : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Ok, Err]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,116:::impl[X : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,116:::fn from_json[X : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,100:::impl[X : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/array#Array">Array</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,100:::fn from_json[X : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[X]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,92:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,92:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,200:::impl <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,200:::fn from_json(json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/json#Json">Json</a>!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,139:::impl[V : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for <a href="moonbitlang/core/builtin#Map">Map</a>[String, V]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,139:::fn from_json[V : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, V]!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,16:::impl[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (A, B)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,16:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,31:::impl[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (A, B, C)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,31:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,47:::impl[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (A, B, C, D)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,52:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,66:::impl[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (A, B, C, D, E)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,72:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D, E)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,87:::impl[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>, F : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (A, B, C, D, E, F)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,94:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>, F : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D, E, F)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,110:::impl[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>, F : <a href="moonbitlang/core/json#FromJson">FromJson</a>, G : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (A, B, C, D, E, F, G)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,118:::fn from_json[A : <a href="moonbitlang/core/json#FromJson">FromJson</a>, B : <a href="moonbitlang/core/json#FromJson">FromJson</a>, C : <a href="moonbitlang/core/json#FromJson">FromJson</a>, D : <a href="moonbitlang/core/json#FromJson">FromJson</a>, E : <a href="moonbitlang/core/json#FromJson">FromJson</a>, F : <a href="moonbitlang/core/json#FromJson">FromJson</a>, G : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (A, B, C, D, E, F, G)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,135:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,144:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,162:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,172:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,191:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,202:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,222:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,234:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,255:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,268:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,290:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,304:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,327:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,342:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,366:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T14 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,382:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T14 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/json/tuple_fromjson.mbt,407:::impl[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T14 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T15 : <a href="moonbitlang/core/json#FromJson">FromJson</a>] <a href="moonbitlang/core/json#FromJson">FromJson</a> for (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/tuple_fromjson.mbt,424:::fn from_json[T0 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T1 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T2 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T3 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T4 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T5 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T6 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T7 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T8 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T9 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T10 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T11 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T12 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T13 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T14 : <a href="moonbitlang/core/json#FromJson">FromJson</a>, T15 : <a href="moonbitlang/core/json#FromJson">FromJson</a>](json : <a href="moonbitlang/core/json#Json">Json</a>, path : <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)!<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
    ```
    > 

## JsonDecodeError

```moonbit
:::source,moonbitlang/core/json/from_json.mbt,16:::pub(all) type! JsonDecodeError (<a href="moonbitlang/core/json#JsonPath">JsonPath</a>, String)

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,16:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,16:::fn op_equal(<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>, <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/core/json/from_json.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/from_json.mbt,16:::fn output(<a href="moonbitlang/core/json#JsonDecodeError">JsonDecodeError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## JsonPath

```moonbit
:::source,moonbitlang/core/json/json_path.mbt,16:::type JsonPath
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/json/json_path.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#JsonPath">JsonPath</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/json_path.mbt,20:::fn op_equal(<a href="moonbitlang/core/json#JsonPath">JsonPath</a>, <a href="moonbitlang/core/json#JsonPath">JsonPath</a>) -> Bool
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
  :::source,moonbitlang/core/json/types.mbt,31:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#ParseError">ParseError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/types.mbt,31:::fn op_equal(<a href="moonbitlang/core/json#ParseError">ParseError</a>, <a href="moonbitlang/core/json#ParseError">ParseError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/core/json/types.mbt,47:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/json#ParseError">ParseError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/types.mbt,47:::fn output(self : <a href="moonbitlang/core/json#ParseError">ParseError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
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
  :::source,moonbitlang/core/json/types.mbt,23:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#Position">Position</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/types.mbt,23:::fn op_equal(<a href="moonbitlang/core/json#Position">Position</a>, <a href="moonbitlang/core/json#Position">Position</a>) -> Bool
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
  :::source,moonbitlang/core/json/types.mbt,52:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/json/types.mbt,52:::fn output(self : <a href="moonbitlang/core/json#Json">Json</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
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
- #### item
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,63:::fn <a href="moonbitlang/core/json#Json">Json</a>::item(self : <a href="moonbitlang/core/json#Json">Json</a>, index : Int) -> <a href="moonbitlang/core/json#Json">Json</a>?
  ```
  > 
  >  Try to get this element as a Json Array and get the element at the `index` as a Json Value
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
- #### value
  ```moonbit
  :::source,moonbitlang/core/json/json.mbt,81:::fn <a href="moonbitlang/core/json#Json">Json</a>::value(self : <a href="moonbitlang/core/json#Json">Json</a>, key : String) -> <a href="moonbitlang/core/json#Json">Json</a>?
  ```
  > 
  >  Try to get this element as a Json Object and get the element with the `key` as a Json Value
