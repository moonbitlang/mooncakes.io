# Documentation
|Type|description|
|---|---|
|[ErrorCode](#ErrorCode)| Error codes.|
|[IpAddress](#IpAddress)||
|[IpAddressFamily](#IpAddressFamily)||
|[IpSocketAddress](#IpSocketAddress)||
|[Ipv4SocketAddress](#Ipv4SocketAddress)||
|[Ipv6SocketAddress](#Ipv6SocketAddress)||
|[Network](#Network)| An opaque resource that represents access to (a subset of) the network.|

## ErrorCode

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,28:::pub(all) enum ErrorCode {
  UNKNOWN
  ACCESS_DENIED
  NOT_SUPPORTED
  INVALID_ARGUMENT
  OUT_OF_MEMORY
  TIMEOUT
  CONCURRENCY_CONFLICT
  NOT_IN_PROGRESS
  WOULD_BLOCK
  INVALID_STATE
  NEW_SOCKET_LIMIT
  ADDRESS_NOT_BINDABLE
  ADDRESS_IN_USE
  REMOTE_UNREACHABLE
  CONNECTION_REFUSED
  CONNECTION_RESET
  CONNECTION_ABORTED
  DATAGRAM_TOO_LARGE
  NAME_UNRESOLVABLE
  TEMPORARY_RESOLVER_FAILURE
  PERMANENT_RESOLVER_FAILURE
}
```
 Error codes.

 In theory, every API can return any error code.
In practice, API's typically only return the errors documented per API
combined with a couple of errors that are always possible:
 - `unknown`
 - `access-denied`
 - `not-supported`
 - `out-of-memory`
 - `concurrency-conflict`

 See each individual API for what the POSIX equivalents are. They sometimes differ per API.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,50:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,50:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,50:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,50:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,80:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>::from(self : Int) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,53:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>::ordinal(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#ErrorCode">ErrorCode</a>) -> Int
  ```
  > 

## IpAddress

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,131:::pub(all) enum IpAddress {
  Ipv4((Byte, Byte, Byte, Byte))
  Ipv6((UInt, UInt, UInt, UInt, UInt, UInt, UInt, UInt))
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,134:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddress">IpAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,134:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddress">IpAddress</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddress">IpAddress</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,134:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddress">IpAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,134:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddress">IpAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## IpAddressFamily

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,108:::pub(all) enum IpAddressFamily {
  IPV4
  IPV6
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,111:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,111:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,111:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,111:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,122:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::from(self : Int) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,114:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::ordinal(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>) -> Int
  ```
  > 

## IpSocketAddress

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,151:::pub(all) enum IpSocketAddress {
  Ipv4(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>)
  Ipv6(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,154:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,154:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,154:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,154:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Ipv4SocketAddress

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,137:::pub(all) struct Ipv4SocketAddress {
  port : UInt
  address : (Byte, Byte, Byte, Byte)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,140:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,140:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,140:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,140:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Ipv6SocketAddress

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,143:::pub(all) struct Ipv6SocketAddress {
  port : UInt
  flow_info : UInt
  address : (UInt, UInt, UInt, UInt, UInt, UInt, UInt, UInt)
  scope_id : UInt
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,148:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,148:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,148:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,148:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Network

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,6:::pub(all) type Network Int
```
 An opaque resource that represents access to (a subset of) the network.
This enables context-based security for networking.
There is no need for this to map 1:1 to a physical network interface.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,6:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,6:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network/top.mbt,12:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/sockets/network#Network">Network</a>) -> Unit
  ```
  > 
