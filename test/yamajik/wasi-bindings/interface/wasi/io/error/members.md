# Documentation
|Type|description|
|---|---|
|[Error\_](#Error_)| A resource which represents some error information.|

## Error\_

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,21:::pub(all) type Error_ Int
```
 A resource which represents some error information.

 The only method provided by this resource is `to-debug-string`,
which provides some human-readable information about the error.

 In the `wasi:io` package, this resource is returned through the
`wasi:io/streams/stream-error` type.

 To provide more specific error information, other interfaces may
provide functions to further "downcast" this error into more specific
error information. For example, `error`s returned in streams derived
from filesystem types to be described using the filesystem's own
error-code type, using the function
`wasi:filesystem/types/filesystem-error-code`, which takes a parameter
`borrow<error>` and returns
`option<wasi:filesystem/types/error-code>`.

 The set of functions which can "downcast" an `error` into a more
concrete type is open.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,21:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,21:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>, <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,21:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,24:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### to\_debug\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/error/top.mbt,36:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>::to_debug_string(self : <a href="yamajik/wasi-bindings/interface/wasi/io/error#Error_">Error_</a>) -> String
  ```
  >  Returns a string that is suitable to assist humans in debugging
  > this error.
  > 
  >  WARNING: The returned string should not be consumed mechanically\!
  > It may change across platforms, hosts, or other implementation
  > details. Parsing this string is a major platform-compatibility
  > hazard.
