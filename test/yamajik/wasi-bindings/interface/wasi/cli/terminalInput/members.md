Terminal input.

In the future, this may include functions for disabling echoing,
disabling input buffering so that keyboard events are sent through
immediately, querying supported features, and so on.
---
# Documentation
|Type|description|
|---|---|
|[TerminalInput](#TerminalInput)| The input side of a terminal.|

## TerminalInput

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/cli/terminalInput/top.mbt,3:::pub(all) type TerminalInput Int
```
 The input side of a terminal.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalInput/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalInput/top.mbt,3:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>, <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalInput/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalInput/top.mbt,3:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalInput/top.mbt,6:::fn <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>) -> Unit
  ```
  >  Drops a resource handle.
