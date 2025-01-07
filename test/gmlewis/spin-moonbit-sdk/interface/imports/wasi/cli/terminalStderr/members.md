An interface providing an optional `terminal-output` for stderr as a
link-time authority.
---
# Documentation
|Value|description|
|---|---|
|[get\_terminal\_stderr](#get_terminal_stderr)| If stderr is connected to a terminal, return a \`terminal-output\` handle|

## get\_terminal\_stderr

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalStderr/top.mbt,5:::fn get_terminal_stderr() -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalOutput#TerminalOutput">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalOutput.TerminalOutput</a>?
```
 If stderr is connected to a terminal, return a `terminal-output` handle
allowing further interaction with it.
