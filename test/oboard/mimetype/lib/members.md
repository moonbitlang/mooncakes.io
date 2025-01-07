# Documentation
|Type|description|
|---|---|
|[T](#T)||

|Value|description|
|---|---|
|[types](#types)||

## T

```moonbit
:::source,oboard/mimetype/lib/main.mbt,1:::pub struct T {
  extentionToType : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
  typeToExtension : <a href="moonbitlang/core/builtin#Map">Map</a>[String, String]
  typeToExtensions : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/array#Array">Array</a>[String]]
}
```


#### mooncakes-io-method-mark-Methods
- #### getAllExtensions
  ```moonbit
  :::source,oboard/mimetype/lib/main.mbt,41:::fn <a href="oboard/mimetype/lib#T">T</a>::getAllExtensions(self : <a href="oboard/mimetype/lib#T">T</a>, mimeType : String) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
  ```
  > 
- #### getExtension
  ```moonbit
  :::source,oboard/mimetype/lib/main.mbt,36:::fn <a href="oboard/mimetype/lib#T">T</a>::getExtension(self : <a href="oboard/mimetype/lib#T">T</a>, mimeType : String) -> String?
  ```
  > 
- #### getType
  ```moonbit
  :::source,oboard/mimetype/lib/main.mbt,23:::fn <a href="oboard/mimetype/lib#T">T</a>::getType(self : <a href="oboard/mimetype/lib#T">T</a>, pathOrExtension : String) -> String?
  ```
  > 
- #### new
  ```moonbit
  :::source,oboard/mimetype/lib/main.mbt,7:::fn <a href="oboard/mimetype/lib#T">T</a>::new() -> <a href="oboard/mimetype/lib#T">T</a>
  ```
  > 

## types

```moonbit
:::source,oboard/mimetype/lib/types.mbt,1:::let types : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/core/array#Array">Array</a>[String]]
```

