# Documentation
|Type|description|
|---|---|
|[Decoder](#Decoder)||
|[Encoder](#Encoder)||
|[InterlaceScan](#InterlaceScan)||
|[ReaderSize](#ReaderSize)||

|Value|description|
|---|---|
|[chunk\_order\_error](#chunk_order_error)||
|[decode](#decode)||
|[decode\_config](#decode_config)||
|[encode](#encode)||
|[err\_negative\_read](#err_negative_read)||

## Decoder

```moonbit
:::source,gmlewis/image/png/reader.mbt,161:::type Decoder
```


#### mooncakes-io-method-mark-Methods
- #### read
  ```moonbit
  :::source,gmlewis/image/png/reader.mbt,457:::fn <a href="gmlewis/image/png#Decoder">Decoder</a>::read(self : <a href="gmlewis/image/png#Decoder">Decoder</a>, p : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 

## Encoder

```moonbit
:::source,gmlewis/image/png/writer.mbt,10:::type Encoder
```


#### mooncakes-io-method-mark-Methods
- #### enc
  ```moonbit
  :::source,gmlewis/image/png/writer.mbt,553:::fn <a href="gmlewis/image/png#Encoder">Encoder</a>::enc(self : <a href="gmlewis/image/png#Encoder">Encoder</a>, w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>, m : <a href="gmlewis/image#Image">@gmlewis/image.Image</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
  ```
  > 
- #### write
  ```moonbit
  :::source,gmlewis/image/png/writer.mbt,182:::fn <a href="gmlewis/image/png#Encoder">Encoder</a>::write(self : <a href="gmlewis/image/png#Encoder">Encoder</a>, b : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]) -> (Int, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
  ```
  > 

## InterlaceScan

```moonbit
:::source,gmlewis/image/png/reader.mbt,113:::type InterlaceScan
```


## ReaderSize

```moonbit
:::source,gmlewis/image/png/bufio.mbt,15:::type ReaderSize
```


## chunk\_order\_error

```moonbit
:::source,gmlewis/image/png/reader.mbt,218:::let chunk_order_error : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```


## decode

```moonbit
:::source,gmlewis/image/png/reader.mbt,1236:::fn decode(r : <a href="gmlewis/io#Reader">@gmlewis/io.Reader</a>) -> (<a href="gmlewis/image#Image">@gmlewis/image.Image</a>, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
```


## decode\_config

```moonbit
:::source,gmlewis/image/png/reader.mbt,1260:::fn decode_config(r : <a href="gmlewis/io#Reader">@gmlewis/io.Reader</a>) -> (<a href="gmlewis/image#Config">@gmlewis/image.Config</a>, <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?)
```


## encode

```moonbit
:::source,gmlewis/image/png/writer.mbt,546:::fn encode(w : <a href="gmlewis/io#Writer">@gmlewis/io.Writer</a>, m : <a href="gmlewis/image#Image">@gmlewis/image.Image</a>) -> <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>?
```


## err\_negative\_read

```moonbit
:::source,gmlewis/image/png/bufio.mbt,57:::let err_negative_read : <a href="gmlewis/io#IOError">@gmlewis/io.IOError</a>
```

