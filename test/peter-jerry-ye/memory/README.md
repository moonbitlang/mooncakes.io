# 简陋内存管理 Naive Memory Allocator 

超级简陋的链表实现。仅限Wasm-gc后端。
内存管理将管理整块线性内存。自动增长内存。

Super naive implementation with linkedlist. Wasm-GC Only.
Allocator will take control over the whole linear memory. Memory will grow automatically.

## 使用 Usage

- `allocate(size: Int) -> Option[Memory]`
- `memory.reallocate(_alignment: Int, new_size: Int) -> Option[Memory]`
- `memory.free() -> Option[Unit]`