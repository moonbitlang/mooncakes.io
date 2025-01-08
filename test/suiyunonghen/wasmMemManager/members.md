# Documentation
|Type|description|
|---|---|
|[Memory](#Memory)||
|[MemoryStream](#MemoryStream)||
|[SeekOrigin](#SeekOrigin)||

|Value|description|
|---|---|
|[freeMemory](#freeMemory)||
|[getMemory](#getMemory)||
|[realloc](#realloc)||

## Memory

```moonbit
:::source,suiyunonghen/wasmMemManager/memory.mbt,3:::pub struct Memory {
  offset : Int
  length : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>
  ```
  > 
  * ```moonbit
    :::source,suiyunonghen/wasmMemManager/memory.mbt,6:::fn output(<a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### copyFrom
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,124:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::copyFrom(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, destPos : Int, src : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, srcPos : Int, len : Int) -> Unit
  ```
  > 
- #### copyFrom\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,145:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::copyFrom_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, destPos : Int, src : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, srcPos : Int, len : Int) -> Unit
  ```
  > 
- #### fill
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,80:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::fill(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, len : Int, fillData : Int) -> Unit
  ```
  > 
- #### fill\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,91:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::fill_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, len : Int, fillData : Int) -> Unit
  ```
  > 
- #### moveData
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,95:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::moveData(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, destPos : Int, srcPos : Int, copyLen : Int) -> Unit
  ```
  > 
- #### move\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,115:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::move_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, destPos : Int, srcPos : Int, copyLen : Int) -> Unit
  ```
  > 
- #### read16
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,68:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::read16(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int?
  ```
  > 
- #### read16\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,76:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::read16_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int
  ```
  > 
- #### read8s
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,44:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::read8s(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int?
  ```
  > 
- #### read8s\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,52:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::read8s_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int
  ```
  > 
- #### readByte
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,32:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readByte(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Byte?
  ```
  > 
- #### readByte\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,40:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readByte_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Byte
  ```
  > 
- #### readDouble
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,155:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readDouble(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Double?
  ```
  > 
- #### readDouble\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,163:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readDouble_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Double
  ```
  > 
- #### readFloat
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,179:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readFloat(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Float?
  ```
  > 
- #### readFloat\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,187:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readFloat_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Float
  ```
  > 
- #### readInt32
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,8:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readInt32(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int?
  ```
  > 
- #### readInt32\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,16:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readInt32_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int
  ```
  > 
- #### readInt64
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,167:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readInt64(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int64?
  ```
  > 
- #### readInt64\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,175:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readInt64_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int64
  ```
  > 
- #### readString
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,283:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readString(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, strLen : Int) -> String
  ```
  > 
- #### readU16
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,56:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readU16(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int?
  ```
  > 
- #### readU16\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,64:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readU16_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> Int
  ```
  > 
- #### readUInt32
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,20:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readUInt32(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> UInt?
  ```
  > 
- #### readUInt32\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,28:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::readUInt32_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int) -> UInt
  ```
  > 
- #### writeByte
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,256:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeByte(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int) -> Bool
  ```
  > 
- #### writeByte\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,265:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeByte_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int) -> Unit
  ```
  > 
- #### writeDouble
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,230:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeDouble(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Double) -> Bool
  ```
  > 
- #### writeDouble\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,239:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeDouble_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Double) -> Unit
  ```
  > 
- #### writeFloat
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,204:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeFloat(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Float) -> Bool
  ```
  > 
- #### writeFloat\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,213:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeFloat_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Float) -> Unit
  ```
  > 
- #### writeInt
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,191:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeInt(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int) -> Bool
  ```
  > 
- #### writeInt64
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,217:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeInt64(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int64) -> Bool
  ```
  > 
- #### writeInt64\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,226:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeInt64_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int64) -> Unit
  ```
  > 
- #### writeInt\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,200:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeInt_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int) -> Unit
  ```
  > 
- #### writeString
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,269:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeString(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : String) -> Unit
  ```
  > 
- #### writeU16
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,243:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeU16(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int) -> Bool
  ```
  > 
- #### writeU16\_unsafe
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memory.mbt,252:::fn <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>::writeU16_unsafe(self : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, pos : Int, value : Int) -> Unit
  ```
  > 

## MemoryStream

```moonbit
:::source,suiyunonghen/wasmMemManager/memorystream.mbt,1:::type MemoryStream
```


#### mooncakes-io-method-mark-Methods
- #### free
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memorystream.mbt,19:::fn <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>::free(self : <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memorystream.mbt,9:::fn <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>::new() -> <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>
  ```
  > 
- #### position
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memorystream.mbt,218:::fn <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>::position(self : <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>) -> Int
  ```
  > 
- #### seek
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memorystream.mbt,118:::fn <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>::seek(self : <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>, pos : Int, origin : <a href="suiyunonghen/wasmMemManager#SeekOrigin">SeekOrigin</a>) -> Unit
  ```
  > 
- #### setPosition
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memorystream.mbt,114:::fn <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>::setPosition(self : <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>, pos : Int) -> Unit
  ```
  > 
- #### setSize
  ```moonbit
  :::source,suiyunonghen/wasmMemManager/memorystream.mbt,35:::fn <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>::setSize(self : <a href="suiyunonghen/wasmMemManager#MemoryStream">MemoryStream</a>, size : Int) -> Unit
  ```
  > 

## SeekOrigin

```moonbit
:::source,suiyunonghen/wasmMemManager/memorystream.mbt,29:::pub(all) enum SeekOrigin {
  SoBeginning
  SoCurrent
  SoEnd
}
```


## freeMemory

```moonbit
:::source,suiyunonghen/wasmMemManager/memory.mbt,447:::fn freeMemory(mem : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>) -> Unit
```


## getMemory

```moonbit
:::source,suiyunonghen/wasmMemManager/memory.mbt,368:::fn getMemory(size : Int) -> <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>
```


## realloc

```moonbit
:::source,suiyunonghen/wasmMemManager/memory.mbt,523:::fn realloc(mem : <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>, newSize : Int) -> <a href="suiyunonghen/wasmMemManager#Memory">Memory</a>
```

