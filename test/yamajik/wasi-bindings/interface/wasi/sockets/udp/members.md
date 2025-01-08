# Documentation
|Type|description|
|---|---|
|[IncomingDatagram](#IncomingDatagram)| A received datagram.|
|[IncomingDatagramStream](#IncomingDatagramStream)||
|[OutgoingDatagram](#OutgoingDatagram)| A datagram to be sent out.|
|[OutgoingDatagramStream](#OutgoingDatagramStream)||
|[UdpSocket](#UdpSocket)| A UDP socket handle.|

## IncomingDatagram

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,3:::pub(all) struct IncomingDatagram {
  data : Bytes
  remote_address : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpSocketAddress</a>
}
```
 A received datagram.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagram">IncomingDatagram</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,6:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagram">IncomingDatagram</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagram">IncomingDatagram</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagram">IncomingDatagram</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,6:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagram">IncomingDatagram</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## IncomingDatagramStream

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,24:::pub(all) type IncomingDatagramStream Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,24:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,24:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,24:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,24:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,27:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### receive
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,623:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>::receive(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>, max_results : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="moonbitlang/core/array#Array">Array</a>[<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagram">IncomingDatagram</a>], <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Receive messages on the socket.
  > 
  >  This function attempts to receive up to `max-results` datagrams on the socket without blocking.
  > The returned list may contain fewer elements than requested, but never more.
  > 
  >  This function returns successfully with an empty list when either:
  >  - `max-results` is 0, or:
  >  - `max-results` is greater than 0, but no results are immediately available.
  >    This function never returns `error(would-block)`.
  > 
  >  #### Typical errors
  >  - `remote-unreachable`: The remote address is not reachable. (ECONNRESET, ENETRESET on Windows, EHOSTUNREACH, EHOSTDOWN, ENETUNREACH, ENETDOWN, ENONET)
  >  - `connection-refused`: The connection was refused. (ECONNREFUSED)
  > 
  >  #### References
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/recvfrom.html>
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/recvmsg.html>
  >  - <https://man7.org/linux/man-pages/man2/recv.2.html>
  >  - <https://man7.org/linux/man-pages/man2/recvmmsg.2.html>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock/nf-winsock-recv>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock/nf-winsock-recvfrom>
  >  - <https://learn.microsoft.com/en-us/previous-versions/windows/desktop/legacy/ms741687(v=vs.85)>
  >  - <https://man.freebsd.org/cgi/man.cgi?query=recv&sektion=2>
- #### subscribe
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,694:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>::subscribe(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">@yamajik/wasi-bindings/interface/wasi/io/poll.Pollable</a>
  ```
  >  Create a `pollable` which will resolve once the stream is ready to receive again.
  > 
  >  Note: this function is here for WASI Preview2 only.
  > It's planned to be removed when `future` is natively supported in Preview3.

## OutgoingDatagram

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,9:::pub(all) struct OutgoingDatagram {
  data : Bytes
  remote_address : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpSocketAddress</a>?
}
```
 A datagram to be sent out.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,12:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagram">OutgoingDatagram</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,12:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagram">OutgoingDatagram</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagram">OutgoingDatagram</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagram">OutgoingDatagram</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,12:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagram">OutgoingDatagram</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## OutgoingDatagramStream

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,33:::pub(all) type OutgoingDatagramStream Int
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,33:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,33:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,33:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,33:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### check\_send
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,713:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>::check_send(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt64, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Check readiness for sending. This function never blocks.
  > 
  >  Returns the number of datagrams permitted for the next call to `send`,
  > or an error. Calling `send` with more datagrams than this function has
  > permitted will trap.
  > 
  >  When this function returns ok(0), the `subscribe` pollable will
  > become ready when this function will report at least ok(1), or an
  > error.
  > 
  >  Never returns `would-block`.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,36:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### send
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,762:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>::send(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>, datagrams : <a href="moonbitlang/core/array#Array">Array</a>[<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagram">OutgoingDatagram</a>]) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt64, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Send messages on the socket.
  > 
  >  This function attempts to send all provided `datagrams` on the socket without blocking and
  > returns how many messages were actually sent (or queued for sending). This function never
  > returns `error(would-block)`. If none of the datagrams were able to be sent, `ok(0)` is returned.
  > 
  >  This function semantically behaves the same as iterating the `datagrams` list and sequentially
  > sending each individual datagram until either the end of the list has been reached or the first error occurred.
  > If at least one datagram has been sent successfully, this function never returns an error.
  > 
  >  If the input list is empty, the function returns `ok(0)`.
  > 
  >  Each call to `send` must be permitted by a preceding `check-send`. Implementations must trap if
  > either `check-send` was not called or `datagrams` contains more items than `check-send` permitted.
  > 
  >  #### Typical errors
  >  - `invalid-argument`:        The `remote-address` has the wrong address family. (EAFNOSUPPORT)
  >  - `invalid-argument`:        The IP address in `remote-address` is set to INADDR\_ANY (`0.0.0.0` / `::`). (EDESTADDRREQ, EADDRNOTAVAIL)
  >  - `invalid-argument`:        The port in `remote-address` is set to 0. (EDESTADDRREQ, EADDRNOTAVAIL)
  >  - `invalid-argument`:        The socket is in "connected" mode and `remote-address` is `some` value that does not match the address passed to `stream`. (EISCONN)
  >  - `invalid-argument`:        The socket is not "connected" and no value for `remote-address` was provided. (EDESTADDRREQ)
  >  - `remote-unreachable`:      The remote address is not reachable. (ECONNRESET, ENETRESET on Windows, EHOSTUNREACH, EHOSTDOWN, ENETUNREACH, ENETDOWN, ENONET)
  >  - `connection-refused`:      The connection was refused. (ECONNREFUSED)
  >  - `datagram-too-large`:      The datagram is too large. (EMSGSIZE)
  > 
  >  #### References
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/sendto.html>
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/sendmsg.html>
  >  - <https://man7.org/linux/man-pages/man2/send.2.html>
  >  - <https://man7.org/linux/man-pages/man2/sendmmsg.2.html>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-send>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-sendto>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-wsasendmsg>
  >  - <https://man.freebsd.org/cgi/man.cgi?query=send&sektion=2>
- #### subscribe
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,836:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>::subscribe(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">@yamajik/wasi-bindings/interface/wasi/io/poll.Pollable</a>
  ```
  >  Create a `pollable` which will resolve once the stream is ready to send again.
  > 
  >  Note: this function is here for WASI Preview2 only.
  > It's planned to be removed when `future` is natively supported in Preview3.

## UdpSocket

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,15:::pub(all) type UdpSocket Int
```
 A UDP socket handle.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,15:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,15:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,15:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,15:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### address\_family
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,459:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::address_family(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpAddressFamily">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpAddressFamily</a>
  ```
  >  Whether this is a IPv4 or IPv6 socket.
  > 
  >  Equivalent to the SO\_DOMAIN socket option.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,18:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### finish\_bind
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,134:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::finish_bind(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  > 
- #### local\_address
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,306:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::local_address(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpSocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Get the current bound address.
  > 
  >  POSIX mentions:
  >  > If the socket has not been bound to a local name, the value
  >  > stored in the object pointed to by `address` is unspecified.
  > 
  >  WASI is stricter and requires `local-address` to return `invalid-state` when the socket hasn't been bound yet.
  > 
  >  #### Typical errors
  >  - `invalid-state`: The socket is not bound to any local address.
  > 
  >  #### References
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/getsockname.html>
  >  - <https://man7.org/linux/man-pages/man2/getsockname.2.html>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock/nf-winsock-getsockname>
  >  - <https://man.freebsd.org/cgi/man.cgi?getsockname>
- #### receive\_buffer\_size
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,517:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::receive_buffer_size(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt64, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  The kernel buffer space reserved for sends/receives on this socket.
  > 
  >  If the provided value is 0, an `invalid-argument` error is returned.
  > Any other value will never cause an error, but it might be silently clamped and/or rounded.
  > I.e. after setting a value, reading the same setting back may return a different value.
  > 
  >  Equivalent to the SO\_RCVBUF and SO\_SNDBUF socket options.
  > 
  >  #### Typical errors
  >  - `invalid-argument`:     (set) The provided value was 0.
- #### remote\_address
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,386:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::remote_address(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpSocketAddress</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Get the address the socket is currently streaming to.
  > 
  >  #### Typical errors
  >  - `invalid-state`: The socket is not streaming to a specific remote address. (ENOTCONN)
  > 
  >  #### References
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/getpeername.html>
  >  - <https://man7.org/linux/man-pages/man2/getpeername.2.html>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock/nf-winsock-getpeername>
  >  - <https://man.freebsd.org/cgi/man.cgi?query=getpeername&sektion=2&n=1>
- #### send\_buffer\_size
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,554:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::send_buffer_size(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt64, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  > 
- #### set\_receive\_buffer\_size
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,533:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::set_receive_buffer_size(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, value : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  > 
- #### set\_send\_buffer\_size
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,570:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::set_send_buffer_size(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, value : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  > 
- #### set\_unicast\_hop\_limit
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,487:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::set_unicast_hop_limit(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, value : Byte) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  > 
- #### start\_bind
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,67:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::start_bind(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, network : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#Network">@yamajik/wasi-bindings/interface/wasi/sockets/network.Network</a>, local_address : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpSocketAddress</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Bind the socket to a specific network on the provided IP address and port.
  > 
  >  If the IP address is zero (`0.0.0.0` in IPv4, `::` in IPv6), it is left to the implementation to decide which
  > network interface(s) to bind to.
  > If the port is zero, the socket will be bound to a random free port.
  > 
  >  #### Typical errors
  >  - `invalid-argument`:          The `local-address` has the wrong address family. (EAFNOSUPPORT, EFAULT on Windows)
  >  - `invalid-state`:             The socket is already bound. (EINVAL)
  >  - `address-in-use`:            No ephemeral ports available. (EADDRINUSE, ENOBUFS on Windows)
  >  - `address-in-use`:            Address is already in use. (EADDRINUSE)
  >  - `address-not-bindable`:      `local-address` is not an address that the `network` can bind to. (EADDRNOTAVAIL)
  >  - `not-in-progress`:           A `bind` operation is not in progress.
  >  - `would-block`:               Can't finish the operation, it is still in progress. (EWOULDBLOCK, EAGAIN)
  > 
  >  #### Implementors note
  >  Unlike in POSIX, in WASI the bind operation is async. This enables
  > interactive WASI hosts to inject permission prompts. Runtimes that
  > don't want to make use of this ability can simply call the native
  > `bind` as part of either `start-bind` or `finish-bind`.
  > 
  >  #### References
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/bind.html>
  >  - <https://man7.org/linux/man-pages/man2/bind.2.html>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock/nf-winsock-bind>
  >  - <https://man.freebsd.org/cgi/man.cgi?query=bind&sektion=2&format=html>
- #### stream
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,189:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::stream(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>, remote_address : <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#IpSocketAddress">@yamajik/wasi-bindings/interface/wasi/sockets/network.IpSocketAddress</a>?) -> <a href="moonbitlang/core/result#Result">Result</a>[(<a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#IncomingDatagramStream">IncomingDatagramStream</a>, <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#OutgoingDatagramStream">OutgoingDatagramStream</a>), <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Set up inbound & outbound communication channels, optionally to a specific peer.
  > 
  >  This function only changes the local socket configuration and does not generate any network traffic.
  > On success, the `remote-address` of the socket is updated. The `local-address` may be updated as well,
  > based on the best network path to `remote-address`.
  > 
  >  When a `remote-address` is provided, the returned streams are limited to communicating with that specific peer:
  >  - `send` can only be used to send to this destination.
  >  - `receive` will only return datagrams sent from the provided `remote-address`.
  > 
  >  This method may be called multiple times on the same socket to change its association, but
  > only the most recently returned pair of streams will be operational. Implementations may trap if
  > the streams returned by a previous invocation haven't been dropped yet before calling `stream` again.
  > 
  >  The POSIX equivalent in pseudo-code is:
  >  ```text
  >  if (was previously connected) {
  >  connect(s, AF_UNSPEC)
  >  }
  >  if (remote_address is Some) {
  >  connect(s, remote_address)
  >  }
  >  ```
  > 
  >  Unlike in POSIX, the socket must already be explicitly bound.
  > 
  >  #### Typical errors
  >  - `invalid-argument`:          The `remote-address` has the wrong address family. (EAFNOSUPPORT)
  >  - `invalid-argument`:          The IP address in `remote-address` is set to INADDR\_ANY (`0.0.0.0` / `::`). (EDESTADDRREQ, EADDRNOTAVAIL)
  >  - `invalid-argument`:          The port in `remote-address` is set to 0. (EDESTADDRREQ, EADDRNOTAVAIL)
  >  - `invalid-state`:             The socket is not bound.
  >  - `address-in-use`:            Tried to perform an implicit bind, but there were no ephemeral ports available. (EADDRINUSE, EADDRNOTAVAIL on Linux, EAGAIN on BSD)
  >  - `remote-unreachable`:        The remote address is not reachable. (ECONNRESET, ENETRESET, EHOSTUNREACH, EHOSTDOWN, ENETUNREACH, ENETDOWN, ENONET)
  >  - `connection-refused`:        The connection was refused. (ECONNREFUSED)
  > 
  >  #### References
  >  - <https://pubs.opengroup.org/onlinepubs/9699919799/functions/connect.html>
  >  - <https://man7.org/linux/man-pages/man2/connect.2.html>
  >  - <https://learn.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-connect>
  >  - <https://man.freebsd.org/cgi/man.cgi?connect>
- #### subscribe
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,594:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::subscribe(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">@yamajik/wasi-bindings/interface/wasi/io/poll.Pollable</a>
  ```
  >  Create a `pollable` which will resolve once the socket is ready for I/O.
  > 
  >  Note: this function is here for WASI Preview2 only.
  > It's planned to be removed when `future` is natively supported in Preview3.
- #### unicast\_hop\_limit
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/sockets/udp/top.mbt,471:::fn <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>::unicast_hop_limit(self : <a href="yamajik/wasi-bindings/interface/wasi/sockets/udp#UdpSocket">UdpSocket</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Byte, <a href="yamajik/wasi-bindings/interface/wasi/sockets/network#ErrorCode">@yamajik/wasi-bindings/interface/wasi/sockets/network.ErrorCode</a>]
  ```
  >  Equivalent to the IP\_TTL & IPV6\_UNICAST\_HOPS socket options.
  > 
  >  If the provided value is 0, an `invalid-argument` error is returned.
  > 
  >  #### Typical errors
  >  - `invalid-argument`:     (set) The TTL value must be 1 or higher.
