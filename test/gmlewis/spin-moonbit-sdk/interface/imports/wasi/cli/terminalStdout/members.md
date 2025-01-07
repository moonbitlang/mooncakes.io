An interface providing an optional `terminal-output` for stdout as a
link-time authority.
---
# Documentation
|Value|description|
|---|---|
|[get\_terminal\_stdout](#get_terminal_stdout)| If stdout is connected to a terminal, return a \`terminal-output\` handle|

## get\_terminal\_stdout

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalStdout/top.mbt,5:::fn get_terminal_stdout() -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalOutput#TerminalOutput">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalOutput.TerminalOutput</a>?
```
 If stdout is connected to a terminal, return a `terminal-output` handle
allowing further interaction with it.
