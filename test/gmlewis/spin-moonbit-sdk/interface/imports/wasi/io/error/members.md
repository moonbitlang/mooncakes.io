# Documentation
|Type|description|
|---|---|
|[Error\_](#Error_)| A resource which represents some error information.|

## Error\_

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,22:::pub(all) type Error_ Int
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
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,22:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a> with op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,22:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a> with output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,28:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>) -> Unit
  ```
  > 
- #### op\_equal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,22:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>::op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,22:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>::output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_debug\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/top.mbt,39:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>::to_debug_string(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>) -> String
  ```
  >  Returns a string that is suitable to assist humans in debugging
  > this error.
  > 
  >  WARNING: The returned string should not be consumed mechanically\!
  > It may change across platforms, hosts, or other implementation
  > details. Parsing this string is a major platform-compatibility
  > hazard.
- #### to\_string
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error/traits.mbt,85:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">Error_</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
