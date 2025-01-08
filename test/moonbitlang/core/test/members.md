# Documentation
|Type|description|
|---|---|
|[T](#T)||

|Value|description|
|---|---|
|[eq](#eq)||
|[fail](#fail)||
|[is](#is)||
|[is\_false](#is_false)||
|[is\_not](#is_not)||
|[is\_true](#is_true)||
|[ne](#ne)||
|[same\_object](#same_object)||

## T

```moonbit
:::source,moonbitlang/core/test/types.mbt,16:::pub(all) struct T {
  name : String
  buffer : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### snapshot
  ```moonbit
  :::source,moonbitlang/core/test/test.mbt,136:::fn <a href="moonbitlang/core/test#T">T</a>::snapshot(self : <a href="moonbitlang/core/test#T">T</a>, filename~ : String, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _, args_loc~ : <a href="moonbitlang/core/builtin#ArgsLoc">ArgsLoc</a> = _) -> Unit!<a href="moonbitlang/core/builtin#SnapshotError">SnapshotError</a>
  ```
  > 
- #### write
  ```moonbit
  :::source,moonbitlang/core/test/test.mbt,125:::fn <a href="moonbitlang/core/test#T">T</a>::write(self : <a href="moonbitlang/core/test#T">T</a>, obj : <a href="moonbitlang/core/builtin#Show">Show</a>) -> Unit
  ```
  > 
- #### writeln
  ```moonbit
  :::source,moonbitlang/core/test/test.mbt,130:::fn <a href="moonbitlang/core/test#T">T</a>::writeln(self : <a href="moonbitlang/core/test#T">T</a>, obj : <a href="moonbitlang/core/builtin#Show">Show</a>) -> Unit
  ```
  > 

## eq

```moonbit
:::source,moonbitlang/core/test/test.mbt,25:::fn eq[T : <a href="moonbitlang/core/builtin#Show">Show</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 @alert deprecated "Use built-in `assert_eq` instead"
@coverage.skip

## fail

```moonbit
:::source,moonbitlang/core/test/test.mbt,120:::fn fail[T](msg : String, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> T!<a href="moonbitlang/core/error#Error">Error</a>
```


## is

```moonbit
:::source,moonbitlang/core/test/test.mbt,91:::fn is[T : <a href="moonbitlang/core/builtin#Show">Show</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 @alert deprecated "Use `same_object` instead"
@coverage.skip

## is\_false

```moonbit
:::source,moonbitlang/core/test/test.mbt,57:::fn is_false(x : Bool, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 @alert deprecated "Use built-in `assert_false` instead"
@coverage.skip

## is\_not

```moonbit
:::source,moonbitlang/core/test/test.mbt,111:::fn is_not[T : <a href="moonbitlang/core/builtin#Show">Show</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 Assert referential inequality of two values.

 Returns Ok if the two arguments are NOT the same object by reference, using
`physical_equal`; raise an Error otherwise. Certain objects may be equal
by value, but they are different objects in the memory. This function
checks the latter.

 #### Examples

 ```
 let a = "4" + "2"
 let b = "4" + "2"
 @test.is_not!(a, b)
 @test.same_object!(a, a)
 ```

## is\_true

```moonbit
:::source,moonbitlang/core/test/test.mbt,47:::fn is_true(x : Bool, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 @alert deprecated "Use built-in `assert_true` instead"
@coverage.skip

## ne

```moonbit
:::source,moonbitlang/core/test/test.mbt,36:::fn ne[T : <a href="moonbitlang/core/builtin#Show">Show</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 @alert deprecated "Use built-in `assert_not_eq` instead"
@coverage.skip

## same\_object

```moonbit
:::source,moonbitlang/core/test/test.mbt,80:::fn same_object[T : <a href="moonbitlang/core/builtin#Show">Show</a>](a : T, b : T, loc~ : <a href="moonbitlang/core/builtin#SourceLoc">SourceLoc</a> = _) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```

 Assert referential equality of two values.

 Returns Ok if the two arguments are the same object by reference, using
`physical_equal`; raise an Error otherwise. Certain objects may be equal by
value, but they are different objects in the memory. This function checks
the latter.

 #### Examples

 ```
 let a = "4" + "2"
 let b = "4" + "2"
 @test.same_object!(a, a)
 @test.is_not!(a, b)
 ```
