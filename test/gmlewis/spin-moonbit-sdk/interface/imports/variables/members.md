# Documentation
|Type|description|
|---|---|
|[Error\_](#Error_)| The set of errors which may be raised by functions in this interface.|

|Value|description|
|---|---|
|[get](#get)| Get an application variable value for the current component.|

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/variables/top.mbt,4:::pub(all) enum Error_ {
  InvalidName(String)
  Undefined(String)
  Provider(String)
  Other(String)
}
```
 The set of errors which may be raised by functions in this interface.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/variables/top.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/variables#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/variables/top.mbt,9:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/variables#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/variables#Error_">Error_</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/variables/top.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/variables#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/variables/top.mbt,9:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/variables#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## get

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/variables/top.mbt,14:::fn get(name : String) -> <a href="moonbitlang/core/result#Result">Result</a>[String, <a href="gmlewis/spin-moonbit-sdk/interface/imports/variables#Error_">Error_</a>]
```
 Get an application variable value for the current component.

 The name must match one defined in in the component manifest.
