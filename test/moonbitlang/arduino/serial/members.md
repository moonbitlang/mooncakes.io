# Documentation
|Trait|description|
|---|---|
|[SerialPrintable](#SerialPrintable)||

|Type|description|
|---|---|
|[Serial](#Serial)||

|Value|description|
|---|---|
|[serial\_parse\_int](#serial_parse_int)||
|[serial\_peek](#serial_peek)||
|[serial\_read](#serial_read)||
|[serial\_read\_to\_buffer](#serial_read_to_buffer)||

## SerialPrintable

```moonbit
:::source,moonbitlang/arduino/serial/serial.mbt,55:::pub(open) trait SerialPrintable {
  serial_print(Self) -> Unit
  serial_println(Self) -> Unit
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,115:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/double#Double">Double</a> with serial_print(self : Double) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,95:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/int#Int">Int</a> with serial_print(self : Int) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,105:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with serial_print(self : Int64) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,85:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/char#Char">Char</a> with serial_print(self : Char) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,100:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/int#Int">Int</a> with serial_println(self : Int) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,120:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/double#Double">Double</a> with serial_println(self : Double) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,110:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/int64#Int64">Int64</a> with serial_println(self : Int64) -> Unit
  ```
  > 
- ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,90:::impl <a href="moonbitlang/arduino/serial#SerialPrintable">SerialPrintable</a> for <a href="moonbitlang/core/char#Char">Char</a> with serial_println(self : Char) -> Unit
  ```
  > 

## Serial

```moonbit
:::source,moonbitlang/arduino/serial/serial.mbt,20:::pub(all) type Serial
```


#### mooncakes-io-method-mark-Methods
- #### available
  ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,50:::fn <a href="moonbitlang/arduino/serial#Serial">Serial</a>::available() -> Int
  ```
  > 
- #### begin
  ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,35:::fn <a href="moonbitlang/arduino/serial#Serial">Serial</a>::begin(baud : Int64) -> Unit
  ```
  > 
- #### end
  ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,40:::fn <a href="moonbitlang/arduino/serial#Serial">Serial</a>::end() -> Unit
  ```
  > 
- #### is\_ok
  ```moonbit
  :::source,moonbitlang/arduino/serial/serial.mbt,45:::fn <a href="moonbitlang/arduino/serial#Serial">Serial</a>::is_ok() -> Bool
  ```
  > 

## serial\_parse\_int

```moonbit
:::source,moonbitlang/arduino/serial/serial.mbt,128:::fn serial_parse_int() -> Int
```


## serial\_peek

```moonbit
:::source,moonbitlang/arduino/serial/serial.mbt,136:::fn serial_peek() -> Int
```


## serial\_read

```moonbit
:::source,moonbitlang/arduino/serial/serial.mbt,144:::fn serial_read() -> Char?
```


## serial\_read\_to\_buffer

```moonbit
:::source,moonbitlang/arduino/serial/serial.mbt,155:::fn serial_read_to_buffer(buf : <a href="moonbitlang/core/buffer#T">@moonbitlang/core/buffer.T</a>, size : Int) -> Int
```

