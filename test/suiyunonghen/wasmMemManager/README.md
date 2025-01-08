# wasm的线性内存管理
简单用法
```
  let mem1 = @wasmMemManager.getMemory(48)
  let mem2 = @wasmMemManager.getMemory(12)
  let mem3 = @wasmMemManager.getMemory(30)
  @wasmMemManager.freeMemory(mem1)
  @wasmMemManager.freeMemory(mem3)
  println(mem2)
  mem2.writeString(3,"不得闲")
  let mem2 = @wasmMemManager.realloc(mem2,48)
  println(mem2)
  println(mem2.readString(3,3))  
  @wasmMemManager.freeMemory(mem2)
```