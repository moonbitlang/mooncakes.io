An interface providing an optional `terminal-input` for stdin as a
link-time authority.
---
# Documentation
|Value|description|
|---|---|
|[get\_terminal\_stdin](#get_terminal_stdin)| If stdin is connected to a terminal, return a \`terminal-input\` handle|

## get\_terminal\_stdin

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/cli/terminalStdin/top.mbt,4:::fn get_terminal_stdin() -> <a href="yamajik/wasi-bindings/interface/wasi/cli/terminalInput#TerminalInput">@yamajik/wasi-bindings/interface/wasi/cli/terminalInput.TerminalInput</a>?
```
 If stdin is connected to a terminal, return a `terminal-input` handle
allowing further interaction with it.
