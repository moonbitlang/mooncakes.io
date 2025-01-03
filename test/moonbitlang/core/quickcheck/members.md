# Documentation
|Trait|description|
|---|---|
|[Arbitrary](#Arbitrary)||

|Value|description|
|---|---|
|[gen](#gen)||
|[samples](#samples)||

## Arbitrary

```moonbit
:::source,moonbitlang/core/quickcheck/arbitrary.mbt,17:::pub(open) trait Arbitrary {
  arbitrary(Int, <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Self
}
```

 Trait for types that can be randomly generated

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,90:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/char#Char">Char</a> with arbitrary(_i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Char
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,25:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/unit#Unit">Unit</a> with arbitrary(_i : Int, _rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,40:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/uint#UInt">UInt</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> UInt
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,96:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/string#String">String</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> String
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,106:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/bigint#BigInt">BigInt</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,87:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/double#Double">Double</a> with arbitrary(_i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Double
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,28:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/bool#Bool">Bool</a> with arbitrary(_i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Bool
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,31:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/int#Int">Int</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Int
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,66:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Int64
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,52:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/bytes#Bytes">Bytes</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Bytes
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,75:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/uint64#UInt64">UInt64</a> with arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> UInt64
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,49:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/byte#Byte">Byte</a> with arbitrary(_i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Byte
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,84:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/float#Float">Float</a> with arbitrary(_i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> float
  ```
  > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,115:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/builtin#Iter">Iter</a> with arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[X]
  ```
  > 

## gen

```moonbit
:::source,moonbitlang/core/quickcheck/arbitrary.mbt,137:::fn gen[T : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>](size? : Int, state? : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> T
```


## samples

```moonbit
:::source,moonbitlang/core/quickcheck/utils.mbt,16:::fn samples[X : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>](x : Int) -> <a href="moonbitlang/core/array#Array">Array</a>[X]
```

