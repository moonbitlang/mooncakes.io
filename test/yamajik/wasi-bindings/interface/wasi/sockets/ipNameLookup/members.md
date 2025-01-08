# Documentation
|Type|description|
|---|---|
|[ResolveAddressStream](#ResolveAddressStream)||

|Value|description|
|---|---|
|[resolve\_addresses](#resolve_addresses)| Resolve an internet host name to a list of IP addresses.|

## ResolveAddressStream

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,4:::pub(all) type ResolveAddressStream Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,4:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,4:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,7:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### resolve\_next\_address
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,70:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>::resolve_next_address(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpAddress</a>?, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Returns the next address from the resolver.
  > 
  >  This function should be called multiple times. On each call, it will
  > return the next address in connection order preference. If all
  > addresses have been exhausted, this function returns `none`.
  > 
  >  This function never returns IPv4-mapped IPv6 addresses.
  > 
  >  #### Typical errors
  >  - `name-unresolvable`:          Name does not exist or has no suitable associated IP addresses. (EAI\_NONAME, EAI\_NODATA, EAI\_ADDRFAMILY)
  >  - `temporary-resolver-failure`: A temporary failure in name resolution occurred. (EAI\_AGAIN)
  >  - `permanent-resolver-failure`: A permanent failure in name resolution occurred. (EAI\_FAIL)
  >  - `would-block`:                A result is not available yet. (EWOULDBLOCK, EAGAIN)
- #### subscribe
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,139:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>::subscribe(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">@yamajik/wasi-bindings/interface/wasi/io/poll.Pollable</a>
  ```
  >  Create a `pollable` which will resolve once the stream is ready for I/O.
  > 
  >  Note: this function is here for WASI Preview2 only.
  > It's planned to be removed when `future` is natively supported in Preview3.

## resolve\_addresses

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup/top.mbt,32:::fn resolve_addresses(network : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">@yamajik/wasi-bindings/interface/wasi/sockets/network.Network</a>, name : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/sockets/ipNameLookup#ResolveAddressStream">ResolveAddressStream</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
```
 Resolve an internet host name to a list of IP addresses.

 Unicode domain names are automatically converted to ASCII using IDNA encoding.
If the input is an IP address string, the address is parsed and returned
as-is without making any external requests.

 See the wasi-socket proposal README.md for a comparison with getaddrinfo.

 This function never blocks. It either immediately fails or immediately
returns successfully with a `resolve-address-stream` that can be used
to (asynchronously) fetch the results.

 #### Typical errors
 - `invalid-argument`: `name` is a syntactically invalid domain name or IP address.

 #### References:
 - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/getaddrinfo.html>
 - <https://man7.org/linux/man-pages/man3/getaddrinfo.3.html>
 - <https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfo>
 - <https://man.freebsd.org/cgi/man.cgi?query=getaddrinfo&sektion=3>
