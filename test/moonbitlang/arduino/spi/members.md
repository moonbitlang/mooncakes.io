# Documentation
|Type|description|
|---|---|
|[Settings](#Settings)||

|Value|description|
|---|---|
|[begin](#begin)||
|[begin\_transaction](#begin_transaction)||
|[end\_transaction](#end_transaction)||
|[transfer](#transfer)||
|[transfer16](#transfer16)||
|[transfer\_bytes](#transfer_bytes)||

## Settings

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,50:::pub(all) struct Settings {
  clock : Int
  bitOrder : Int
  dataMode : Int
}
```


## begin

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,28:::fn begin(sck? : <a href="moonbitlang/arduino#Pin">@moonbitlang/arduino.Pin</a>, miso? : <a href="moonbitlang/arduino#Pin">@moonbitlang/arduino.Pin</a>, mosi? : <a href="moonbitlang/arduino#Pin">@moonbitlang/arduino.Pin</a>, ss? : <a href="moonbitlang/arduino#Pin">@moonbitlang/arduino.Pin</a>) -> Unit
```


## begin\_transaction

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,57:::fn begin_transaction(settings : <a href="moonbitlang/arduino/spi#Settings">Settings</a>) -> Unit
```


## end\_transaction

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,69:::fn end_transaction() -> Unit
```


## transfer

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,77:::fn transfer[T : <a href="moonbitlang/arduino#ToInt8">@moonbitlang/arduino.ToInt8</a>](data : T) -> Unit
```


## transfer16

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,85:::fn transfer16[T : <a href="moonbitlang/arduino#ToInt16">@moonbitlang/arduino.ToInt16</a>](data : T) -> Unit
```


## transfer\_bytes

```moonbit
:::source,moonbitlang/arduino/spi/spi.mbt,93:::fn transfer_bytes(data : Bytes) -> Unit
```

