A WASI interface dedicated to performing inferencing for Large Language Models.
---
# Documentation
|Type|description|
|---|---|
|[EmbeddingsResult](#EmbeddingsResult)| Result of generating embeddings|
|[EmbeddingsUsage](#EmbeddingsUsage)| Usage related to an embeddings generation request|
|[Error\_](#Error_)| The set of errors which may be raised by functions in this interface|
|[InferencingParams](#InferencingParams)| Inference request parameters|
|[InferencingResult](#InferencingResult)| An inferencing result|
|[InferencingUsage](#InferencingUsage)| Usage information related to the inferencing result|

|Value|description|
|---|---|
|[generate\_embeddings](#generate_embeddings)| Generate embeddings for the supplied list of text|
|[infer](#infer)| Perform inferencing using the provided model and prompt with the given optional params|

## EmbeddingsResult

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,38:::pub(all) struct EmbeddingsResult {
  embeddings : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[Double]]
  usage : <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>
}
```
 Result of generating embeddings

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,41:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,41:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,41:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,41:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## EmbeddingsUsage

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,33:::pub(all) struct EmbeddingsUsage {
  prompt_token_count : UInt
}
```
 Usage related to an embeddings generation request

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,35:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,35:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,35:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,35:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsUsage">EmbeddingsUsage</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,14:::pub(all) enum Error_ {
  ModelNotSupported
  RuntimeError(String)
  InvalidInput(String)
}
```
 The set of errors which may be raised by functions in this interface

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,18:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,18:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,18:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,18:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InferencingParams

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,4:::pub(all) struct InferencingParams {
  max_tokens : UInt
  repeat_penalty : Double
  repeat_penalty_last_n_token_count : UInt
  temperature : Double
  top_k : UInt
  top_p : Double
}
```
 Inference request parameters

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,11:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,11:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,11:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,11:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InferencingResult

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,27:::pub(all) struct InferencingResult {
  text : String
  usage : <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>
}
```
 An inferencing result

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,30:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,30:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,30:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,30:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InferencingUsage

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,21:::pub(all) struct InferencingUsage {
  prompt_token_count : UInt
  generated_token_count : UInt
}
```
 Usage information related to the inferencing result

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,24:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,24:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,24:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,24:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingUsage">InferencingUsage</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## generate\_embeddings

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,113:::fn generate_embeddings(model : String, text : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#EmbeddingsResult">EmbeddingsResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>]
```
 Generate embeddings for the supplied list of text

## infer

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/llm/top.mbt,44:::fn infer(model : String, prompt : String, params : <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingParams">InferencingParams</a>?) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#InferencingResult">InferencingResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/llm#Error_">Error_</a>]
```
 Perform inferencing using the provided model and prompt with the given optional params
