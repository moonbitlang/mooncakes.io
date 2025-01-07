WASI Wall Clock is a clock API intended to let users query the current
time. The name "wall" makes an analogy to a "clock on the wall", which
is not necessarily monotonic as it may be reset.

It is intended to be portable at least between Unix-family platforms and
Windows.

A wall clock is a clock which measures the date and time according to
some external reference.

External references may be reset, so this clock is not necessarily
monotonic, making it unsuitable for measuring elapsed time.

It is intended for reporting the current date and time for humans.
---
# Documentation
|Type|description|
|---|---|
|[Datetime](#Datetime)| A time and date in seconds plus nanoseconds.|

|Value|description|
|---|---|
|[now](#now)| Read the current value of the clock.|
|[resolution](#resolution)| Query the resolution of the clock.|

## Datetime

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,3:::pub(all) struct Datetime {
  seconds : UInt64
  nanoseconds : UInt
}
```
 A time and date in seconds plus nanoseconds.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,6:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a> with op_equal(<a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>, <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,6:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a> with output(<a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,6:::fn <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>::op_equal(<a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>, <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,6:::fn <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>::output(<a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/traits.mbt,85:::fn <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## now

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,21:::fn now() -> <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>
```
 Read the current value of the clock.

 This clock is not monotonic, therefore calling this function repeatedly
will not necessarily produce a sequence of non-decreasing values.

 The returned timestamps represent the number of seconds since
1970-01-01T00:00:00Z, also known as [POSIX's Seconds Since the Epoch],
also known as [Unix Time].

 The nanoseconds field of the output is always less than 1000000000.

 [POSIX's Seconds Since the Epoch]: https://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xbd_chap04.html#tag_21_04_16
 [Unix Time]: https://en.wikipedia.org/wiki/Unix_time

## resolution

```moonbit
:::source,yamajik/wasi-bindings/interface/wasi/clocks/wallClock/top.mbt,34:::fn resolution() -> <a href="yamajik/wasi-bindings/interface/wasi/clocks/wallClock#Datetime">Datetime</a>
```
 Query the resolution of the clock.

 The nanoseconds field of the output is always less than 1000000000.
