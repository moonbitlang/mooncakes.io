# Documentation
|Type|description|
|---|---|
|[IOError](#IOError)||

|Value|description|
|---|---|
|[create\_dir](#create_dir)| Creates a directory at the specified path.|
|[is\_dir](#is_dir)| Checks if the given path is a directory.|
|[is\_file](#is_file)| Check if the given path points to a file.|
|[path\_exists](#path_exists)| Checks if a path exists.|
|[read\_dir](#read_dir)| Reads the contents of a directory and returns an array of filenames.|
|[read\_file\_to\_bytes](#read_file_to_bytes)| Reads the content of a file specified by the given path and returns its|
|[read\_file\_to\_string](#read_file_to_string)| Reads the entire contents of a file into a string.|
|[remove\_dir](#remove_dir)| Removes a directory at the specified path.|
|[remove\_file](#remove_file)| Removes a file at the specified path.|
|[write\_bytes\_to\_file](#write_bytes_to_file)| Writes an array of bytes to a file at the specified path.|
|[write\_string\_to\_file](#write_string_to_file)| Writes a string to a file.|

## IOError

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,16:::pub(all) enum IOError {
  NotFound(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/fs/fs.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/fs#IOError">IOError</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/fs/fs.mbt,21:::fn output(self : <a href="moonbitlang/x/fs#IOError">IOError</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

## create\_dir

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,109:::fn create_dir(path~ : String) -> Unit
```
 Creates a directory at the specified path.
Note: nested directories are not supported for native backend

 #### Parameters

 - `path` : The path where the directory should be created.

## is\_dir

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,122:::fn is_dir(path~ : String) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
```
 Checks if the given path is a directory.

 #### Parameters

 - `path` : The string representing the path to be checked.

 #### Returns

 - `Bool` : `true` if the path is a directory, `false` otherwise.

## is\_file

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,136:::fn is_file(path~ : String) -> Bool!<a href="moonbitlang/core/error#Error">Error</a>
```
 Check if the given path points to a file.

 #### Parameters

 - `path` : The string representing the path to be checked.

 #### Returns

 - `Bool` : `true` if the path points to a file, `false` otherwise.

## path\_exists

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,58:::fn path_exists(path~ : String) -> Bool
```
 Checks if a path exists.

 #### Parameters
 - `path`: A `String` representing the file path.

 #### Returns
 A boolean indicating whether the path exists.

## read\_dir

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,98:::fn read_dir(path~ : String) -> <a href="moonbitlang/core/array#Array">Array</a>[String]!<a href="moonbitlang/core/error#Error">Error</a>
```
 Reads the contents of a directory and returns an array of filenames.

 #### Parameters

 - `path` : The path to the directory to be read.

 #### Returns

 - An array of strings representing the file name and directory name in the directory.

## read\_file\_to\_bytes

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,84:::fn read_file_to_bytes(path~ : String) -> Bytes!<a href="moonbitlang/core/error#Error">Error</a>
```
 Reads the content of a file specified by the given path and returns its
content as an array of bytes. If the file does not exist, an error is raised.

 #### Parameters

 - `path` : The path to the file to be read.

 #### Returns

 - An array of bytes representing the content of the file.

## read\_file\_to\_string

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,69:::fn read_file_to_string(path~ : String) -> String!<a href="moonbitlang/core/error#Error">Error</a>
```
 Reads the entire contents of a file into a string.

 #### Parameters
 - `path`: A `String` representing the file path.

 #### Returns
 A `String` containing the file contents if the file exists, otherwise raises an error.

## remove\_dir

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,146:::fn remove_dir(path~ : String) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```
 Removes a directory at the specified path.

 #### Parameters

 - `path` : The string path to the directory that needs to be removed.

## remove\_file

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,156:::fn remove_file(path~ : String) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
```
 Removes a file at the specified path.

 #### Parameters

 - `path` : The path to the file that needs to be removed.

## write\_bytes\_to\_file

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,47:::fn write_bytes_to_file(path~ : String, content~ : Bytes) -> Unit
```
 Writes an array of bytes to a file at the specified path.

 #### Parameters

 - `path` : The path to the file where the bytes will be written.
 - `content` : An array of bytes to be written to the file.

## write\_string\_to\_file

```moonbit
:::source,moonbitlang/x/fs/fs.mbt,37:::fn write_string_to_file(path~ : String, content~ : String) -> Unit
```
 Writes a string to a file.

 #### Parameters
 - `path`: A `String` representing the file path.
 - `content`: A `String` containing the content to be written to the file.
