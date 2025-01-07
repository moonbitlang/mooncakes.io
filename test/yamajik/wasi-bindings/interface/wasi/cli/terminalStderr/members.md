An interface providing an optional `terminal-output` for stderr as a
link-time authority.
---
# Documentation
|Value|description|
|---|---|
|[get\_terminal\_stderr](#get_terminal_stderr)| If stderr is connected to a terminal, return a \`terminal-output\` handle|

## get\_terminal\_stderr

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/cli/terminalStderr/top.mbt,4:::fn get_terminal_stderr() -> <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">@yamajik/wasi-bindings/interface/wasi/cli/terminalOutput.TerminalOutput</a>?
```
 If stderr is connected to a terminal, return a `terminal-output` handle
allowing further interaction with it.
