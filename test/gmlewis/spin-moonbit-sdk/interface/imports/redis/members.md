# Documentation
|Type|description|
|---|---|
|[Connection](#Connection)||
|[Error\_](#Error_)| Errors related to interacting with Redis|
|[RedisParameter](#RedisParameter)| A parameter type for the general-purpose \`execute\` function.|
|[RedisResult](#RedisResult)| A return type for the general-purpose \`execute\` function.|

## Connection

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,12:::pub(all) type Connection Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,12:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,12:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,12:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### del
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,229:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::del(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, keys : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Removes the specified keys.
  > 
  >  A key is ignored if it does not exist. Returns the number of keys deleted.
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,18:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>) -> Unit
  ```
  > 
- #### execute
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,413:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::execute(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, command : String, arguments : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisParameter">RedisParameter</a>]) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisResult">RedisResult</a>], <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Execute an arbitrary Redis command and receive the result.
- #### get
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,105:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::get(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, key : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Bytes?, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Get the value of a key.
- #### incr
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,193:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::incr(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, key : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Int64, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Increments the number stored at key by one.
  > 
  >  If the key does not exist, it is set to 0 before performing the operation.
  > An `error::type-error` is returned if the key contains a value of the wrong type
  > or contains a string that can not be represented as integer.
- #### open
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,37:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::open(address : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Open a connection to the Redis instance at `address`.
- #### publish
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,67:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::publish(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, channel : String, payload : Bytes) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Publish a Redis message to the specified channel.
- #### sadd
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,270:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::sadd(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, key : String, values : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Add the specified `values` to the set named `key`, returning the number of newly-added values.
- #### set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,151:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, key : String, value : Bytes) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Set key to value.
  > 
  >  If key already holds a value, it is overwritten.
- #### smembers
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,320:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::smembers(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, key : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/array#Array">Array</a>[String], <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Retrieve the contents of the set named `key`.
- #### srem
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,363:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>::srem(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Connection">Connection</a>, key : String, values : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>]
  ```
  >  Remove the specified `values` from the set named `key`, returning the number of newly-removed values.

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,4:::pub(all) enum Error_ {
  InvalidAddress
  TooManyConnections
  TypeError
  Other(String)
}
```
 Errors related to interacting with Redis

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,9:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,9:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## RedisParameter

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,23:::pub(all) enum RedisParameter {
  Int64(Int64)
  Binary(Bytes)
}
```
 A parameter type for the general-purpose `execute` function.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,26:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisParameter">RedisParameter</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,26:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisParameter">RedisParameter</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisParameter">RedisParameter</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,26:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisParameter">RedisParameter</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,26:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisParameter">RedisParameter</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## RedisResult

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,29:::pub(all) enum RedisResult {
  Nil
  Status(String)
  Int64(Int64)
  Binary(Bytes)
}
```
 A return type for the general-purpose `execute` function.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,34:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisResult">RedisResult</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,34:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisResult">RedisResult</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisResult">RedisResult</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,34:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisResult">RedisResult</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/redis/top.mbt,34:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/redis#RedisResult">RedisResult</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
