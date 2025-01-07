# Documentation
|Type|description|
|---|---|
|[AutoComplete](#AutoComplete)||
|[Html](#Html)||
|[InputType](#InputType)||
|[Target](#Target)||

|Value|description|
|---|---|
|[a](#a)||
|[b](#b)||
|[blockquote](#blockquote)||
|[br](#br)||
|[button](#button)||
|[canvas](#canvas)||
|[code](#code)||
|[dd](#dd)||
|[div](#div)||
|[dl](#dl)||
|[dt](#dt)||
|[em](#em)||
|[form](#form)||
|[fragment](#fragment)| Represents a fragment of elements, useful for grouping elements without adding an extra div|
|[h1](#h1)||
|[h2](#h2)||
|[h3](#h3)||
|[h4](#h4)||
|[h5](#h5)||
|[h6](#h6)||
|[hr](#hr)||
|[i](#i)||
|[iframe](#iframe)||
|[img](#img)||
|[input](#input)||
|[label](#label)||
|[li](#li)||
|[node](#node)| |
|[nothing](#nothing)| Represents an empty element|
|[ol](#ol)||
|[p](#p)||
|[pre](#pre)||
|[span](#span)||
|[strong](#strong)||
|[sub](#sub)||
|[sup](#sup)||
|[text](#text)||
|[u](#u)||
|[ul](#ul)||

## AutoComplete

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,537:::pub(all) enum AutoComplete {
  On
  Off
}
```


## Html

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,4:::type Html
```


#### mooncakes-io-method-mark-Methods
- #### map
  ```moonbit
  :::source,Yoorkin/rabbit-tea/html/html.mbt,12:::fn <a href="Yoorkin/rabbit-tea/html#Html">Html</a>::map[A, B](self : <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[A], f : (A) -> B) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[B]
  ```
  > 
- #### to\_virtual\_dom
  ```moonbit
  :::source,Yoorkin/rabbit-tea/html/html.mbt,24:::fn <a href="Yoorkin/rabbit-tea/html#Html">Html</a>::to_virtual_dom[Msg, Model, View](self : <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[Msg], sandbox : <a href="Yoorkin/rabbit-tea/browser#Sandbox">@Yoorkin/rabbit-tea/browser.Sandbox</a>[Msg, Model, View]) -> <a href="Yoorkin/rabbit-tea/internal/vdom#Node">@Yoorkin/rabbit-tea/internal/vdom.Node</a>
  ```
  > 

## InputType

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,511:::pub(all) enum InputType {
  Button
  Checkbox
  Color
  Date
  DateTimeLocal
  Email
  File
  Hidden
  Image
  Month
  Number
  Password
  Radio
  Range
  Reset
  Search
  Submit
  Tel
  Text
  Time
  Url
  Week
}
```


## Target

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,244:::pub(all) enum Target {
  Self
  Blank
}
```


## a

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,250:::fn a[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, href~ : String, target~ : <a href="Yoorkin/rabbit-tea/html#Target">Target</a> = .., childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## b

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,306:::fn b[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## blockquote

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,222:::fn blockquote[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## br

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,502:::fn br[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## button

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,92:::fn button[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, click? : M, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## canvas

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,478:::fn canvas[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, width? : Int, height? : Int) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## code

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,266:::fn code[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## dd

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,409:::fn dd[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## div

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,173:::fn div[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, click? : M, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## dl

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,389:::fn dl[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## dt

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,399:::fn dt[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## em

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,276:::fn em[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## form

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,543:::fn form[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, action? : String, childern : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## fragment

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,87:::fn fragment[M](childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```
 Represents a fragment of elements, useful for grouping elements without adding an extra div

## h1

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,111:::fn h1[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## h2

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,121:::fn h2[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## h3

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,131:::fn h3[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## h4

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,141:::fn h4[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## h5

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,151:::fn h5[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## h6

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,161:::fn h6[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## hr

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,202:::fn hr[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens~ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]] = ..) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## i

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,296:::fn i[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## iframe

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,452:::fn iframe[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, src? : String, title? : String, width? : Int, height? : Int) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## img

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,421:::fn img[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, src? : String, alt? : String, title? : String, width? : Int, height? : Int, border? : Int, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## input

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,581:::fn input[M](input_type~ : <a href="Yoorkin/rabbit-tea/html#InputType">InputType</a> = .., name? : String, value? : String, read_only? : Bool, multiple? : Bool, accept? : String, placeholder? : String, auto_complete? : <a href="Yoorkin/rabbit-tea/html#AutoComplete">AutoComplete</a>, style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens~ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]] = .., change? : (String) -> M) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## label

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,562:::fn label[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, for_? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## li

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,376:::fn li[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, click? : M, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## node

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,73:::fn node[M](tag~ : String, attributes~ : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String] = .., childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```
 

## nothing

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,82:::fn nothing[M]() -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```
 Represents an empty element

## ol

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,366:::fn ol[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## p

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,192:::fn p[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## pre

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,212:::fn pre[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## span

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,234:::fn span[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## strong

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,286:::fn strong[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## sub

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,326:::fn sub[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## sup

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,336:::fn sup[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## text

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,346:::fn text[M](str : String) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## u

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,316:::fn u[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```


## ul

```moonbit
:::source,Yoorkin/rabbit-tea/html/html.mbt,353:::fn ul[M](style~ : <a href="moonbitlang/core/array#Array">Array</a>[String] = .., id? : String, class? : String, click? : M, childrens : <a href="moonbitlang/core/array#Array">Array</a>[<a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]]) -> <a href="Yoorkin/rabbit-tea/html#Html">Html</a>[M]
```

