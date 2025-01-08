Terminal output.

In the future, this may include functions for querying the terminal
size, being notified of terminal size changes, querying supported
features, and so on.
---
# Documentation
|Type|description|
|---|---|
|[TerminalOutput](#TerminalOutput)| The output side of a terminal.|

## TerminalOutput

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/cli/terminalOutput/top.mbt,3:::pub(all) type TerminalOutput Int
```
 The output side of a terminal.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalOutput/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalOutput/top.mbt,3:::fn op_equal(<a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>, <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalOutput/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>
  ```
  > 
  * ```moonbit
    :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalOutput/top.mbt,3:::fn output(<a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/cli/terminalOutput/top.mbt,6:::fn <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">TerminalOutput</a>) -> Unit
  ```
  >  Drops a resource handle.
