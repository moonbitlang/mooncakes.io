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
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,25:::pub(all) enum ErrorCode {
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
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,47:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,47:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,77:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>::from(self : Int) -> <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,47:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>) -> Bool
  ```
  > automatically derived
- #### ordinal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,50:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>::ordinal(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>) -> Int
  ```
  > 
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,47:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">ErrorCode</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IpAddress

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,128:::pub(all) enum IpAddress {
  Ipv4((Byte, Byte, Byte, Byte))
  Ipv6((UInt, UInt, UInt, UInt, UInt, UInt, UInt, UInt))
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,131:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,131:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,131:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,131:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">IpAddress</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IpAddressFamily

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,105:::pub(all) enum IpAddressFamily {
  IPV4
  IPV6
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,108:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,108:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,119:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::from(self : Int) -> <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,108:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>) -> Bool
  ```
  > automatically derived
- #### ordinal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,111:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::ordinal(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>) -> Int
  ```
  > 
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,108:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">IpAddressFamily</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IpSocketAddress

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,148:::pub(all) enum IpSocketAddress {
  Ipv4(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>)
  Ipv6(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,151:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,151:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,151:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,151:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">IpSocketAddress</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Ipv4SocketAddress

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,134:::pub(all) struct Ipv4SocketAddress {
  port : UInt
  address : (Byte, Byte, Byte, Byte)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,137:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,137:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,137:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,137:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv4SocketAddress">Ipv4SocketAddress</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Ipv6SocketAddress

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,140:::pub(all) struct Ipv6SocketAddress {
  port : UInt
  flow_info : UInt
  address : (UInt, UInt, UInt, UInt, UInt, UInt, UInt, UInt)
  scope_id : UInt
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,145:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,145:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,145:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,145:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Ipv6SocketAddress">Ipv6SocketAddress</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Network

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,5:::pub(all) type Network Int
```
 An opaque resource that represents access to (a subset of) the network.
This enables context-based security for networking.
There is no need for this to map 1:1 to a physical network interface.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,8:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,5:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/top.mbt,5:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/network/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">Network</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
