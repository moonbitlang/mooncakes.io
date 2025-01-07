A poll API intended to let users wait for I/O events on multiple handles
at once.
---
# Documentation
|Type|description|
|---|---|
|[Pollable](#Pollable)| \`pollable\` represents a single I/O event which may be ready, or not.|

|Value|description|
|---|---|
|[poll](#poll)| Poll for completion on a set of pollables.|

## Pollable

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,3:::pub(all) type Pollable Int
```
 `pollable` represents a single I/O event which may be ready, or not.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>, <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,3:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### block
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,25:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>::block(self : <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>) -> Unit
  ```
  >  `block` returns immediately if the pollable is ready, and otherwise
  > blocks until ready.
  > 
  >  This function is equivalent to calling `poll.poll` on a list
  > containing only this pollable.
- #### drop
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,6:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>::drop(self : <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>) -> Unit
  ```
  >  Drops a resource handle.
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,3:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>, <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,3:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### ready
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,14:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>::ready(self : <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>) -> Bool
  ```
  >  Return the readiness of a pollable. This function never blocks.
  > 
  >  Returns `true` when the pollable is ready, and `false` otherwise.
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/io/poll/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## poll

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/io/poll/top.mbt,48:::fn poll(in_ : <a href="moonbitlang/core/array#Array">Array</a>[<a href="yamajik/wasi-bindings/interface/wasi/io/poll#Pollable">Pollable</a>]) -> <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[UInt]
```
 Poll for completion on a set of pollables.

 This function takes a list of pollables, which identify I/O sources of
interest, and waits until one or more of the events is ready for I/O.

 The result `list<u32>` contains one or more indices of handles in the
argument list that is ready for I/O.

 If the list contains more elements than can be indexed with a `u32`
value, this function traps.

 A timeout can be implemented by adding a pollable from the
wasi-clocks API to the list.

 This function does not return a `result`; polling in itself does not
do any I/O so it doesn't fail. If any of the I/O sources identified by
the pollables has an error, it is indicated by marking the source as
being reaedy for I/O.
