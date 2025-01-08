# 简陋内存管理 Naive Memory Allocator 

超级简陋的链表实现。仅限Wasm-gc后端。
内存管理将管理整块线性内存。自动增长内存。

Super naive implementation with linkedlist. Wasm-GC Only.
Allocator will take control over the whole linear memory. Memory will grow automatically.

## 使用 Usage

- `allocate(size: Int) -> Option[Memory]`
- `memory.reallocate(_alignment: Int, new_size: Int) -> Option[Memory]`
- `memory.free() -> Option[Unit]`
---
# Documentation
|Type|description|
|---|---|
|[Memory](#Memory)| Represent memory 内存|

|Value|description|
|---|---|
|[allocate](#allocate)| Allocate memory 分配内存|

## Memory

```moonbit
:::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,16:::pub struct Memory {
  offset : Int
  length : Int
}
```
 Represent memory 内存

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="peter-jerry-ye/memory#Memory">Memory</a>
  ```
  > 
  * ```moonbit
    :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,19:::fn output(<a href="peter-jerry-ye/memory#Memory">Memory</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### free
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,317:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::free(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>) -> Unit?
  ```
  >  Free Memory 释放内存
- #### load32
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,31:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::load32(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int) -> Int?
  ```
  >  Load Int32 读取32位整数
- #### load64
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,40:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::load64(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int) -> Int64?
  ```
  >  Load Int64 读取64位整数
- #### load8
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,22:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::load8(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int) -> Int?
  ```
  >  Load Byte 读取字节
- #### load\_bytes
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,94:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::load_bytes(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>) -> Bytes
  ```
  >  Load Bytes 读取数据块
- #### loadf64
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,49:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::loadf64(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int) -> Double?
  ```
  >  Load Float64 读取64位浮点数
- #### make
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,193:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::make(offset : Int, length : Int) -> <a href="peter-jerry-ye/memory#Memory">Memory</a>?
  ```
  >  Create memory 创建内存
  > Only valid if it is actually an allocated memory that is in use
  > 当该内存确实为被分配的内存时输入合法
- #### reallocate
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,330:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::reallocate(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, _alignment : Int, new_length : Int) -> <a href="peter-jerry-ye/memory#Memory">Memory</a>?
  ```
  >  Reallocate Memory 重新分配内存
- #### store32
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,67:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::store32(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int, value : Int) -> Unit?
  ```
  >  Store Int32 存储32位整数
- #### store64
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,76:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::store64(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int, value : Int64) -> Unit?
  ```
  >  Store Int64 存储64位整数
- #### store8
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,58:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::store8(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int, value : Int) -> Unit?
  ```
  >  Store Byte 存储字节
- #### store\_bytes
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,103:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::store_bytes(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, bytes : Bytes) -> Unit
  ```
  >  Store Bytes 存储数据块
- #### storef64
  ```moonbit
  :::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,85:::fn <a href="peter-jerry-ye/memory#Memory">Memory</a>::storef64(self : <a href="peter-jerry-ye/memory#Memory">Memory</a>, offset : Int, value : Double) -> Unit?
  ```
  >  Store Float64 存储64位浮点数

## allocate

```moonbit
:::source,peter-jerry-ye/memory/memory.wasm-gc.mbt,238:::fn allocate(size : Int) -> <a href="peter-jerry-ye/memory#Memory">Memory</a>?
```
 Allocate memory 分配内存
