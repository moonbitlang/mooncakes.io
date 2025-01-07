# format

```moonbit
let str = "Hello, {}! Today is {}."
let name = "Alice"
let day = "Monday"
println(format(str, [name, day])) 
```

```
Hello, Alice! Today is Monday.
```
---
# Documentation
|Value|description|
|---|---|
|[format](#format)| Formats a string by replacing placeholders with the corresponding arguments.|
|[printf](#printf)| \# Example|

## format

```moonbit
:::source,Yoorkin/format/format.mbt,20:::fn format(format : String, args : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/builtin#Show">Show</a>]) -> String
```
 Formats a string by replacing placeholders with the corresponding arguments.

 #### Arguments

 - `format`: A string containing placeholders to be replaced.
 - `args`: An array of values to be inserted into the placeholders.

 #### Returns

 Returns the formatted string.

 #### Example

 ```moonbit
 let str = "Hello, {}! Today is {}."
 let name = "Alice"
 let day = "Monday"
 println(format(str, [name, day])) // Output: "Hello, Alice! Today is Monday."
 ```

## printf

```moonbit
:::source,Yoorkin/format/format.mbt,39:::fn printf(text : String, args : <a href="moonbitlang/core/array#Array">Array</a>[<a href="moonbitlang/core/builtin#Show">Show</a>]) -> Unit
```
 #### Example

 ```moonbit
 let name = "Alice"
 let day = "Monday"
 printf("Hello, {}! Today is {}.", [name, day]) // Output: "Hello, Alice! Today is Monday."
 ```
