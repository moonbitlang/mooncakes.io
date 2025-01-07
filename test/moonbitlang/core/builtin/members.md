# Documentation
|Trait|description|
|---|---|
|[Compare](#Compare)||
|[Default](#Default)||
|[Eq](#Eq)||
|[Hash](#Hash)||
|[Logger](#Logger)||
|[Show](#Show)||
|[ToJson](#ToJson)||

|Type|description|
|---|---|
|[ArgsLoc](#ArgsLoc)||
|[Array](#Array)||
|[ArrayView](#ArrayView)||
|[BigInt](#BigInt)||
|[Failure](#Failure)||
|[Hasher](#Hasher)||
|[InspectError](#InspectError)||
|[Iter](#Iter)||
|[Iter2](#Iter2)||
|[IterResult](#IterResult)||
|[Json](#Json)||
|[Map](#Map)||
|[Set](#Set)||
|[SnapshotError](#SnapshotError)||
|[SourceLoc](#SourceLoc)||
|[StringBuilder](#StringBuilder)||
|[UninitializedArray](#UninitializedArray)||
|[Bool](#Bool)||
|[Byte](#Byte)||
|[Bytes](#Bytes)||
|[Char](#Char)||
|[Double](#Double)||
|[Entry](#Entry)||
|[FixedArray](#FixedArray)||
|[Float](#Float)||
|[Int](#Int)||
|[Int64](#Int64)||
|[Logger](#Logger)||
|[Option](#Option)||
|[Ref](#Ref)||
|[Result](#Result)||
|[SEntry](#SEntry)||
|[Sign](#Sign)||
|[String](#String)||
|[Tuple10](#Tuple10)||
|[Tuple11](#Tuple11)||
|[Tuple12](#Tuple12)||
|[Tuple13](#Tuple13)||
|[Tuple14](#Tuple14)||
|[Tuple15](#Tuple15)||
|[Tuple16](#Tuple16)||
|[Tuple2](#Tuple2)||
|[Tuple3](#Tuple3)||
|[Tuple4](#Tuple4)||
|[Tuple5](#Tuple5)||
|[Tuple6](#Tuple6)||
|[Tuple7](#Tuple7)||
|[Tuple8](#Tuple8)||
|[Tuple9](#Tuple9)||
|[UInt](#UInt)||
|[UInt64](#UInt64)||
|[Unit](#Unit)||

|Value|description|
|---|---|
|[abort](#abort)||
|[assert\_eq](#assert_eq)||
|[assert\_false](#assert_false)||
|[assert\_not\_eq](#assert_not_eq)||
|[assert\_true](#assert_true)||
|[fail](#fail)||
|[ignore](#ignore)||
|[inspect](#inspect)||
|[not](#not)||
|[op\_ge](#op_ge)||
|[op\_gt](#op_gt)||
|[op\_le](#op_le)||
|[op\_lt](#op_lt)||
|[op\_notequal](#op_notequal)||
|[panic](#panic)||
|[physical\_equal](#physical_equal)||
|[print](#print)||
|[println](#println)||

## Compare

```moonbit
:::source,moonbitlang/core/builtin/traits.mbt,28:::pub(open) trait Compare : <a href="moonbitlang/core/builtin#Eq">Eq</a> {
  compare(Self, Self) -> Int
}
```

 Trait for types whose elements are ordered

 The return value of \[compare\] is:
 - zero, if the two arguments are equal
 - negative, if the first argument is smaller
 - positive, if the first argument is greater

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,279:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/core/array#ArrayView">ArrayView</a> with compare[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], other : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Int
  ```
  > 

## Default

```moonbit
:::source,moonbitlang/core/builtin/traits.mbt,48:::pub(open) trait Default {
  default() -> Self
}
```

 Trait for types with a default value

## Eq

```moonbit
:::source,moonbitlang/core/builtin/traits.mbt,17:::pub(open) trait Eq {
  op_equal(Self, Self) -> Bool
}
```

 Trait for types whose elements can test for equality

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,34:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/builtin#IterResult">IterResult</a> with op_equal(<a href="moonbitlang/core/builtin#IterResult">IterResult</a>, <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,24:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/json#Json">Json</a> with op_equal(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#Json">Json</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,265:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/core/array#ArrayView">ArrayView</a> with op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], other : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Bool
  ```
  > 

## Hash

```moonbit
:::source,moonbitlang/core/builtin/traits.mbt,34:::pub(open) trait Hash {
  hash_combine(Self, <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  hash(Self) -> Int
}
```

 Trait for types that can be hashed

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,122:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/byte#Byte">Byte</a> with hash(self : Byte) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="#$default_impl">$default_impl</a> with hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,171:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/int#Int">Int</a> with hash(self : Int) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,73:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>, F : <a href="moonbitlang/core/builtin#Hash">Hash</a>, G : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D, E, F, G), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,207:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/result#Result">Result</a> with hash_combine[T : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,59:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>, F : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D, E, F), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,22:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,31:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,194:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/uint64#UInt64">UInt64</a> with hash_combine(self : UInt64, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,184:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/int#Int">Int</a> with hash_combine(self : Int, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,189:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/uint#UInt">UInt</a> with hash_combine(self : UInt, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,46:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D, E), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,199:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/option#Option">Option</a> with hash_combine[X : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : X?, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,16:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a> with hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,165:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/string#String">String</a> with hash_combine(self : String, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,125:::impl <a href="moonbitlang/core/builtin#Hash">Hash</a> for <a href="moonbitlang/core/byte#Byte">Byte</a> with hash_combine(self : Byte, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 

## Logger

```moonbit
:::source,moonbitlang/core/builtin/traits.mbt,54:::pub(open) trait Logger {
  write_string(Self, String) -> Unit
  write_substring(Self, String, Int, Int) -> Unit
  write_sub_string(Self, String, Int, Int) -> Unit
  write_char(Self, Char) -> Unit
}
```

 Trait for a logger, where debug logs can be written into

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,63:::impl <a href="moonbitlang/core/builtin#Logger">Logger</a> for <a href="#$default_impl">$default_impl</a> with write_sub_string[Self : <a href="moonbitlang/core/builtin#Logger">Logger</a>](self : Self, value : String, start : Int, len : Int) -> Unit
  ```
  > 

## Show

```moonbit
:::source,moonbitlang/core/builtin/traits.mbt,69:::pub(open) trait Show {
  output(Self, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  to_string(Self) -> String
}
```

 Trait for types that can be converted to `String`

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,39:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/uint64#UInt64">UInt64</a> with output(self : UInt64, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,32:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#Iter2">Iter2</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,627:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/bigint#BigInt">BigInt</a> with output(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,34:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/uint#UInt">UInt</a> with output(self : UInt, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,118:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>, F : <a href="moonbitlang/core/builtin#Show">Show</a>, G : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D, E, F, G), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,24:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/int#Int">Int</a> with output(self : Int, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,37:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#Iter">Iter</a> with output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,391:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#Map">Map</a> with output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/autoloc.mbt,22:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> with output(self : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,343:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#Set">Set</a> with output[K : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,256:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,391:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>, T13 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,146:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#Failure">Failure</a> with output(self : <a href="moonbitlang/core/builtin#Failure">Failure</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,343:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,91:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>, F : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D, E, F), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,49:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with output(self : Bytes, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/unit#Unit">Unit</a> with output(_self : Unit, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,44:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/byte#Byte">Byte</a> with output(self : Byte, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,67:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D, E), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,496:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>, T13 : <a href="moonbitlang/core/builtin#Show">Show</a>, T14 : <a href="moonbitlang/core/builtin#Show">Show</a>, T15 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,170:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/result#Result">Result</a> with output[T : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,188:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/array#Array">Array</a> with output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,181:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,148:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,212:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/char#Char">Char</a> with output(self : Char, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,178:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/ref#Ref">Ref</a> with output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,298:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,27:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/bool#Bool">Bool</a> with output(self : Bool, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,442:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>, T13 : <a href="moonbitlang/core/builtin#Show">Show</a>, T14 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/autoloc.mbt,27:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a> with output(<a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,161:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/option#Option">Option</a> with output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : X?, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,183:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/array#FixedArray">FixedArray</a> with output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,92:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a> with output(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
  >  TODO: improve perf
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,193:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/array#ArrayView">ArrayView</a> with output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,78:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/string#String">String</a> with output(self : String, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,29:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with output(self : Int64, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,217:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a> with output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,43:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a> with output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,71:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with to_string(self : Bytes) -> String
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,137:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/string#String">String</a> with to_string(self : String) -> String
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,140:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/builtin#Failure">Failure</a> with to_string(self : <a href="moonbitlang/core/builtin#Failure">Failure</a>) -> String
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="#$default_impl">$default_impl</a> with to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ToJson

```moonbit
:::source,moonbitlang/core/builtin/json.mbt,28:::pub(open) trait ToJson {
  to_json(Self) -> <a href="moonbitlang/core/json#Json">Json</a>
}
```

 Trait for types that can be converted to `Json`

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,101:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,41:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,59:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,151:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,125:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,28:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,209:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,16:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,79:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,311:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, N : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, O : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,349:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, N : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, O : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, P : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,241:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,21:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,179:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,275:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a> with to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, N : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 

## ArgsLoc

```moonbit
:::source,moonbitlang/core/builtin/autoloc.mbt,27:::pub(all) type ArgsLoc <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a>?]
```


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/autoloc.mbt,27:::fn <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a>::output(<a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/autoloc.mbt,30:::fn <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a>::to_json(self : <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a>) -> String
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Array

```moonbit
:::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,21:::type Array
```

 An `Array` is a collection of values that supports random access and can
grow in size.

#### mooncakes-io-method-mark-Methods
- #### append
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,166:::fn <a href="moonbitlang/core/array#Array">Array</a>::append[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], other : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  > 
  >  Appends all the elements of other array into self
  > 
  >  #### Example
  >  ```
  >  let v1 = [3, 4, 5]
  >  let v2 = [6, 7, 8]
  >  v1.append(v2)
  >  ```
- #### binary\_search
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,624:::fn <a href="moonbitlang/core/array#Array">Array</a>::binary_search[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], value : T) -> <a href="moonbitlang/core/result#Result">Result</a>[Int, Int]
  ```
  > 
  >  Performs a binary search on a sorted array to find the index of a given element.
  >  
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let result = v.binary_search(3)
  >  assert_eq!(result, Ok(0)) // The element 3 is found at index 0
  >  ```
  >  
  >  #### Arguments
  >  - `self`: The array in which to perform the search.
  >  - `value`: The element to search for in the array.
  >  
  >  #### Returns
  >  - `Result[Int, Int]`:
  >    If the element is found, an `Ok` variant is returned, containing the index of the matching element in the array.
  >    If there are multiple matches, the leftmost match will be returned.
  >    If the element is not found, an `Err` variant is returned, containing the index where the element could be inserted to maintain the sorted order.
  >  
  >  #### Notes
  >  - Ensure that the array is sorted in increasing order before calling this function.
  >  - If the array is not sorted, the returned result is undefined and should not be relied on.
- #### binary\_search\_by
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,675:::fn <a href="moonbitlang/core/array#Array">Array</a>::binary_search_by[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], cmp : (T) -> Int) -> <a href="moonbitlang/core/result#Result">Result</a>[Int, Int]
  ```
  > 
  >  Performs a binary search on a sorted array using a custom comparator function, and returns the index of the given element.
  >  
  >  The comparator function should return an `Int` that indicates whether the argument is less than `(-1)`, equal to `(0)`, or greater than `(1)`
  > the target element.
  >  
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let result = v.binary_search_by(
  >    fn(v : Int) { if v < 3 { -1 } else if v == 3 { 0 } else { 1 } },
  >  )
  >  assert_eq!(result, Ok(0)) // The element 3 is found at index 0
  >  ```
  >  #### Type Parameters
  >  - `T`: The type of elements in the array.
  >  
  >  #### Arguments
  >  - `self`: The array in which to perform the search.
  >  - `cmp`: A closure that defines the comparator function, taking an element of type `T` and returning an `Int`.
  >  
  >  #### Returns
  >  - `Result[Int, Int]`: If the element is found, `Ok` is returned with the index of the element.
  >    If the element is not found, `Err` is returned with the index where the element could be inserted to maintain sorted order.
  >  
  >  #### Notes
  >  - The array must be sorted, and the comparator function should be consistent with the sorted order of the array.
  >  - If not, the returned result is undefined and should not be relied on.
- #### blit\_to
  ```moonbit
  :::source,moonbitlang/core/builtin/array_block.mbt,66:::fn <a href="moonbitlang/core/array#Array">Array</a>::blit_to[A](self : <a href="moonbitlang/core/array#Array">Array</a>[A], dst : <a href="moonbitlang/core/array#Array">Array</a>[A], len~ : Int, src_offset~ : Int = .., dst_offset~ : Int = ..) -> Unit
  ```
  > 
  >  Copies elements from one array to another array. The destination array will grow if necessary.
  >  
  >  #### Arguments
  >  - `self`: The source array to copy elements from
  >  - `dst`: The destination array to copy elements to
  >  - `len`: The number of elements to copy
  >  - `src_offset`: Starting index in the source array (default: 0)
  >  - `dst_offset`: Starting index in the destination array (default: 0)
  > 
  >  #### Panics
  >  Panics if:
  >  - `len` is negative
  >  - `src_offset` is negative
  >  - `dst_offset` is negative
  >  - `src_offset + len` exceeds source array length
  >  - `dst_offset` exceeds destination array length
- #### capacity
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,36:::fn <a href="moonbitlang/core/array#Array">Array</a>::capacity[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Int
  ```
  > 
  >  Returns the total number of elements the array can hold without reallocating.
- #### chunk\_by
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,1008:::fn <a href="moonbitlang/core/array#Array">Array</a>::chunk_by[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], pred : (T, T) -> Bool) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[T]]
  ```
  > 
  >  Group the elements of the array into chunks based on a predicate.
  > 
  >  #### Example
  >  ```
  >  let v = [1, 1, 2, 3, 2, 3, 2, 3, 4]
  >  let chunks = v.chunk_by(fn(x, y) { x <= y })
  >  assert_eq!(chunks, [[1, 1, 2, 3], [2, 3], [2, 3, 4]])
  >  ```
- #### chunks
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,985:::fn <a href="moonbitlang/core/array#Array">Array</a>::chunks[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], size : Int) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[T]]
  ```
  > 
  >  Group the elements of the array into sized chunks.
  > 
  >  If the elements of the array cannot be divided into equal-sized chunks, the last chunk will be smaller.
  > 
  >  #### Example
  >  ```
  >  let v = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  >  let chunks = v.chunks(3)
  >  assert_eq!(chunks, [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  >  ```
- #### clear
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,262:::fn <a href="moonbitlang/core/array#Array">Array</a>::clear[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  > 
  >  Clears the array, removing all values.
  > 
  >  This method has no effect on the allocated capacity of the array, only setting the length to 0.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.clear()
  >  assert_eq!(v.length(), 0)
  >  ```
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,118:::fn <a href="moonbitlang/core/array#Array">Array</a>::compare[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], other : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Int
  ```
  > 
- #### contains
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,452:::fn <a href="moonbitlang/core/array#Array">Array</a>::contains[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], value : T) -> Bool
  ```
  > 
  >  Checks if the array contains an element.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  assert_true!(v.contains(3))
  >  ```
- #### dedup
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,933:::fn <a href="moonbitlang/core/array#Array">Array</a>::dedup[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  > 
  >  Removes consecutive repeated elements in the array according to the Eq trait.
  > 
  >  #### Example
  > 
  >  ```
  >  let v = [3, 4, 4, 5, 5, 5]
  >  v.dedup() // v = [3, 4, 5]
  >  ```
  > 
  >  #### Notes
  > 
  >  Usually, you might want to sort the array before calling this function. For example:
  > 
  >  ```
  >  let v = [3, 4, 5, 4, 5, 5]
  >  v.sort()
  >  v.dedup() // v = [3, 4, 5]
  >  ```
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,1073:::fn <a href="moonbitlang/core/array#Array">Array</a>::default[T]() -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
- #### drain
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,301:::fn <a href="moonbitlang/core/array#Array">Array</a>::drain[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], begin : Int, end : Int) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Removes the specified range from the array and returns it.
  > 
  >  This functions returns a array range from `begin` to `end` `[begin, end)`
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let vv = v.drain(1, 2) // vv = [4], v = [3, 5]
  >  assert_eq!(vv, [4])
  >  assert_eq!(v, [3, 5])
  >  ```
  >  @alert unsafe "Panic if index is out of bounds."
- #### each
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,187:::fn <a href="moonbitlang/core/array#Array">Array</a>::each[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the array.
  > 
  >  #### Example
  >  ```
  >  let v = Array::new(capacity=3)
  >  v.push(3)
  >  v.push(4)
  >  v.push(5)
  >  let mut sum = 0
  >  v.each(fn (x) {sum = sum + x})
  >  ```
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,245:::fn <a href="moonbitlang/core/array#Array">Array</a>::eachi[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (Int, T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the array with index.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let mut sum = 0
  >  v.eachi(fn (i, x) {sum = sum + x + i})
  >  ```
- #### ends\_with
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,491:::fn <a href="moonbitlang/core/array#Array">Array</a>::ends_with[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], suffix : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Bool
  ```
  > 
  >  Check if the array ends with a given suffix.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  assert_true!(v.ends_with([5]))
  >  ```
- #### extract\_if
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,959:::fn <a href="moonbitlang/core/array#Array">Array</a>::extract_if[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Bool) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Extract elements from the array according to the given function.
  > 
  >  This function will remove the elements from the original array and return a new array.
  >  #### Example
  >  ```
  >  let 
  >  v = [3, 4, 5]
  >  let vv = v.extract_if(fn(x) { x > 3 })
  >  assert_eq!(vv, [4, 5])
  >  assert_eq!(v, [3])
  >  ```
- #### filter
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,342:::fn <a href="moonbitlang/core/array#Array">Array</a>::filter[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Bool) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Filters the array with a predicate function.
  > 
  >  #### Example
  >  ```
  >  let arr = [1, 2, 3, 4, 5, 6]
  >  let v = arr.filter(fn (x) { x % 2 == 0 })
  >  assert_eq!(v, [2, 4, 6])
  >  ```
- #### find\_index
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,575:::fn <a href="moonbitlang/core/array#Array">Array</a>::find_index[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Bool) -> Int?
  ```
  > 
  >  @alert deprecated "Use `search_by` instead."
- #### flatten
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,773:::fn <a href="moonbitlang/core/array#Array">Array</a>::flatten[T](self : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[T]]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Flattens a array of arrays into a array.
  > 
  >  #### Example
  >  ```
  >  let v = [[3, 4], [5, 6]].flatten()
  >  assert_eq!(v, [3, 4, 5, 6])
  >  ```
  >  TODO: perf could be improved by pre-allocated
- #### fold
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,805:::fn <a href="moonbitlang/core/array#Array">Array</a>::fold[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
- #### fold\_left
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,871:::fn <a href="moonbitlang/core/array#Array">Array</a>::fold_left[T, U](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
  >  @alert deprecated "Use `fold` instead."
- #### fold\_lefti
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,897:::fn <a href="moonbitlang/core/array#Array">Array</a>::fold_lefti[T, U](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (Int, U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
  >  @alert deprecated "Use `foldi` instead."
- #### fold\_right
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,884:::fn <a href="moonbitlang/core/array#Array">Array</a>::fold_right[T, U](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
  >  @alert deprecated "Use `rev_fold` instead."
- #### fold\_righti
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,910:::fn <a href="moonbitlang/core/array#Array">Array</a>::fold_righti[T, U](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (Int, U, T) -> U, init~ : U) -> U
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
  >  @alert deprecated "Use `rev_foldi` instead."
- #### foldi
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,837:::fn <a href="moonbitlang/core/array#Array">Array</a>::foldi[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
- #### from\_fixed\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,17:::fn <a href="moonbitlang/core/array#Array">Array</a>::from_fixed_array[T](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Creates a new array from an array.
- #### get
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,72:::fn <a href="moonbitlang/core/array#Array">Array</a>::get[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], index : Int) -> T?
  ```
  > 
  >  Retrieves the element at the specified index from the array, or `None` if index is out of bounds
  > 
  >  #### Example
  >  ```
  >  let v = []
  >  v.push(3)
  >  assert_eq!(v.get(0), Some(3))
  >  ```
- #### insert
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,325:::fn <a href="moonbitlang/core/array#Array">Array</a>::insert[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], index : Int, value : T) -> Unit
  ```
  > 
  >  Inserts an element at a given index within the array.
  > 
  >  #### Example
  >  ```
  >  [3, 4, 5].insert(1, 6)
  >  ```
  >  @alert unsafe "Panic if index is out of bounds."
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,360:::fn <a href="moonbitlang/core/array#Array">Array</a>::is_empty[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Bool
  ```
  > 
  >  Test if the array is empty.
  > 
  >  #### Example
  >  ```
  >  let v : Array[Int] = []
  >  assert_true!(v.is_empty())
  >  ```
- #### is\_sorted
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,372:::fn <a href="moonbitlang/core/array#Array">Array</a>::is_sorted[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Bool
  ```
  > 
  >  Test if the array is sorted.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  assert_true!(v.is_sorted())
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,1049:::fn <a href="moonbitlang/core/array#Array">Array</a>::iter[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,1061:::fn <a href="moonbitlang/core/array#Array">Array</a>::iter2[A](self : <a href="moonbitlang/core/array#Array">Array</a>[A]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, A]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,44:::fn <a href="moonbitlang/core/array#Array">Array</a>::length[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Int
  ```
  > 
  >  Returns the number of elements in the array.
  > @intrinsic %array.length
- #### make
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,26:::fn <a href="moonbitlang/core/array#Array">Array</a>::make[T](len : Int, elem : T) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Creates a new array, with the specified length \[len\] and element \[elem\].
- #### map
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,275:::fn <a href="moonbitlang/core/array#Array">Array</a>::map[T, U](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> U) -> <a href="moonbitlang/core/array#Array">Array</a>[U]
  ```
  > 
  >  Maps a function over the elements of the array.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let v2 = v.map(fn (x) {x + 1})
  >  assert_eq!(v2, [4, 5, 6])
  >  ```
- #### map\_inplace
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,292:::fn <a href="moonbitlang/core/array#Array">Array</a>::map_inplace[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> T) -> Unit
  ```
  > 
  >  Maps a function over the elements of the array in place.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.map_inplace(fn (x) {x + 1})
  >  assert_eq!(v, [4, 5, 6])
  >  ```
- #### mapi
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,307:::fn <a href="moonbitlang/core/array#Array">Array</a>::mapi[T, U](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (Int, T) -> U) -> <a href="moonbitlang/core/array#Array">Array</a>[U]
  ```
  > 
  >  Maps a function over the elements of the array with index.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let v2 = v.mapi(fn (i, x) {x + i})
  >  assert_eq!(v2, [3, 5, 7])
  >  ```
- #### mapi\_inplace
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,327:::fn <a href="moonbitlang/core/array#Array">Array</a>::mapi_inplace[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (Int, T) -> T) -> Unit
  ```
  > 
  >  Maps a function over the elements of the array with index in place.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.mapi_inplace(fn (i, x) {x + i})
  >  assert_eq!(v, [3, 5, 7])
  >  ```
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,33:::fn <a href="moonbitlang/core/array#Array">Array</a>::new[T](capacity~ : Int = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Creates a new array.
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,138:::fn <a href="moonbitlang/core/array#Array">Array</a>::op_add[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], other : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
- #### op\_as\_view
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,61:::fn <a href="moonbitlang/core/array#Array">Array</a>::op_as_view[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], start~ : Int = .., end? : Int) -> <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,103:::fn <a href="moonbitlang/core/array#Array">Array</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], other : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Bool
  ```
  > 
  >  Compares two arrays for equality.
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,57:::fn <a href="moonbitlang/core/array#Array">Array</a>::op_get[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], index : Int) -> T
  ```
  > 
  >  Retrieves the element at the specified index from the array.
  > 
  >  #### Example
  >  ```
  >  let v = []
  >  v.push(3)
  >  assert_eq!(v[0], 3)
  >  ```
  >  @alert unsafe "Panic if index is out of bounds"
  > @intrinsic %array.get
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,95:::fn <a href="moonbitlang/core/array#Array">Array</a>::op_set[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], index : Int, value : T) -> Unit
  ```
  > 
  >  Sets the value of the element at the specified index.
  > 
  >  #### Example
  >  ```
  >  let v = []
  >  v.push(3)
  >  assert_eq!(v[0], 3)
  >  ```
  >  @alert unsafe "Panic if index is out of bounds."
  > @intrinsic %array.set
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,188:::fn <a href="moonbitlang/core/array#Array">Array</a>::output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### pop
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,225:::fn <a href="moonbitlang/core/array#Array">Array</a>::pop[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> T?
  ```
  > 
  >  Removes the last element from a array and returns it, or `None` if it is empty.
  > 
  >  #### Example
  >  ```
  >  let v = [1, 2, 3]
  >  assert_eq!(v.pop(), Some(3))
  >  assert_eq!(v, [1, 2])
  >  ```
- #### pop\_exn
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,240:::fn <a href="moonbitlang/core/array#Array">Array</a>::pop_exn[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> T
  ```
  > 
  >  @alert deprecated "Use `unsafe_pop` instead"
- #### push
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,207:::fn <a href="moonbitlang/core/array#Array">Array</a>::push[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], value : T) -> Unit
  ```
  > 
  >  Adds an element to the end of the array.
  > 
  >  If the array is at capacity, it will be reallocated.
  > 
  >  #### Example
  >  ```
  >  let v = []
  >  v.push(3)
  >  ```
- #### remove
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,270:::fn <a href="moonbitlang/core/array#Array">Array</a>::remove[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], index : Int) -> T
  ```
  > 
  >  Remove an element from the array at a given index.
  > 
  >  Removes and returns the element at position index within the array, shifting all elements after it to the left.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  assert_eq!(v.remove(1), 4)
  >  assert_eq!(v, [3, 5])
  >  ```
  >  @alert unsafe "Panic if index is out of bounds."
- #### repeat
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,789:::fn <a href="moonbitlang/core/array#Array">Array</a>::repeat[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], times : Int) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Create a array by repeat a given array for a given times.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4].repeat(2)
  >  assert_eq!(v, [3, 4, 3, 4])
  >  ```
- #### reserve\_capacity
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,170:::fn <a href="moonbitlang/core/array#Array">Array</a>::reserve_capacity[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], capacity : Int) -> Unit
  ```
  > 
  >  Reserves capacity to ensure that it can hold at least the number of elements
  > specified by the `capacity` argument.
  > 
  >  #### Example
  > 
  >  ```
  >  let v = [1]
  >  v.reserve_capacity(10)
  >  assert_eq!(v.capacity(), 10)
  >  ```
- #### resize
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,751:::fn <a href="moonbitlang/core/array#Array">Array</a>::resize[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], new_len : Int, f : T) -> Unit
  ```
  > 
  >  Resize the array to a new length with a default value.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.resize(1, 0)
  >  assert_eq!(v, [3])
  >  ```
  >  @alert unsafe "Panic if new length is negative."
- #### retain
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,728:::fn <a href="moonbitlang/core/array#Array">Array</a>::retain[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Bool) -> Unit
  ```
  > 
  >  Retains only the elements specified by the predicate.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.retain(fn(x) { x > 3 })
  >  ```
  >  TODO: perf could be improved
- #### rev
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,402:::fn <a href="moonbitlang/core/array#Array">Array</a>::rev[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Reverses the order of elements in the Array and returns a new Array.
- #### rev\_each
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,212:::fn <a href="moonbitlang/core/array#Array">Array</a>::rev_each[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the array in reverse order, applying the given
  > function to each element.
  > 
  >  Parameters:
  > 
  >  * `array` : The array to iterate over.
  >  * `f` : A function that takes an element of type `T` and returns `Unit`. This
  >    function is applied to each element of the array in reverse order.
  > 
  >  Example:
  > 
  >  ```
  >  let v = [3, 4, 5]
  >  let mut sum = 0
  >  v.rev_each(fn(x) { sum = sum - x })
  >  @json.inspect!(sum, content=-12)
  >  ```
  > 
- #### rev\_eachi
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,229:::fn <a href="moonbitlang/core/array#Array">Array</a>::rev_eachi[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (Int, T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over the elements of the array with index in reversed order.
  >  
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let mut sum = 0
  >  v.rev_eachi(fn(i, x) { sum = sum + x + i })
  >  assert_eq!(sum, 15)
  >  ```
- #### rev\_fold
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,821:::fn <a href="moonbitlang/core/array#Array">Array</a>::rev_fold[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
- #### rev\_foldi
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,853:::fn <a href="moonbitlang/core/array#Array">Array</a>::rev_foldi[A, B](self : <a href="moonbitlang/core/array#Array">Array</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an array according to certain rules in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5].rev_foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
- #### rev\_inplace
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,392:::fn <a href="moonbitlang/core/array#Array">Array</a>::rev_inplace[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  > 
  >  Reverses the order of elements in the Array, in place.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.rev_inplace()
  >  ```
- #### search
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,563:::fn <a href="moonbitlang/core/array#Array">Array</a>::search[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], value : T) -> Int?
  ```
  > 
  >  Search the array index for a given element.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let index = v.search(3)
  >  assert_eq!(index, Some(0))
  >  ```
- #### search\_by
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,591:::fn <a href="moonbitlang/core/array#Array">Array</a>::search_by[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], f : (T) -> Bool) -> Int?
  ```
  > 
  >  Search the index of the first element that satisfies the predicate.
  > 
  >  #### Example
  >  
  >  ```
  >  let v = [1, 2, 3, 4, 5]
  >  match v.search_by(fn(x) { x == 3 }) {
  >    Some(index) => assert_eq!(index, 2) // 2
  >    None => println("Not found")
  >  }
  >  ```
- #### shrink\_to\_fit
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,190:::fn <a href="moonbitlang/core/array#Array">Array</a>::shrink_to_fit[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Unit
  ```
  > 
  >  Shrinks the capacity of the array as much as possible.
  > 
  >  #### Example
  > 
  >  ```
  >  let v = Array::new(capacity=10)
  >  v.push(1)
  >  v.push(2)
  >  v.push(3)
  >  v.shrink_to_fit()
  >  assert_eq!(v.capacity(), 3)
  >  ```
- #### split
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,1033:::fn <a href="moonbitlang/core/array#Array">Array</a>::split[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], pred : (T) -> Bool) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[T]]
  ```
  > 
  >  Split the array into chunks based on a predicate.
  > 
  >  #### Example
  >  ```
  >  let v = [1, 0, 2, 0, 3, 0, 4]
  >  let chunks = v.split(fn(x) { x == 0 })
  >  assert_eq!(chunks, [[1], [2], [3], [4]])
  >  ```
- #### split\_at
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,422:::fn <a href="moonbitlang/core/array#Array">Array</a>::split_at[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], index : Int) -> (<a href="moonbitlang/core/array#Array">Array</a>[T], <a href="moonbitlang/core/array#Array">Array</a>[T])
  ```
  > 
  >  Split the array into two at the given index.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let (v1, v2) = v.split_at(1)
  >  assert_eq!(v1, [3])
  >  assert_eq!(v2, [4, 5])
  >  ```
  >  TODO: perf could be optimized
  > @alert unsafe "Panic if index is out of bounds."
- #### starts\_with
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,470:::fn <a href="moonbitlang/core/array#Array">Array</a>::starts_with[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], prefix : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> Bool
  ```
  > 
  >  Check if the array starts with a given prefix.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  assert_true!(v.starts_with([3, 4]))
  >  ```
- #### strip\_prefix
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,516:::fn <a href="moonbitlang/core/array#Array">Array</a>::strip_prefix[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], prefix : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]?
  ```
  > 
  >  Strip a prefix from the array.
  > 
  >  If the array starts with the prefix, return the array after the prefix, otherwise return None.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let v2 = v.strip_prefix([3])
  >  assert_eq!(v2, Some([4, 5]))
  >  ```
- #### strip\_suffix
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,543:::fn <a href="moonbitlang/core/array#Array">Array</a>::strip_suffix[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[T], suffix : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]?
  ```
  > 
  >  Strip a suffix from the array.
  > 
  >  If the array ends with the suffix, return the array before the suffix, otherwise return None.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let v2 = v.strip_suffix([5])
  >  assert_eq!(v2, Some([3, 4]))
  >  ```
- #### swap
  ```moonbit
  :::source,moonbitlang/core/builtin/array.mbt,707:::fn <a href="moonbitlang/core/array#Array">Array</a>::swap[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T], i : Int, j : Int) -> Unit
  ```
  > 
  >  Swap two elements in the array.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v.swap(1, 2)
  >  ```
  >  @alert unsafe "Panic if index is out of bounds."
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,118:::fn <a href="moonbitlang/core/array#Array">Array</a>::to_json[X : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/array#Array">Array</a>[X]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/array#Array">Array</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### unsafe\_blit
  ```moonbit
  :::source,moonbitlang/core/builtin/array_block.mbt,16:::fn <a href="moonbitlang/core/array#Array">Array</a>::unsafe_blit[A](dst : <a href="moonbitlang/core/array#Array">Array</a>[A], dst_offset : Int, src : <a href="moonbitlang/core/array#Array">Array</a>[A], src_offset : Int, len : Int) -> Unit
  ```
  > 
- #### unsafe\_blit\_fixed
  ```moonbit
  :::source,moonbitlang/core/builtin/array_block.mbt,33:::fn <a href="moonbitlang/core/array#Array">Array</a>::unsafe_blit_fixed[A](dst : <a href="moonbitlang/core/array#Array">Array</a>[A], dst_offset : Int, src : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], src_offset : Int, len : Int) -> Unit
  ```
  > 
- #### unsafe\_pop
  ```moonbit
  :::source,moonbitlang/core/builtin/arraycore_nonjs.mbt,248:::fn <a href="moonbitlang/core/array#Array">Array</a>::unsafe_pop[T](self : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> T
  ```
  > 
  >  Removes the last element from a array and returns it.
  >  
  >  @alert unsafe "Panic if the array is empty."

## ArrayView

```moonbit
:::source,moonbitlang/core/builtin/arrayview.mbt,17:::type ArrayView
```

 A `ArrayView` is a slice of a `Array`.

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,279:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::compare[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], other : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Int
  ```
  > 
- #### filter
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,254:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::filter[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> Bool) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Filters the array view with a predicate function.
  > 
  >  #### Example
  >  ```
  >  let arr = [1, 2, 3, 4, 5, 6]
  >  let v = arr[2:].filter(fn (x) { x % 2 == 0 })
  >  assert_eq!(v, [4, 6])
  >  ```
- #### fold
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,114:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::fold[A, B](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an arrayview according to certain rules.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
- #### foldi
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,146:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::foldi[A, B](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an arrayview according to certain rules with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,95:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::iter[A](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,24:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::length[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Int
  ```
  > 
- #### map
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,184:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::map[T, U](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> U) -> <a href="moonbitlang/core/array#Array">Array</a>[U]
  ```
  > 
  >  Maps a function over the elements of the array view.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let v2 = v[1:].map(fn (x) {x + 1})
  >  assert_eq!(v2, [5, 6])
  >  ```
- #### map\_inplace
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,204:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::map_inplace[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (T) -> T) -> Unit
  ```
  > 
  >  Maps a function over the elements of the array view in place.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v[1:].map_inplace(fn (x) {x + 1})
  >  assert_eq!(v, [3, 5, 6])
  >  ```
- #### mapi
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,219:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::mapi[T, U](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (Int, T) -> U) -> <a href="moonbitlang/core/array#Array">Array</a>[U]
  ```
  > 
  >  Maps a function over the elements of the array view with index.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  let v2 = v[1:].mapi(fn (i, x) {x + i})
  >  assert_eq!(v2, [4, 6])
  >  ```
- #### mapi\_inplace
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,239:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::mapi_inplace[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], f : (Int, T) -> T) -> Unit
  ```
  > 
  >  Maps a function over the elements of the array view with index in place.
  > 
  >  #### Example
  >  ```
  >  let v = [3, 4, 5]
  >  v[1:].mapi_inplace(fn (i, x) {x + i})
  >  assert_eq!(v, [3, 4, 6])
  >  ```
- #### op\_as\_view
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,78:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::op_as_view[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], start~ : Int = .., end? : Int) -> <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,265:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], other : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T]) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,29:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::op_get[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], index : Int) -> T
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,39:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::op_set[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], index : Int, value : T) -> Unit
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,193:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### rev\_fold
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,130:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::rev_fold[A, B](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A], init~ : B, f : (B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an arrayview according to certain rules in reversed turn.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].rev_fold(init=0, fn { sum, elem => sum + elem })
  >  assert_eq!(sum, 15)
  >  ```
- #### rev\_foldi
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,162:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::rev_foldi[A, B](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[A], init~ : B, f : (Int, B, A) -> B) -> B
  ```
  > 
  >  Fold out values from an arrayview according to certain rules in reversed turn with index.
  > 
  >  #### Example
  >  ```
  >  let sum = [1, 2, 3, 4, 5][:].rev_foldi(init=0, fn { index, sum, _elem => sum + index })
  >  assert_eq!(sum, 10)
  >  ```
- #### swap
  ```moonbit
  :::source,moonbitlang/core/builtin/arrayview.mbt,49:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::swap[T](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[T], i : Int, j : Int) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,136:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::to_json[X : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[X]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,198:::fn <a href="moonbitlang/core/array#ArrayView">ArrayView</a>::to_string[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[X]) -> String
  ```
  > 

## BigInt

```moonbit
:::source,moonbitlang/core/builtin/bigint_nonjs.mbt,33:::type BigInt
```

 A big integer represented as an array of Int.

#### mooncakes-io-method-mark-Methods
- #### asr
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_deprecated.mbt,17:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::asr(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  @alert deprecated "Use infix bitwise operator `>>` instead"
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,538:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::compare(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> Int
  ```
  > 
  >  Implements the compare trait for BigInt
- #### from\_hex
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,672:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::from_hex(input : String) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Converts a hex string to a BigInt.
  >  
  >  The input string must be a valid hex string with no extra `0x` prefix.
- #### from\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,83:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::from_int(n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Convert an Int to a BigInt.
- #### from\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,89:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::from_int64(n : Int64) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Convert an Int64 to a BigInt.
- #### from\_octets
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,857:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::from_octets(input : Bytes, signum~ : Int = ..) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Convert an octet string to a BigInt.
  >  
  >  The input is treated as a big-endian octet array.
  >  
  >  Example: `from_octets(b"\xab\xcd\xef") == from_hex("abcdef")`
  >  
  >  The input must not be empty, unless signum is zero
- #### from\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,633:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::from_string(input : String) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Converts decimal string to a BigInt.
- #### is\_zero
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,532:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::is_zero(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> Bool
  ```
  > 
  >  Check if a bigint is zero
- #### land
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,930:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::land(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
- #### lor
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,1017:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::lor(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
- #### lsl
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_deprecated.mbt,37:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::lsl(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Left shift a bigint
  > The sign of the result is the same as the sign of the input.
  > Only the absolute value is shifted.
  >  
  >  @alert deprecated "Use infix bitwise operator `<<` instead"
- #### lxor
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,1104:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::lxor(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,117:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_add(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Add two bigint.
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,265:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_div(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Divide two bigint
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,565:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_equal(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> Bool
  ```
  > 
  >  Implements the Eq trait for BigInt
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,287:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_mod(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Modulo two bigint
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,197:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_mul(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Multiply two bigint
- #### op\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,108:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_neg(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Negate a bigint
- #### op\_shl
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,453:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_shl(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Left shift a bigint
  > The sign of the result is the same as the sign of the input.
  > Only the absolute value is shifted.
  >  
- #### op\_shr
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,490:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_shr(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Right shift a bigint
  > The sign of the result is the same as the sign of the input.
  > Only the absolute value is shifted.
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,145:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::op_sub(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, other : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Subtract two bigint
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,627:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::output(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### pow
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,814:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::pow(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, exp : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, modulus? : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Computes the result of raising a `BigInt` to the power of another `BigInt`,
  > with an optional modulus.
  > 
  >  When a modulus is provided, computes the modular exponentiation using the
  > square-and-multiply algorithm. This is particularly useful in cryptographic
  > applications where direct exponentiation would result in numbers too large to
  > handle efficiently.
  > 
  >  Parameters:
  > 
  >  * `self` : The base number to be raised to a power.
  >  * `exp` : The exponent (must be non-negative).
  >  * `modulus` : Optional modulus for modular exponentiation (must be positive
  >    if provided).
  > 
  >  Returns the result of the exponentiation, or the result modulo `modulus` if a
  > modulus is provided.
  > 
  >  Throws:
  > 
  >  * Aborts if the exponent is negative.
  >  * Aborts if the provided modulus is zero or negative.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "BigInt::pow" {
  >    let base = BigInt::from_string("3")
  >    let exp = BigInt::from_string("4")
  >    inspect!(base.pow(exp), content="81")
  >    inspect!(base.pow(exp, modulus=BigInt::from_string("10")), content="1")
  >  }
  >  
  >  test "panic BigInt::pow/negative_exponent" {
  >    let base = BigInt::from_string("3")
  >    let exp = BigInt::from_string("-1")
  >    ignore(base.pow(exp))
  >  }
  >  ```
- #### shl
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_deprecated.mbt,27:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::shl(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Left shift a bigint
  > The sign of the result is the same as the sign of the input.
  > Only the absolute value is shifted.
  >  
  >  @alert deprecated "Use infix bitwise operator `<<` instead"
- #### shr
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_deprecated.mbt,47:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::shr(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, n : Int) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  >  Right shift a bigint
  > The sign of the result is the same as the sign of the input.
  > Only the absolute value is shifted.
  >  
  >  @alert deprecated "Use infix bitwise operator `>>` instead"
- #### to\_hex
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,721:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::to_hex(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, uppercase~ : Bool = ..) -> String
  ```
  > 
  >  Converts a BigInt to a hex string.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,113:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::to_json(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_octets
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,905:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::to_octets(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>, length? : Int) -> Bytes
  ```
  > 
  >  Convert a BigInt to an octet string.
  >  
  >  The output is a big-endian octet array.
  >  
  >  The output may be padded with leading zeros to meet the length requirement
  > if and only if the actual length is less than the expected.
  >  
  >  The value should be non-negative and the padding should be positive.
  >  
  >  Example:
  >  - `to_octets(from_hex("abcdef"), length=3) == b"\xab\xcd\xef"`
  >  - `to_octets(from_hex("1abcdef"), length=3) == b"\x01\xab\xcd\xef"`
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bigint_nonjs.mbt,579:::fn <a href="moonbitlang/core/bigint#BigInt">BigInt</a>::to_string(self : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> String
  ```
  > 
  >  Returns the decimal string representation of the BigInt.

## Failure

```moonbit
:::source,moonbitlang/core/builtin/failure.mbt,16:::pub(all) type! Failure String

```


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,146:::fn <a href="moonbitlang/core/builtin#Failure">Failure</a>::output(self : <a href="moonbitlang/core/builtin#Failure">Failure</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,140:::fn <a href="moonbitlang/core/builtin#Failure">Failure</a>::to_string(self : <a href="moonbitlang/core/builtin#Failure">Failure</a>) -> String
  ```
  > 

## Hasher

```moonbit
:::source,moonbitlang/core/builtin/hasher.mbt,32:::type Hasher
```

 xxhash32 Hasher

#### mooncakes-io-method-mark-Methods
- #### combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,42:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine[T : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : T) -> Unit
  ```
  > 
- #### combine\_bool
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,52:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_bool(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Bool) -> Unit
  ```
  > 
- #### combine\_byte
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,85:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_byte(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Byte) -> Unit
  ```
  > 
- #### combine\_bytes
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,90:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_bytes(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Bytes) -> Unit
  ```
  > 
- #### combine\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,113:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_char(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Char) -> Unit
  ```
  > 
- #### combine\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,80:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_double(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Double) -> Unit
  ```
  > 
- #### combine\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,57:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_int(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Int) -> Unit
  ```
  > 
- #### combine\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,63:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_int64(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : Int64) -> Unit
  ```
  > 
- #### combine\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,106:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_string(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : String) -> Unit
  ```
  > 
- #### combine\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,70:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_uint(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : UInt) -> Unit
  ```
  > 
- #### combine\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,75:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_uint64(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>, value : UInt64) -> Unit
  ```
  > 
- #### combine\_unit
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,47:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::combine_unit(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### finalize
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,118:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::finalize(self : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,37:::fn <a href="moonbitlang/core/builtin#Hasher">Hasher</a>::new(seed~ : Int = ..) -> <a href="moonbitlang/core/builtin#Hasher">Hasher</a>
  ```
  > 

## InspectError

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,182:::pub(all) type! InspectError String

```


## Iter

```moonbit
:::source,moonbitlang/core/builtin/iter.mbt,17:::type Iter
```


#### mooncakes-io-method-mark-Methods
- #### all
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,68:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::all[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Bool) -> Bool
  ```
  > 
- #### any
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,63:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::any[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Bool) -> Bool
  ```
  > 
- #### append
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,711:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::append[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], a : T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Appends a single element to the end of the iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `a` - The element to be appended to the iterator.
  > 
  >  #### Returns
  > 
  >  Returns a new iterator with the element `a` appended to the original iterator.
- #### collect
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,764:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::collect[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Collects the elements of the iterator into an array.
- #### concat
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,737:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::concat[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], other : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Combines two iterators into one by appending the elements of the second iterator to the first.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterators.
  > 
  >  #### Arguments
  > 
  >  * `self` - The first input iterator.
  >  * `other` - The second input iterator to be appended to the first.
  > 
  >  #### Returns
  > 
  >  Returns a new iterator that contains the elements of `self` followed by the elements of `other`.
  > @intrinsic %iter.concat
- #### contains
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,887:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::contains[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A], value : A) -> Bool
  ```
  > 
  >  Checks if the iterator contains an element equal to the given value.
  > 
  >  Parameters:
  > 
  >  * `self` : The iterator to search in.
  >  * `value` : The value to search for.
  > 
  >  Returns `true` if the iterator contains an element equal to the given value,
  > `false` otherwise.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Iter::contains" {
  >    let iter = [1, 2, 3, 4, 5].iter()
  >    inspect!(iter.contains(3), content="true")
  >    inspect!(iter.contains(6), content="false")
  >  }
  >  
  >  test "Iter::contains/empty" {
  >    let iter = Iter::empty()
  >    inspect!(iter.contains(1), content="false")
  >  }
  >  ```
- #### count
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,133:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::count[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> Int
  ```
  > 
  >  Counts the number of elements in the iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  - `self`: The iterator to consume.
  > 
  >  #### Returns
  > 
  >  Returns the number of elements in the iterator.
- #### drop
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,593:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::drop[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], n : Int) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Skips the first `n` elements from the iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `n` - The number of elements to skip.
  > 
  >  #### Returns
  > 
  >  A new iterator that starts after skipping the first `n` elements.
- #### drop\_while
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,622:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::drop_while[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Bool) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Skips elements from the iterator as long as the predicate function returns `true`.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The predicate function that determines whether an element should be skipped.
  > 
  >  #### Returns
  > 
  >  A new iterator that starts after skipping the elements as long as the predicate function returns `true`.
- #### each
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,56:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::each[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over each element in the iterator, applying the function `f` to each element.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  - `self`: The iterator to consume.
  >  - `f`: A function that takes an element of type `T` and returns `Unit`. This function is applied to each element of the iterator.
  >    TODO: change the intrinsic to match the function name
  >    @intrinsic %iter.iter
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,85:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::eachi[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (Int, T) -> Unit) -> Unit
  ```
  > 
  >  Iterates over each element in the iterator, applying the function `f` to each element with index.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  - `self`: The iterator to consume.
  >  - `f`: A function that takes an index of type `Int` and an element of type `T` and returns `Unit`. This function is applied to each element of the iterator.
  >    TODO: Add intrinsic
- #### empty
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,155:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::empty[T]() -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Creates an empty iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Returns
  > 
  >  Returns an empty iterator of type `Iter[T]`.
- #### filter
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,391:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::filter[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Bool) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Filters the elements of the iterator based on a predicate function.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The predicate function that determines whether an element should be included in the filtered iterator.
  > 
  >  #### Returns
  > 
  >  A new iterator that only contains the elements for which the predicate function returns `IterContinue`.
  > @intrinsic %iter.filter
- #### find\_first
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,651:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::find_first[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Bool) -> T?
  ```
  > 
  >  Finds the first element in the iterator that satisfies the predicate function.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The predicate function that determines whether an element is the first element to be found.
  > 
  >  #### Returns
  > 
  >  An `Option` that contains the first element that satisfies the predicate function, or `None` if no such element is found.
- #### flat\_map
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,449:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::flat_map[T, R](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[R]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[R]
  ```
  > 
  >  Transforms each element of the iterator into an iterator and flattens the resulting iterators into a single iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  >  - `R`: The type of the transformed elements.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The function that transforms each element of the iterator into an iterator.
  > 
  >  #### Returns
  > 
  >  A new iterator that contains the flattened elements.
  > @intrinsic %iter.flat\_map
- #### fold
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,111:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::fold[T, B](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], init~ : B, f : (B, T) -> B) -> B
  ```
  > 
  >  Folds the elements of the iterator using the given function, starting with the given initial value.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  >  - `B`: The type of the accumulator value.
  > 
  >  #### Arguments
  > 
  >  - `self`: The iterator to consume.
  >  - `f`: A function that takes an accumulator of type `B` and an element of type `T`, and returns a new accumulator value.
  >  - `init`: The initial value for the fold operation.
  > 
  >  #### Returns
  > 
  >  Returns the final accumulator value after folding all elements of the iterator.
  > @intrinsic %iter.reduce
- #### head
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,808:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::head[A](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> A?
  ```
  > 
  >  Returns the first element of the iterator, or `None` if the iterator is empty.
  >  
  >  #### Type Parameters
  >  
  >  - `A` : The type of the elements in the iterator.
  >  
  >  #### Parameters
  >  
  >  - `self` : The iterator to retrieve the first element from.
  >  
  >  #### Returns
  >  
  >  - An `Option` containing the first element of the iterator if it exists, otherwise `None`.
  >  
  >  #### Examples
  >  
  >  ```
  >  let iter = Iter::singleton(42)
  >  assert_eq!(head(iter), Some(42))
  >  ```
- #### intersperse
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,831:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::intersperse[A](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A], sep : A) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
  >  Inserts a separator element `sep` between each element of the iterator.
  >  
  >  #### Parameters
  >  
  >  - `self` : The iterator to intersperse the separator into.
  >  - `sep` : The separator element to insert between each element of the iterator.
  >  
  >  #### Examples
  >  
  >  ```
  >  let arr = []
  >  [1, 2, 3].iter().intersperse(0).each(fn(i) {arr.push(i)})
  >  assert_eq!(arr, [1, 0, 2, 0, 3])
  >  ```
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,773:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::iter[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Iter itself is an iterator.
  > so that it works with array spread operator. e.g, `[..iter]`
- #### just\_run
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,26:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::just_run[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> Unit
  ```
  > 
- #### last
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,779:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::last[A](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]) -> A?
  ```
  > 
  >  Returns the last element of the iterator, or `None` if the iterator is empty.
- #### map
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,414:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::map[T, R](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> R) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[R]
  ```
  > 
  >  Transforms the elements of the iterator using a mapping function.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  >  - `R`: The type of the transformed elements.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The mapping function that transforms each element of the iterator.
  > 
  >  #### Returns
  > 
  >  A new iterator that contains the transformed elements.
  > @intrinsic %iter.map
- #### map\_option
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,421:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::map_option[A, B](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A], f : (A) -> B?) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[B]
  ```
  > 
  >  Transforms the elements of the iterator using a mapping function that returns an `Option`.
  > The elements for which the function returns `None` are filtered out.
- #### map\_while
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,559:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::map_while[A, B](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A], f : (A) -> B?) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[B]
  ```
  > 
  >  Transforms the elements of the iterator using a mapping function upto the function returns `None`.
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,141:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::new[T](f : ((T) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Do not use this method, it is for internal use only.
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,748:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::op_add[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], other : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
- #### op\_as\_view
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,848:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::op_as_view[A](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[A], start~ : Int = .., end? : Int) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A]
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,37:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### peek
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,662:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::peek[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> T?
  ```
  > 
- #### prepend
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,686:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::prepend[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], a : T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Prepends a single element to the beginning of the iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `a` - The element to be prepended to the iterator.
  > 
  >  #### Returns
  > 
  >  Returns a new iterator with the element `a` prepended to the original iterator.
- #### repeat
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,192:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::repeat[T](a : T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Creates an iterator that repeats the given element indefinitely.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  - `a`: The element to be repeated.
  > 
  >  #### Returns
  > 
  >  Returns an iterator of type `Iter[T]` that repeats the element `a` indefinitely.
  > @intrinsic %iter.repeat
- #### run
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,21:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::run[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>
  ```
  > 
- #### singleton
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,173:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::singleton[T](a : T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Creates an iterator that contains a single element.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the element in the iterator.
  > 
  >  #### Arguments
  > 
  >  - `a`: The single element to be contained in the iterator.
  > 
  >  #### Returns
  > 
  >  Returns an iterator of type `Iter[T]` that contains the single element `a`.
- #### take
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,491:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::take[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], n : Int) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Takes the first `n` elements from the iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `n` - The number of elements to take.
  > 
  >  #### Returns
  > 
  >  A new iterator that contains the first `n` elements.
  > @intrinsic %iter.take
- #### take\_while
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,532:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::take_while[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Bool) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Takes elements from the iterator as long as the predicate function returns `true`.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The predicate function that determines whether an element should be taken.
  > 
  >  #### Returns
  > 
  >  A new iterator that contains the elements as long as the predicate function returns `true`.
- #### tap
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,470:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::tap[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], f : (T) -> Unit) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  Applies a function to each element of the iterator without modifying the iterator.
  > 
  >  #### Type Parameters
  > 
  >  - `T`: The type of the elements in the iterator.
  > 
  >  #### Arguments
  > 
  >  * `self` - The input iterator.
  >  * `f` - The function to apply to each element of the iterator.
  > 
  >  #### Returns
  > 
  >  The same iterator.
  >  
  >  @alert deprecated "use cascade operator \[..\] instead"
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,754:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::to_array[T](self : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  > 
  >  Collects the elements of the iterator into an array.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#Iter">Iter</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Iter2

```moonbit
:::source,moonbitlang/core/builtin/iter2.mbt,23:::type Iter2
```


#### mooncakes-io-method-mark-Methods
- #### each
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,59:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::each[A, B](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B], f : (A, B) -> Unit) -> Unit
  ```
  > 
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,68:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::iter[A, B](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(A, B)]
  ```
  > 
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,73:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::iter2[A, B](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B]
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,52:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::new[A, B](f : ((A, B) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B]
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,32:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### run
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,27:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::run[A, B](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B], f : (A, B) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> <a href="moonbitlang/core/builtin#IterResult">IterResult</a>
  ```
  > 
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/iter2.mbt,81:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::to_array[A, B](self : <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[A, B]) -> <a href="moonbitlang/core/array#Array">Array</a>[(A, B)]
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#Iter2">Iter2</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IterResult

```moonbit
:::source,moonbitlang/core/builtin/iter.mbt,31:::pub(all) enum IterResult {
  IterEnd
  IterContinue
}
```


#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,34:::fn <a href="moonbitlang/core/builtin#IterResult">IterResult</a>::op_equal(<a href="moonbitlang/core/builtin#IterResult">IterResult</a>, <a href="moonbitlang/core/builtin#IterResult">IterResult</a>) -> Bool
  ```
  > automatically derived

## Json

```moonbit
:::source,moonbitlang/core/builtin/json.mbt,16:::pub(all) enum Json {
  Null
  True
  False
  Number(Double)
  String(String)
  Array(<a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/json#Json">Json</a>])
  Object(<a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/json#Json">Json</a>])
}
```


#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,191:::fn <a href="moonbitlang/core/json#Json">Json</a>::default() -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,24:::fn <a href="moonbitlang/core/json#Json">Json</a>::op_equal(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#Json">Json</a>) -> Bool
  ```
  > automatically derived

## Map

```moonbit
:::source,moonbitlang/core/builtin/linked_hash_map.mbt,48:::type Map
```

 Mutable linked hash map that maintains the order of insertion, not thread safe.
  
 #### Example
 
 ```
 let map = { 3: "three", 8 :  "eight", 1 :  "one"}
 assert_eq!(map.get(2), None)
 assert_eq!(map.get(3), Some("three"))
 map.set(3, "updated")
 assert_eq!(map.get(3), Some("updated"))
 ```

#### mooncakes-io-method-mark-Methods
- #### capacity
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,413:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::capacity[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> Int
  ```
  > 
  >  Get the capacity of the map.
- #### clear
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,449:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::clear[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> Unit
  ```
  > 
  >  Clears the map, removing all key-value pairs. Keeps the allocated space.
- #### contains
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,250:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::contains[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K) -> Bool
  ```
  > 
  >  Check if the hash map contains a key.
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,569:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::default[K, V]() -> <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]
  ```
  > 
- #### each
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,425:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::each[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], f : (K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all key-value pairs of the map in the order of insertion.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,437:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::eachi[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], f : (Int, K, V) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all key-value pairs of the map in the order of insertion, with index.
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,105:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::from_array[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](arr : <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]) -> <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]
  ```
  > 
  >  Create a hash map from array.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,560:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::from_iter[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]) -> <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]
  ```
  > 
- #### get
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,163:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::get[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K) -> V?
  ```
  > 
  >  Get the value associated with a key.
- #### get\_or\_default
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,209:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::get_or_default[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K, default : V) -> V
  ```
  > 
  >  Returns the value associated with the key in the map, or computes and returns
  > a default value if the key does not exist.
  > 
  >  Parameters:
  > 
  >  * `map` : The map to search in.
  >  * `key` : The key to look up in the map.
  >  * `default` : A function that returns a default value when the key is not
  >    found.
  > 
  >  Returns either the value associated with the key if it exists, or the result
  > of calling the default function.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "get_or_default" {
  >    let map = { "a": 1, "b": 2 }
  >    inspect!(map.get_or_default("a", 0), content="1")
  >    inspect!(map.get_or_default("c", 42), content="42")
  >  }
  >  ```
- #### get\_or\_init
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,233:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::get_or_init[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K, default : () -> V) -> V
  ```
  > 
  >  Returns the value for the given key, or sets and returns a default value if the key does not exist.
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,419:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::is_empty[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> Bool
  ```
  > 
  >  Check if the hash map is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,458:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::iter[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[(K, V)]
  ```
  > 
  >  Returns the iterator of the hash map, provide elements in the order of insertion.
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,473:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::iter2[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[K, V]
  ```
  > 
- #### keys
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,488:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::keys[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[K]
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,89:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::new[K, V](capacity~ : Int = ..) -> <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]
  ```
  > 
  >  Create a hash map.
  > The capacity of the map will be the smallest power of 2 that is
  > greater than or equal to the provided \[capacity\].
- #### of
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,548:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::of[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(K, V)]) -> <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,530:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::op_equal[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], that : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,182:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::op_get[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K) -> V?
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,157:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::op_set[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,391:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::output[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,259:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::remove[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K) -> Unit
  ```
  > 
  >  Remove a key-value pair from hash map.
- #### set
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,114:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::set[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V], key : K, value : V) -> Unit
  ```
  > 
  >  Set a key-value pair into the hash map.
  > @alert unsafe "Panic if the hash map is full."
- #### size
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,407:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::size[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> Int
  ```
  > 
  >  Get the number of key-value pairs in the map.
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,517:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::to_array[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> <a href="moonbitlang/core/array#Array">Array</a>[(K, V)]
  ```
  > 
  >  Converts the hash map to an array.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,149:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::to_json[K : <a href="moonbitlang/core/builtin#Show">Show</a>, V : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### values
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_map.mbt,502:::fn <a href="moonbitlang/core/builtin#Map">Map</a>::values[K, V](self : <a href="moonbitlang/core/builtin#Map">Map</a>[K, V]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[V]
  ```
  > 

## Set

```moonbit
:::source,moonbitlang/core/builtin/linked_hash_set.mbt,38:::type Set
```

 Mutable linked hash set that maintains the order of insertion, not thread safe.

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,130:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::add[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], key : K) -> Unit
  ```
  > 
  >  Insert a key into the hash set.
- #### add\_and\_check
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,87:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::add_and_check[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], key : K) -> Bool
  ```
  > 
  >  Insert a key into the hash set.if the key exists return false
- #### capacity
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,365:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::capacity[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> Int
  ```
  > 
  >  Get the capacity of the set.
- #### clear
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,401:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::clear[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> Unit
  ```
  > 
  >  Clears the set, removing all keys. Keeps the allocated space.
- #### contains
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,173:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::contains[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], key : K) -> Bool
  ```
  > 
  >  Check if the hash set contains a key.
- #### difference
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,475:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::difference[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], other : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
- #### each
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,377:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::each[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], f : (K) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all keys of the set in the order of insertion.
- #### eachi
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,389:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::eachi[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], f : (Int, K) -> Unit) -> Unit
  ```
  > 
  >  Iterate over all keys of the set in the order of insertion, with index.
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,71:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::from_array[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#Array">Array</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
  >  Create a hash set from array.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,468:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::from_iter[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
- #### insert
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,81:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::insert[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], key : K) -> Unit
  ```
  > 
  >  Insert a key into the hash set.
  >  
  >  @alert deprecated "Use `add` instead."
- #### intersection
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,501:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::intersection[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], other : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,371:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::is_empty[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> Bool
  ```
  > 
  >  Check if the hash set is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,410:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::iter[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[K]
  ```
  > 
  >  Returns the iterator of the hash set, provide elements in the order of insertion.
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,55:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::new[K](capacity~ : Int = ..) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
  >  Create a hash set.
  > The capacity of the set will be the smallest power of 2 that is
  > greater than or equal to the provided \[capacity\].
- #### of
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,456:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::of[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,439:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::op_equal[K : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], that : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,343:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::output[K : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### remove
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,193:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::remove[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], key : K) -> Unit
  ```
  > 
  >  Remove a key from hash set.
- #### remove\_and\_check
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,217:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::remove_and_check[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], key : K) -> Bool
  ```
  > 
  >  Remove a key from hash set.if the key exists, delete it and return true
- #### size
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,359:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::size[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> Int
  ```
  > 
  >  Get the number of keys in the set.
- #### symmetric\_difference
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,482:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::symmetric_difference[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], other : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,426:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::to_array[K](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> <a href="moonbitlang/core/array#Array">Array</a>[K]
  ```
  > 
  >  Converts the hash set to an array.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,158:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::to_json[X : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[X]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### union
  ```moonbit
  :::source,moonbitlang/core/builtin/linked_hash_set.mbt,493:::fn <a href="moonbitlang/core/builtin#Set">Set</a>::union[K : <a href="moonbitlang/core/builtin#Hash">Hash</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/builtin#Set">Set</a>[K], other : <a href="moonbitlang/core/builtin#Set">Set</a>[K]) -> <a href="moonbitlang/core/builtin#Set">Set</a>[K]
  ```
  > 

## SnapshotError

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,205:::pub(all) type! SnapshotError String

```


## SourceLoc

```moonbit
:::source,moonbitlang/core/builtin/autoloc.mbt,16:::pub(all) type SourceLoc
```


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/autoloc.mbt,22:::fn <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a>::output(self : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/autoloc.mbt,19:::fn <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a>::to_string(self : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a>) -> String
  ```
  > 

## StringBuilder

```moonbit
:::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,16:::type StringBuilder
```


#### mooncakes-io-method-mark-Methods
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,30:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::is_empty(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>) -> Bool
  ```
  > 
  >  Return whether the given buffer is empty.
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,22:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::new(size_hint~ : Int = ..) -> <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,92:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::output(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
  >  TODO: improve perf
- #### reset
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,99:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::reset(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,86:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::to_string(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>) -> String
  ```
  > 
- #### write\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,66:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::write_char(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, ch : Char) -> Unit
  ```
  > 
- #### write\_object
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder.mbt,16:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::write_object[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, obj : T) -> Unit
  ```
  > 
- #### write\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,59:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::write_string(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, str : String) -> Unit
  ```
  > 
- #### write\_substring
  ```moonbit
  :::source,moonbitlang/core/builtin/stringbuilder_buffer.mbt,73:::fn <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>::write_substring(self : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, str : String, start : Int, len : Int) -> Unit
  ```
  > 

## UninitializedArray

```moonbit
:::source,moonbitlang/core/builtin/uninitialized_array.mbt,16:::type UninitializedArray
```


#### mooncakes-io-method-mark-Methods
- #### length
  ```moonbit
  :::source,moonbitlang/core/builtin/uninitialized_array.mbt,57:::fn <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>::length[A](self : <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>[A]) -> Int
  ```
  > 
  >  Returns the length of an uninitialized array.
  > 
  >  Parameters:
  > 
  >  - `array` : The uninitialized array whose length is to be determined.
  > 
  >  Returns the length of the uninitialized array as an integer.
- #### make
  ```moonbit
  :::source,moonbitlang/core/builtin/uninitialized_array.mbt,26:::fn <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>::make[T](size : Int) -> <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>[T]
  ```
  > 
  >  Creates an uninitialized array of the specified size.
  > 
  >  Parameters:
  > 
  >  - `size` : The number of elements the array should hold.
  > 
  >  Returns an uninitialized array of type `T` with the specified size.
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/uninitialized_array.mbt,37:::fn <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>::op_get[T](self : <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>[T], index : Int) -> T
  ```
  > 
  >  Retrieves the element at the specified index from an uninitialized array.
  > 
  >  Parameters:
  > 
  >  - `array` : The uninitialized array from which to retrieve the element.
  >  - `index` : The index of the element to retrieve.
  > 
  >  Returns the element at the specified index.
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/builtin/uninitialized_array.mbt,47:::fn <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>::op_set[T](self : <a href="moonbitlang/core/builtin#UninitializedArray">UninitializedArray</a>[T], index : Int, value : T) -> Unit
  ```
  > 
  >  Sets the value at the specified index in an uninitialized array.
  > 
  >  Parameters:
  > 
  >  - `array` : The uninitialized array where the value will be set.
  >  - `index` : The position in the array where the value will be set.
  >  - `value` : The value to be set at the specified index.

## abort

```moonbit
:::source,moonbitlang/core/builtin/intrinsics.mbt,22:::fn abort[T](msg : String) -> T
```


## assert\_eq

```moonbit
:::source,moonbitlang/core/builtin/assert.mbt,23:::fn assert_eq[T : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```


## assert\_false

```moonbit
:::source,moonbitlang/core/builtin/assert.mbt,50:::fn assert_false(x : Bool, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```


## assert\_not\_eq

```moonbit
:::source,moonbitlang/core/builtin/assert.mbt,30:::fn assert_not_eq[T : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```


## assert\_true

```moonbit
:::source,moonbitlang/core/builtin/assert.mbt,43:::fn assert_true(x : Bool, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```


## fail

```moonbit
:::source,moonbitlang/core/builtin/failure.mbt,19:::fn fail[T](msg : String, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> T!<a href="moonbitlang/core/builtin#Failure">Failure</a>
```


## ignore

```moonbit
:::source,moonbitlang/core/builtin/intrinsics.mbt,16:::fn ignore[T](t : T) -> Unit
```


## inspect

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,185:::fn inspect(obj : <a href="moonbitlang/core/builtin#Show">Show</a>, content~ : String = .., loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _, args_loc~ : <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a> = _) -> Unit!<a href="moonbitlang/core/builtin#InspectError">InspectError</a>
```


## not

```moonbit
:::source,moonbitlang/core/builtin/intrinsics.mbt,33:::fn not(x : Bool) -> Bool
```


## op\_ge

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,154:::fn op_ge[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self_ : T, other : T) -> Bool
```

 @coverage.skip

## op\_gt

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,142:::fn op_gt[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self_ : T, other : T) -> Bool
```

 @coverage.skip

## op\_le

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,148:::fn op_le[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self_ : T, other : T) -> Bool
```

 @coverage.skip

## op\_lt

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,136:::fn op_lt[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self_ : T, other : T) -> Bool
```

 @coverage.skip

## op\_notequal

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,160:::fn op_notequal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](x : T, y : T) -> Bool
```

 @coverage.skip

## panic

```moonbit
:::source,moonbitlang/core/builtin/intrinsics.mbt,28:::fn panic[T]() -> T
```


## physical\_equal

```moonbit
:::source,moonbitlang/core/builtin/intrinsics.mbt,19:::fn physical_equal[T](a : T, b : T) -> Bool
```


## print

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,25:::fn print[T : <a href="moonbitlang/core/builtin#Show">Show</a>](input : T) -> Unit
```

 @alert deprecated "Use `println` instead"

## println

```moonbit
:::source,moonbitlang/core/builtin/console.mbt,19:::fn println[T : <a href="moonbitlang/core/builtin#Show">Show</a>](input : T) -> Unit
```


## Bool


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,46:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::compare(self : Bool, other : Bool) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,49:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::default() -> Bool
  ```
  > 
- #### not
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,36:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::not(self : Bool) -> Bool
  ```
  >  @alert deprecated "Use `not(x)` instead"
- #### op\_compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,43:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::op_compare(self : Bool, other : Bool) -> Int
  ```
  > 
  >  @alert deprecated "Use `compare` instead"
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,39:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::op_equal(self : Bool, other : Bool) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,19:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::output(self : Bool, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,33:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::to_json(self : Bool) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/console.mbt,30:::fn <a href="moonbitlang/core/bool#Bool">Bool</a>::to_string(self : Bool) -> String
  ```
  > 

## Byte


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,78:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::compare(self : Byte, that : Byte) -> Int
  ```
  > 
  >  Compares two `Byte` values and returns an integer indicating their relative
  > order.
  > 
  >  Parameters:
  > 
  >  - `byte1` : The first `Byte` value to compare.
  >  - `byte2` : The second `Byte` value to compare.
  > 
  >  Returns an integer where:
  >  - A value less than 0 indicates that `byte1` is less than `byte2`.
  >  - A value of 0 indicates that `byte1` is equal to `byte2`.
  >  - A value greater than 0 indicates that `byte1` is greater than `byte2`.
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,137:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::default() -> Byte
  ```
  > 
  >  Returns the default value for a `Byte`, which is `b'\x00'`.
  > 
  >  Parameters:
  > 
  >  - None
  > 
  >  Returns the default `Byte` value, which is `b'\x00'`.
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,122:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::hash(self : Byte) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,125:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::hash_combine(self : Byte, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### land
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,163:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::land(self : Byte, that : Byte) -> Byte
  ```
  > 
  >  Performs a bitwise AND operation between two `Byte` values.
  > 
  >  Parameters:
  > 
  >  - `byte1` : The first `Byte` value to perform the bitwise AND operation with.
  >  - `byte2` : The second `Byte` value to perform the bitwise AND operation
  >    with.
  > 
  >  Returns the result of the bitwise AND operation as a `Byte`.
- #### lnot
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,149:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::lnot(self : Byte) -> Byte
  ```
  > 
  >  Performs a bitwise NOT operation on the given `Byte` value.
  > 
  >  Parameters:
  > 
  >  - `value` : The `Byte` value to apply the bitwise NOT operation on.
  > 
  >  Returns the result of the bitwise NOT operation as a `Byte`.
- #### lor
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,176:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::lor(self : Byte, that : Byte) -> Byte
  ```
  > 
  >  Performs a bitwise OR operation between two `Byte` values.
  > 
  >  Parameters:
  > 
  >  - `self` : The first `Byte` value.
  >  - `that` : The second `Byte` value.
  > 
  >  Returns a new `Byte` value resulting from the bitwise OR operation.
- #### lsl
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,247:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::lsl(self : Byte, count : Int) -> Byte
  ```
  > 
  >  positions.
  > 
  >  Parameters:
  > 
  >  - `byte_value` : The `Byte` value whose bits are to be shifted.
  >  - `shift_count` : The number of bit positions to shift the `byte_value` to
  >    the left.
  > 
  >  Returns the resulting `Byte` value after the bitwise left shift operation.
  >  
  >  @alert deprecated "Use infix operator `<<` instead"
- #### lsr
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,262:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::lsr(self : Byte, count : Int) -> Byte
  ```
  > 
  >  bits.
  > 
  >  Parameters:
  > 
  >  - `value` : The `Byte` value to be shifted.
  >  - `count` : The number of bits to shift the `value` to the right.
  > 
  >  Returns the result of the logical shift right operation as a `Byte`.
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### lxor
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,189:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::lxor(self : Byte, that : Byte) -> Byte
  ```
  > 
  >  Performs a bitwise XOR operation between two `Byte` values.
  > 
  >  Parameters:
  > 
  >  - `self` : The first `Byte` value.
  >  - `that` : The second `Byte` value.
  > 
  >  Returns the result of the bitwise XOR operation as a `Byte`.
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,47:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_add(self : Byte, that : Byte) -> Byte
  ```
  > 
  >  Adds two `Byte` values together and returns the result as a `Byte`.
  > 
  >  Parameters:
  > 
  >  - `byte1` : The first `Byte` value to be added.
  >  - `byte2` : The second `Byte` value to be added.
  > 
  >  Returns the sum of `byte1` and `byte2` as a `Byte`.
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,21:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_div(self : Byte, that : Byte) -> Byte
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,34:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_equal(self : Byte, that : Byte) -> Bool
  ```
  > 
  >  Compares two `Byte` values for equality.
  > 
  >  Parameters:
  > 
  >  - `self` : The first `Byte` value to compare.
  >  - `that` : The second `Byte` value to compare.
  > 
  >  Returns `true` if the two `Byte` values are equal, otherwise `false`.
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,16:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_mul(self : Byte, that : Byte) -> Byte
  ```
  > 
- #### op\_shl
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,216:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_shl(self : Byte, count : Int) -> Byte
  ```
  > 
  >  Shifts the bits of the `Byte` value to the left by the specified number of
  > positions.
  > 
  >  Parameters:
  > 
  >  - `byte_value` : The `Byte` value whose bits are to be shifted.
  >  - `shift_count` : The number of bit positions to shift the `byte_value` to
  >    the left.
  > 
  >  Returns the resulting `Byte` value after the shift operation.
- #### op\_shr
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,231:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_shr(self : Byte, count : Int) -> Byte
  ```
  > 
  >  Shifts the bits of the `Byte` value to the right by the specified number of
  > positions.
  > 
  >  Parameters:
  > 
  >  - `byte` : The `Byte` value whose bits are to be shifted.
  >  - `count` : The number of bit positions to shift the `byte` value to the
  >    right.
  > 
  >  Returns the resulting `Byte` value after the bitwise right shift operation.
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,61:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::op_sub(self : Byte, that : Byte) -> Byte
  ```
  > 
  >  Subtracts the second byte from the first byte and returns the result as a
  > byte.
  > 
  >  Parameters:
  > 
  >  - `self` : The byte from which the second byte will be subtracted.
  >  - `that` : The byte to subtract from the first byte.
  > 
  >  Returns the result of the subtraction as a byte.
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,44:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::output(self : Byte, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,438:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::to_float(self : Byte) -> float
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,296:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::to_int(self : Byte) -> Int
  ```
  > 
- #### to\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,299:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::to_int64(self : Byte) -> Int64
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,114:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::to_string(self : Byte) -> String
  ```
  > 
  >  Converts a `Byte` to its string representation in hexadecimal format.
  > 
  >  Parameters:
  > 
  >  - `byte` : The `Byte` value to be converted.
  > 
  >  Returns a `String` representing the `Byte` in the format `b'\xHH'`, where
  > `HH` is the hexadecimal representation of the byte.
- #### to\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/byte.mbt,201:::fn <a href="moonbitlang/core/byte#Byte">Byte</a>::to_uint(self : Byte) -> UInt
  ```
  > 
  >  Converts a `Byte` to a `UInt`.
  > 
  >  Parameters:
  > 
  >  - `byte` : The `Byte` value to be converted.
  > 
  >  Returns the `UInt` representation of the `Byte`.

## Bytes


#### mooncakes-io-method-mark-Methods
- #### blit
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes_block.mbt,36:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::blit(self : Bytes, dst_offset : Int, src : Bytes, src_offset : Int, length : Int) -> Unit
  ```
  > 
  >  Transfer bytes.
  > 
  >  It copies `length` bytes from `src` begin at `src_offset`, to destination byte sequence `self` begin at `dst_offset`.
  > 
  >  #### Usage
  >  ```
  >  let b1 = Bytes::of_string("abcdef")
  >  let b2 = Bytes::of_string("ABCDEF")
  >  b1.blit(2, b2, 2, 2)
  >  assert_eq!(b1.to_unchecked_string(), "aBcdef")
  >  ```
- #### blit\_from\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,73:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::blit_from_string(self : Bytes, bytes_offset : Int, str : String, str_offset : Int, length : Int) -> Unit
  ```
  > 
  >  Copy `length` chars from string `str`, starting at `str_offset`,
  > into byte sequence `self`, starting at `bytes_offset`.
  > @alert deprecated "The type Bytes is about to be changed to be immutable. Use `FixedArray[Byte]` or `Buffer` instead."
- #### copy
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,145:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::copy(self : Bytes) -> Bytes
  ```
  > 
  >  Return a new Bytes that contains the same byte sequence.
- #### length
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,231:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::length(self : Bytes) -> Int
  ```
  > 
- #### make
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,234:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::make(len : Int, init : Byte) -> Bytes
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,238:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::new(len : Int) -> Bytes
  ```
  > 
  >  The init value of Bytes is 0.
- #### of\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,21:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::of_string(str : String) -> Bytes
  ```
  > 
  >  Create byte sequence from String.
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,329:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::op_equal(self : Bytes, other : Bytes) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,225:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::op_get(self : Bytes, idx : Int) -> Byte
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,228:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::op_set(self : Bytes, idx : Int, val : Byte) -> Unit
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,49:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::output(self : Bytes, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### set\_utf16\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,223:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::set_utf16_char(self : Bytes, offset : Int, value : Char) -> Int
  ```
  > 
  >  Fill UTF16 encoded char `value` into byte sequence `self`, starting at `offset`.
  > It return the length of bytes has been written.
  > @alert unsafe "Panic if the \[value\] is out of range"
  > @alert deprecated "The type Bytes is about to be changed to be immutable. Use `FixedArray[Byte]` or `Buffer` instead."
- #### set\_utf8\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,153:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::set_utf8_char(self : Bytes, offset : Int, value : Char) -> Int
  ```
  > 
  >  Fill UTF8 encoded char `value` into byte sequence `self`, starting at `offset`.
  > It return the length of bytes has been written.
  > @alert deprecated "The type Bytes is about to be changed to be immutable. Use `FixedArray[Byte]` or `Buffer` instead."
- #### sub\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,40:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::sub_string(self : Bytes, byte_offset : Int, byte_length : Int) -> String
  ```
  > 
  >  Return a new unchecked string, containing the subsequence of `self` that
  > starts at `byte_offset` and has length `byte_length`.
  >  
  >  @alert deprecated "Use `to_unchecked_string` instead"
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,48:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::to_string(self : Bytes) -> String
  ```
  > 
  >  Create a new unchecked string from byte sequence.
  >  
  >  @alert deprecated "Use `to_unchecked_string` instead"
- #### to\_unchecked\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,59:::fn <a href="moonbitlang/core/bytes#Bytes">Bytes</a>::to_unchecked_string(self : Bytes, offset~ : Int = .., length~ : Int = ..) -> String
  ```
  > 
  >  Return an unchecked string, containing the subsequence of `self` that starts at
  > `offset` and has length `length`. Both `offset` and `length`
  > are indexed by byte.
  >  
  >  Note this function does not validate the encoding of the byte sequence,
  > it simply copy the bytes into a new String.

## Char


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,217:::fn <a href="moonbitlang/core/char#Char">Char</a>::compare(self : Char, other : Char) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,220:::fn <a href="moonbitlang/core/char#Char">Char</a>::default() -> Char
  ```
  > 
- #### from\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,211:::fn <a href="moonbitlang/core/char#Char">Char</a>::from_int(val : Int) -> Char
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,214:::fn <a href="moonbitlang/core/char#Char">Char</a>::op_equal(self : Char, other : Char) -> Bool
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/char.mbt,16:::fn <a href="moonbitlang/core/char#Char">Char</a>::op_sub(self : Char, that : Char) -> Int
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,212:::fn <a href="moonbitlang/core/char#Char">Char</a>::output(self : Char, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,203:::fn <a href="moonbitlang/core/char#Char">Char</a>::to_int(self : Char) -> Int
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,108:::fn <a href="moonbitlang/core/char#Char">Char</a>::to_json(self : Char) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,205:::fn <a href="moonbitlang/core/char#Char">Char</a>::to_string(self : Char) -> String
  ```
  > 
  >  Convert Char to String
  > @intrinsic %char.to\_string
- #### to\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,206:::fn <a href="moonbitlang/core/char#Char">Char</a>::to_uint(self : Char) -> UInt
  ```
  > 

## Double


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,189:::fn <a href="moonbitlang/core/double#Double">Double</a>::compare(self : Double, other : Double) -> Int
  ```
  > 
- #### convert\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,198:::fn <a href="moonbitlang/core/double#Double">Double</a>::convert_uint(val : UInt) -> Double
  ```
  > 
- #### convert\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,174:::fn <a href="moonbitlang/core/double#Double">Double</a>::convert_uint64(val : UInt64) -> Double
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,192:::fn <a href="moonbitlang/core/double#Double">Double</a>::default() -> Double
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,168:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_add(self : Double, other : Double) -> Double
  ```
  > 
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,177:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_div(self : Double, other : Double) -> Double
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,183:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_equal(self : Double, other : Double) -> Bool
  ```
  > 
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,174:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_mul(self : Double, other : Double) -> Double
  ```
  > 
- #### op\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,165:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_neg(self : Double) -> Double
  ```
  > 
- #### op\_neq
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,186:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_neq(self : Double, other : Double) -> Bool
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,171:::fn <a href="moonbitlang/core/double#Double">Double</a>::op_sub(self : Double, other : Double) -> Double
  ```
  > 
- #### reinterpret\_as\_i64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,161:::fn <a href="moonbitlang/core/double#Double">Double</a>::reinterpret_as_i64(self : Double) -> Int64
  ```
  > 
  >  @alert deprecated "Use `reinterpret_as_int64` instead"
- #### reinterpret\_as\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,164:::fn <a href="moonbitlang/core/double#Double">Double</a>::reinterpret_as_int64(self : Double) -> Int64
  ```
  > 
- #### reinterpret\_as\_u64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,168:::fn <a href="moonbitlang/core/double#Double">Double</a>::reinterpret_as_u64(self : Double) -> UInt64
  ```
  > 
  >  @alert deprecated "Use `reinterpret_as_uint64` instead"
- #### reinterpret\_as\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,171:::fn <a href="moonbitlang/core/double#Double">Double</a>::reinterpret_as_uint64(self : Double) -> UInt64
  ```
  > 
- #### sqrt
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,180:::fn <a href="moonbitlang/core/double#Double">Double</a>::sqrt(self : Double) -> Double
  ```
  > 
- #### to\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,441:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_float(self : Double) -> float
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/double.mbt,43:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_int(self : Double) -> Int
  ```
  > 
  >  Converts a double-precision floating-point number to a 32-bit integer.
  > Handles special cases including NaN and numbers outside the valid Int range.
  > 
  >  Parameters:
  > 
  >  * `self` : The double-precision floating-point number to be converted.
  > 
  >  Returns an 32-bit integer value according to the following rules:
  > 
  >  * Returns 0 if the input is NaN
  >  * Returns `@int.max_value` (2147483647) if the input is greater than or
  >    equal to `@int.max_value`
  >  * Returns `@int.min_value` (-2147483648) if the input is less than or equal
  >    to `@int.min_value`
  >  * Otherwise returns the integer part of the input by truncating towards zero
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Double::to_int/normal" {
  >    inspect!(42.0.to_int(), content="42")
  >    inspect!((-42.5).to_int(), content="-42")
  >    inspect!((0.0 / 0.0).to_int(), content="0") // NaN
  >    inspect!((1.0 / 0.0).to_int(), content="2147483647") // Infinity
  >    inspect!((-1.0 / 0.0).to_int(), content="-2147483648") // -Infinity
  >  }
  >  ```
- #### to\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,147:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_int64(self : Double) -> Int64
  ```
  > 
  >  Converts a double-precision floating-point number to a 64-bit integer.
  > Handles special cases including NaN and numbers outside the valid Int range.
  > 
  >  Parameters:
  > 
  >  * `self` : The double-precision floating-point number to be converted.
  > 
  >  Returns an 64-bit integer value according to the following rules:
  > 
  >  * Returns 0 if the input is NaN
  >  * Returns `@int64.max_value` (9223372036854775807L) if the input is greater than or
  >    equal to `@int64.max_value`
  >  * Returns `@int64.min_value` (-9223372036854775808L) if the input is less than or equal
  >    to `@int64.min_value`
  >  * Otherwise returns the integer part of the input by truncating towards zero
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "Double::to_int64" {
  >    inspect!(42.0.to_int64(), content="42")
  >    inspect!((-42.5).to_int64(), content="-42")
  >    inspect!((0.0 / 0.0).to_int64(), content="0") // NaN
  >    inspect!((1.0 / 0.0).to_int64(), content="9223372036854775807") // Infinity
  >    inspect!((-1.0 / 0.0).to_int64(), content="-9223372036854775808") // -Infinity
  >  }
  >  ```
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,52:::fn <a href="moonbitlang/core/double#Double">Double</a>::to_json(self : Double) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### until
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,344:::fn <a href="moonbitlang/core/double#Double">Double</a>::until(self : Double, end : Double, step~ : Double = .., inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Double]
  ```
  > 
  >  Creates an iterator that iterates over a range of Double with default step 1.0 .
  > To grow the range downward, set the `step` parameter to a negative value.
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive by default).
  >  * `step` - The step size of the range (default 1.0).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Double from `start` to `end - 1`.
- #### upto
  ```moonbit
  :::source,moonbitlang/core/builtin/iter_upto.mbt,190:::fn <a href="moonbitlang/core/double#Double">Double</a>::upto(self : Double, end : Double, inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Double]
  ```
  > 
  >  Creates an iterator that iterates over a range of Double with default step 1.0 .
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Double from `start` to `end - 1`.
  > @alert deprecated "Use `..<` in for loop or `until` method instead"

## Entry


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#Entry">Entry</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## FixedArray


#### mooncakes-io-method-mark-Methods
- #### blit\_from\_bytes
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,123:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::blit_from_bytes(self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], bytes_offset : Int, src : Bytes, src_offset : Int, length : Int) -> Unit
  ```
  > 
  >  Copy `length` chars from byte sequence `src`, starting at `src_offset`,
  > into byte sequence `self`, starting at `bytes_offset`.
- #### blit\_from\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,98:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::blit_from_string(self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], bytes_offset : Int, str : String, str_offset : Int, length : Int) -> Unit
  ```
  > 
  >  Copy `length` chars from string `str`, starting at `str_offset`,
  > into byte sequence `self`, starting at `bytes_offset`.
- #### blit\_to
  ```moonbit
  :::source,moonbitlang/core/builtin/fixedarray_block.mbt,72:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::blit_to[A](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], dst : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], len~ : Int, src_offset~ : Int = .., dst_offset~ : Int = ..) -> Unit
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/fixedarray.mbt,41:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::default[X]() -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]
  ```
  > 
- #### fill
  ```moonbit
  :::source,moonbitlang/core/builtin/fixedarray.mbt,54:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::fill[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], value : T) -> Unit
  ```
  > 
  >  Fill the array with a given value.
  > 
  >  #### Example
  >  ```
  >  let fa : FixedArray[Int] = [0, 0, 0, 0, 0]
  >  fa.fill(3)
  >  assert_eq!(fa[0], 3)
  >  ```
- #### get
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,256:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::get[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], idx : Int) -> T
  ```
  > 
- #### iter
  ```moonbit
  :::source,moonbitlang/core/builtin/fixedarray.mbt,17:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::iter[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T]
  ```
  > 
  >  @intrinsic %iter.from\_array
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/builtin/fixedarray.mbt,29:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::iter2[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, T]
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,265:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::length[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]) -> Int
  ```
  > 
- #### make
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,268:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::make[T](len : Int, init : T) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T]
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,253:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::op_get[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], idx : Int) -> T
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,259:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::op_set[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], idx : Int, val : T) -> Unit
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,183:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### set
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,262:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::set[T](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[T], idx : Int, val : T) -> Unit
  ```
  > 
- #### set\_utf16\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,248:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::set_utf16_char(self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], offset : Int, value : Char) -> Int
  ```
  > 
  >  Fill utf16 encoded char `value` into byte sequence `self`, starting at `offset`.
  > It return the length of bytes has been written.
  > @alert unsafe "Panic if the \[value\] is out of range"
  > @alert deprecated "Use `set_utf16le_char` instead"
- #### set\_utf16be\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,304:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::set_utf16be_char(self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], offset : Int, value : Char) -> Int
  ```
  > 
  >  Fill UTF16BE encoded char `value` into byte sequence `self`, starting at `offset`.
  > It return the length of bytes has been written.
  > @alert unsafe "Panic if the \[value\] is out of range"
- #### set\_utf16le\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,276:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::set_utf16le_char(self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], offset : Int, value : Char) -> Int
  ```
  > 
  >  Fill UTF16LE encoded char `value` into byte sequence `self`, starting at `offset`.
  > It return the length of bytes has been written.
  > @alert unsafe "Panic if the \[value\] is out of range"
- #### set\_utf8\_char
  ```moonbit
  :::source,moonbitlang/core/builtin/bytes.mbt,185:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::set_utf8_char(self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[Byte], offset : Int, value : Char) -> Int
  ```
  > 
  >  Fill UTF8 encoded char `value` into byte sequence `self`, starting at `offset`.
  > It return the length of bytes has been written.
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,123:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::to_json[X : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[X]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### unsafe\_blit
  ```moonbit
  :::source,moonbitlang/core/builtin/fixedarray_block.mbt,37:::fn <a href="moonbitlang/core/array#FixedArray">FixedArray</a>::unsafe_blit[A](dst : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], dst_offset : Int, src : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[A], src_offset : Int, len : Int) -> Unit
  ```
  > 
  >  Copies a slice of elements from one fixed array to another.
  > 
  >  This function copies `len` elements from `src` starting at `src_offset` to `dst` starting at `dst_offset`.
  > The arrays may overlap, in which case the copy is performed in a way that preserves the data.
  > 
  >  #### Example
  >  ```
  >  let src = FixedArray::from_array([1, 2, 3, 4, 5])
  >  let dst = FixedArray::from_array([0, 0, 0, 0, 0])
  >  FixedArray::unsafe_blit(dst, 0, src, 0, 3)
  >  assert_eq!(dst, FixedArray::from_array([1, 2, 3, 0, 0]))
  >  ```
  > 
  >  The behavior is undefined and platform-specific if:
  >  - `len < 0`
  >  - `src_offset < 0`
  >  - `dst_offset < 0`
  >  - `dst_offset + len > dst.length()`
  >  - `src_offset + len > src.length()`
  > 
  >  @intrinsic %fixedarray.copy

## Float


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,417:::fn <a href="moonbitlang/core/float#Float">Float</a>::compare(self : float, other : float) -> Int
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,396:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_add(self : float, other : float) -> float
  ```
  > 
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,405:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_div(self : float, other : float) -> float
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,411:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_equal(self : float, other : float) -> Bool
  ```
  > 
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,402:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_mul(self : float, other : float) -> float
  ```
  > 
- #### op\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,393:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_neg(self : float) -> float
  ```
  > 
- #### op\_neq
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,414:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_neq(self : float, other : float) -> Bool
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,399:::fn <a href="moonbitlang/core/float#Float">Float</a>::op_sub(self : float, other : float) -> float
  ```
  > 
- #### reinterpret\_as\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,423:::fn <a href="moonbitlang/core/float#Float">Float</a>::reinterpret_as_int(self : float) -> Int
  ```
  > 
- #### reinterpret\_as\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,426:::fn <a href="moonbitlang/core/float#Float">Float</a>::reinterpret_as_uint(self : float) -> UInt
  ```
  > 
- #### sqrt
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,408:::fn <a href="moonbitlang/core/float#Float">Float</a>::sqrt(self : float) -> float
  ```
  > 
- #### to\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,420:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_double(self : float) -> Double
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,62:::fn <a href="moonbitlang/core/float#Float">Float</a>::to_json(self : float) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### until
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,301:::fn <a href="moonbitlang/core/float#Float">Float</a>::until(self : float, end : float, step~ : float = .., inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[float]
  ```
  > 
  >  Creates an iterator that iterates over a range of Float with default step 1.0 .
  > To grow the range downward, set the `step` parameter to a negative value.
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive by default).
  >  * `step` - The step size of the range (default 1.0).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Float from `start` to `end - 1`.
- #### upto
  ```moonbit
  :::source,moonbitlang/core/builtin/iter_upto.mbt,156:::fn <a href="moonbitlang/core/float#Float">Float</a>::upto(self : float, end : float, inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[float]
  ```
  > 
  >  Creates an iterator that iterates over a range of Float with default step 1.0 .
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Float from `start` to `end - 1`.
  > @alert deprecated "Use `..<` in for loop or `until` method instead"

## Int


#### mooncakes-io-method-mark-Methods
- #### asr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,105:::fn <a href="moonbitlang/core/int#Int">Int</a>::asr(self : Int, other : Int) -> Int
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### clz
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,115:::fn <a href="moonbitlang/core/int#Int">Int</a>::clz(self : Int) -> Int
  ```
  > 
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,124:::fn <a href="moonbitlang/core/int#Int">Int</a>::compare(self : Int, other : Int) -> Int
  ```
  > 
- #### ctz
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,112:::fn <a href="moonbitlang/core/int#Int">Int</a>::ctz(self : Int) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,139:::fn <a href="moonbitlang/core/int#Int">Int</a>::default() -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,171:::fn <a href="moonbitlang/core/int#Int">Int</a>::hash(self : Int) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,184:::fn <a href="moonbitlang/core/int#Int">Int</a>::hash_combine(self : Int, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### is\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,130:::fn <a href="moonbitlang/core/int#Int">Int</a>::is_neg(self : Int) -> Bool
  ```
  > 
- #### is\_non\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,136:::fn <a href="moonbitlang/core/int#Int">Int</a>::is_non_neg(self : Int) -> Bool
  ```
  > 
- #### is\_non\_pos
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,133:::fn <a href="moonbitlang/core/int#Int">Int</a>::is_non_pos(self : Int) -> Bool
  ```
  > 
- #### is\_pos
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,127:::fn <a href="moonbitlang/core/int#Int">Int</a>::is_pos(self : Int) -> Bool
  ```
  > 
- #### land
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,75:::fn <a href="moonbitlang/core/int#Int">Int</a>::land(self : Int, other : Int) -> Int
  ```
  > 
- #### lnot
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,72:::fn <a href="moonbitlang/core/int#Int">Int</a>::lnot(self : Int) -> Int
  ```
  > 
- #### lor
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,78:::fn <a href="moonbitlang/core/int#Int">Int</a>::lor(self : Int, other : Int) -> Int
  ```
  > 
- #### lsl
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,91:::fn <a href="moonbitlang/core/int#Int">Int</a>::lsl(self : Int, other : Int) -> Int
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### lsr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,99:::fn <a href="moonbitlang/core/int#Int">Int</a>::lsr(self : Int, other : Int) -> Int
  ```
  > 
  >  @alert deprecated "Use UInt type and infix operator `>>` instead"
- #### lxor
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,81:::fn <a href="moonbitlang/core/int#Int">Int</a>::lxor(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,57:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_add(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,66:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_div(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,121:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_equal(self : Int, other : Int) -> Bool
  ```
  > 
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,69:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_mod(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,63:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_mul(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,54:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_neg(self : Int) -> Int
  ```
  > 
- #### op\_shl
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,84:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_shl(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_shr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,87:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_shr(self : Int, other : Int) -> Int
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,60:::fn <a href="moonbitlang/core/int#Int">Int</a>::op_sub(self : Int, other : Int) -> Int
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,24:::fn <a href="moonbitlang/core/int#Int">Int</a>::output(self : Int, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### popcnt
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,118:::fn <a href="moonbitlang/core/int#Int">Int</a>::popcnt(self : Int) -> Int
  ```
  > 
- #### reinterpret\_as\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,432:::fn <a href="moonbitlang/core/int#Int">Int</a>::reinterpret_as_float(self : Int) -> float
  ```
  > 
- #### reinterpret\_as\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,152:::fn <a href="moonbitlang/core/int#Int">Int</a>::reinterpret_as_uint(self : Int) -> UInt
  ```
  > 
  >  reinterpret the signed int as unsigned int, when the value is
  > non-negative, i.e, 0..=2^31-1, the value is the same. When the
  > value is negative, it turns into a large number,
  > for example, -1 turns into 2^32-1
- #### shl
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,95:::fn <a href="moonbitlang/core/int#Int">Int</a>::shl(self : Int, other : Int) -> Int
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### shr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,109:::fn <a href="moonbitlang/core/int#Int">Int</a>::shr(self : Int, other : Int) -> Int
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### to\_byte
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,243:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_byte(self : Int) -> Byte
  ```
  > 
- #### to\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,142:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_double(self : Int) -> Double
  ```
  > 
- #### to\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,429:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_float(self : Int) -> float
  ```
  > 
- #### to\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,114:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_int64(self : Int) -> Int64
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,42:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_json(self : Int) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/console.mbt,68:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_string(self : Int) -> String
  ```
  > 
- #### to\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,156:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_uint(self : Int) -> UInt
  ```
  > 
  >  @alert deprecated "Use `reinterpret_as_uint` instead"
- #### to\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,160:::fn <a href="moonbitlang/core/int#Int">Int</a>::to_uint64(self : Int) -> UInt64
  ```
  > 
- #### until
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,215:::fn <a href="moonbitlang/core/int#Int">Int</a>::until(self : Int, end : Int, step~ : Int = .., inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int]
  ```
  > 
  >  Creates an iterator that iterates over a range of Int with default step 1.
  > To grow the range downward, set the `step` parameter to a negative value.
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive by default).
  >  * `step` - The step size of the range (default 1).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Int from `start` to `end - 1`.
- #### upto
  ```moonbit
  :::source,moonbitlang/core/builtin/iter_upto.mbt,28:::fn <a href="moonbitlang/core/int#Int">Int</a>::upto(self : Int, end : Int, inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int]
  ```
  > 
  >  Creates an iterator that iterates over a range of Int with default step 1.
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Int from `start` to `end - 1`.
  > @alert deprecated "Use `..<` in for loop or `until` method instead"

## Int64


#### mooncakes-io-method-mark-Methods
- #### asr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,59:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::asr(self : Int64, other : Int) -> Int64
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### clz
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,75:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::clz(self : Int64) -> Int
  ```
  > 
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,84:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::compare(self : Int64, other : Int64) -> Int
  ```
  > 
- #### ctz
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,72:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::ctz(self : Int64) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,87:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::default() -> Int64
  ```
  > 
- #### land
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,37:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::land(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### lnot
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,34:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::lnot(self : Int64) -> Int64
  ```
  > 
- #### lor
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,40:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::lor(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### lsl
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,47:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::lsl(self : Int64, other : Int) -> Int64
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### lsr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,55:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::lsr(self : Int64, other : Int) -> Int64
  ```
  > 
  >  @alert deprecated "Use UInt64 type and infix operator `>>` instead"
- #### lxor
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,43:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::lxor(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,19:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_add(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,28:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_div(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,81:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_equal(self : Int64, other : Int64) -> Bool
  ```
  > 
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,31:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_mod(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,25:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_mul(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### op\_neg
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,16:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_neg(self : Int64) -> Int64
  ```
  > 
- #### op\_shl
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,66:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_shl(self : Int64, other : Int) -> Int64
  ```
  > 
- #### op\_shr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,69:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_shr(self : Int64, other : Int) -> Int64
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,22:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::op_sub(self : Int64, other : Int64) -> Int64
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,29:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::output(self : Int64, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### popcnt
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,78:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::popcnt(self : Int64) -> Int
  ```
  > 
- #### reinterpret\_as\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,96:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::reinterpret_as_double(self : Int64) -> Double
  ```
  > 
- #### reinterpret\_as\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,181:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::reinterpret_as_uint64(self : Int64) -> UInt64
  ```
  > 
- #### shl
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,51:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::shl(self : Int64, other : Int) -> Int64
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### shr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,63:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::shr(self : Int64, other : Int) -> Int64
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### to\_byte
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,102:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_byte(self : Int64) -> Byte
  ```
  > 
- #### to\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,93:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_double(self : Int64) -> Double
  ```
  > 
- #### to\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,108:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_float(self : Int64) -> float
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,90:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_int(self : Int64) -> Int
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,47:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_json(self : Int64) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/console.mbt,39:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_string(self : Int64) -> String
  ```
  > 
- #### to\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,178:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::to_uint64(self : Int64) -> UInt64
  ```
  > 
  >  @alert deprecated "Use `reinterpret_as_uint64` instead"
- #### until
  ```moonbit
  :::source,moonbitlang/core/builtin/iter.mbt,258:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::until(self : Int64, end : Int64, step~ : Int64 = .., inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int64]
  ```
  > 
  >  Creates an iterator that iterates over a range of Int64 with default step 1L.
  > To grow the range downward, set the `step` parameter to a negative value.
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive by default).
  >  * `step` - The step size of the range (default 1L).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Int64 from `start` to `end - 1`.
- #### upto
  ```moonbit
  :::source,moonbitlang/core/builtin/iter_upto.mbt,122:::fn <a href="moonbitlang/core/int64#Int64">Int64</a>::upto(self : Int64, end : Int64, inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Int64]
  ```
  > 
  >  Creates an iterator that iterates over a range of Int64 with default step 1L.
  > 
  >  #### Arguments
  > 
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  > 
  >  Returns an iterator that iterates over the range of Int64 from `start` to `end - 1`.
  > @alert deprecated "Use `..<` in for loop or `until` method instead"

## Logger


#### mooncakes-io-method-mark-Methods
- #### write\_iter
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,97:::fn <a href="moonbitlang/core/builtin#Logger">Logger</a>::write_iter[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Logger">Logger</a>, iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], prefix~ : String = .., suffix~ : String = .., sep~ : String = .., trailing~ : Bool = ..) -> Unit
  ```
  > 
- #### write\_object
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,92:::fn <a href="moonbitlang/core/builtin#Logger">Logger</a>::write_object[Obj : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/builtin#Logger">Logger</a>, obj : Obj) -> Unit
  ```
  > 

## Option


#### mooncakes-io-method-mark-Methods
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/option#Option">Option</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,199:::fn <a href="moonbitlang/core/option#Option">Option</a>::hash_combine[X : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : X?, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/option.mbt,16:::fn <a href="moonbitlang/core/option#Option">Option</a>::op_equal[X : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : X?, other : X?) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,161:::fn <a href="moonbitlang/core/option#Option">Option</a>::output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : X?, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,167:::fn <a href="moonbitlang/core/option#Option">Option</a>::to_json[T : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : T?) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/option.mbt,25:::fn <a href="moonbitlang/core/option#Option">Option</a>::to_string[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : X?) -> String
  ```
  > 
- #### unwrap
  ```moonbit
  :::source,moonbitlang/core/builtin/option.mbt,35:::fn <a href="moonbitlang/core/option#Option">Option</a>::unwrap[X](self : X?) -> X
  ```
  > 
  >  Extract the value in `Some`.
  > Panic if input is `None`.

## Ref


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,178:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::output[X : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/ref#Ref">Ref</a>[X], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/ref#Ref">Ref</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Result


#### mooncakes-io-method-mark-Methods
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/result#Result">Result</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,207:::fn <a href="moonbitlang/core/result#Result">Result</a>::hash_combine[T : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/result.mbt,16:::fn <a href="moonbitlang/core/result#Result">Result</a>::op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>, E : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], other : <a href="moonbitlang/core/result#Result">Result</a>[T, E]) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,170:::fn <a href="moonbitlang/core/result#Result">Result</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[T, E], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,175:::fn <a href="moonbitlang/core/result#Result">Result</a>::to_json[Ok : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, Err : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : <a href="moonbitlang/core/result#Result">Result</a>[Ok, Err]) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/result#Result">Result</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## SEntry


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#SEntry">SEntry</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Sign


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/builtin#Sign">Sign</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## String


#### mooncakes-io-method-mark-Methods
- #### escape
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,154:::fn <a href="moonbitlang/core/string#String">String</a>::escape(self : String) -> String
  ```
  > 
  >  Returns a valid MoonBit string literal representation of a string,
  > add quotes and escape special characters.
- #### get
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,279:::fn <a href="moonbitlang/core/string#String">String</a>::get(self : String, idx : Int) -> Char
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/string#String">String</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,165:::fn <a href="moonbitlang/core/string#String">String</a>::hash_combine(self : String, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### length
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,273:::fn <a href="moonbitlang/core/string#String">String</a>::length(self : String) -> Int
  ```
  > 
- #### make
  ```moonbit
  :::source,moonbitlang/core/builtin/console.mbt,173:::fn <a href="moonbitlang/core/string#String">String</a>::make(length : Int, value : Char) -> String
  ```
  > 
  >  Create new string of `length`, where each character is `value`
  > 
  >  ```
  >  assert_eq!(String::make(5,'S'), "SSSSS")
  >  ```
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,282:::fn <a href="moonbitlang/core/string#String">String</a>::op_add(self : String, other : String) -> String
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,285:::fn <a href="moonbitlang/core/string#String">String</a>::op_equal(self : String, other : String) -> Bool
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,276:::fn <a href="moonbitlang/core/string#String">String</a>::op_get(self : String, idx : Int) -> Char
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,78:::fn <a href="moonbitlang/core/string#String">String</a>::output(self : String, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### substring
  ```moonbit
  :::source,moonbitlang/core/builtin/string.mbt,60:::fn <a href="moonbitlang/core/string#String">String</a>::substring(self : String, start~ : Int = .., end~ : Int = ..) -> String
  ```
  > 
  >  Returns a new string containing characters from the original string starting
  > at `start` index up to (but not including) `end` index.
  > 
  >  Parameters:
  > 
  >  * `string` : The source string from which to extract the substring.
  >  * `start` : The starting index of the substring (inclusive). Defaults to 0.
  >  * `end` : The ending index of the substring (exclusive). Defaults to the
  >    length of the string.
  > 
  >  Returns a new string containing the specified substring.
  > 
  >  Example:
  > 
  >  ```moonbit
  >  test "substring/basic" {
  >    let s = "Hello world"
  >    inspect!(s.substring(start=0, end=5), content="Hello")
  >    inspect!(s.substring(start=6, end=11), content="world")
  >    inspect!(s.substring(), content="Hello world")
  >  }
  >  
  >  test "substring/empty" {
  >    let s = "test"
  >    inspect!(s.substring(start=2, end=2), content="")
  >    inspect!("".substring(), content="")
  >  }
  >  
  >  test "panic substring/invalid_range" {
  >    let s = "test"
  >    ignore(s.substring(start=-1))
  >    ignore(s.substring(end=5))
  >    ignore(s.substring(start=3, end=2))
  >  }
  >  ```
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,103:::fn <a href="moonbitlang/core/string#String">String</a>::to_json(self : String) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,288:::fn <a href="moonbitlang/core/string#String">String</a>::to_string(self : String) -> String
  ```
  > 

## Tuple10


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,152:::fn <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,110:::fn <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,217:::fn <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,151:::fn <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple10">Tuple10</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple11


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,178:::fn <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,127:::fn <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,256:::fn <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,179:::fn <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple11">Tuple11</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple12


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,206:::fn <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,145:::fn <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,298:::fn <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,209:::fn <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple12">Tuple12</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple13


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,236:::fn <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,164:::fn <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,343:::fn <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,241:::fn <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple13">Tuple13</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple14


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,268:::fn <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T13 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,184:::fn <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T13 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,391:::fn <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>, T13 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,275:::fn <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, N : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple14">Tuple14</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple15


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,302:::fn <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T13 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T14 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,205:::fn <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T13 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T14 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,442:::fn <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>, T13 : <a href="moonbitlang/core/builtin#Show">Show</a>, T14 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,311:::fn <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, N : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, O : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple15">Tuple15</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple16


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,338:::fn <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T13 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T14 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T15 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,227:::fn <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T9 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T10 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T11 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T12 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T13 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T14 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T15 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,496:::fn <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>, T9 : <a href="moonbitlang/core/builtin#Show">Show</a>, T10 : <a href="moonbitlang/core/builtin#Show">Show</a>, T11 : <a href="moonbitlang/core/builtin#Show">Show</a>, T12 : <a href="moonbitlang/core/builtin#Show">Show</a>, T13 : <a href="moonbitlang/core/builtin#Show">Show</a>, T14 : <a href="moonbitlang/core/builtin#Show">Show</a>, T15 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,349:::fn <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, J : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, K : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, L : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, M : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, N : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, O : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, P : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple16">Tuple16</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple2


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,16:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1), other : (T0, T1)) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,16:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,16:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1), other : (T0, T1)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,16:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,16:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple2">Tuple2</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple3


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,26:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2), other : (T0, T1, T2)) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,22:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,21:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2), other : (T0, T1, T2)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,27:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,21:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple3">Tuple3</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple4


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,38:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3), other : (T0, T1, T2, T3)) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,31:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,29:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3), other : (T0, T1, T2, T3)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,43:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,28:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple4">Tuple4</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple5


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,52:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4), other : (T0, T1, T2, T3, T4)) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,46:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D, E), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4), other : (T0, T1, T2, T3, T4)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,67:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D, E), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,41:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple5">Tuple5</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple6


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,68:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5), other : (T0, T1, T2, T3, T4, T5)) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,59:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>, F : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D, E, F), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,52:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5), other : (T0, T1, T2, T3, T4, T5)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,91:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>, F : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D, E, F), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,59:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple6">Tuple6</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple7


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,86:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6), other : (T0, T1, T2, T3, T4, T5, T6)) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_hash.mbt,73:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::hash_combine[A : <a href="moonbitlang/core/builtin#Hash">Hash</a>, B : <a href="moonbitlang/core/builtin#Hash">Hash</a>, C : <a href="moonbitlang/core/builtin#Hash">Hash</a>, D : <a href="moonbitlang/core/builtin#Hash">Hash</a>, E : <a href="moonbitlang/core/builtin#Hash">Hash</a>, F : <a href="moonbitlang/core/builtin#Hash">Hash</a>, G : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : (A, B, C, D, E, F, G), hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,65:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6), other : (T0, T1, T2, T3, T4, T5, T6)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,118:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::output[A : <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/core/builtin#Show">Show</a>, C : <a href="moonbitlang/core/builtin#Show">Show</a>, D : <a href="moonbitlang/core/builtin#Show">Show</a>, E : <a href="moonbitlang/core/builtin#Show">Show</a>, F : <a href="moonbitlang/core/builtin#Show">Show</a>, G : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (A, B, C, D, E, F, G), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,79:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple7">Tuple7</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple8


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,106:::fn <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7), other : (T0, T1, T2, T3, T4, T5, T6, T7)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,79:::fn <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7), other : (T0, T1, T2, T3, T4, T5, T6, T7)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,148:::fn <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,101:::fn <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple8">Tuple8</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Tuple9


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_compare.mbt,128:::fn <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a>::compare[T0 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8)) -> Int
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_eq.mbt,94:::fn <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a>::op_equal[T0 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T1 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T2 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T3 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T4 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T5 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T6 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T7 : <a href="moonbitlang/core/builtin#Eq">Eq</a>, T8 : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8), other : (T0, T1, T2, T3, T4, T5, T6, T7, T8)) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_show.mbt,181:::fn <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a>::output[T0 : <a href="moonbitlang/core/builtin#Show">Show</a>, T1 : <a href="moonbitlang/core/builtin#Show">Show</a>, T2 : <a href="moonbitlang/core/builtin#Show">Show</a>, T3 : <a href="moonbitlang/core/builtin#Show">Show</a>, T4 : <a href="moonbitlang/core/builtin#Show">Show</a>, T5 : <a href="moonbitlang/core/builtin#Show">Show</a>, T6 : <a href="moonbitlang/core/builtin#Show">Show</a>, T7 : <a href="moonbitlang/core/builtin#Show">Show</a>, T8 : <a href="moonbitlang/core/builtin#Show">Show</a>](self : (T0, T1, T2, T3, T4, T5, T6, T7, T8), logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/tuple_to_json.mbt,125:::fn <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a>::to_json[A : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, B : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, C : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, D : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, E : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, F : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, G : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, H : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>, I : <a href="moonbitlang/core/builtin#ToJson">ToJson</a>](self : (A, B, C, D, E, F, G, H, I)) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/tuple#Tuple9">Tuple9</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## UInt


#### mooncakes-io-method-mark-Methods
- #### clz
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,373:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::clz(self : UInt) -> Int
  ```
  > 
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,336:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::compare(self : UInt, other : UInt) -> Int
  ```
  > 
- #### ctz
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,376:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::ctz(self : UInt) -> Int
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,189:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::hash_combine(self : UInt, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### land
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,339:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::land(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### lnot
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,348:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::lnot(self : UInt) -> UInt
  ```
  > 
- #### lor
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,342:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::lor(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### lsl
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,352:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::lsl(self : UInt, shift : Int) -> UInt
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### lsr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,360:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::lsr(self : UInt, shift : Int) -> UInt
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### lxor
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,345:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::lxor(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,315:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_add(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,324:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_div(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,330:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_equal(self : UInt, other : UInt) -> Bool
  ```
  > 
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,327:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_mod(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,321:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_mul(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### op\_neq
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,333:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_neq(self : UInt, other : UInt) -> Bool
  ```
  > 
- #### op\_shl
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,367:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_shl(self : UInt, shift : Int) -> UInt
  ```
  > 
- #### op\_shr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,370:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_shr(self : UInt, shift : Int) -> UInt
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,318:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::op_sub(self : UInt, other : UInt) -> UInt
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,34:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::output(self : UInt, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### popcnt
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,379:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::popcnt(self : UInt) -> Int
  ```
  > 
- #### reinterpret\_as\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,435:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::reinterpret_as_float(self : UInt) -> float
  ```
  > 
- #### reinterpret\_as\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,308:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::reinterpret_as_int(self : UInt) -> Int
  ```
  > 
  >  reinterpret the unsigned int as signed int
  > For number within the range of 0..=2^31-1,
  > the value is the same. For number within the range of 2^31..=2^32-1,
  > the value is negative
- #### shl
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,356:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::shl(self : UInt, shift : Int) -> UInt
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### shr
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,364:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::shr(self : UInt, shift : Int) -> UInt
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### to\_byte
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,387:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_byte(self : UInt) -> Byte
  ```
  > 
- #### to\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,444:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_float(self : UInt) -> float
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,312:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_int(self : UInt) -> Int
  ```
  > 
  >  @alert deprecated "Use `reinterpret_as_int` instead"
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/console.mbt,97:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_string(self : UInt) -> String
  ```
  > 
- #### to\_uint64
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,382:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::to_uint64(self : UInt) -> UInt64
  ```
  > 
- #### trunc\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,145:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::trunc_double(val : Double) -> UInt
  ```
  > 
- #### upto
  ```moonbit
  :::source,moonbitlang/core/builtin/iter_upto.mbt,58:::fn <a href="moonbitlang/core/uint#UInt">UInt</a>::upto(self : UInt, end : UInt, inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[UInt]
  ```
  > 
  >  Creates an iterator that iterates over a range of UInt with default step 1U.
  >  
  >  #### Arguments
  >  
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  > 
  >  #### Returns
  >  
  >  Returns an iterator that iterates over the range of UInt from `start` to `end - 1`.
  > @alert deprecated "Use `..<` in for loop or `until` method instead"

## UInt64


#### mooncakes-io-method-mark-Methods
- #### clz
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,255:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::clz(self : UInt64) -> Int
  ```
  > 
- #### compare
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,215:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::compare(self : UInt64, other : UInt64) -> Int
  ```
  > 
- #### ctz
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,258:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::ctz(self : UInt64) -> Int
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/builtin/uint64.mbt,16:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::default() -> UInt64
  ```
  > 
- #### extend\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,111:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::extend_uint(val : UInt) -> UInt64
  ```
  > 
- #### hash
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,40:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::hash[Self : <a href="moonbitlang/core/builtin#Hash">Hash</a>](self : Self) -> Int
  ```
  > 
- #### hash\_combine
  ```moonbit
  :::source,moonbitlang/core/builtin/hasher.mbt,194:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::hash_combine(self : UInt64, hasher : <a href="moonbitlang/core/builtin#Hasher">Hasher</a>) -> Unit
  ```
  > 
- #### land
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,221:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::land(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### lnot
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,230:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::lnot(self : UInt64) -> UInt64
  ```
  > 
- #### lor
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,224:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::lor(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### lsl
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,234:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::lsl(self : UInt64, shift : Int) -> UInt64
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### lsr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,246:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::lsr(self : UInt64, shift : Int) -> UInt64
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### lxor
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,227:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::lxor(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### op\_add
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,200:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_add(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### op\_div
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,209:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_div(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,218:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_equal(self : UInt64, other : UInt64) -> Bool
  ```
  > 
- #### op\_mod
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,212:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_mod(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### op\_mul
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,206:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_mul(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### op\_shl
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,249:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_shl(self : UInt64, shift : Int) -> UInt64
  ```
  > 
- #### op\_shr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,252:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_shr(self : UInt64, shift : Int) -> UInt64
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,203:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::op_sub(self : UInt64, other : UInt64) -> UInt64
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,39:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::output(self : UInt64, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### popcnt
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,261:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::popcnt(self : UInt64) -> Int
  ```
  > 
- #### reinterpret\_as\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,99:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::reinterpret_as_double(self : UInt64) -> Double
  ```
  > 
- #### reinterpret\_as\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,188:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::reinterpret_as_int64(self : UInt64) -> Int64
  ```
  > 
- #### shl
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,238:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::shl(self : UInt64, shift : Int) -> UInt64
  ```
  > 
  >  @alert deprecated "Use infix operator `<<` instead"
- #### shr
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,242:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::shr(self : UInt64, shift : Int) -> UInt64
  ```
  > 
  >  @alert deprecated "Use infix operator `>>` instead"
- #### to\_byte
  ```moonbit
  :::source,moonbitlang/core/builtin/intrinsics.mbt,246:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_byte(self : UInt64) -> Byte
  ```
  > 
- #### to\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,197:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_double(self : UInt64) -> Double
  ```
  > 
- #### to\_float
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,264:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_float(self : UInt64) -> float
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,194:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_int(self : UInt64) -> Int
  ```
  > 
- #### to\_int64
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,185:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_int64(self : UInt64) -> Int64
  ```
  > 
  >  @alert deprecated "Use `reinterpret_as_int64` instead"
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/console.mbt,118:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_string(self : UInt64) -> String
  ```
  > 
- #### to\_uint
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,191:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::to_uint(self : UInt64) -> UInt
  ```
  > 
- #### trunc\_double
  ```moonbit
  :::source,moonbitlang/core/builtin/int64_nonjs.mbt,105:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::trunc_double(val : Double) -> UInt64
  ```
  > 
- #### upto
  ```moonbit
  :::source,moonbitlang/core/builtin/iter_upto.mbt,88:::fn <a href="moonbitlang/core/uint64#UInt64">UInt64</a>::upto(self : UInt64, end : UInt64, inclusive~ : Bool = ..) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[UInt64]
  ```
  > 
  >  Creates an iterator that iterates over a range of UInt64 with default step 1UL.
  >  
  >  #### Arguments
  >  
  >  * `start` - The starting value of the range (inclusive).
  >  * `end` - The ending value of the range (exclusive).
  >  * `inclusive` - Whether the ending value is inclusive (default false).
  >  
  >  #### Returns
  >  
  >  Returns an iterator that iterates over the range of UInt64 from `start` to `end - 1`.
  > @alert deprecated "Use `..<` in for loop or `until` method instead"

## Unit


#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/core/builtin/unit.mbt,16:::fn <a href="moonbitlang/core/unit#Unit">Unit</a>::op_equal(self : Unit, _other : Unit) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/core/builtin/show.mbt,16:::fn <a href="moonbitlang/core/unit#Unit">Unit</a>::output(_self : Unit, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_json
  ```moonbit
  :::source,moonbitlang/core/builtin/json.mbt,186:::fn <a href="moonbitlang/core/unit#Unit">Unit</a>::to_json(_self : Unit) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/core/builtin/traits.mbt,85:::fn <a href="moonbitlang/core/unit#Unit">Unit</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
