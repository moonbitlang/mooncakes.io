# Documentation
|Value|description|
|---|---|
|[i32\_atomic\_rmw\_cmpxchg](#i32_atomic_rmw_cmpxchg)||
|[i32\_atomic\_store](#i32_atomic_store)||
|[memory\_atomic\_notify](#memory_atomic_notify)||
|[memory\_atomic\_wait32](#memory_atomic_wait32)||

## i32\_atomic\_rmw\_cmpxchg

```moonbit
:::source,tonyfettes/atomics/atomics.wasm-gc.mbt,10:::fn i32_atomic_rmw_cmpxchg(addr : Int, expected : Int, replacement : Int) -> Int
```


## i32\_atomic\_store

```moonbit
:::source,tonyfettes/atomics/atomics.wasm-gc.mbt,22:::fn i32_atomic_store(addr : Int, value : Int) -> Unit
```


## memory\_atomic\_notify

```moonbit
:::source,tonyfettes/atomics/atomics.wasm-gc.mbt,29:::fn memory_atomic_notify(addr : Int, count : Int) -> Int
```


## memory\_atomic\_wait32

```moonbit
:::source,tonyfettes/atomics/atomics.wasm-gc.mbt,2:::fn memory_atomic_wait32(addr : Int, expected : Int, timeout : Int64) -> Int
```

