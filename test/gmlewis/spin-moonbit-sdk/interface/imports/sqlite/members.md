# Documentation
|Type|description|
|---|---|
|[Connection](#Connection)| A handle to an open sqlite instance|
|[Error\_](#Error_)| The set of errors which may be raised by functions in this interface|
|[QueryResult](#QueryResult)| A result of a query|
|[RowResult](#RowResult)| A set of values for each of the columns in a query-result|
|[Value](#Value)| A single column's result from a database query|

## Connection

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,4:::pub(all) type Connection Int
```
 A handle to an open sqlite instance

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,4:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,4:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,10:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>) -> Unit
  ```
  > 
- #### execute
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,79:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>::execute(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>, statement : String, parameters : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>]) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#QueryResult">QueryResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>]
  ```
  >  Execute a statement returning back data if there is any
- #### open
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,48:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>::open(database : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>]
  ```
  >  Open a connection to a named database instance.
  > 
  >  If `database` is "default", the default instance is opened.
  > 
  >  `error::no-such-database` will be raised if the `name` is not recognized.

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,15:::pub(all) enum Error_ {
  NoSuchDatabase
  AccessDenied
  InvalidConnection
  DatabaseFull
  Io(String)
}
```
 The set of errors which may be raised by functions in this interface

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,21:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,21:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,21:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## QueryResult

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,38:::pub(all) struct QueryResult {
  columns : <a href="moonbitlang/core/array#Array">Array</a>[String]
  rows : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#RowResult">RowResult</a>]
}
```
 A result of a query

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,41:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#QueryResult">QueryResult</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,41:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#QueryResult">QueryResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#QueryResult">QueryResult</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,41:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#QueryResult">QueryResult</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,41:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#QueryResult">QueryResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## RowResult

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,33:::pub(all) struct RowResult {
  values : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>]
}
```
 A set of values for each of the columns in a query-result

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,35:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#RowResult">RowResult</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,35:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#RowResult">RowResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#RowResult">RowResult</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,35:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#RowResult">RowResult</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,35:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#RowResult">RowResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Value

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,24:::pub(all) enum Value {
  Integer(Int64)
  Real(Double)
  Text(String)
  Blob(Bytes)
  Null
}
```
 A single column's result from a database query

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,30:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,30:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,30:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/sqlite/top.mbt,30:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/sqlite#Value">Value</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
