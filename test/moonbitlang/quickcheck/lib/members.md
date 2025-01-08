# Documentation
|Trait|description|
|---|---|
|[@moonbitlang/quickcheck/lib.Shrink](#@moonbitlang/quickcheck/lib.Shrink)||
|[@moonbitlang/quickcheck/lib.Testable](#@moonbitlang/quickcheck/lib.Testable)||

|Type|description|
|---|---|
|[Arrow](#Arrow)||
|[Axiom](#Axiom)||
|[Callback](#Callback)||
|[Config](#Config)| Configuration for initializing a test runner.|
|[Coverage](#Coverage)||
|[Discard](#Discard)||
|[Equivalence](#Equivalence)||
|[Gen](#Gen)| The Gen type represents a generator of values of type T.|
|[InternalError](#InternalError)||
|[Kind](#Kind)||
|[ListCompare](#ListCompare)||
|[Outcome](#Outcome)||
|[Printer](#Printer)||
|[Property](#Property)||
|[Replay](#Replay)||
|[SingleResult](#SingleResult)||
|[State](#State)| Internal State of Compiler|
|[TestError](#TestError)||
|[TestSuccess](#TestSuccess)||
|[RandomState](#RandomState)||

|Value|description|
|---|---|
|[alphabet](#alphabet)| Generates alphabet|
|[associative](#associative)| Associative binary operation.|
|[callback](#callback)||
|[char\_range](#char_range)| Generate char within given range \[lo, hi\]|
|[classify](#classify)| Classifies a test case based on a condition|
|[collect](#collect)| Attaches a label (Show) to a test case|
|[commutative](#commutative)| Commutative binary operation.|
|[counterexample](#counterexample)| Adds a string to the counterexample if the property fails|
|[distributive\_left](#distributive_left)| Distributive binary operation over left|
|[distributive\_right](#distributive_right)| Distributive binary operation over right|
|[expect\_fail](#expect_fail)||
|[expect\_gave\_up](#expect_gave_up)||
|[ext\_equal](#ext_equal)| Extensional equality for function.|
|[failed](#failed)||
|[filter](#filter)| Filters a property based on a condition|
|[flatten\_array](#flatten_array)| Generate an array of elements from individual generators|
|[flatten\_list](#flatten_list)| Generate a list of elements from individual generators|
|[flatten\_option](#flatten_option)| Generate an option from an optional generator|
|[flatten\_result](#flatten_result)| Generate a result of a generator or return the pure error|
|[forall](#forall)| Run with an explicit generator|
|[forall\_shrink](#forall_shrink)||
|[frequency](#frequency)| Chooses one of the given generators, with a weighted random distribution.|
|[frequency\_list](#frequency_list)| Chooses one of the given generators, with a weighted random distribution.|
|[idempotent](#idempotent)| Idempotent function.|
|[if\_fail](#if_fail)| Adds a callback that will be called if the property fails|
|[int\_bound](#int_bound)| Generates int within given bound \[0, bound)|
|[int\_range](#int_range)| Generates int within given range \[lo, hi)|
|[integer\_bound](#integer_bound)| Generates integer within given bound \[0, bound)|
|[inverse](#inverse)| Inverse function.|
|[involutory](#involutory)| Involutory function.|
|[label](#label)| Attaches a label to a test case|
|[liftA2](#liftA2)| Lift a binary function to generators|
|[liftA3](#liftA3)| Lift a ternary function to generators|
|[liftA4](#liftA4)| Lift a quaternary function to generators|
|[liftA5](#liftA5)| Lift a quinary function to generators|
|[liftA6](#liftA6)| Lift a senary function to generators|
|[list\_with\_size](#list_with_size)||
|[local\_min\_found](#local_min_found)||
|[map\_prop](#map_prop)||
|[map\_rose\_result](#map_rose_result)||
|[map\_size](#map_size)||
|[map\_total\_result](#map_total_result)||
|[mono\_decrease](#mono_decrease)| Monotonic decreasing function.|
|[mono\_increase](#mono_increase)| Monotonic increasing function.|
|[nat](#nat)||
|[neg\_int](#neg_int)| Generates a negative integer|
|[numeral](#numeral)| Generates a numeral char|
|[one\_of](#one_of)| Randomly uses one of the given generators. |
|[one\_of\_array](#one_of_array)| Randomly select one element from an array|
|[one\_of\_list](#one_of_list)| Randomly uses one of the given generators in list|
|[pure](#pure)| Functor instance for Gen\[T\] (pure)|
|[pure\_eq](#pure_eq)||
|[quad](#quad)| Create quad generator from four generators|
|[quick\_check](#quick_check)||
|[quick\_check\_fn](#quick_check_fn)||
|[quick\_check\_with](#quick_check_with)||
|[quick\_check\_with\_result](#quick_check_with_result)||
|[rejected](#rejected)||
|[shrinking](#shrinking)||
|[sized](#sized)| Create sized generators|
|[small\_int](#small_int)| Primitive Generators and Combinators|
|[sorted\_list](#sorted_list)||
|[succeed](#succeed)||
|[terminate](#terminate)| Modifies a property to make it terminate after the first test|
|[triple](#triple)| Create triple generator from three generators|
|[tuple](#tuple)| Create tuple generator from two generators|
|[with\_discarded\_ratio](#with_discarded_ratio)||
|[with\_max\_shrinks](#with_max_shrinks)||
|[with\_max\_size](#with_max_size)||
|[with\_max\_success](#with_max_success)||

## @moonbitlang/quickcheck/lib.Shrink

```moonbit
:::source,moonbitlang/quickcheck/lib/shrink.mbt,1:::pub(open) trait @moonbitlang/quickcheck/lib.Shrink {
  shrink(Self) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Self]
}
```


* ```moonbit
  :::source,moonbitlang/quickcheck/lib/shrink.mbt,5:::impl <a href="moonbitlang/quickcheck/lib#Shrink">Shrink</a> with shrink(_a : Self) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Self]
  ```
  > 
## @moonbitlang/quickcheck/lib.Testable

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,52:::pub(open) trait @moonbitlang/quickcheck/lib.Testable {
  property(Self) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,70:::impl <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for Unit
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,70:::fn property(_self : Unit) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,83:::impl <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for Bool
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,83:::fn property(self : Bool) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,93:::impl[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>] <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for P?
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,93:::fn property[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](self : P?) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,75:::impl <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for <a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,75:::fn property(self : <a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 

## Arrow

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,5:::type Arrow
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,96:::impl[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>, A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/quickcheck/lib#Shrink">Shrink</a> + <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for <a href="moonbitlang/quickcheck/lib#Arrow">Arrow</a>[A, P]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,99:::fn property[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>, A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/quickcheck/lib#Shrink">Shrink</a> + <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="moonbitlang/quickcheck/lib#Arrow">Arrow</a>[A, P]) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 

## Axiom

```moonbit
:::source,moonbitlang/quickcheck/lib/axiom.mbt,47:::type Axiom
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,51:::fn <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>::new[T](run_axiom : (T) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>[T]
  ```
  > 
- #### run
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,55:::fn <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>::run[T](self : <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>[T], x : T) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]
  ```
  > 
- #### to\_property
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,59:::fn <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>::to_property[T, U](self : <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>[T], cong : (T) -> U, eq : (U, U) -> Bool) -> ((T) -> Bool)
  ```
  > 
- #### to\_property\_eq
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,67:::fn <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>::to_property_eq[T, U : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>[T], cong : (T) -> U) -> ((T) -> Bool)
  ```
  > 
- #### to\_property\_parametric
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,74:::fn <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>::to_property_parametric[T, M, N](self : <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>[T], cong : (T, M) -> N, eq : (N, N) -> Bool) -> (((T, M)) -> Bool)
  ```
  > 
- #### to\_property\_parametric\_eq
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,82:::fn <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>::to_property_parametric_eq[T, M, N : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/quickcheck/lib#Axiom">Axiom</a>[T], cong : (T, M) -> N) -> (((T, M)) -> Bool)
  ```
  > 

## Callback

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,20:::type Callback
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,23:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib#Callback">Callback</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,23:::fn output(<a href="moonbitlang/quickcheck/lib#Callback">Callback</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Config

```moonbit
:::source,moonbitlang/quickcheck/lib/config.mbt,2:::type Config
```
 Configuration for initializing a test runner.

## Coverage

```moonbit
:::source,moonbitlang/quickcheck/lib/state.mbt,215:::type Coverage
```


## Discard

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,57:::type Discard
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,65:::impl <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for <a href="moonbitlang/quickcheck/lib#Discard">Discard</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,65:::fn property(_self : <a href="moonbitlang/quickcheck/lib#Discard">Discard</a>) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 

## Equivalence

```moonbit
:::source,moonbitlang/quickcheck/lib/axiom.mbt,1:::type Equivalence
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,4:::impl[T : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/axiom.mbt,4:::fn output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### ap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,26:::fn <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>::ap[T, U](self : <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[(T) -> U], other : <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[U]
  ```
  > 
- #### bind
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,17:::fn <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>::bind[T, U](self : <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T], f : (T) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[U]) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[U]
  ```
  > 
- #### equal\_by
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,43:::fn <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>::equal_by[T](self : <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T], eq : (T, T) -> Bool) -> Bool
  ```
  > 
- #### fmap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,10:::fn <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>::fmap[T, U](self : <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[U]
  ```
  > 
- #### is\_equal
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,39:::fn <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>::is_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](self : <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]) -> Bool
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/axiom.mbt,6:::fn <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>::new[T](lhs : T, rhs : T) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]
  ```
  > 

## Gen

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,4:::type Gen
```
 The Gen type represents a generator of values of type T.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,88:::impl[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>] <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[P]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,88:::fn property[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[P]) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### ap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,75:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::ap[T, U](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[(T) -> U], v : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U]
  ```
  >  Applicative Functor instance for Gen\[T\]
- #### array\_with\_size
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,446:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::array_with_size[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], size : Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/array#Array">Array</a>[T]]
  ```
  > 
- #### bind
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,80:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::bind[T, U](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], f : (T) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U]
  ```
  >  Monad instance for Gen\[T\]
- #### feat\_random
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,20:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::feat_random[T : <a href="moonbitlang/quickcheck/lib/feat#Enumerable">@moonbitlang/quickcheck/lib/feat.Enumerable</a>](size : Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  >  Generate a value from an enumerable instance (up to a size bound)
  > @alert unsafe "Experimental: May cause stack overflow"
- #### fmap
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,70:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::fmap[T, U](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], f : (T) -> U) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U]
  ```
  >  Functor instance for Gen\[T\] (fmap)
- #### join
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,90:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::join[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,9:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::new[T](gen : (Int, <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> T) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  >  Create a new generator from a function
- #### resize
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,222:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::resize[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], size : Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  >  Resize a generator to a specific value
- #### run
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,25:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::run[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], i : Int, rs : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>) -> T
  ```
  >  Run a generator with a size and random state
- #### sample
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,30:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::sample[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], size~ : Int = .., seed~ : UInt64 = ..) -> T
  ```
  >  Generate a value from a generator
- #### samples
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,40:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::samples[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], size~ : Int = .., seed~ : UInt64 = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[T]
  ```
  >  Generate an array of samples from a generator
- #### scale
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,217:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::scale[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], f : (Int) -> Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  >  Adjust the size parameter of a generator
- #### spawn
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,14:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::spawn[T : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a>]() -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  >  Spawn a new generator from an arbitrary instance
- #### such\_that
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,246:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::such_that[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], pred : (T) -> Bool) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
  ```
  >  Generate a value that satisfies a predicate
- #### such\_that\_maybe
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/gen.mbt,228:::fn <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>::such_that_maybe[T](self : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], pred : (T) -> Bool) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T?]
  ```
  >  Attempt to generate a value that satisfies a predicate
  > If failures reach the maximum size, return None

## InternalError

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,2:::type InternalError
```


## Kind

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,26:::type Kind
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,29:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib#Kind">Kind</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,29:::fn output(<a href="moonbitlang/quickcheck/lib#Kind">Kind</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## ListCompare

```moonbit
:::source,moonbitlang/quickcheck/lib/state.mbt,194:::type ListCompare
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,194:::impl[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>] <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/quickcheck/lib#ListCompare">ListCompare</a>[T]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/state.mbt,194:::fn op_equal[T : <a href="moonbitlang/core/builtin#Eq">Eq</a>](<a href="moonbitlang/quickcheck/lib#ListCompare">ListCompare</a>[T], <a href="moonbitlang/quickcheck/lib#ListCompare">ListCompare</a>[T]) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,194:::impl[T : <a href="moonbitlang/core/builtin#Show">Show</a>] <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib#ListCompare">ListCompare</a>[T]
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/state.mbt,194:::fn output[T : <a href="moonbitlang/core/builtin#Show">Show</a>](<a href="moonbitlang/quickcheck/lib#ListCompare">ListCompare</a>[T], <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Outcome

```moonbit
:::source,moonbitlang/quickcheck/lib/result.mbt,1:::pub(all) enum Outcome {
  Success
  GaveUp
  Fail(T)
}
```


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/result.mbt,15:::fn <a href="moonbitlang/quickcheck/lib#Outcome">Outcome</a>::output[T](self : <a href="moonbitlang/quickcheck/lib#Outcome">Outcome</a>[T], logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/result.mbt,7:::fn <a href="moonbitlang/quickcheck/lib#Outcome">Outcome</a>::to_string[T](self : <a href="moonbitlang/quickcheck/lib#Outcome">Outcome</a>[T]) -> String
  ```
  > 

## Printer

```moonbit
:::source,moonbitlang/quickcheck/lib/state.mbt,3:::type Printer
```


#### mooncakes-io-method-mark-Methods
- #### format
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,22:::fn <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>::format(self : <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>, str : String) -> String
  ```
  > 
- #### from\_buffer
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,10:::fn <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>::from_buffer(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>) -> <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>
  ```
  > 
- #### ident
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,14:::fn <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>::ident(self : <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>, size~ : Int = ..) -> Unit
  ```
  > 
- #### unident
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,18:::fn <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>::unident(self : <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>) -> Unit
  ```
  > 
- #### write\_string
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/state.mbt,30:::fn <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>::write_string(self : <a href="moonbitlang/quickcheck/lib#Printer">Printer</a>, str : String) -> Unit
  ```
  > 

## Property

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,37:::type Property
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,62:::impl <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for <a href="moonbitlang/quickcheck/lib#Property">Property</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,62:::fn property(self : <a href="moonbitlang/quickcheck/lib#Property">Property</a>) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### make
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,42:::fn <a href="moonbitlang/quickcheck/lib#Property">Property</a>::make(property : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]]) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
  ```
  > 
- #### run\_prop
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,47:::fn <a href="moonbitlang/quickcheck/lib#Property">Property</a>::run_prop(self : <a href="moonbitlang/quickcheck/lib#Property">Property</a>) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]]
  ```
  > 

## Replay

```moonbit
:::source,moonbitlang/quickcheck/lib/result.mbt,19:::pub(all) struct Replay {
  rand_state : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>
  size : Int
}
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/result.mbt,24:::fn <a href="moonbitlang/quickcheck/lib#Replay">Replay</a>::new(rand_state : <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>, size : Int) -> <a href="moonbitlang/quickcheck/lib#Replay">Replay</a>
  ```
  > 

## SingleResult

```moonbit
:::source,moonbitlang/quickcheck/lib/result.mbt,28:::type SingleResult
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/result.mbt,43:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/result.mbt,43:::fn output(<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/quickcheck/lib/testable.mbt,78:::impl <a href="moonbitlang/quickcheck/lib#Testable">Testable</a> for <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/quickcheck/lib/testable.mbt,78:::fn property(self : <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
    ```
    > 

## State

```moonbit
:::source,moonbitlang/quickcheck/lib/state.mbt,35:::type State
```
 Internal State of Compiler

#### mooncakes-io-method-mark-Methods
- #### complete\_test
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/driver.mbt,95:::fn <a href="moonbitlang/quickcheck/lib#State">State</a>::complete_test(self : <a href="moonbitlang/quickcheck/lib#State">State</a>, _prop : <a href="moonbitlang/quickcheck/lib#Property">Property</a>) -> <a href="moonbitlang/quickcheck/lib#TestSuccess">TestSuccess</a>!<a href="moonbitlang/quickcheck/lib#TestError">TestError</a>
  ```
  > 
- #### find\_failure
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/driver.mbt,185:::fn <a href="moonbitlang/quickcheck/lib#State">State</a>::find_failure(self : <a href="moonbitlang/quickcheck/lib#State">State</a>, res : <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>, ts : <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]]) -> <a href="moonbitlang/quickcheck/lib#TestSuccess">TestSuccess</a>!<a href="moonbitlang/quickcheck/lib#TestError">TestError</a>
  ```
  > 
- #### give\_up
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/driver.mbt,114:::fn <a href="moonbitlang/quickcheck/lib#State">State</a>::give_up(self : <a href="moonbitlang/quickcheck/lib#State">State</a>, _prop : <a href="moonbitlang/quickcheck/lib#Property">Property</a>) -> <a href="moonbitlang/quickcheck/lib#TestSuccess">TestSuccess</a>!<a href="moonbitlang/quickcheck/lib#TestError">TestError</a>
  ```
  > 
- #### local\_min
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/driver.mbt,218:::fn <a href="moonbitlang/quickcheck/lib#State">State</a>::local_min(self : <a href="moonbitlang/quickcheck/lib#State">State</a>, res : <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>, ts : <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]]) -> (Int, Int, Int, <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>)
  ```
  > 
- #### run\_single\_test
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/driver.mbt,133:::fn <a href="moonbitlang/quickcheck/lib#State">State</a>::run_single_test(self : <a href="moonbitlang/quickcheck/lib#State">State</a>, prop : <a href="moonbitlang/quickcheck/lib#Property">Property</a>) -> <a href="moonbitlang/quickcheck/lib#TestSuccess">TestSuccess</a>!<a href="moonbitlang/quickcheck/lib#TestError">TestError</a>
  ```
  > 
- #### run\_test
  ```moonbit
  :::source,moonbitlang/quickcheck/lib/driver.mbt,84:::fn <a href="moonbitlang/quickcheck/lib#State">State</a>::run_test(self : <a href="moonbitlang/quickcheck/lib#State">State</a>, prop : <a href="moonbitlang/quickcheck/lib#Property">Property</a>) -> <a href="moonbitlang/quickcheck/lib#TestSuccess">TestSuccess</a>!<a href="moonbitlang/quickcheck/lib#TestError">TestError</a>
  ```
  > 

## TestError

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,2:::type TestError
```


## TestSuccess

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,32:::type TestSuccess
```


## RandomState

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,1:::type RandomState = <a href="moonbitlang/core/quickcheck/splitmix#RandomState">@moonbitlang/core/quickcheck/splitmix.RandomState</a>
```


## alphabet

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,391:::fn alphabet() -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Char]
```
 Generates alphabet

## associative

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,41:::fn associative[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A, A) -> A) -> (((A, A, A)) -> Bool)
```
 Associative binary operation.

## callback

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,160:::fn callback[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, cb : <a href="moonbitlang/quickcheck/lib#Callback">Callback</a>) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## char\_range

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,424:::fn char_range(lo : Char, hi : Char) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Char]
```
 Generate char within given range \[lo, hi\]

## classify

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,175:::fn classify[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, cond : Bool, s : String) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Classifies a test case based on a condition

## collect

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,170:::fn collect[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>, T : <a href="moonbitlang/core/builtin#Show">Show</a>](p : P, t : T) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Attaches a label (Show) to a test case

## commutative

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,36:::fn commutative[A, B : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A, A) -> B) -> (((A, A)) -> Bool)
```
 Commutative binary operation.

## counterexample

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,183:::fn counterexample[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, s : String) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Adds a string to the counterexample if the property fails

## distributive\_left

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,46:::fn distributive_left[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A, A) -> A, g : (A, A) -> A) -> (((A, A, A)) -> Bool)
```
 Distributive binary operation over left

## distributive\_right

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,54:::fn distributive_right[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A, A) -> A, g : (A, A) -> A) -> (((A, A, A)) -> Bool)
```
 Distributive binary operation over right

## expect\_fail

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,244:::fn expect_fail[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## expect\_gave\_up

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,249:::fn expect_gave_up[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## ext\_equal

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,2:::fn ext_equal[A, B : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A) -> B, g : (A) -> B) -> ((A) -> Bool)
```
 Extensional equality for function.

## failed

```moonbit
:::source,moonbitlang/quickcheck/lib/result.mbt,49:::fn failed() -> <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>
```


## filter

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,189:::fn filter[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, cond : Bool) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Filters a property based on a condition

## flatten\_array

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,308:::fn flatten_array[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/array#Array">Array</a>[T]]
```
 Generate an array of elements from individual generators

## flatten\_list

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,300:::fn flatten_list[T](lst : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[<a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```
 Generate a list of elements from individual generators

## flatten\_option

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,315:::fn flatten_option[T](opt : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]?) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T?]
```
 Generate an option from an optional generator

## flatten\_result

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,323:::fn flatten_result[T, E](res : <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], E]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/result#Result">Result</a>[T, E]]
```
 Generate a result of a generator or return the pure error

## forall

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,197:::fn forall[T : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>, A : <a href="moonbitlang/core/builtin#Show">Show</a>](gen : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], f : (A) -> T) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Run with an explicit generator

## forall\_shrink

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,202:::fn forall_shrink[T : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>, A : <a href="moonbitlang/core/builtin#Show">Show</a>](gen : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], shrinker : (A) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[A], f : (A) -> T) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## frequency

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,259:::fn frequency[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[(Int, <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T])]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Chooses one of the given generators, with a weighted random distribution.
@alert unsafe "Panics if the array is empty or total weight is less than one"

## frequency\_list

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,287:::fn frequency_list[T](lst : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[(Int, T)]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Chooses one of the given generators, with a weighted random distribution.
@alert unsafe "Panics if the list is empty or total weight is less than one"

## idempotent

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,7:::fn idempotent[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A) -> A) -> ((A) -> Bool)
```
 Idempotent function.

## if\_fail

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,223:::fn if_fail[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, f : () -> Unit) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Adds a callback that will be called if the property fails

## int\_bound

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,396:::fn int_bound(bound : Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Int]
```
 Generates int within given bound \[0, bound)

## int\_range

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,414:::fn int_range(lo : Int, hi : Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Int]
```
 Generates int within given range \[lo, hi)

## integer\_bound

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,405:::fn integer_bound(bound : <a href="moonbitlang/core/bigint#BigInt">BigInt</a>) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/bigint#BigInt">BigInt</a>]
```
 Generates integer within given bound \[0, bound)

## inverse

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,17:::fn inverse[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>, B](f : (A) -> B, g : (B) -> A) -> ((A) -> Bool)
```
 Inverse function.

## involutory

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,12:::fn involutory[A : <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A) -> A) -> ((A) -> Bool)
```
 Involutory function.

## label

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,165:::fn label[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, s : String) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Attaches a label to a test case

## liftA2

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,95:::fn liftA2[A, B, C](f : (A, B) -> C, v : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], w : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[B]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[C]
```
 Lift a binary function to generators

## liftA3

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,100:::fn liftA3[A, B, C, D](f : (A, B, C) -> D, v : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], w : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[B], x : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[C]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[D]
```
 Lift a ternary function to generators

## liftA4

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,110:::fn liftA4[A, B, C, D, E](f : (A, B, C, D) -> E, v : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], w : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[B], x : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[C], y : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[D]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[E]
```
 Lift a quaternary function to generators

## liftA5

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,125:::fn liftA5[A, B, C, D, E, F](f : (A, B, C, D, E) -> F, v : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], w : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[B], x : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[C], y : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[D], z : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[E]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[F]
```
 Lift a quinary function to generators

## liftA6

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,147:::fn liftA6[A, B, C, D, E, F, G](ff : (A, B, C, D, E, F) -> G, v : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[A], w : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[B], x : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[C], y : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[D], z : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[E], u : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[F]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[G]
```
 Lift a senary function to generators

## list\_with\_size

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,428:::fn list_with_size[T](size : Int, gen : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```


## local\_min\_found

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,249:::fn local_min_found(st : <a href="moonbitlang/quickcheck/lib#State">State</a>, res : <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>) -> (Int, Int, Int, <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>)
```


## map\_prop

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,104:::fn map_prop[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](prop : P, f : (<a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## map\_rose\_result

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,109:::fn map_rose_result[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](prop : P, f : (<a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]) -> <a href="moonbitlang/quickcheck/lib/rose#Rose">@moonbitlang/quickcheck/lib/rose.Rose</a>[<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>]) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## map\_size

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,142:::fn map_size[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, f : (Int) -> Int) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## map\_total\_result

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,117:::fn map_total_result[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](prop : P, f : (<a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>) -> <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## mono\_decrease

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,29:::fn mono_decrease[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A) -> B) -> (((A, A)) -> Bool)
```
 Monotonic decreasing function.

## mono\_increase

```moonbit
:::source,moonbitlang/quickcheck/lib/invariant.mbt,22:::fn mono_increase[A : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>, B : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](f : (A) -> B) -> (((A, A)) -> Bool)
```
 Monotonic increasing function.

## nat

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,363:::fn nat() -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Int]
```


## neg\_int

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,381:::fn neg_int() -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Int]
```
 Generates a negative integer

## numeral

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,386:::fn numeral() -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Char]
```
 Generates a numeral char

## one\_of

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,332:::fn one_of[T](arr : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Randomly uses one of the given generators.
@alert unsafe "Panics if the array is empty"

## one\_of\_array

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,344:::fn one_of_array[T](val : <a href="moonbitlang/core/array#Array">Array</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Randomly select one element from an array
@alert unsafe "Panics if the array is empty"

## one\_of\_list

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,338:::fn one_of_list[T](lst : <a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Randomly uses one of the given generators in list
@alert unsafe "Panics if the list is empty"

## pure

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,65:::fn pure[T](val : T) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Functor instance for Gen\[T\] (pure)

## pure\_eq

```moonbit
:::source,moonbitlang/quickcheck/lib/axiom.mbt,35:::fn pure_eq[T](x : T) -> <a href="moonbitlang/quickcheck/lib#Equivalence">Equivalence</a>[T]
```


## quad

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,196:::fn quad[T, U, V, W](gen1 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], gen2 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U], gen3 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[V], gen4 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[W]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[(T, U, V, W)]
```
 Create quad generator from four generators

## quick\_check

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,42:::fn quick_check[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](prop : P) -> Unit!<a href="moonbitlang/core/builtin#Failure">Failure</a>
```


## quick\_check\_fn

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,47:::fn quick_check_fn[A : <a href="moonbitlang/core/quickcheck#Arbitrary">@moonbitlang/core/quickcheck.Arbitrary</a> + <a href="moonbitlang/quickcheck/lib#Shrink">Shrink</a> + <a href="moonbitlang/core/builtin#Show">Show</a>, B : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](f : (A) -> B) -> Unit!<a href="moonbitlang/core/builtin#Failure">Failure</a>
```


## quick\_check\_with

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,54:::fn quick_check_with[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](cfg : <a href="moonbitlang/quickcheck/lib#Config">Config</a>, prop : P) -> Unit!<a href="moonbitlang/core/builtin#Failure">Failure</a>
```


## quick\_check\_with\_result

```moonbit
:::source,moonbitlang/quickcheck/lib/driver.mbt,76:::fn quick_check_with_result[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](cfg : <a href="moonbitlang/quickcheck/lib#Config">Config</a>, prop : P) -> <a href="moonbitlang/quickcheck/lib#TestSuccess">TestSuccess</a>!<a href="moonbitlang/quickcheck/lib#TestError">TestError</a>
```


## rejected

```moonbit
:::source,moonbitlang/quickcheck/lib/result.mbt,53:::fn rejected() -> <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>
```


## shrinking

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,147:::fn shrinking[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>, T](shrinker : (T) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[T], x0 : T, pf : (T) -> P) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## sized

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,212:::fn sized[T](f : (Int) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]
```
 Create sized generators

## small\_int

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,350:::fn small_int() -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[Int]
```
 Primitive Generators and Combinators

## sorted\_list

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,439:::fn sorted_list[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](size : Int, gen : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[<a href="moonbitlang/core/immut/list#T">@moonbitlang/core/immut/list.T</a>[T]]
```


## succeed

```moonbit
:::source,moonbitlang/quickcheck/lib/result.mbt,45:::fn succeed() -> <a href="moonbitlang/quickcheck/lib#SingleResult">SingleResult</a>
```


## terminate

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,239:::fn terminate[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```
 Modifies a property to make it terminate after the first test

## triple

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,187:::fn triple[T, U, V](gen1 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], gen2 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U], gen3 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[V]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[(T, U, V)]
```
 Create triple generator from three generators

## tuple

```moonbit
:::source,moonbitlang/quickcheck/lib/gen.mbt,182:::fn tuple[T, U](gen1 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[T], gen2 : <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[U]) -> <a href="moonbitlang/quickcheck/lib#Gen">Gen</a>[(T, U)]
```
 Create tuple generator from two generators

## with\_discarded\_ratio

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,259:::fn with_discarded_ratio[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, n : Int) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## with\_max\_shrinks

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,264:::fn with_max_shrinks[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, n : Int) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## with\_max\_size

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,269:::fn with_max_size[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, n : Int) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```


## with\_max\_success

```moonbit
:::source,moonbitlang/quickcheck/lib/testable.mbt,254:::fn with_max_success[P : <a href="moonbitlang/quickcheck/lib#Testable">Testable</a>](p : P, n : Int) -> <a href="moonbitlang/quickcheck/lib#Property">Property</a>
```

