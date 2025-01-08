# Documentation
|Trait|description|
|---|---|
|[@moonbitlang/core/quickcheck.Arbitrary](#@moonbitlang/core/quickcheck.Arbitrary)||

|Value|description|
|---|---|
|[gen](#gen)||
|[samples](#samples)||

## @moonbitlang/core/quickcheck.Arbitrary

```moonbit
:::source,moonbitlang/core/quickcheck/arbitrary.mbt,17:::pub(open) trait @moonbitlang/core/quickcheck.Arbitrary {
  arbitrary(Int, <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Self
}
```

 Trait for types that can be randomly generated

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,25:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Unit
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,25:::fn arbitrary(_ : Int, _ : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Unit
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,28:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Bool
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,28:::fn arbitrary(_ : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,49:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Byte
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,49:::fn arbitrary(_ : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Byte
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,86:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Char
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,86:::fn arbitrary(_ : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Char
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,31:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Int
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,31:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Int
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,62:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,62:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Int64
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,40:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for UInt
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,40:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> UInt
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,71:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for UInt64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,71:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> UInt64
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,80:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Float
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,80:::fn arbitrary(_ : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Float
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,83:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Double
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,83:::fn arbitrary(_ : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Double
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,92:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for String
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,92:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> String
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,52:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for Bytes
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,52:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> Bytes
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,102:::impl <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,102:::fn arbitrary(size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/bigint#BigInt">BigInt</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/core/quickcheck/arbitrary.mbt,111:::impl[X : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>] <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a> for <a href="moonbitlang/core/builtin#Iter">Iter</a>[X]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/quickcheck/arbitrary.mbt,111:::fn arbitrary[X : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>](size : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[X]
    ```
    > 

## gen

```moonbit
:::source,moonbitlang/core/quickcheck/arbitrary.mbt,133:::fn gen[T : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>](size? : Int, state? : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> T
```


## samples

```moonbit
:::source,moonbitlang/core/quickcheck/utils.mbt,16:::fn samples[X : <a href="moonbitlang/core/quickcheck#Arbitrary">Arbitrary</a>](x : Int) -> <a href="moonbitlang/core/array#Array">Array</a>[X]
```

