# Documentation
|Type|description|
|---|---|
|[Entry](#Entry)||
|[Logger](#Logger)||

## Entry

```moonbit
:::source,yamajik/wasi/log/entry.mbt,5:::type Entry
```


#### mooncakes-io-method-mark-Methods
- #### debug
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,39:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::debug(self : <a href="yamajik/wasi/log#Entry">Entry</a>, message : String) -> Unit
  ```
  > 
- #### error
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,54:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::error(self : <a href="yamajik/wasi/log#Entry">Entry</a>, message : String) -> Unit
  ```
  > 
- #### info
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,44:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::info(self : <a href="yamajik/wasi/log#Entry">Entry</a>, message : String) -> Unit
  ```
  > 
- #### panic
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,59:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::panic(self : <a href="yamajik/wasi/log#Entry">Entry</a>, message : String) -> Unit
  ```
  > 
- #### warn
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,49:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::warn(self : <a href="yamajik/wasi/log#Entry">Entry</a>, message : String) -> Unit
  ```
  > 
- #### with\_error
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,34:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::with_error(self : <a href="yamajik/wasi/log#Entry">Entry</a>, error : <a href="moonbitlang/core/error#Error">Error</a>) -> <a href="yamajik/wasi/log#Entry">Entry</a>
  ```
  > 
- #### with\_field
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,19:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::with_field(self : <a href="yamajik/wasi/log#Entry">Entry</a>, key : String, value : <a href="moonbitlang/core/builtin#Show">Show</a>) -> <a href="yamajik/wasi/log#Entry">Entry</a>
  ```
  > 
- #### with\_fields
  ```moonbit
  :::source,yamajik/wasi/log/entry.mbt,26:::fn <a href="yamajik/wasi/log#Entry">Entry</a>::with_fields(self : <a href="yamajik/wasi/log#Entry">Entry</a>, fields : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/builtin#Show">Show</a>]) -> <a href="yamajik/wasi/log#Entry">Entry</a>
  ```
  > 

## Logger

```moonbit
:::source,yamajik/wasi/log/logger.mbt,5:::type Logger
```


#### mooncakes-io-method-mark-Methods
- #### debug
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,38:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::debug(self : <a href="yamajik/wasi/log#Logger">Logger</a>, message : String) -> Unit
  ```
  > 
- #### error
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,53:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::error(self : <a href="yamajik/wasi/log#Logger">Logger</a>, message : String) -> Unit
  ```
  > 
- #### info
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,43:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::info(self : <a href="yamajik/wasi/log#Logger">Logger</a>, message : String) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,10:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::new() -> <a href="yamajik/wasi/log#Logger">Logger</a>
  ```
  > 
- #### panic
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,58:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::panic(self : <a href="yamajik/wasi/log#Logger">Logger</a>, message : String) -> Unit
  ```
  > 
- #### warn
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,48:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::warn(self : <a href="yamajik/wasi/log#Logger">Logger</a>, message : String) -> Unit
  ```
  > 
- #### with\_error
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,27:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::with_error(self : <a href="yamajik/wasi/log#Logger">Logger</a>, error : <a href="moonbitlang/core/error#Error">Error</a>) -> <a href="yamajik/wasi/log#Entry">Entry</a>
  ```
  > 
- #### with\_field
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,15:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::with_field(self : <a href="yamajik/wasi/log#Logger">Logger</a>, key : String, value : <a href="moonbitlang/core/builtin#Show">Show</a>) -> <a href="yamajik/wasi/log#Entry">Entry</a>
  ```
  > 
- #### with\_fields
  ```moonbit
  :::source,yamajik/wasi/log/logger.mbt,22:::fn <a href="yamajik/wasi/log#Logger">Logger</a>::with_fields(self : <a href="yamajik/wasi/log#Logger">Logger</a>, fields : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/builtin#Show">Show</a>]) -> <a href="yamajik/wasi/log#Entry">Entry</a>
  ```
  > 
