# Documentation
|Value|description|
|---|---|
|[get\_arguments](#get_arguments)| Get the POSIX-style arguments to the program.|
|[get\_environment](#get_environment)| Get the POSIX-style environment variables.|
|[initial\_cwd](#initial_cwd)| Return a path that programs should use as their initial current working|

## get\_arguments

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/environment/top.mbt,27:::fn get_arguments() -> <a href="moonbitlang/core/array#Array">Array</a>[String]
```
 Get the POSIX-style arguments to the program.

## get\_environment

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/environment/top.mbt,11:::fn get_environment() -> <a href="moonbitlang/core/array#Array">Array</a>[(String, String)]
```
 Get the POSIX-style environment variables.

 Each environment variable is provided as a pair of string variable names
and string value.

 Morally, these are a value import, but until value imports are available
in the component model, this import function should return the same
values each time it is called.

## initial\_cwd

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/cli/environment/top.mbt,43:::fn initial_cwd() -> String?
```
 Return a path that programs should use as their initial current working
directory, interpreting `.` as shorthand for this.
