# Documentation
|Type|description|
|---|---|
|[Connection](#Connection)||
|[Error\_](#Error_)| Errors related to interacting with Mqtt|
|[Qos](#Qos)| QoS for publishing Mqtt messages|

## Connection

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,38:::pub(all) type Connection Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,38:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,38:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,38:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,38:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,44:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>) -> Unit
  ```
  > 
- #### open
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,49:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>::open(address : String, username : String, password : String, keep_alive_interval_in_secs : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>]
  ```
  >  Open a connection to the Mqtt instance at `address`.
- #### publish
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,94:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>::publish(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Connection">Connection</a>, topic : String, payload : Bytes, qos : <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>]
  ```
  >  Publish an Mqtt message to the specified `topic`.

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,4:::pub(all) enum Error_ {
  InvalidAddress
  TooManyConnections
  ConnectionFailed(String)
  Other(String)
}
```
 Errors related to interacting with Mqtt

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,9:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,9:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Qos

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,12:::pub(all) enum Qos {
  AT_MOST_ONCE
  AT_LEAST_ONCE
  EXACTLY_ONCE
}
```
 QoS for publishing Mqtt messages

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,16:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,16:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,16:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,28:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>::from(self : Int) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/mqtt/top.mbt,19:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>::ordinal(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/mqtt#Qos">Qos</a>) -> Int
  ```
  > 
