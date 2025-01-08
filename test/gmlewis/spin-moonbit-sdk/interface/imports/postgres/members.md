# Documentation
|Type|description|
|---|---|
|[Connection](#Connection)| A connection to a postgres database.|

## Connection

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,4:::pub(all) type Connection Int
```
 A connection to a postgres database.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,4:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,4:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,10:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>) -> Unit
  ```
  > 
- #### execute
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,262:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>::execute(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>, statement : String, params : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes#ParameterValue">@gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes.ParameterValue</a>]) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt64, <a href="gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes#Error_">@gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes.Error_</a>]
  ```
  >  Execute command to the database.
- #### open
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,15:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>::open(address : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes#Error_">@gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes.Error_</a>]
  ```
  >  Open a connection to the Postgres instance at `address`.
- #### query
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/postgres/top.mbt,60:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>::query(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/postgres#Connection">Connection</a>, statement : String, params : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes#ParameterValue">@gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes.ParameterValue</a>]) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes#RowSet">@gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes.RowSet</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes#Error_">@gmlewis/spin-moonbit-sdk/interface/imports/rdbmsTypes.Error_</a>]
  ```
  >  Query the database.
