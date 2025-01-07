# Documentation
|Type|description|
|---|---|
|[CardModel](#CardModel)||
|[EditModel](#EditModel)||
|[EditMsg](#EditMsg)||
|[Message](#Message)||
|[Model](#Model)||

## CardModel

```moonbit
:::source,Yoorkin/rabbit-tea/example/card.mbt,2:::type CardModel
```


## EditModel

```moonbit
:::source,Yoorkin/rabbit-tea/example/edit.mbt,2:::type EditModel
```


## EditMsg

```moonbit
:::source,Yoorkin/rabbit-tea/example/edit.mbt,8:::type EditMsg
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/rabbit-tea/example/edit.mbt,13:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Yoorkin/rabbit-tea/example#EditMsg">EditMsg</a> with output(<a href="Yoorkin/rabbit-tea/example#EditMsg">EditMsg</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,Yoorkin/rabbit-tea/example/edit.mbt,13:::fn <a href="Yoorkin/rabbit-tea/example#EditMsg">EditMsg</a>::output(<a href="Yoorkin/rabbit-tea/example#EditMsg">EditMsg</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,Yoorkin/rabbit-tea/example/traits.mbt,85:::fn <a href="Yoorkin/rabbit-tea/example#EditMsg">EditMsg</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Message

```moonbit
:::source,Yoorkin/rabbit-tea/example/main.mbt,2:::type Message
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,Yoorkin/rabbit-tea/example/main.mbt,10:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="Yoorkin/rabbit-tea/example#Message">Message</a> with output(<a href="Yoorkin/rabbit-tea/example#Message">Message</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,Yoorkin/rabbit-tea/example/main.mbt,10:::fn <a href="Yoorkin/rabbit-tea/example#Message">Message</a>::output(<a href="Yoorkin/rabbit-tea/example#Message">Message</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,Yoorkin/rabbit-tea/example/traits.mbt,85:::fn <a href="Yoorkin/rabbit-tea/example#Message">Message</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Model

```moonbit
:::source,Yoorkin/rabbit-tea/example/main.mbt,13:::type Model
```

