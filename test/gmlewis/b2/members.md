# gmlewis/b2
[![check](https://github.com/gmlewis/moonbit-b2/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-b2/actions/workflows/check.yml)

This is a simple b2 client used to retrieve objects from Backblaze B2
via its Native API.

## Status

The code has been updated to support compiler:

```bash
$ moon version --all
moon 0.1.20241219 (e628c26 2024-12-19) ~/.moon/bin/moon
moonc v0.1.20241223+62b9a1a85 ~/.moon/bin/moonc
moonrun 0.1.20241219 (e628c26 2024-12-19) ~/.moon/bin/moonrun
```

Use `moonup` to manage `moon` compiler versions:
https://github.com/chawyehsu/moonup

---
# Documentation
|Type|description|
|---|---|
|[APIInfo](#APIInfo)| \`APIInfo\` represents Backblaze B2 Native API info.|
|[Client](#Client)| \`Client\` represents an authorized b2 client.|
|[ClientError](#ClientError)||
|[StorageAPI](#StorageAPI)| \`StorageAPI\` represents Backblaze B2 Native Storage API info.|

## APIInfo

```moonbit
:::source,gmlewis/b2/api-info.mbt,3:::type APIInfo
```
 `APIInfo` represents Backblaze B2 Native API info.
It is a data structure that groups the information you need by API suite.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/b2/api-info.mbt,7:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/b2#APIInfo">APIInfo</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/b2/api-info.mbt,7:::fn output(<a href="gmlewis/b2#APIInfo">APIInfo</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Client

```moonbit
:::source,gmlewis/b2/client.mbt,2:::type Client
```
 `Client` represents an authorized b2 client.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/b2/client.mbt,15:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/b2#Client">Client</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/b2/client.mbt,15:::fn output(<a href="gmlewis/b2#Client">Client</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### consume\_object
  ```moonbit
  :::source,gmlewis/b2/consume-object.mbt,3:::fn <a href="gmlewis/b2#Client">Client</a>::consume_object(self : <a href="gmlewis/b2#Client">Client</a>, filename : String, hash~ : <a href="gmlewis/spin-moonbit-sdk/common#HashFunc">@gmlewis/spin-moonbit-sdk/common.HashFunc</a>?, debug~ : Bool = ..) -> String!<a href="gmlewis/b2#ClientError">ClientError</a>
  ```
  >  `consume_object` performs a GET to retrieve the b2 object, consumes it
  > and optionally returns the object's hash using the provided HashFunc.
- #### get\_download\_authorization\_url
  ```moonbit
  :::source,gmlewis/b2/get-download-authorization-url.mbt,5:::fn <a href="gmlewis/b2#Client">Client</a>::get_download_authorization_url(self : <a href="gmlewis/b2#Client">Client</a>, file_name_prefix : String, valid_duration_in_seconds~ : Int = .., debug~ : Bool = ..) -> String!<a href="gmlewis/b2#ClientError">ClientError</a>
  ```
  >  `get_download_authorization_url` returns a URL that can be used in an
  > https GET call to download any files in a bucket with the given `file_name_prefix`.
  > Note that if `file_name_prefix` needs to be escaped for suitability within a query parameter,
  > you must do that first before calling this function.
- #### new
  ```moonbit
  :::source,gmlewis/b2/b2.mbt,9:::fn <a href="gmlewis/b2#Client">Client</a>::new(key_id : String, key_secret : String, bucket_id : String, bucket_name : String, debug~ : Bool = ..) -> <a href="gmlewis/b2#Client">Client</a>!<a href="gmlewis/b2#ClientError">ClientError</a>
  ```
  >  `Client::new` returns a new client to communicate with the b2 (Backblaze) API
  > for the provided `bucket_id` and `bucket_name`.
- #### stream\_object
  ```moonbit
  :::source,gmlewis/b2/stream-object.mbt,4:::fn <a href="gmlewis/b2#Client">Client</a>::stream_object(self : <a href="gmlewis/b2#Client">Client</a>, filename : String, response_out : <a href="gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types#ResponseOutparam">@gmlewis/spin-moonbit-sdk/interface/imports/wasi/http/types.ResponseOutparam</a>, hash~ : <a href="gmlewis/spin-moonbit-sdk/common#HashFunc">@gmlewis/spin-moonbit-sdk/common.HashFunc</a>?, debug~ : Bool = ..) -> String!<a href="gmlewis/b2#ClientError">ClientError</a>
  ```
  >  `stream_object` performs a GET to retrieve the b2 object, streams it to
  > its https `response_out`, and optionally returns the object's hash using the
  > provided HashFunc.

## ClientError

```moonbit
:::source,gmlewis/b2/b2.mbt,5:::pub(all) type! ClientError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/b2/b2.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/b2#ClientError">ClientError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/b2/b2.mbt,5:::fn output(<a href="gmlewis/b2#ClientError">ClientError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## StorageAPI

```moonbit
:::source,gmlewis/b2/api-info.mbt,21:::type StorageAPI
```
 `StorageAPI` represents Backblaze B2 Native Storage API info.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/b2/api-info.mbt,81:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/b2#StorageAPI">StorageAPI</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/b2/api-info.mbt,81:::fn output(<a href="gmlewis/b2#StorageAPI">StorageAPI</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
