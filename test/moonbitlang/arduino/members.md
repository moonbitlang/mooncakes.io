# Documentation
|Trait|description|
|---|---|
|[@moonbitlang/arduino.Floating](#@moonbitlang/arduino.Floating)||
|[@moonbitlang/arduino.FromInt](#@moonbitlang/arduino.FromInt)||
|[@moonbitlang/arduino.Integer](#@moonbitlang/arduino.Integer)||
|[@moonbitlang/arduino.Number](#@moonbitlang/arduino.Number)||
|[@moonbitlang/arduino.ToInt](#@moonbitlang/arduino.ToInt)||
|[@moonbitlang/arduino.ToInt16](#@moonbitlang/arduino.ToInt16)||
|[@moonbitlang/arduino.ToInt8](#@moonbitlang/arduino.ToInt8)||

|Type|description|
|---|---|
|[DigitalValue](#DigitalValue)||
|[InterruptMode](#InterruptMode)||
|[Pin](#Pin)||
|[PinMode](#PinMode)||

|Value|description|
|---|---|
|[abs](#abs)||
|[analogRead](#analogRead)||
|[analogReadResolution](#analogReadResolution)||
|[analogWrite](#analogWrite)||
|[analogWriteResolution](#analogWriteResolution)||
|[attachInterrupt](#attachInterrupt)||
|[bit](#bit)||
|[bitClear](#bitClear)||
|[bitRead](#bitRead)||
|[bitSet](#bitSet)||
|[bitWrite](#bitWrite)||
|[builtin\_led](#builtin_led)||
|[constrain](#constrain)||
|[delay](#delay)||
|[delayMicroseconds](#delayMicroseconds)||
|[detachInterrupt](#detachInterrupt)||
|[digitalPinToInterrupt](#digitalPinToInterrupt)||
|[digitalRead](#digitalRead)||
|[digitalWrite](#digitalWrite)||
|[highByte](#highByte)||
|[interrupts](#interrupts)||
|[lowByte](#lowByte)||
|[map](#map)||
|[max](#max)||
|[micros](#micros)||
|[millis](#millis)||
|[min](#min)||
|[noInterrupts](#noInterrupts)||
|[pinMode](#pinMode)||
|[sq](#sq)||
|[test\_bytes](#test_bytes)||
|[tone](#tone)||

## @moonbitlang/arduino.Floating

```moonbit
:::source,moonbitlang/arduino/traits.mbt,59:::pub(open) trait @moonbitlang/arduino.Floating : <a href="moonbitlang/arduino#Number">Number</a> {
  is_nan(Self) -> Bool
}
```


## @moonbitlang/arduino.FromInt

```moonbit
:::source,moonbitlang/arduino/traits.mbt,54:::pub(open) trait @moonbitlang/arduino.FromInt {
  from_int(Int) -> Self
}
```


## @moonbitlang/arduino.Integer

```moonbit
:::source,moonbitlang/arduino/traits.mbt,64:::pub(open) trait @moonbitlang/arduino.Integer : <a href="moonbitlang/arduino#Number">Number</a> {
  is_integer(Self) -> Bool
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,69:::impl <a href="moonbitlang/arduino#Integer">Integer</a> for Int
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,69:::fn is_integer(_x : Int) -> Bool
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,72:::impl <a href="moonbitlang/arduino#Integer">Integer</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,72:::fn is_integer(_x : Int64) -> Bool
    ```
    > 

## @moonbitlang/arduino.Number

```moonbit
:::source,moonbitlang/arduino/traits.mbt,75:::pub(open) trait @moonbitlang/arduino.Number : <a href="moonbitlang/core/builtin#Compare">Compare</a> {
  op_add(Self, Self) -> Self
  op_sub(Self, Self) -> Self
  op_mul(Self, Self) -> Self
  op_div(Self, Self) -> Self
  abs(Self) -> Self
  zero() -> Self
  one() -> Self
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,86:::impl <a href="moonbitlang/arduino#Number">Number</a> for Int
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,98:::fn one() -> Int
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,86:::fn zero() -> Int
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,89:::impl <a href="moonbitlang/arduino#Number">Number</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,101:::fn one() -> Int64
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,89:::fn zero() -> Int64
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,92:::impl <a href="moonbitlang/arduino#Number">Number</a> for Float
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,104:::fn one() -> Float
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,92:::fn zero() -> Float
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,95:::impl <a href="moonbitlang/arduino#Number">Number</a> for Double
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,107:::fn one() -> Double
    ```
    > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,95:::fn zero() -> Double
    ```
    > 

## @moonbitlang/arduino.ToInt

```moonbit
:::source,moonbitlang/arduino/traits.mbt,20:::pub(open) trait @moonbitlang/arduino.ToInt {
  to_int(Self) -> Int
}
```


## @moonbitlang/arduino.ToInt16

```moonbit
:::source,moonbitlang/arduino/traits.mbt,41:::pub(open) trait @moonbitlang/arduino.ToInt16 {
  to_int16(Self) -> Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,46:::impl <a href="moonbitlang/arduino#ToInt16">ToInt16</a> for Int
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,46:::fn to_int16(self : Int) -> Int
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,49:::impl <a href="moonbitlang/arduino#ToInt16">ToInt16</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,49:::fn to_int16(self : Int64) -> Int
    ```
    > 

## @moonbitlang/arduino.ToInt8

```moonbit
:::source,moonbitlang/arduino/traits.mbt,25:::pub(open) trait @moonbitlang/arduino.ToInt8 {
  to_int8(Self) -> Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,30:::impl <a href="moonbitlang/arduino#ToInt8">ToInt8</a> for Byte
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,30:::fn to_int8(self : Byte) -> Int
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,33:::impl <a href="moonbitlang/arduino#ToInt8">ToInt8</a> for Int
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,33:::fn to_int8(self : Int) -> Int
    ```
    > 
- ```moonbit
  :::source,moonbitlang/arduino/traits.mbt,36:::impl <a href="moonbitlang/arduino#ToInt8">ToInt8</a> for Int64
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/arduino/traits.mbt,36:::fn to_int8(self : Int64) -> Int
    ```
    > 

## DigitalValue

```moonbit
:::source,moonbitlang/arduino/lib.mbt,33:::pub(all) enum DigitalValue {
  LOW
  HIGH
}
```


#### mooncakes-io-method-mark-Methods
- #### from\_int
  ```moonbit
  :::source,moonbitlang/arduino/lib.mbt,39:::fn <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>::from_int(val : Int) -> <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>
  ```
  > 
- #### to\_int
  ```moonbit
  :::source,moonbitlang/arduino/lib.mbt,48:::fn <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>::to_int(self : <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>) -> Int
  ```
  > 
- #### to\_int8
  ```moonbit
  :::source,moonbitlang/arduino/lib.mbt,56:::fn <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>::to_int8(self : <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>) -> Int
  ```
  > 

## InterruptMode

```moonbit
:::source,moonbitlang/arduino/interrupts.mbt,26:::pub(all) enum InterruptMode {
  RISING
  FALLING
  CHANGE
  ONLOW
  ONHIGH
  ONLOW_WE
  ONHIGH_WE
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_int
  ```moonbit
  :::source,moonbitlang/arduino/interrupts.mbt,37:::fn <a href="moonbitlang/arduino#InterruptMode">InterruptMode</a>::to_int(self : <a href="moonbitlang/arduino#InterruptMode">InterruptMode</a>) -> Int
  ```
  > 

## Pin

```moonbit
:::source,moonbitlang/arduino/pin.mbt,20:::pub(all) enum Pin {
  GPIO_0
  GPIO_1
  GPIO_2
  GPIO_3
  GPIO_4
  GPIO_5
  GPIO_6
  GPIO_7
  GPIO_8
  GPIO_9
  GPIO_10
  GPIO_11
  GPIO_12
  GPIO_13
  GPIO_14
  GPIO_15
  GPIO_16
  GPIO_17
  GPIO_18
  GPIO_19
  GPIO_20
  GPIO_21
  GPIO_22
  GPIO_23
}
```


#### mooncakes-io-method-mark-Methods
- #### from\_int
  ```moonbit
  :::source,moonbitlang/arduino/pin.mbt,78:::fn <a href="moonbitlang/arduino#Pin">Pin</a>::from_int(x : Int) -> <a href="moonbitlang/arduino#Pin">Pin</a>
  ```
  > 
- #### to\_int8
  ```moonbit
  :::source,moonbitlang/arduino/pin.mbt,48:::fn <a href="moonbitlang/arduino#Pin">Pin</a>::to_int8(x : <a href="moonbitlang/arduino#Pin">Pin</a>) -> Int
  ```
  > 

## PinMode

```moonbit
:::source,moonbitlang/arduino/lib.mbt,20:::pub(all) enum PinMode {
  INPUT
  OUTPUT
  PULLUP
  INPUT_PULLUP
  PULLDOWN
  INPUT_PULLDOWN
  OPEN_DRAIN
  OUTPUT_OPEN_DRIN
  ANALOG
}
```


## abs

```moonbit
:::source,moonbitlang/arduino/math.mbt,20:::fn abs[T : <a href="moonbitlang/arduino#Number">Number</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](x : T) -> T
```


## analogRead

```moonbit
:::source,moonbitlang/arduino/analog_io.mbt,24:::fn analogRead(pin : <a href="moonbitlang/arduino#Pin">Pin</a>) -> Int
```


## analogReadResolution

```moonbit
:::source,moonbitlang/arduino/analog_io.mbt,33:::fn analogReadResolution[T : <a href="moonbitlang/arduino#ToInt8">ToInt8</a>](bits : T) -> Unit
```


## analogWrite

```moonbit
:::source,moonbitlang/arduino/analog_io.mbt,42:::fn analogWrite(pin : <a href="moonbitlang/arduino#Pin">Pin</a>, value : Int) -> Unit
```


## analogWriteResolution

```moonbit
:::source,moonbitlang/arduino/analog_io.mbt,51:::fn analogWriteResolution[T : <a href="moonbitlang/arduino#ToInt8">ToInt8</a>](pin : <a href="moonbitlang/arduino#Pin">Pin</a>, resolution : T) -> Unit
```


## attachInterrupt

```moonbit
:::source,moonbitlang/arduino/interrupts.mbt,58:::fn attachInterrupt(pin : <a href="moonbitlang/arduino#Pin">Pin</a>, intRoutine : () -> Unit, mode : <a href="moonbitlang/arduino#InterruptMode">InterruptMode</a>) -> Unit
```


## bit

```moonbit
:::source,moonbitlang/arduino/bits.mbt,20:::fn bit(n : Int) -> Int
```


## bitClear

```moonbit
:::source,moonbitlang/arduino/bits.mbt,23:::fn bitClear(x : Int, n : Int) -> Int
```


## bitRead

```moonbit
:::source,moonbitlang/arduino/bits.mbt,26:::fn bitRead(x : Int, n : Int) -> Int
```


## bitSet

```moonbit
:::source,moonbitlang/arduino/bits.mbt,29:::fn bitSet(x : Int, n : Int) -> Int
```


## bitWrite

```moonbit
:::source,moonbitlang/arduino/bits.mbt,32:::fn bitWrite(x : Int, n : Int, b : Bool) -> Unit
```


## builtin\_led

```moonbit
:::source,moonbitlang/arduino/lib.mbt,64:::fn builtin_led() -> Int
```


## constrain

```moonbit
:::source,moonbitlang/arduino/math.mbt,25:::fn constrain[T : <a href="moonbitlang/arduino#Number">Number</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](amt : T, low : T, high : T) -> T
```


## delay

```moonbit
:::source,moonbitlang/arduino/time.mbt,21:::fn delay(ms : UInt) -> Unit
```


## delayMicroseconds

```moonbit
:::source,moonbitlang/arduino/time.mbt,24:::fn delayMicroseconds(us : Int) -> Unit
```


## detachInterrupt

```moonbit
:::source,moonbitlang/arduino/interrupts.mbt,71:::fn detachInterrupt(pin : <a href="moonbitlang/arduino#Pin">Pin</a>) -> Unit
```


## digitalPinToInterrupt

```moonbit
:::source,moonbitlang/arduino/interrupts.mbt,79:::fn digitalPinToInterrupt(pin : <a href="moonbitlang/arduino#Pin">Pin</a>) -> <a href="moonbitlang/arduino#Pin">Pin</a>
```


## digitalRead

```moonbit
:::source,moonbitlang/arduino/lib.mbt,86:::fn digitalRead(pin : <a href="moonbitlang/arduino#Pin">Pin</a>) -> <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>
```


## digitalWrite

```moonbit
:::source,moonbitlang/arduino/lib.mbt,95:::fn digitalWrite(pin : <a href="moonbitlang/arduino#Pin">Pin</a>, val : <a href="moonbitlang/arduino#DigitalValue">DigitalValue</a>) -> Unit
```


## highByte

```moonbit
:::source,moonbitlang/arduino/bytes.mbt,20:::fn highByte(x : Int) -> Byte
```


## interrupts

```moonbit
:::source,moonbitlang/arduino/interrupts.mbt,20:::fn interrupts() -> Unit
```


## lowByte

```moonbit
:::source,moonbitlang/arduino/bytes.mbt,23:::fn lowByte(x : Int) -> Byte
```


## map

```moonbit
:::source,moonbitlang/arduino/math.mbt,36:::fn map[T : <a href="moonbitlang/arduino#Number">Number</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](x : T, in_min : T, in_max : T, out_min : T, out_max : T) -> T
```


## max

```moonbit
:::source,moonbitlang/arduino/math.mbt,53:::fn max[T : <a href="moonbitlang/arduino#Number">Number</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](a : T, b : T) -> T
```


## micros

```moonbit
:::source,moonbitlang/arduino/time.mbt,27:::fn micros() -> UInt64
```


## millis

```moonbit
:::source,moonbitlang/arduino/time.mbt,30:::fn millis() -> UInt64
```


## min

```moonbit
:::source,moonbitlang/arduino/math.mbt,62:::fn min[T : <a href="moonbitlang/arduino#Number">Number</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](a : T, b : T) -> T
```


## noInterrupts

```moonbit
:::source,moonbitlang/arduino/interrupts.mbt,23:::fn noInterrupts() -> Unit
```


## pinMode

```moonbit
:::source,moonbitlang/arduino/lib.mbt,104:::fn pinMode(pin : <a href="moonbitlang/arduino#Pin">Pin</a>, mode : <a href="moonbitlang/arduino#PinMode">PinMode</a>) -> Unit
```


## sq

```moonbit
:::source,moonbitlang/arduino/math.mbt,71:::fn sq[T : <a href="moonbitlang/arduino#Number">Number</a> + <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](x : T) -> T
```


## test\_bytes

```moonbit
:::source,moonbitlang/arduino/lib.mbt,109:::fn test_bytes(data : Bytes) -> Unit
```


## tone

```moonbit
:::source,moonbitlang/arduino/advanced_io.mbt,23:::fn tone(pin : <a href="moonbitlang/arduino#Pin">Pin</a>, frequency : Int, duration~ : Int64 = ..) -> Unit
```

