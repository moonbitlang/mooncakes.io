# Documentation
|Type|description|
|---|---|
|[Clause](#Clause)||
|[ClauseAction](#ClauseAction)||
|[ClauseItem](#ClauseItem)||
|[ClauseItemIdent](#ClauseItemIdent)||
|[ClauseItemSymbol](#ClauseItemSymbol)||
|[CodeWithSubst](#CodeWithSubst)||
|[Command](#Command)||
|[LexEngine](#LexEngine)||
|[LexError](#LexError)||
|[Lexbuf](#Lexbuf)||
|[Lexer](#Lexer)||
|[ParseError](#ParseError)||
|[ParserSpec](#ParserSpec)||
|[Rule](#Rule)||
|[SubstItem](#SubstItem)||
|[SubstItemDesc](#SubstItemDesc)||
|[Token](#Token)||
|[TokenKind](#TokenKind)||
|[YYDecision](#YYDecision)||
|[YYObj\_Clause](#YYObj_Clause)||
|[YYObj\_ClauseAction](#YYObj_ClauseAction)||
|[YYObj\_ClauseItem](#YYObj_ClauseItem)||
|[YYObj\_ClauseItemSymbol](#YYObj_ClauseItemSymbol)||
|[YYObj\_Code\_](#YYObj_Code_)||
|[YYObj\_Command](#YYObj_Command)||
|[YYObj\_ParserSpec](#YYObj_ParserSpec)||
|[YYObj\_Rule](#YYObj_Rule)||
|[YYObj\_String](#YYObj_String)||
|[YYObj\_Symbol](#YYObj_Symbol)||
|[YYObj\_Symbol\_](#YYObj_Symbol_)||
|[YYObj\_Void](#YYObj_Void)||
|[YYObj\_\_String\_\_Array\_SubstItem\_\_](#YYObj__String__Array_SubstItem__)||
|[YYObj\_\_immut\_list\_T\_ClauseItem\_](#YYObj__immut_list_T_ClauseItem_)||
|[YYObj\_\_immut\_list\_T\_Clause\_](#YYObj__immut_list_T_Clause_)||
|[YYObj\_\_immut\_list\_T\_Command\_](#YYObj__immut_list_T_Command_)||
|[YYObj\_\_immut\_list\_T\_Rule\_](#YYObj__immut_list_T_Rule_)||
|[YYObj\_\_immut\_list\_T\_Symbol\_](#YYObj__immut_list_T_Symbol_)||
|[YYSymbol](#YYSymbol)||
|[Code](#Code)||
|[Position](#Position)||
|[Symbol](#Symbol)||

|Value|description|
|---|---|
|[new\_lexer](#new_lexer)||
|[spec](#spec)||

## Clause

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,62:::pub(all) struct Clause {
  items : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#ClauseItem">ClauseItem</a>]
  prec : String?
  action : <a href="hackwaly/moonyacc/lib/parser#ClauseAction">ClauseAction</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,66:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#Clause">Clause</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#Clause">Clause</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,66:::fn <a href="hackwaly/moonyacc/lib/parser#Clause">Clause</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#Clause">Clause</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## ClauseAction

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,69:::pub(all) struct ClauseAction {
  code : <a href="hackwaly/moonyacc/lib/parser#CodeWithSubst">CodeWithSubst</a>?
  start : Int
  end : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,73:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseAction">ClauseAction</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseAction">ClauseAction</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,73:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseAction">ClauseAction</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseAction">ClauseAction</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## ClauseItem

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,82:::pub(all) struct ClauseItem {
  binder : String?
  symbol : <a href="hackwaly/moonyacc/lib/parser#ClauseItemSymbol">ClauseItemSymbol</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,85:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseItem">ClauseItem</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseItem">ClauseItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,85:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItem">ClauseItem</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseItem">ClauseItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## ClauseItemIdent

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,26:::pub(all) enum ClauseItemIdent {
  Dollar(Int)
  Name(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a> with compare(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>, <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a> with op_equal(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>, <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a> with output(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>::compare(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>, <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>::op_equal(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>, <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>::output(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,29:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## ClauseItemSymbol

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,88:::pub(all) enum ClauseItemSymbol {
  Symbol(String)
  Image(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,91:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#ClauseItemSymbol">ClauseItemSymbol</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseItemSymbol">ClauseItemSymbol</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,91:::fn <a href="hackwaly/moonyacc/lib/parser#ClauseItemSymbol">ClauseItemSymbol</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#ClauseItemSymbol">ClauseItemSymbol</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## CodeWithSubst

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,76:::pub(all) struct CodeWithSubst {
  code : String
  subst : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,79:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#CodeWithSubst">CodeWithSubst</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#CodeWithSubst">CodeWithSubst</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,79:::fn <a href="hackwaly/moonyacc/lib/parser#CodeWithSubst">CodeWithSubst</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#CodeWithSubst">CodeWithSubst</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## Command

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,42:::pub(all) enum Command {
  Start(<a href="moonbitlang/core/array#Array">Array</a>[String])
  Token(<a href="moonbitlang/core/array#Array">Array</a>[String], String?)
  Token1(String, String?, String)
  Type(<a href="moonbitlang/core/array#Array">Array</a>[String], String)
  Derive(String, String)
  Position(String)
  Left(<a href="moonbitlang/core/array#Array">Array</a>[String])
  Right(<a href="moonbitlang/core/array#Array">Array</a>[String])
  Nonassoc(<a href="moonbitlang/core/array#Array">Array</a>[String])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,52:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#Command">Command</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#Command">Command</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,52:::fn <a href="hackwaly/moonyacc/lib/parser#Command">Command</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#Command">Command</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## LexEngine

```moonbit
:::source,hackwaly/moonyacc/lib/parser/lexer.mbt,39:::pub(all) struct LexEngine {
  graph : <a href="moonbitlang/core/array#Array">Array</a>[(Int) -> (Int, <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/array#Array">Array</a>[Int]])]
  end_nodes : <a href="moonbitlang/core/array#Array">Array</a>[(Int, <a href="moonbitlang/core/array#Array">Array</a>[((Int, Int), (Int, Int))])?]
  start_tags : <a href="moonbitlang/core/array#Array">Array</a>[Int]
  code_blocks_n : Int
}
```


#### mooncakes-io-method-mark-Methods
- #### run
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/lexer.mbt,47:::fn <a href="hackwaly/moonyacc/lib/parser#LexEngine">LexEngine</a>::run(self : <a href="hackwaly/moonyacc/lib/parser#LexEngine">LexEngine</a>, lexbuf : <a href="hackwaly/moonyacc/lib/parser#Lexbuf">Lexbuf</a>) -> (Int, <a href="moonbitlang/core/array#Array">Array</a>[(Int, Int)])
  ```
  > 

## LexError

```moonbit
:::source,hackwaly/moonyacc/lib/parser/lexer.mbt,99:::type LexError
```


## Lexbuf

```moonbit
:::source,hackwaly/moonyacc/lib/parser/lexer.mbt,2:::type Lexbuf
```


#### mooncakes-io-method-mark-Methods
- #### from\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/lexer.mbt,8:::fn <a href="hackwaly/moonyacc/lib/parser#Lexbuf">Lexbuf</a>::from_string(content : String) -> <a href="hackwaly/moonyacc/lib/parser#Lexbuf">Lexbuf</a>
  ```
  > 

## Lexer

```moonbit
:::source,hackwaly/moonyacc/lib/parser/lexer.mbt,105:::type Lexer
```


#### mooncakes-io-method-mark-Methods
- #### next\_token
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/lexer.mbt,3039:::fn <a href="hackwaly/moonyacc/lib/parser#Lexer">Lexer</a>::next_token(self : <a href="hackwaly/moonyacc/lib/parser#Lexer">Lexer</a>) -> (<a href="hackwaly/moonyacc/lib/parser#Token">Token</a>, Int, Int)!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 

## ParseError

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,117:::pub(all) enum ParseError {
  UnexpectedToken(<a href="hackwaly/moonyacc/lib/parser#Token">Token</a>, (Int, Int), <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a>])
}
```


## ParserSpec

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,2:::pub(all) struct ParserSpec {
  header : String?
  footer : String?
  commands : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#Command">Command</a>]
  rules : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#Rule">Rule</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,7:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#ParserSpec">ParserSpec</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#ParserSpec">ParserSpec</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,7:::fn <a href="hackwaly/moonyacc/lib/parser#ParserSpec">ParserSpec</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#ParserSpec">ParserSpec</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## Rule

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,55:::pub(all) struct Rule {
  nonterminal : String
  type_ : String?
  clauses : <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#Clause">Clause</a>]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,59:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#Rule">Rule</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#Rule">Rule</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,59:::fn <a href="hackwaly/moonyacc/lib/parser#Rule">Rule</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#Rule">Rule</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

## SubstItem

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,32:::pub(all) struct SubstItem {
  start : Int
  end : Int
  desc : <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,36:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a> with output(<a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,36:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,36:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>::output(<a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,36:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## SubstItemDesc

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,13:::pub(all) enum SubstItemDesc {
  Dollar(Int)
  StartPos
  EndPos
  Loc
  StartPosOf(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>)
  EndPosOf(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>)
  LocOf(<a href="hackwaly/moonyacc/lib/parser#ClauseItemIdent">ClauseItemIdent</a>)
  SymbolStartPos
  Sloc
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a> with compare(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>, <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a> with op_equal(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>, <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a> with output(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a> with to_json(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>::compare(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>, <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>::op_equal(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>, <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>::output(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_json
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/ast.mbt,23:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>::to_json(<a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/parser#SubstItemDesc">SubstItemDesc</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Token

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,5:::pub(all) enum Token {
  EOF
  IDENT(String)
  STRING(String)
  LANGLE_CODE_RANGLE(String)
  LBRACE_CODE_RBRACE((String, <a href="moonbitlang/core/array#Array">Array</a>[<a href="hackwaly/moonyacc/lib/parser#SubstItem">SubstItem</a>]))
  PERCENT_LBRACE_CODE_PERCENT_RBRACE(String)
  ARROW_CODE(String)
  PERCENT_PERCENT_CODE_EOF(String)
  PERCENT_PERCENT
  PERCENT_START
  PERCENT_TOKEN
  PERCENT_TYPE
  PERCENT_POSITION
  PERCENT_LEFT
  PERCENT_RIGHT
  PERCENT_NONASSOC
  PERCENT_PREC
  PERCENT_DERIVE
  COLON
  BAR
  EQ
  SEMI
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/parser.mbt,28:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/parser#Token">Token</a> with output(<a href="hackwaly/moonyacc/lib/parser#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### kind
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/parser.mbt,31:::fn <a href="hackwaly/moonyacc/lib/parser#Token">Token</a>::kind(self : <a href="hackwaly/moonyacc/lib/parser#Token">Token</a>) -> <a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a>
  ```
  > 
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/parser.mbt,28:::fn <a href="hackwaly/moonyacc/lib/parser#Token">Token</a>::output(<a href="hackwaly/moonyacc/lib/parser#Token">Token</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/parser#Token">Token</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TokenKind

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,60:::pub(all) enum TokenKind {
  TK_EOF
  TK_IDENT
  TK_STRING
  TK_LANGLE_CODE_RANGLE
  TK_LBRACE_CODE_RBRACE
  TK_PERCENT_LBRACE_CODE_PERCENT_RBRACE
  TK_ARROW_CODE
  TK_PERCENT_PERCENT_CODE_EOF
  TK_PERCENT_PERCENT
  TK_PERCENT_START
  TK_PERCENT_TOKEN
  TK_PERCENT_TYPE
  TK_PERCENT_POSITION
  TK_PERCENT_LEFT
  TK_PERCENT_RIGHT
  TK_PERCENT_NONASSOC
  TK_PERCENT_PREC
  TK_PERCENT_DERIVE
  TK_COLON
  TK_BAR
  TK_EQ
  TK_SEMI
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/parser.mbt,86:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a> with output(self : <a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/parser.mbt,86:::fn <a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a>::output(self : <a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,hackwaly/moonyacc/lib/parser/traits.mbt,85:::fn <a href="hackwaly/moonyacc/lib/parser#TokenKind">TokenKind</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## YYDecision

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,185:::type YYDecision
```


## YYObj\_Clause

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,134:::type YYObj_Clause
```


## YYObj\_ClauseAction

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,155:::type YYObj_ClauseAction
```


## YYObj\_ClauseItem

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,149:::type YYObj_ClauseItem
```


## YYObj\_ClauseItemSymbol

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,158:::type YYObj_ClauseItemSymbol
```


## YYObj\_Code\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,131:::type YYObj_Code_
```


## YYObj\_Command

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,143:::type YYObj_Command
```


## YYObj\_ParserSpec

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,152:::type YYObj_ParserSpec
```


## YYObj\_Rule

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,128:::type YYObj_Rule
```


## YYObj\_String

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,137:::type YYObj_String
```


## YYObj\_Symbol

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,140:::type YYObj_Symbol
```


## YYObj\_Symbol\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,146:::type YYObj_Symbol_
```


## YYObj\_Void

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,125:::type YYObj_Void
```


## YYObj\_\_String\_\_Array\_SubstItem\_\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,176:::type YYObj__String__Array_SubstItem__
```


## YYObj\_\_immut\_list\_T\_ClauseItem\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,173:::type YYObj__immut_list_T_ClauseItem_
```


## YYObj\_\_immut\_list\_T\_Clause\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,164:::type YYObj__immut_list_T_Clause_
```


## YYObj\_\_immut\_list\_T\_Command\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,170:::type YYObj__immut_list_T_Command_
```


## YYObj\_\_immut\_list\_T\_Rule\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,161:::type YYObj__immut_list_T_Rule_
```


## YYObj\_\_immut\_list\_T\_Symbol\_

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,167:::type YYObj__immut_list_T_Symbol_
```


## YYSymbol

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,194:::type YYSymbol
```


## Code

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,10:::type Code = String
```


## Position

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,2:::type Position = Int
```


## Symbol

```moonbit
:::source,hackwaly/moonyacc/lib/parser/ast.mbt,39:::type Symbol = String
```


## new\_lexer

```moonbit
:::source,hackwaly/moonyacc/lib/parser/lexer.mbt,3034:::fn new_lexer(input : String) -> <a href="hackwaly/moonyacc/lib/parser#Lexer">Lexer</a>
```


## spec

```moonbit
:::source,hackwaly/moonyacc/lib/parser/parser.mbt,1718:::fn spec(read_token : () -> (<a href="hackwaly/moonyacc/lib/parser#Token">Token</a>, Int, Int), start_pos : Int) -> <a href="hackwaly/moonyacc/lib/parser#ParserSpec">ParserSpec</a>!<a href="hackwaly/moonyacc/lib/parser#ParseError">ParseError</a>
```

