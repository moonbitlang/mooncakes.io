WASI filesystem is a filesystem API primarily intended to let users run WASI
programs that access their files on their existing filesystems, without
significant overhead.

It is intended to be roughly portable between Unix-family platforms and
Windows, though it does not hide many of the major differences.

Paths are passed as interface-type `string`s, meaning they must consist of
a sequence of Unicode Scalar Values (USVs). Some filesystems may contain
paths which are not accessible by this API.

The directory separator in WASI is always the forward-slash (`/`).

All paths in WASI are relative paths, and are interpreted relative to a
`descriptor` referring to a base directory. If a `path` argument to any WASI
function starts with `/`, or if any step of resolving a `path`, including
`..` and symbolic link steps, reaches a directory outside of the base
directory, or reaches a symlink to an absolute or rooted path in the
underlying filesystem, the function fails with `error-code::not-permitted`.

For more information about WASI path resolution and sandboxing, see
[WASI filesystem path resolution].

[WASI filesystem path resolution]: https://github.com/WebAssembly/wasi-filesystem/blob/main/path-resolution.md
---
# Documentation
|Type|description|
|---|---|
|[Advice](#Advice)| File or memory access pattern advisory information.|
|[Descriptor](#Descriptor)| A descriptor is a reference to a filesystem object, which may be a file,|
|[DescriptorFlags](#DescriptorFlags)| Descriptor flags.|
|[DescriptorFlagsFlag](#DescriptorFlagsFlag)||
|[DescriptorStat](#DescriptorStat)| File attributes.|
|[DescriptorType](#DescriptorType)| The type of a filesystem object referenced by a descriptor.|
|[DirectoryEntry](#DirectoryEntry)| A directory entry.|
|[DirectoryEntryStream](#DirectoryEntryStream)| A stream of directory entries.|
|[ErrorCode](#ErrorCode)| Error codes returned by functions, similar to \`errno\` in POSIX.|
|[MetadataHashValue](#MetadataHashValue)| A 128-bit hash value, split into parts because wasm doesn't have a|
|[NewTimestamp](#NewTimestamp)| When setting a timestamp, this gives the value to set it to.|
|[OpenFlags](#OpenFlags)| Open flags used by \`open-at\`.|
|[OpenFlagsFlag](#OpenFlagsFlag)||
|[PathFlags](#PathFlags)| Flags determining the method of how paths are resolved.|
|[PathFlagsFlag](#PathFlagsFlag)||

|Value|description|
|---|---|
|[filesystem\_error\_code](#filesystem_error_code)| Attempts to extract a filesystem-related \`error-code\` from the stream|

## Advice

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,335:::pub(all) enum Advice {
  NORMAL
  SEQUENTIAL
  RANDOM
  WILL_NEED
  DONT_NEED
  NO_REUSE
}
```
 File or memory access pattern advisory information.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,342:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,342:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,342:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,342:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,357:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>::from(self : Int) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,345:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>::ordinal(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>) -> Int
  ```
  > 

## Descriptor

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,379:::pub(all) type Descriptor Int
```
 A descriptor is a reference to a filesystem object, which may be a file,
directory, named pipe, special file, or other object on which filesystem
calls may be made.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,379:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,379:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,379:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,379:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### advise
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,484:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::advise(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, offset : UInt64, length : UInt64, advice : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Advice">Advice</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Provide file advisory information on a descriptor.
  > 
  >  This is similar to `posix_fadvise` in POSIX.
- #### append\_via\_stream
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,464:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::append_via_stream(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/streams#OutputStream">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/streams.OutputStream</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return a stream for appending to a file, if available.
  > 
  >  May fail with an error-code describing why the file cannot be appended.
  > 
  >  Note: This allows using `write-stream`, which is similar to `write` with
  > `O_APPEND` in in POSIX.
- #### create\_directory\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,758:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::create_directory_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Create a directory.
  > 
  >  Note: This is similar to `mkdirat` in POSIX.
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,385:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> Unit
  ```
  > 
- #### get\_flags
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,531:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::get_flags(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Get flags associated with a descriptor.
  > 
  >  Note: This returns similar flags to `fcntl(fd, F_GETFL)` in POSIX.
  > 
  >  Note: This returns the value that was the `fs_flags` value returned
  > from `fdstat_get` in earlier versions of WASI.
- #### get\_type
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,555:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::get_type(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Get the dynamic type of a descriptor.
  > 
  >  Note: This returns the same value as the `type` field of the `fd-stat`
  > returned by `stat`, `stat-at` and similar.
  > 
  >  Note: This returns similar flags to the `st_mode & S_IFMT` value provided
  > by `fstat` in POSIX.
  > 
  >  Note: This returns the value that was the `fs_filetype` value returned
  > from `fdstat_get` in earlier versions of WASI.
- #### is\_same\_object
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1190:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::is_same_object(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> Bool
  ```
  >  Test whether two descriptors refer to the same filesystem object.
  > 
  >  In POSIX, this corresponds to testing whether the two descriptors have the
  > same device (`st_dev`) and inode (`st_ino` or `d_ino`) numbers.
  > wasi-filesystem does not expose device and inode numbers, so this function
  > may be used instead.
- #### link\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,968:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::link_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, old_path_flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, old_path : String, new_descriptor : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, new_path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Create a hard link.
  > 
  >  Note: This is similar to `linkat` in POSIX.
- #### metadata\_hash
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1217:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::metadata_hash(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return a hash of the metadata associated with a filesystem object referred
  > to by a descriptor.
  > 
  >  This returns a hash of the last-modification timestamp and file size, and
  > may also include the inode number, device number, birth timestamp, and
  > other metadata fields that may change when the file is modified or
  > replaced. It may also include a secret value chosen by the
  > implementation and not otherwise exposed.
  > 
  >  Implementations are encourated to provide the following properties:
  > 
  >  - If the file is not modified or replaced, the computed hash value should
  >    usually not change.
  >  - If the object is modified or replaced, the computed hash value should
  >    usually change.
  >  - The inputs to the hash should not be easily computable from the
  >    computed hash.
  > 
  >  However, none of these is required.
- #### metadata\_hash\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1239:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::metadata_hash_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path_flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return a hash of the metadata associated with a filesystem object referred
  > to by a directory descriptor and a relative path.
  > 
  >  This performs the same hash computation as `metadata-hash`.
- #### open\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1015:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::open_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path_flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, path : String, open_flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>, flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Open a file or directory.
  > 
  >  The returned descriptor is not guaranteed to be the lowest-numbered
  > descriptor not currently open/ it is randomized to prevent applications
  > from depending on making assumptions about indexes, since this is
  > error-prone in multi-threaded contexts. The returned descriptor is
  > guaranteed to be less than 2\*\*31.
  > 
  >  If `flags` contains `descriptor-flags::mutate-directory`, and the base
  > descriptor doesn't have `descriptor-flags::mutate-directory` set,
  > `open-at` fails with `error-code::read-only`.
  > 
  >  If `flags` contains `write` or `mutate-directory`, or `open-flags`
  > contains `truncate` or `create`, and the base descriptor doesn't have
  > `descriptor-flags::mutate-directory` set, `open-at` fails with
  > `error-code::read-only`.
  > 
  >  Note: This is similar to `openat` in POSIX.
- #### read
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,655:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::read(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, length : UInt64, offset : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[(Bytes, Bool), <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Read from a descriptor, without using and updating the descriptor's offset.
  > 
  >  This function returns a list of bytes containing the data that was
  > read, along with a bool which, when true, indicates that the end of the
  > file was reached. The returned list will contain up to `length` bytes; it
  > may return fewer than requested, if the end of the file is reached or
  > if the I/O operation is interrupted.
  > 
  >  In the future, this may change to return a `stream<u8, error-code>`.
  > 
  >  Note: This is similar to `pread` in POSIX.
- #### read\_directory
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,720:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::read_directory(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Read directory entries from a directory.
  > 
  >  On filesystems where directories contain entries referring to themselves
  > and their parents, often named `.` and `..` respectively, these entries
  > are omitted.
  > 
  >  This always returns a new stream which starts at the beginning of the
  > directory. Multiple streams may be active on the same directory, and they
  > do not interfere with each other.
- #### read\_via\_stream
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,408:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::read_via_stream(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, offset : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/streams#InputStream">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/streams.InputStream</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return a stream for reading from a file, if available.
  > 
  >  May fail with an error-code describing why the file cannot be read.
  > 
  >  Multiple read, write, and append streams may be active on the same open
  > file and they do not interfere with each other.
  > 
  >  Note: This allows using `read-stream`, which is similar to `read` in POSIX.
- #### readlink\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1048:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::readlink_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[String, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Read the contents of a symbolic link.
  > 
  >  If the contents contain an absolute or rooted path in the underlying
  > filesystem, this function fails with `error-code::not-permitted`.
  > 
  >  Note: This is similar to `readlinkat` in POSIX.
- #### remove\_directory\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1077:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::remove_directory_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Remove a directory.
  > 
  >  Return `error-code::not-empty` if the directory is not empty.
  > 
  >  Note: This is similar to `unlinkat(fd, path, AT_REMOVEDIR)` in POSIX.
- #### rename\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1101:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::rename_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, old_path : String, new_descriptor : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, new_path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Rename a filesystem object.
  > 
  >  Note: This is similar to `renameat` in POSIX.
- #### set\_size
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,573:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::set_size(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, size : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Adjust the size of an open file. If this increases the file's size, the
  > extra bytes are filled with zeros.
  > 
  >  Note: This was called `fd_filestat_set_size` in earlier versions of WASI.
- #### set\_times
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,597:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::set_times(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, data_access_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>, data_modification_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Adjust the timestamps of an open file or directory.
  > 
  >  Note: This is similar to `futimens` in POSIX.
  > 
  >  Note: This was called `fd_filestat_set_times` in earlier versions of WASI.
- #### set\_times\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,912:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::set_times_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path_flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, path : String, data_access_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>, data_modification_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Adjust the timestamps of a file or directory.
  > 
  >  Note: This is similar to `utimensat` in POSIX.
  > 
  >  Note: This was called `path_filestat_set_times` in earlier versions of
  > WASI.
- #### stat
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,788:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::stat(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return the attributes of an open file or directory.
  > 
  >  Note: This is similar to `fstat` in POSIX, except that it does not return
  > device and inode information. For testing whether two descriptors refer to
  > the same underlying filesystem object, use `is-same-object`. To obtain
  > additional data that can be used do determine whether a file has been
  > modified, use `metadata-hash`.
  > 
  >  Note: This was called `fd_filestat_get` in earlier versions of WASI.
- #### stat\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,845:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::stat_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path_flags : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return the attributes of a file or directory.
  > 
  >  Note: This is similar to `fstatat` in POSIX, except that it does not
  > return device and inode information. See the `stat` description for a
  > discussion of alternatives.
  > 
  >  Note: This was called `path_filestat_get` in earlier versions of WASI.
- #### symlink\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1134:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::symlink_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, old_path : String, new_path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Create a symbolic link (also known as a "symlink").
  > 
  >  If `old-path` starts with `/`, the function fails with
  > `error-code::not-permitted`.
  > 
  >  Note: This is similar to `symlinkat` in POSIX.
- #### sync
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,743:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::sync(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Synchronize the data and metadata of a file to disk.
  > 
  >  This function succeeds with no effect if the file descriptor is not
  > opened for writing.
  > 
  >  Note: This is similar to `fsync` in POSIX.
- #### sync\_data
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,513:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::sync_data(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Synchronize the data of a file to disk.
  > 
  >  This function succeeds with no effect if the file descriptor is not
  > opened for writing.
  > 
  >  Note: This is similar to `fdatasync` in POSIX.
- #### unlink\_file\_at
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1163:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::unlink_file_at(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, path : String) -> <a href="moonbitlang/core/result#Result">Result</a>[Unit, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Unlink a filesystem object that is not a directory.
  > 
  >  Return `error-code::is-directory` if the path refers to a directory.
  > Note: This is similar to `unlinkat(fd, path, 0)` in POSIX.
- #### write
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,688:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::write(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, buffer : Bytes, offset : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[UInt64, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Write to a descriptor, without using and updating the descriptor's offset.
  > 
  >  It is valid to write past the end of a file; the file is extended to the
  > extent of the write, with bytes between the previous end and the start of
  > the write set to zero.
  > 
  >  In the future, this may change to take a `stream<u8, error-code>`.
  > 
  >  Note: This is similar to `pwrite` in POSIX.
- #### write\_via\_stream
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,436:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>::write_via_stream(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#Descriptor">Descriptor</a>, offset : UInt64) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/streams#OutputStream">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/streams.OutputStream</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Return a stream for writing to a file, if available.
  > 
  >  May fail with an error-code describing why the file cannot be written.
  > 
  >  Note: This allows using `write-stream`, which is similar to `write` in
  > POSIX.

## DescriptorFlags

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,49:::pub(all) type DescriptorFlags Byte
```
 Descriptor flags.

 Note: This was called `fdflags` in earlier versions of WASI.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,49:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,49:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,49:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,49:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,52:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>::default() -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>
  ```
  > 
- #### is\_set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,95:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>::is_set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlagsFlag">DescriptorFlagsFlag</a>) -> Bool
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,79:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>::set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlagsFlag">DescriptorFlagsFlag</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>
  ```
  > 
- #### unset
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,87:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>::unset(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlagsFlag">DescriptorFlagsFlag</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorFlags">DescriptorFlags</a>
  ```
  > 

## DescriptorFlagsFlag

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,57:::pub(all) enum DescriptorFlagsFlag {
  READ
  WRITE
  FILE_INTEGRITY_SYNC
  DATA_INTEGRITY_SYNC
  REQUESTED_WRITE_SYNC
  MUTATE_DIRECTORY
}
```


## DescriptorStat

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,181:::pub(all) struct DescriptorStat {
  type_ : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>
  link_count : UInt64
  size : UInt64
  data_access_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock#Datetime">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock.Datetime</a>?
  data_modification_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock#Datetime">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock.Datetime</a>?
  status_change_timestamp : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock#Datetime">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock.Datetime</a>?
}
```
 File attributes.

 Note: This was called `filestat` in earlier versions of WASI.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,188:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,188:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,188:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,188:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorStat">DescriptorStat</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## DescriptorType

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,6:::pub(all) enum DescriptorType {
  UNKNOWN
  BLOCK_DEVICE
  CHARACTER_DEVICE
  DIRECTORY
  FIFO
  SYMBOLIC_LINK
  REGULAR_FILE
  SOCKET
}
```
 The type of a filesystem object referenced by a descriptor.

 Note: This was called `filetype` in earlier versions of WASI.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,15:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,15:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,15:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,15:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,32:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>::from(self : Int) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,18:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>::ordinal(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>) -> Int
  ```
  > 

## DirectoryEntry

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,198:::pub(all) struct DirectoryEntry {
  type_ : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DescriptorType">DescriptorType</a>
  name : String
}
```
 A directory entry.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,201:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntry">DirectoryEntry</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,201:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntry">DirectoryEntry</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntry">DirectoryEntry</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,201:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntry">DirectoryEntry</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,201:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntry">DirectoryEntry</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## DirectoryEntryStream

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,390:::pub(all) type DirectoryEntryStream Int
```
 A stream of directory entries.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,390:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,390:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,390:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,390:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### drop
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,396:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>::drop(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>) -> Unit
  ```
  > 
- #### read\_directory\_entry
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1267:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>::read_directory_entry(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntryStream">DirectoryEntryStream</a>) -> <a href="moonbitlang/core/result#Result">Result</a>[<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#DirectoryEntry">DirectoryEntry</a>?, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>]
  ```
  >  Read a single directory entry from a `directory-entry-stream`.

## ErrorCode

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,207:::pub(all) enum ErrorCode {
  ACCESS
  WOULD_BLOCK
  ALREADY
  BAD_DESCRIPTOR
  BUSY
  DEADLOCK
  QUOTA
  EXIST
  FILE_TOO_LARGE
  ILLEGAL_BYTE_SEQUENCE
  IN_PROGRESS
  INTERRUPTED
  INVALID
  IO
  IS_DIRECTORY
  LOOP
  TOO_MANY_LINKS
  MESSAGE_SIZE
  NAME_TOO_LONG
  NO_DEVICE
  NO_ENTRY
  NO_LOCK
  INSUFFICIENT_MEMORY
  INSUFFICIENT_SPACE
  NOT_DIRECTORY
  NOT_EMPTY
  NOT_RECOVERABLE
  UNSUPPORTED
  NO_TTY
  NO_SUCH_DEVICE
  OVERFLOW
  NOT_PERMITTED
  PIPE
  READ_ONLY
  INVALID_SEEK
  TEXT_FILE_BUSY
  CROSS_DEVICE
}
```
 Error codes returned by functions, similar to `errno` in POSIX.
Not all of these error codes are returned by the functions provided by this
API; some are used in higher-level library layers, and others are provided
merely for alignment with POSIX.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,245:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,245:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,245:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,245:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,291:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>::from(self : Int) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,248:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>::ordinal(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>) -> Int
  ```
  > 

## MetadataHashValue

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,371:::pub(all) struct MetadataHashValue {
  lower : UInt64
  upper : UInt64
}
```
 A 128-bit hash value, split into parts because wasm doesn't have a
128-bit integer type.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,374:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,374:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,374:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,374:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#MetadataHashValue">MetadataHashValue</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## NewTimestamp

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,191:::pub(all) enum NewTimestamp {
  NoChange
  Now
  Timestamp(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock#Datetime">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/clocks/wallClock.Datetime</a>)
}
```
 When setting a timestamp, this gives the value to set it to.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,195:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,195:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,195:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,195:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#NewTimestamp">NewTimestamp</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## OpenFlags

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,138:::pub(all) type OpenFlags Byte
```
 Open flags used by `open-at`.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,138:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,138:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,138:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,138:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,141:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>::default() -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>
  ```
  > 
- #### is\_set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,174:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>::is_set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlagsFlag">OpenFlagsFlag</a>) -> Bool
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,164:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>::set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlagsFlag">OpenFlagsFlag</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>
  ```
  > 
- #### unset
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,169:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>::unset(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlagsFlag">OpenFlagsFlag</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#OpenFlags">OpenFlags</a>
  ```
  > 

## OpenFlagsFlag

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,146:::pub(all) enum OpenFlagsFlag {
  CREATE
  DIRECTORY
  EXCLUSIVE
  TRUNCATE
}
```


## PathFlags

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,103:::pub(all) type PathFlags Byte
```
 Flags determining the method of how paths are resolved.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,103:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,103:::fn op_equal(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,103:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,103:::fn output(<a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### default
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,106:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>::default() -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>
  ```
  > 
- #### is\_set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,133:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>::is_set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlagsFlag">PathFlagsFlag</a>) -> Bool
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,123:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>::set(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlagsFlag">PathFlagsFlag</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>
  ```
  > 
- #### unset
  ```moonbit
  :::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,128:::fn <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>::unset(self : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>, other : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlagsFlag">PathFlagsFlag</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#PathFlags">PathFlags</a>
  ```
  > 

## PathFlagsFlag

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,111:::pub(all) enum PathFlagsFlag {
  SYMLINK_FOLLOW
}
```


## filesystem\_error\_code

```moonbit
:::source,gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types/top.mbt,1304:::fn filesystem_error_code(err : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error#Error_">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/io/error.Error_</a>) -> <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/filesystem/types#ErrorCode">ErrorCode</a>?
```
 Attempts to extract a filesystem-related `error-code` from the stream
`error` provided.

 Stream operations which return `stream-error::last-operation-failed`
have a payload with more information about the operation that failed.
This payload can be passed through to this function to see if there's
filesystem-related information about the error to return.

 Note that this function is fallible because not all stream-related
errors are filesystem-related errors.
