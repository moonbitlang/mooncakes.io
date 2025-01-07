# Documentation
|Type|description|
|---|---|
|[Config](#Config)||
|[DriverState](#DriverState)||
|[Either](#Either)||
|[Failure](#Failure)||
|[Gen](#Gen)||
|[IsValidShrink](#IsValidShrink)||
|[Property](#Property)||
|[Sample](#Sample)||
|[SampleTree](#SampleTree)||
|[ShrinkExplain](#ShrinkExplain)||
|[ShrinkHistroy](#ShrinkHistroy)||
|[Success](#Success)||
|[TestResult](#TestResult)||
|[TestRun](#TestRun)||
|[LazyList](#LazyList)||
|[List](#List)||
|[RandomState](#RandomState)||

|Value|description|
|---|---|
|[collect](#collect)||
|[combine\_shrunk](#combine_shrunk)||
|[constant](#constant)||
|[discard](#discard)||
|[falsify](#falsify)||
|[from\_rng](#from_rng)||
|[from\_seed](#from_seed)||
|[gen](#gen)||
|[info](#info)||
|[init\_state](#init_state)||
|[init\_test\_run](#init_test_run)||
|[label](#label)||
|[mk\_property](#mk_property)||
|[new](#new)||
|[prim](#prim)||
|[prim\_with](#prim_with)||
|[pure](#pure)||
|[run\_property](#run_property)||
|[second](#second)||
|[shrink\_to\_list](#shrink_to_list)||
|[test\_gen](#test_gen)||

## Config

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,12:::type Config
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a> with output(<a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,19:::fn <a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a>::output(<a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## DriverState

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,32:::type DriverState
```


## Either

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/selective.mbt,2:::type Either
```


## Failure

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,7:::type Failure
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,10:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/falsify#Failure">Failure</a> with output[E : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#Failure">Failure</a>[E], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,10:::fn <a href="moonbitlang/quickcheck/lib/falsify#Failure">Failure</a>::output[E : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#Failure">Failure</a>[E], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/falsify#Failure">Failure</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Gen

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,3:::type Gen
```


#### mooncakes-io-method-mark-Methods
- #### ap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,71:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::ap[T, U](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[(T) -> U], g : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[U]
  ```
  > 
- #### apS
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/selective.mbt,49:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::apS[A, B](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[(A) -> B], x : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[A]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[B]
  ```
  > 
- #### bind
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,60:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::bind[T, U](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T], f : (T) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[U]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[U]
  ```
  > 
- #### fmap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,15:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::fmap[T, U](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[U]
  ```
  > 
- #### ifS
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/selective.mbt,40:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::ifS[T](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[Bool], t : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T], e : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]
  ```
  > 
- #### run\_gen
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,11:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::run_gen[T](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T], x : <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>) -> (T, <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>])
  ```
  > 
- #### sample
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,62:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::sample[T](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]) -> T
  ```
  > 
- #### select
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/selective.mbt,14:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::select[T, U](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[(T) -> U], e : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[<a href="moonbitlang/quickcheck/lib/falsify#Either">Either</a>[T, U]]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[U]
  ```
  > 
- #### shrink\_from
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,82:::fn <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>::shrink_from[A, P, N](self : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[A], prop : (A) -> <a href="moonbitlang/quickcheck/lib/falsify#IsValidShrink">IsValidShrink</a>[P, N], ps : (P, <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>])) -> <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N]
  ```
  > 

## IsValidShrink

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,53:::type IsValidShrink
```


## Property

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,19:::type Property
```


#### mooncakes-io-method-mark-Methods
- #### run
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/property.mbt,23:::fn <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>::run[T, E](self : <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, E], tr : <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[(<a href="moonbitlang/quickcheck/lib/falsify#TestResult">TestResult</a>[T, E], <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>)]
  ```
  > 

## Sample

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,6:::type Sample
```


#### mooncakes-io-method-mark-Methods
- #### sample\_value
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,11:::fn <a href="moonbitlang/quickcheck/lib/falsify#Sample">Sample</a>::sample_value(self : <a href="moonbitlang/quickcheck/lib/falsify#Sample">Sample</a>) -> UInt
  ```
  > 

## SampleTree

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,1:::type SampleTree
```


#### mooncakes-io-method-mark-Methods
- #### map
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,43:::fn <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>::map(self : <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>, f : (UInt) -> UInt) -> <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>
  ```
  > 
- #### mod
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,58:::fn <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>::mod(self : <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>, u : UInt) -> <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>
  ```
  > 
- #### view
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,18:::fn <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>::view(self : <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>) -> (<a href="moonbitlang/quickcheck/lib/falsify#Sample">Sample</a>, <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>, <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>)
  ```
  > 

## ShrinkExplain

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,7:::type ShrinkExplain
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,10:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a> with output[P : <a href="moonbitlang/core/builtin#Show">Show</a>, N : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### limit\_steps
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,12:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>::limit_steps[P, N](self : <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N], n : Int?) -> <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N]
  ```
  > 
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,10:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>::output[P : <a href="moonbitlang/core/builtin#Show">Show</a>, N : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### shrink\_history
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,29:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>::shrink_history[P, N](self : <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N]) -> <a href="moonbitlang/core/array#Array">Array</a>[P]
  ```
  > 
- #### shrink\_outcome
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,41:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>::shrink_outcome[P, N](self : <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>[P, N]) -> (P, <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[N]?)
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkExplain">ShrinkExplain</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ShrinkHistroy

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,1:::type ShrinkHistroy
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/falsify#ShrinkHistroy">ShrinkHistroy</a> with output[P : <a href="moonbitlang/core/builtin#Show">Show</a>, N : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#ShrinkHistroy">ShrinkHistroy</a>[P, N], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,5:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkHistroy">ShrinkHistroy</a>::output[P : <a href="moonbitlang/core/builtin#Show">Show</a>, N : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#ShrinkHistroy">ShrinkHistroy</a>[P, N], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/falsify#ShrinkHistroy">ShrinkHistroy</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Success

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,1:::type Success
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/falsify#Success">Success</a> with output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#Success">Success</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,5:::fn <a href="moonbitlang/quickcheck/lib/falsify#Success">Success</a>::output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib/falsify#Success">Success</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/falsify#Success">Success</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TestResult

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,13:::type TestResult
```


## TestRun

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,3:::type TestRun
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/property.mbt,7:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a> with output(<a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/property.mbt,7:::fn <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>::output(<a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/falsify/traits.mbt,85:::fn <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## LazyList

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,1:::type LazyList = <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[T]
```


## List

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,1:::type List = <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]
```


## RandomState

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,27:::type RandomState = <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>
```


## collect

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,68:::fn collect[T : <a href="moonbitlang/core/builtin#Show">Show</a>, E](l : String, ls : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[Unit, E]
```


## combine\_shrunk

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,28:::fn combine_shrunk(s : <a href="moonbitlang/quickcheck/lib/falsify#Sample">Sample</a>, l : <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>, r : <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>, ls : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>], rs : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>]) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>]
```


## constant

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,39:::fn constant(val : UInt) -> <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>
```


## discard

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,42:::fn discard[T, E]() -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, E]
```


## falsify

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,75:::fn falsify[T, E](opt : <a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a>, prop : <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, E]) -> (<a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>, <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="moonbitlang/quickcheck/lib/falsify#Success">Success</a>[T]], Int, <a href="moonbitlang/quickcheck/lib/falsify#Failure">Failure</a>[E]?)
```


## from\_rng

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,29:::fn from_rng(rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>
```


## from\_seed

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/sample.mbt,35:::fn from_seed(seed : UInt64) -> <a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>
```


## gen

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,73:::fn gen[T, E](f : (T) -> String?, g : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, E]
```


## info

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,46:::fn info(msg : String) -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[Unit, String]
```


## init\_state

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/driver.mbt,54:::fn init_state[T](opt : <a href="moonbitlang/quickcheck/lib/falsify#Config">Config</a>) -> <a href="moonbitlang/quickcheck/lib/falsify#DriverState">DriverState</a>[T]
```


## init\_test\_run

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,9:::fn init_test_run() -> <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>
```


## label

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,52:::fn label[E](label : String, vals : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[String]) -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[Unit, E]
```


## mk\_property

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,30:::fn mk_property[T, E](run : (<a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[(<a href="moonbitlang/quickcheck/lib/falsify#TestResult">TestResult</a>[T, E], <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>)]) -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, E]
```


## new

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,7:::fn new[T](g : (<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>) -> (T, <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[<a href="moonbitlang/quickcheck/lib/falsify#SampleTree">SampleTree</a>])) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]
```


## prim

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,84:::fn prim() -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[UInt]
```


## prim\_with

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,75:::fn prim_with(f : (<a href="moonbitlang/quickcheck/lib/falsify#Sample">Sample</a>) -> <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[UInt]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[<a href="moonbitlang/quickcheck/lib/falsify#Sample">Sample</a>]
```


## pure

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/gen.mbt,24:::fn pure[T](v : T) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]
```


## run\_property

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,36:::fn run_property[T, E](p : <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, E]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[(<a href="moonbitlang/quickcheck/lib/falsify#TestResult">TestResult</a>[T, E], <a href="moonbitlang/quickcheck/lib/falsify#TestRun">TestRun</a>)]
```


## second

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/utils.mbt,26:::fn second[A, B, C](f : (B) -> C, v : (A, B)) -> (A, C)
```


## shrink\_to\_list

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/shrinking.mbt,107:::fn shrink_to_list[T](val : T, xs : <a href="moonbitlang/quickcheck/lib/lazy#LazyList">@moonbitlang/quickcheck/lib/lazy.LazyList</a>[T]) -> <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]
```


## test\_gen

```moonbit
:::source,moonbitlang/quickcheck/lib/falsify/property.mbt,87:::fn test_gen[T](f : (T) -> Bool, gen : <a href="moonbitlang/quickcheck/lib/falsify#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib/falsify#Property">Property</a>[T, String]
```

