# Documentation
|Type|description|
|---|---|
|[A](#A)||
|[Gen](#Gen)||
|[Test](#Test)||

|Value|description|
|---|---|
|[arr\_generator\_concat](#arr_generator_concat)||
|[gen\_arg\_code](#gen_arg_code)||
|[lock](#lock)||

## A

```moonbit
:::source,Lampese/moondata/argument.mbt,2:::pub enum A {
  Int(() -> Int)
  Float(() -> float)
  Double(() -> Double)
  String(() -> String)
  Bool(() -> Bool)
  Char(() -> Char)
  Int64(() -> Int64)
  UInt64(() -> UInt64)
  UInt(() -> UInt)
  ArrayInt(() -> <a href="moonbitlang/core/array#Array">Array</a>[Int])
  ArrayFloat(() -> <a href="moonbitlang/core/array#Array">Array</a>[float])
  ArrayDouble(() -> <a href="moonbitlang/core/array#Array">Array</a>[Double])
  ArrayString(() -> <a href="moonbitlang/core/array#Array">Array</a>[String])
  ArrayBool(() -> <a href="moonbitlang/core/array#Array">Array</a>[Bool])
  ArrayChar(() -> <a href="moonbitlang/core/array#Array">Array</a>[Char])
  ArrayInt64(() -> <a href="moonbitlang/core/array#Array">Array</a>[Int64])
  ArrayUInt64(() -> <a href="moonbitlang/core/array#Array">Array</a>[UInt64])
  ArrayUInt(() -> <a href="moonbitlang/core/array#Array">Array</a>[UInt])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Lampese/moondata/argument.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Lampese/moondata#A">A</a> with output(<a href="Lampese/moondata#A">A</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,Lampese/moondata/argument.mbt,21:::fn <a href="Lampese/moondata#A">A</a>::output(<a href="Lampese/moondata#A">A</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,Lampese/moondata/argument.mbt,35:::fn <a href="Lampese/moondata#A">A</a>::to_string(self : <a href="Lampese/moondata#A">A</a>) -> String
  ```
  > 

## Gen

```moonbit
:::source,Lampese/moondata/primitive_gen.mbt,2:::type Gen
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,7:::fn <a href="Lampese/moondata#Gen">Gen</a>::new(state~ : Bytes = ..) -> <a href="Lampese/moondata#Gen">Gen</a>
  ```
  > 
- #### rand\_arrar\_double
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,82:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_arrar_double(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> Double) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[Double])
  ```
  > 
- #### rand\_array\_bool
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,50:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_bool(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> Bool) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[Bool])
  ```
  > 
- #### rand\_array\_char
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,18:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_char(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> Char) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[Char])
  ```
  > 
- #### rand\_array\_float
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,66:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_float(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> float) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[float])
  ```
  > 
- #### rand\_array\_int
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,2:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_int(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> Int) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[Int])
  ```
  > 
- #### rand\_array\_int64
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,114:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_int64(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> Int64) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[Int64])
  ```
  > 
- #### rand\_array\_string
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,34:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_string(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> String) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[String])
  ```
  > 
- #### rand\_array\_uint
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,98:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_uint(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> UInt) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[UInt])
  ```
  > 
- #### rand\_array\_uint64
  ```moonbit
  :::source,Lampese/moondata/array_gen.mbt,130:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_array_uint64(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., gen~ : () -> UInt64) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[UInt64])
  ```
  > 
- #### rand\_bool
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,27:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_bool(self : <a href="Lampese/moondata#Gen">Gen</a>) -> (() -> Bool)
  ```
  > 
- #### rand\_char
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,47:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_char(self : <a href="Lampese/moondata#Gen">Gen</a>) -> (() -> Char)
  ```
  > 
- #### rand\_char\_range
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,52:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_char_range(self : <a href="Lampese/moondata#Gen">Gen</a>, l : Int, r : Int) -> (() -> Char)
  ```
  > 
- #### rand\_double
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,22:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_double(self : <a href="Lampese/moondata#Gen">Gen</a>, l : Double, r : Double) -> (() -> Double)
  ```
  > 
- #### rand\_float
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,17:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_float(self : <a href="Lampese/moondata#Gen">Gen</a>, l : float, r : float) -> (() -> float)
  ```
  > 
- #### rand\_int
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,12:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_int(self : <a href="Lampese/moondata#Gen">Gen</a>, l : Int, r : Int) -> (() -> Int)
  ```
  > 
- #### rand\_int64
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,37:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_int64(self : <a href="Lampese/moondata#Gen">Gen</a>, l : Int64, r : Int64) -> (() -> Int64)
  ```
  > 
- #### rand\_string
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,57:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_string(self : <a href="Lampese/moondata#Gen">Gen</a>, len~ : () -> Int = .., char_gen~ : () -> Char) -> (() -> String)
  ```
  > 
- #### rand\_uint
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,32:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_uint(self : <a href="Lampese/moondata#Gen">Gen</a>, l : UInt, r : UInt) -> (() -> UInt)
  ```
  > 
- #### rand\_uint64
  ```moonbit
  :::source,Lampese/moondata/primitive_gen.mbt,42:::fn <a href="Lampese/moondata#Gen">Gen</a>::rand_uint64(self : <a href="Lampese/moondata#Gen">Gen</a>, l : UInt64, r : UInt64) -> (() -> UInt64)
  ```
  > 
- #### select
  ```moonbit
  :::source,Lampese/moondata/const.mbt,8:::fn <a href="Lampese/moondata#Gen">Gen</a>::select[T](self : <a href="Lampese/moondata#Gen">Gen</a>, fl : <a href="moonbitlang/core/array#Array">Array</a>[() -> T]) -> T
  ```
  > 

## Test

```moonbit
:::source,Lampese/moondata/argument.mbt,24:::pub struct Test {
  name : String
  arg : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="moonbitlang/core/array#Array">Array</a>[<a href="Lampese/moondata#A">A</a>], Int)]
}
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,Lampese/moondata/argument.mbt,30:::fn <a href="Lampese/moondata#Test">Test</a>::new(name~ : String, arg~ : <a href="moonbitlang/core/array#Array">Array</a>[(<a href="moonbitlang/core/array#Array">Array</a>[<a href="Lampese/moondata#A">A</a>], Int)]) -> <a href="Lampese/moondata#Test">Test</a>
  ```
  > 
- #### run
  ```moonbit
  :::source,Lampese/moondata/argument.mbt,72:::fn <a href="Lampese/moondata#Test">Test</a>::run(self : <a href="Lampese/moondata#Test">Test</a>, output_dir~ : String, filename~ : String) -> Unit
  ```
  > 

## arr\_generator\_concat

```moonbit
:::source,Lampese/moondata/array_gen.mbt,146:::fn arr_generator_concat[T](arr_gen~ : () -> <a href="moonbitlang/core/array#Array">Array</a>[T], arr_gen_2~ : () -> <a href="moonbitlang/core/array#Array">Array</a>[T]) -> (() -> <a href="moonbitlang/core/array#Array">Array</a>[T])
```


## gen\_arg\_code

```moonbit
:::source,Lampese/moondata/argument.mbt,59:::fn gen_arg_code(arg : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Lampese/moondata#A">A</a>]) -> String
```


## lock

```moonbit
:::source,Lampese/moondata/const.mbt,2:::fn lock[T](f : () -> T) -> (() -> T)
```

