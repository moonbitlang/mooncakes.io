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
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput/top.mbt,4:::pub(all) type TerminalInput Int
```
 The input side of a terminal.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput/top.mbt,4:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput/top.mbt,4:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput/top.mbt,4:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput/top.mbt,10:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">TerminalInput</a>) -> Unit
  ```
  > 
