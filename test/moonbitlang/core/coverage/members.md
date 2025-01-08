# Documentation
|Type|description|
|---|---|
|[CoverageCounter](#CoverageCounter)||

|Value|description|
|---|---|
|[end](#end)||
|[track](#track)||

## CoverageCounter

```moonbit
:::source,moonbitlang/core/coverage/coverage.mbt,19:::type CoverageCounter
```

 The `CoverageCounter` structure is used for keeping track of the number of
times each chunk of code is executed. It's not very useful outside of
generated code.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/core/coverage/coverage.mbt,41:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/core/coverage/coverage.mbt,41:::fn output(self : <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### incr
  ```moonbit
  :::source,moonbitlang/core/coverage/coverage.mbt,35:::fn <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>::incr(self : <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>, idx : Int) -> Unit
  ```
  > 
  >  Increment the specified tracking index.
  > 
  >  @coverage.skip
- #### new
  ```moonbit
  :::source,moonbitlang/core/coverage/coverage.mbt,27:::fn <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>::new(size : Int) -> <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>
  ```
  > 
  >  Create a new coverage counter with the given size.
  > 
  >  @coverage.skip

## end

```moonbit
:::source,moonbitlang/core/coverage/coverage.mbt,103:::fn end() -> Unit
```

 Output the counters to stdout for coverage report usages. The counter data
is printed as a map of `{ counter_id: counter_contents }`, enclosed between
a pair of delimiters.

 An example output of this function is like the following:

 ```plaintext
 ----- BEGIN MOONBIT COVERAGE -----
 {
 "foo/foo": [1, 2, 3, 4]
 , "foo/bar": [5, 6, 7, 8]
 }
 ----- END MOONBIT COVERAGE -----
 ```

## track

```moonbit
:::source,moonbitlang/core/coverage/coverage.mbt,66:::fn track(name : String, counter : <a href="moonbitlang/core/coverage#CoverageCounter">CoverageCounter</a>) -> Unit
```

 Add the given counter along its ID to the tracking list.

 @coverage.skip
