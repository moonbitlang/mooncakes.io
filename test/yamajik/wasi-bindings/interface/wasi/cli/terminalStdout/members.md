An interface providing an optional `terminal-output` for stdout as a
link-time authority.
---
# Documentation
|Value|description|
|---|---|
|[get\_terminal\_stdout](#get_terminal_stdout)| If stdout is connected to a terminal, return a \`terminal-output\` handle|

## get\_terminal\_stdout

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/cli/terminalStdout/top.mbt,4:::fn get_terminal_stdout() -> <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalOutput#TerminalOutput">@yamajik/wasi-bindings/interface/wasi/cli/terminalOutput.TerminalOutput</a>?
```
 If stdout is connected to a terminal, return a `terminal-output` handle
allowing further interaction with it.
