An interface providing an optional `terminal-input` for stdin as a
link-time authority.
---
# Documentation
|Value|description|
|---|---|
|[get\_terminal\_stdin](#get_terminal_stdin)| If stdin is connected to a terminal, return a \`terminal-input\` handle|

## get\_terminal\_stdin

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalStdin/top.mbt,5:::fn get_terminal_stdin() -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput#TerminalInput">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/terminalInput.TerminalInput</a>?
```
 If stdin is connected to a terminal, return a `terminal-input` handle
allowing further interaction with it.
