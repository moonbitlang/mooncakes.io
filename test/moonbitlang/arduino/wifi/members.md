# Documentation
|Type|description|
|---|---|
|[WLStatus](#WLStatus)||
|[WiFiClient](#WiFiClient)||
|[WiFiServer](#WiFiServer)||

|Value|description|
|---|---|
|[wifi\_begin](#wifi_begin)||
|[wifi\_server\_new](#wifi_server_new)||
|[wifi\_status](#wifi_status)||

## WLStatus

```moonbit
:::source,moonbitlang/arduino/wifi/lib.mbt,20:::pub(all) enum WLStatus {
  WL_NO_SHIELD
  WL_STOPPED
  WL_IDLE_STATUS
  WL_NO_SSID_AVAIL
  WL_SCAN_COMPLETED
  WL_CONNECTED
  WL_CONNECT_FAILED
  WL_CONNECTION_LOST
  WL_DISCONNECTED
}
```


#### mooncakes-io-method-mark-Methods
- #### from\_int
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,48:::fn <a href="moonbitlang/arduino/wifi#WLStatus">WLStatus</a>::from_int(val : Int) -> <a href="moonbitlang/arduino/wifi#WLStatus">WLStatus</a>
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,33:::fn <a href="moonbitlang/arduino/wifi#WLStatus">WLStatus</a>::to_int(self : <a href="moonbitlang/arduino/wifi#WLStatus">WLStatus</a>) -> Int
  ```
  > 

## WiFiClient

```moonbit
:::source,moonbitlang/arduino/wifi/lib.mbt,73:::type WiFiClient
```


#### mooncakes-io-method-mark-Methods
- #### delete
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,88:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::delete(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>) -> Unit
  ```
  > 
- #### is\_available
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,97:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::is_available(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>) -> Bool
  ```
  > 
- #### is\_connected
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,94:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::is_connected(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>) -> Bool
  ```
  > 
- #### is\_ok
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,91:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::is_ok(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>) -> Bool
  ```
  > 
- #### print
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,103:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::print(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>, s : Bytes) -> Unit
  ```
  > 
- #### println
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,106:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::println(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>, s : Bytes) -> Unit
  ```
  > 
- #### read\_char
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,100:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::read_char(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>) -> Char?
  ```
  > 
- #### stop
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,109:::fn <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>::stop(self : <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>) -> Unit
  ```
  > 

## WiFiServer

```moonbit
:::source,moonbitlang/arduino/wifi/lib.mbt,70:::type WiFiServer
```


#### mooncakes-io-method-mark-Methods
- #### accept
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,85:::fn <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>::accept(self : <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>) -> <a href="moonbitlang/arduino/wifi#WiFiClient">WiFiClient</a>
  ```
  > 
- #### begin
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,82:::fn <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>::begin(self : <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>) -> Unit
  ```
  > 
- #### delete
  ```moonbit
  :::source,moonbitlang/arduino/wifi/lib.mbt,79:::fn <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>::delete(self : <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>) -> Unit
  ```
  > 

## wifi\_begin

```moonbit
:::source,moonbitlang/arduino/wifi/lib.mbt,64:::fn wifi_begin(ssid : Bytes, password : Bytes) -> Int
```


## wifi\_server\_new

```moonbit
:::source,moonbitlang/arduino/wifi/lib.mbt,76:::fn wifi_server_new(port : Int) -> <a href="moonbitlang/arduino/wifi#WiFiServer">WiFiServer</a>
```


## wifi\_status

```moonbit
:::source,moonbitlang/arduino/wifi/lib.mbt,67:::fn wifi_status() -> Int
```

