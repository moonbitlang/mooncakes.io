# Documentation
|Value|description|
|---|---|
|[debug](#debug)| \`debug\` prints a string prefixed with "DEBUG: " to wasi stderr with a newline.|
|[error](#error)| \`error\` prints a string prefixed with "ERROR: " to wasi stderr with a newline.|
|[info](#info)| \`info\` prints a string prefixed with "INFO: " to wasi stderr with a newline.|
|[warn](#warn)| \`warn\` prints a string prefixed with "WARNING: " to wasi stderr with a newline.|

## debug

```moonbit
:::source,gmlewis/spin-moonbit-sdk/log/logger.mbt,12:::fn debug(s : String, leading_blank_line~ : Bool = ..) -> Unit
```
 `debug` prints a string prefixed with "DEBUG: " to wasi stderr with a newline.

## error

```moonbit
:::source,gmlewis/spin-moonbit-sdk/log/logger.mbt,32:::fn error(s : String, leading_blank_line~ : Bool = ..) -> Unit
```
 `error` prints a string prefixed with "ERROR: " to wasi stderr with a newline.

## info

```moonbit
:::source,gmlewis/spin-moonbit-sdk/log/logger.mbt,2:::fn info(s : String, leading_blank_line~ : Bool = ..) -> Unit
```
 `info` prints a string prefixed with "INFO: " to wasi stderr with a newline.

## warn

```moonbit
:::source,gmlewis/spin-moonbit-sdk/log/logger.mbt,22:::fn warn(s : String, leading_blank_line~ : Bool = ..) -> Unit
```
 `warn` prints a string prefixed with "WARNING: " to wasi stderr with a newline.
