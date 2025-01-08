# Documentation
|Type|description|
|---|---|
|[Parser](#Parser)||
|[ParserContext](#ParserContext)||

|Value|description|
|---|---|
|[parse\_syntax](#parse_syntax)||
|[parser\_context](#parser_context)||

## Parser

```moonbit
:::source,oboard/moonbit-eval/parser/basic_parser.mbt,2:::type Parser
```


#### mooncakes-io-method-mark-Methods
- #### parse
  ```moonbit
  :::source,oboard/moonbit-eval/parser/parser.mbt,20:::fn <a href="oboard/moonbit-eval/parser#Parser">Parser</a>::parse[V](self : <a href="oboard/moonbit-eval/parser#Parser">Parser</a>[V], tokens : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[<a href="oboard/moonbit-eval/lex#Token">@oboard/moonbit-eval/lex.Token</a>]) -> (V, <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[<a href="oboard/moonbit-eval/lex#Token">@oboard/moonbit-eval/lex.Token</a>])?
  ```
  > 

## ParserContext

```moonbit
:::source,oboard/moonbit-eval/parser/context.mbt,2:::type ParserContext
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,oboard/moonbit-eval/parser/context.mbt,17:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="oboard/moonbit-eval/parser#ParserContext">ParserContext</a>
  ```
  > 
  * ```moonbit
    :::source,oboard/moonbit-eval/parser/context.mbt,17:::fn output(<a href="oboard/moonbit-eval/parser#ParserContext">ParserContext</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## parse\_syntax

```moonbit
:::source,oboard/moonbit-eval/parser/parser.mbt,306:::fn parse_syntax(tokens : <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[<a href="oboard/moonbit-eval/lex#Token">@oboard/moonbit-eval/lex.Token</a>]) -> (<a href="oboard/moonbit-eval/types#Syntax">@oboard/moonbit-eval/types.Syntax</a>, <a href="moonbitlang/core/array#ArrayView">ArrayView</a>[<a href="oboard/moonbit-eval/lex#Token">@oboard/moonbit-eval/lex.Token</a>])?
```


## parser\_context

```moonbit
:::source,oboard/moonbit-eval/parser/context.mbt,20:::let parser_context : <a href="oboard/moonbit-eval/parser#ParserContext">ParserContext</a>
```

