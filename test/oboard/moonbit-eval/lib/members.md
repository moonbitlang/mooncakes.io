# Documentation
|Type|description|
|---|---|
|[ClosureInterpreter](#ClosureInterpreter)||
|[MoonBitVM](#MoonBitVM)||
|[Value](#Value)||
|[Variable](#Variable)||

## ClosureInterpreter

```moonbit
:::source,oboard/moonbit-eval/lib/interpreter.mbt,1:::type ClosureInterpreter
```


#### mooncakes-io-method-mark-Methods
- #### add\_extern\_fn
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,42:::fn <a href="oboard/moonbit-eval/lib#ClosureInterpreter">ClosureInterpreter</a>::add_extern_fn(self : <a href="oboard/moonbit-eval/lib#ClosureInterpreter">ClosureInterpreter</a>, name : String, f : (<a href="moonbitlang/core/array#Array">Array</a>[<a href="oboard/moonbit-eval/lib#Value">Value</a>]) -> <a href="oboard/moonbit-eval/lib#Value">Value</a>) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,38:::fn <a href="oboard/moonbit-eval/lib#ClosureInterpreter">ClosureInterpreter</a>::new() -> <a href="oboard/moonbit-eval/lib#ClosureInterpreter">ClosureInterpreter</a>
  ```
  > 

## MoonBitVM

```moonbit
:::source,oboard/moonbit-eval/lib/vm.mbt,1:::type MoonBitVM
```


#### mooncakes-io-method-mark-Methods
- #### eval
  ```moonbit
  :::source,oboard/moonbit-eval/lib/vm.mbt,24:::fn <a href="oboard/moonbit-eval/lib#MoonBitVM">MoonBitVM</a>::eval(self : <a href="oboard/moonbit-eval/lib#MoonBitVM">MoonBitVM</a>, code : String, log? : Bool) -> <a href="oboard/moonbit-eval/lib#Value">Value</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,oboard/moonbit-eval/lib/vm.mbt,6:::fn <a href="oboard/moonbit-eval/lib#MoonBitVM">MoonBitVM</a>::new(log~ : Bool = ..) -> <a href="oboard/moonbit-eval/lib#MoonBitVM">MoonBitVM</a>
  ```
  > 

## Value

```moonbit
:::source,oboard/moonbit-eval/lib/interpreter.mbt,11:::type Value
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/lib#Value">Value</a> with output(<a href="oboard/moonbit-eval/lib#Value">Value</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,21:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="oboard/moonbit-eval/lib#Value">Value</a> with to_json(<a href="oboard/moonbit-eval/lib#Value">Value</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,23:::fn <a href="oboard/moonbit-eval/lib#Value">Value</a>::op_equal(self : <a href="oboard/moonbit-eval/lib#Value">Value</a>, other : <a href="oboard/moonbit-eval/lib#Value">Value</a>) -> Bool
  ```
  > 
- #### output
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,21:::fn <a href="oboard/moonbit-eval/lib#Value">Value</a>::output(<a href="oboard/moonbit-eval/lib#Value">Value</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,21:::fn <a href="oboard/moonbit-eval/lib#Value">Value</a>::to_json(<a href="oboard/moonbit-eval/lib#Value">Value</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,oboard/moonbit-eval/lib/traits.mbt,85:::fn <a href="oboard/moonbit-eval/lib#Value">Value</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Variable

```moonbit
:::source,oboard/moonbit-eval/lib/interpreter.mbt,6:::type Variable
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/lib#Variable">Variable</a> with output(<a href="oboard/moonbit-eval/lib#Variable">Variable</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,9:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="oboard/moonbit-eval/lib#Variable">Variable</a> with to_json(<a href="oboard/moonbit-eval/lib#Variable">Variable</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,9:::fn <a href="oboard/moonbit-eval/lib#Variable">Variable</a>::output(<a href="oboard/moonbit-eval/lib#Variable">Variable</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,oboard/moonbit-eval/lib/interpreter.mbt,9:::fn <a href="oboard/moonbit-eval/lib#Variable">Variable</a>::to_json(<a href="oboard/moonbit-eval/lib#Variable">Variable</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,oboard/moonbit-eval/lib/traits.mbt,85:::fn <a href="oboard/moonbit-eval/lib#Variable">Variable</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
