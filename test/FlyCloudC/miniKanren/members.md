# Documentation
|Type|description|
|---|---|
|[Goal](#Goal)||
|[Stream](#Stream)||
|[Sub](#Sub)| A Substitution cannot contain two or more associations with the same car.|
|[Val](#Val)||
|[VarId](#VarId)||

|Value|description|
|---|---|
|[appendo](#appendo)||
|[caro](#caro)||
|[cdro](#cdro)||
|[conso](#conso)||
|[delay](#delay)||
|[eqo](#eqo)||
|[fresh\_var](#fresh_var)||
|[fresh\_var\_2](#fresh_var_2)||
|[fresh\_var\_3](#fresh_var_3)||
|[list](#list)||
|[listo](#listo)||
|[membero](#membero)||
|[nilo](#nilo)||
|[run](#run)||

## Goal

```moonbit
:::source,FlyCloudC/miniKanren/goal.mbt,2:::type Goal
```


#### mooncakes-io-method-mark-Methods
- #### land
  ```moonbit
  :::source,FlyCloudC/miniKanren/goal.mbt,22:::fn <a href="FlyCloudC/miniKanren#Goal">Goal</a>::land(g1 : <a href="FlyCloudC/miniKanren#Goal">Goal</a>, g2 : <a href="FlyCloudC/miniKanren#Goal">Goal</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
  ```
  > 
- #### lor
  ```moonbit
  :::source,FlyCloudC/miniKanren/goal.mbt,17:::fn <a href="FlyCloudC/miniKanren#Goal">Goal</a>::lor(g1 : <a href="FlyCloudC/miniKanren#Goal">Goal</a>, g2 : <a href="FlyCloudC/miniKanren#Goal">Goal</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
  ```
  > 

## Stream

```moonbit
:::source,FlyCloudC/miniKanren/stream.mbt,2:::type Stream
```


## Sub

```moonbit
:::source,FlyCloudC/miniKanren/sub.mbt,2:::type Sub
```
 A Substitution cannot contain two or more associations with the same car.

## Val

```moonbit
:::source,FlyCloudC/miniKanren/val.mbt,5:::pub(all) enum Val {
  Int(Int)
  Nil
  Pair(<a href="FlyCloudC/miniKanren#Val">Val</a>, <a href="FlyCloudC/miniKanren#Val">Val</a>)
  Var(<a href="FlyCloudC/miniKanren#VarId">VarId</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,FlyCloudC/miniKanren/val.mbt,10:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="FlyCloudC/miniKanren#Val">Val</a>
  ```
  > 
  * ```moonbit
    :::source,FlyCloudC/miniKanren/val.mbt,10:::fn op_equal(<a href="FlyCloudC/miniKanren#Val">Val</a>, <a href="FlyCloudC/miniKanren#Val">Val</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,FlyCloudC/miniKanren/val.mbt,57:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="FlyCloudC/miniKanren#Val">Val</a>
  ```
  > 
  * ```moonbit
    :::source,FlyCloudC/miniKanren/val.mbt,57:::fn output(self : <a href="FlyCloudC/miniKanren#Val">Val</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## VarId

```moonbit
:::source,FlyCloudC/miniKanren/val.mbt,2:::type VarId
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,FlyCloudC/miniKanren/val.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="FlyCloudC/miniKanren#VarId">VarId</a>
  ```
  > 
  * ```moonbit
    :::source,FlyCloudC/miniKanren/val.mbt,2:::fn op_equal(<a href="FlyCloudC/miniKanren#VarId">VarId</a>, <a href="FlyCloudC/miniKanren#VarId">VarId</a>) -> Bool
    ```
    > automatically derived

## appendo

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,83:::fn appendo(l1 : <a href="FlyCloudC/miniKanren#Val">Val</a>, l2 : <a href="FlyCloudC/miniKanren#Val">Val</a>, o : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## caro

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,12:::fn caro(p : <a href="FlyCloudC/miniKanren#Val">Val</a>, a : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## cdro

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,17:::fn cdro(p : <a href="FlyCloudC/miniKanren#Val">Val</a>, d : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## conso

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,7:::fn conso(a : <a href="FlyCloudC/miniKanren#Val">Val</a>, d : <a href="FlyCloudC/miniKanren#Val">Val</a>, p : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## delay

```moonbit
:::source,FlyCloudC/miniKanren/goal.mbt,27:::fn delay(f : () -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## eqo

```moonbit
:::source,FlyCloudC/miniKanren/goal.mbt,5:::fn eqo(u : <a href="FlyCloudC/miniKanren#Val">Val</a>, v : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## fresh\_var

```moonbit
:::source,FlyCloudC/miniKanren/val.mbt,27:::fn fresh_var() -> <a href="FlyCloudC/miniKanren#Val">Val</a>
```


## fresh\_var\_2

```moonbit
:::source,FlyCloudC/miniKanren/val.mbt,30:::fn fresh_var_2() -> (<a href="FlyCloudC/miniKanren#Val">Val</a>, <a href="FlyCloudC/miniKanren#Val">Val</a>)
```


## fresh\_var\_3

```moonbit
:::source,FlyCloudC/miniKanren/val.mbt,35:::fn fresh_var_3() -> (<a href="FlyCloudC/miniKanren#Val">Val</a>, <a href="FlyCloudC/miniKanren#Val">Val</a>, <a href="FlyCloudC/miniKanren#Val">Val</a>)
```


## list

```moonbit
:::source,FlyCloudC/miniKanren/val.mbt,13:::fn list(vs : <a href="moonbitlang/core/array#Array">Array</a>[<a href="FlyCloudC/miniKanren#Val">Val</a>]) -> <a href="FlyCloudC/miniKanren#Val">Val</a>
```


## listo

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,22:::fn listo(v : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## membero

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,45:::fn membero(e : <a href="FlyCloudC/miniKanren#Val">Val</a>, ls : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## nilo

```moonbit
:::source,FlyCloudC/miniKanren/list_rules.mbt,2:::fn nilo(v : <a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>
```


## run

```moonbit
:::source,FlyCloudC/miniKanren/goal.mbt,32:::fn run(f : (<a href="FlyCloudC/miniKanren#Val">Val</a>) -> <a href="FlyCloudC/miniKanren#Goal">Goal</a>) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[<a href="FlyCloudC/miniKanren#Val">Val</a>]
```

