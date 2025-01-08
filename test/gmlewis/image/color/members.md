# Documentation
|Trait|description|
|---|---|
|[@gmlewis/image/color.Color](#@gmlewis/image/color.Color)| Color can convert itself to alpha-premultiplied 16-bits per channel RGBA.|
|[@gmlewis/image/color.Model](#@gmlewis/image/color.Model)| Model can convert any \[\&Color\] to one from its own color model. The conversion|

|Type|description|
|---|---|
|[Alpha](#Alpha)| Alpha represents an 8-bit alpha color.|
|[Alpha16](#Alpha16)| Alpha16 represents a 16-bit alpha color.|
|[CMYK](#CMYK)| CMYK represents a fully opaque CMYK color, having 8 bits for each of cyan,|
|[Gray](#Gray)| Gray represents an 8-bit grayscale color.|
|[Gray16](#Gray16)| Gray16 represents a 16-bit grayscale color.|
|[ModelFunc](#ModelFunc)||
|[NRGBA](#NRGBA)| NRGBA represents a non-alpha-premultiplied 32-bit color.|
|[NRGBA64](#NRGBA64)| NRGBA64 represents a non-alpha-premultiplied 64-bit color,|
|[NYCbCrA](#NYCbCrA)| NYCbCrA represents a non-alpha-premultiplied Y'CbCr-with-alpha color, having|
|[Palette](#Palette)| Palette is a palette of colors and satisfies the Model trait.|
|[RGBA](#RGBA)| RGBA represents a traditional 32-bit alpha-premultiplied color, having 8|
|[RGBA64](#RGBA64)| RGBA64 represents a 64-bit alpha-premultiplied color, having 16 bits for|
|[YCbCr](#YCbCr)| YCbCr represents a fully opaque 24-bit Y'CbCr color, having 8 bits each for|
|[Color](#Color)||

|Value|description|
|---|---|
|[alpha16\_model](#alpha16_model)||
|[alpha\_model](#alpha_model)||
|[black](#black)| Standard colors.|
|[cmyk\_model](#cmyk_model)| cmyk\_model is the \[Model\] for CMYK colors.|
|[cmyk\_to\_rgb](#cmyk_to_rgb)| cmyk\_to\_rgb converts a \[CMYK\] quadruple to an RGB triple.|
|[gray16\_model](#gray16_model)||
|[gray\_model](#gray_model)||
|[model\_func](#model_func)| model\_func returns a \[Model\] that invokes f to implement the conversion.|
|[n\_y\_cb\_cr\_a\_model](#n_y_cb_cr_a_model)| n\_y\_cb\_cr\_a\_model is the \[Model\] for non-alpha-premultiplied Y'CbCr-with-alpha|
|[nrgba64\_model](#nrgba64_model)||
|[nrgba\_model](#nrgba_model)||
|[opaque](#opaque)||
|[rgb\_to\_cmyk](#rgb_to_cmyk)| rgb\_to\_cmyk converts an RGB triple to a CMYK quadruple.|
|[rgb\_to\_y\_cb\_cr](#rgb_to_y_cb_cr)| rgb\_to\_y\_cb\_cr converts an RGB triple to a Y'CbCr triple.|
|[rgba64\_model](#rgba64_model)||
|[rgba\_model](#rgba_model)| Models for the standard color types.|
|[transparent](#transparent)||
|[white](#white)||
|[y\_cb\_cr\_model](#y_cb_cr_model)| y\_cb\_cr\_model is the \[Model\] for Y'CbCr colors.|
|[y\_cb\_cr\_to\_rgb](#y_cb_cr_to_rgb)| y\_cb\_cr\_to\_rgb converts a Y'CbCr triple to an RGB triple.|

## @gmlewis/image/color.Color

```moonbit
:::source,gmlewis/image/color/color.mbt,12:::pub(open) trait @gmlewis/image/color.Color {
  rgba(Self) -> (UInt, UInt, UInt, UInt)
  model(Self) -> String
  raw(Self) -> (UInt, UInt, UInt, UInt)
}
```
 Color can convert itself to alpha-premultiplied 16-bits per channel RGBA.
The conversion may be lossy.

## @gmlewis/image/color.Model

```moonbit
:::source,gmlewis/image/color/color.mbt,317:::pub(open) trait @gmlewis/image/color.Model {
  convert(Self, <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Color">Color</a>
  name(Self) -> String
  get_palette(Self) -> <a href="gmlewis/image/color#Palette">Palette</a>?
}
```
 Model can convert any \[\&Color\] to one from its own color model. The conversion
may be lossy.

## Alpha

```moonbit
:::source,gmlewis/image/color/color.mbt,199:::pub(all) struct Alpha {
  a : Byte
}
```
 Alpha represents an 8-bit alpha color.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,201:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#Alpha">Alpha</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,201:::fn op_equal(<a href="gmlewis/image/color#Alpha">Alpha</a>, <a href="gmlewis/image/color#Alpha">Alpha</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,201:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#Alpha">Alpha</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,201:::fn output(<a href="gmlewis/image/color#Alpha">Alpha</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,478:::fn <a href="gmlewis/image/color#Alpha">Alpha</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Alpha">Alpha</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,212:::fn <a href="gmlewis/image/color#Alpha">Alpha</a>::model(_self : <a href="gmlewis/image/color#Alpha">Alpha</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,207:::fn <a href="gmlewis/image/color#Alpha">Alpha</a>::new(a : Byte) -> <a href="gmlewis/image/color#Alpha">Alpha</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,217:::fn <a href="gmlewis/image/color#Alpha">Alpha</a>::raw(self : <a href="gmlewis/image/color#Alpha">Alpha</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,223:::fn <a href="gmlewis/image/color#Alpha">Alpha</a>::rgba(self : <a href="gmlewis/image/color#Alpha">Alpha</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## Alpha16

```moonbit
:::source,gmlewis/image/color/color.mbt,229:::pub(all) struct Alpha16 {
  a : UInt
}
```
 Alpha16 represents a 16-bit alpha color.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,231:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#Alpha16">Alpha16</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,231:::fn op_equal(<a href="gmlewis/image/color#Alpha16">Alpha16</a>, <a href="gmlewis/image/color#Alpha16">Alpha16</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,231:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#Alpha16">Alpha16</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,231:::fn output(<a href="gmlewis/image/color#Alpha16">Alpha16</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,494:::fn <a href="gmlewis/image/color#Alpha16">Alpha16</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Alpha16">Alpha16</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,242:::fn <a href="gmlewis/image/color#Alpha16">Alpha16</a>::model(_self : <a href="gmlewis/image/color#Alpha16">Alpha16</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,237:::fn <a href="gmlewis/image/color#Alpha16">Alpha16</a>::new(a : UInt) -> <a href="gmlewis/image/color#Alpha16">Alpha16</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,247:::fn <a href="gmlewis/image/color#Alpha16">Alpha16</a>::raw(self : <a href="gmlewis/image/color#Alpha16">Alpha16</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,252:::fn <a href="gmlewis/image/color#Alpha16">Alpha16</a>::rgba(self : <a href="gmlewis/image/color#Alpha16">Alpha16</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## CMYK

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,419:::pub(all) struct CMYK {
  c : Byte
  m : Byte
  y : Byte
  k : Byte
}
```
 CMYK represents a fully opaque CMYK color, having 8 bits for each of cyan,
magenta, yellow and black.

 It is not associated with any particular color profile.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,424:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#CMYK">CMYK</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/ycbcr.mbt,424:::fn op_equal(<a href="gmlewis/image/color#CMYK">CMYK</a>, <a href="gmlewis/image/color#CMYK">CMYK</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,424:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#CMYK">CMYK</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/ycbcr.mbt,424:::fn output(<a href="gmlewis/image/color#CMYK">CMYK</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,465:::fn <a href="gmlewis/image/color#CMYK">CMYK</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#CMYK">CMYK</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,435:::fn <a href="gmlewis/image/color#CMYK">CMYK</a>::model(_self : <a href="gmlewis/image/color#CMYK">CMYK</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,430:::fn <a href="gmlewis/image/color#CMYK">CMYK</a>::new(c : Byte, m : Byte, y : Byte, k : Byte) -> <a href="gmlewis/image/color#CMYK">CMYK</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,440:::fn <a href="gmlewis/image/color#CMYK">CMYK</a>::raw(self : <a href="gmlewis/image/color#CMYK">CMYK</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,445:::fn <a href="gmlewis/image/color#CMYK">CMYK</a>::rgba(self : <a href="gmlewis/image/color#CMYK">CMYK</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## Gray

```moonbit
:::source,gmlewis/image/color/color.mbt,257:::pub(all) struct Gray {
  y : Byte
}
```
 Gray represents an 8-bit grayscale color.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,259:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#Gray">Gray</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,259:::fn op_equal(<a href="gmlewis/image/color#Gray">Gray</a>, <a href="gmlewis/image/color#Gray">Gray</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,259:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#Gray">Gray</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,259:::fn output(<a href="gmlewis/image/color#Gray">Gray</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,509:::fn <a href="gmlewis/image/color#Gray">Gray</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Gray">Gray</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,270:::fn <a href="gmlewis/image/color#Gray">Gray</a>::model(_self : <a href="gmlewis/image/color#Gray">Gray</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,265:::fn <a href="gmlewis/image/color#Gray">Gray</a>::new(y : Byte) -> <a href="gmlewis/image/color#Gray">Gray</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,275:::fn <a href="gmlewis/image/color#Gray">Gray</a>::raw(self : <a href="gmlewis/image/color#Gray">Gray</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,281:::fn <a href="gmlewis/image/color#Gray">Gray</a>::rgba(self : <a href="gmlewis/image/color#Gray">Gray</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## Gray16

```moonbit
:::source,gmlewis/image/color/color.mbt,287:::pub(all) struct Gray16 {
  y : UInt
}
```
 Gray16 represents a 16-bit grayscale color.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,289:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#Gray16">Gray16</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,289:::fn op_equal(<a href="gmlewis/image/color#Gray16">Gray16</a>, <a href="gmlewis/image/color#Gray16">Gray16</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,289:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#Gray16">Gray16</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,289:::fn output(<a href="gmlewis/image/color#Gray16">Gray16</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,535:::fn <a href="gmlewis/image/color#Gray16">Gray16</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Gray16">Gray16</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,300:::fn <a href="gmlewis/image/color#Gray16">Gray16</a>::model(_self : <a href="gmlewis/image/color#Gray16">Gray16</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,295:::fn <a href="gmlewis/image/color#Gray16">Gray16</a>::new(y : UInt) -> <a href="gmlewis/image/color#Gray16">Gray16</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,305:::fn <a href="gmlewis/image/color#Gray16">Gray16</a>::raw(self : <a href="gmlewis/image/color#Gray16">Gray16</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,311:::fn <a href="gmlewis/image/color#Gray16">Gray16</a>::rgba(self : <a href="gmlewis/image/color#Gray16">Gray16</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## ModelFunc

```moonbit
:::source,gmlewis/image/color/color.mbt,339:::type ModelFunc
```


#### mooncakes-io-method-mark-Methods
- #### convert
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,346:::fn <a href="gmlewis/image/color#ModelFunc">ModelFunc</a>::convert(self : <a href="gmlewis/image/color#ModelFunc">ModelFunc</a>, c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Color">Color</a>
  ```
  > 
- #### get\_palette
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,356:::fn <a href="gmlewis/image/color#ModelFunc">ModelFunc</a>::get_palette(self : <a href="gmlewis/image/color#ModelFunc">ModelFunc</a>) -> <a href="gmlewis/image/color#Palette">Palette</a>?
  ```
  > 
- #### name
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,351:::fn <a href="gmlewis/image/color#ModelFunc">ModelFunc</a>::name(self : <a href="gmlewis/image/color#ModelFunc">ModelFunc</a>) -> String
  ```
  > 

## NRGBA

```moonbit
:::source,gmlewis/image/color/color.mbt,122:::pub(all) struct NRGBA {
  r : Byte
  g : Byte
  b : Byte
  a : Byte
}
```
 NRGBA represents a non-alpha-premultiplied 32-bit color.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,127:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#NRGBA">NRGBA</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,127:::fn op_equal(<a href="gmlewis/image/color#NRGBA">NRGBA</a>, <a href="gmlewis/image/color#NRGBA">NRGBA</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,127:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#NRGBA">NRGBA</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,127:::fn output(<a href="gmlewis/image/color#NRGBA">NRGBA</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,424:::fn <a href="gmlewis/image/color#NRGBA">NRGBA</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#NRGBA">NRGBA</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,138:::fn <a href="gmlewis/image/color#NRGBA">NRGBA</a>::model(_self : <a href="gmlewis/image/color#NRGBA">NRGBA</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,133:::fn <a href="gmlewis/image/color#NRGBA">NRGBA</a>::new(r : Byte, g : Byte, b : Byte, a : Byte) -> <a href="gmlewis/image/color#NRGBA">NRGBA</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,143:::fn <a href="gmlewis/image/color#NRGBA">NRGBA</a>::raw(self : <a href="gmlewis/image/color#NRGBA">NRGBA</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,148:::fn <a href="gmlewis/image/color#NRGBA">NRGBA</a>::rgba(self : <a href="gmlewis/image/color#NRGBA">NRGBA</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## NRGBA64

```moonbit
:::source,gmlewis/image/color/color.mbt,165:::pub(all) struct NRGBA64 {
  r : UInt
  g : UInt
  b : UInt
  a : UInt
}
```
 NRGBA64 represents a non-alpha-premultiplied 64-bit color,
having 16 bits for each of red, green, blue and alpha.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,170:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,170:::fn op_equal(<a href="gmlewis/image/color#NRGBA64">NRGBA64</a>, <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,170:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,170:::fn output(<a href="gmlewis/image/color#NRGBA64">NRGBA64</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,453:::fn <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,181:::fn <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>::model(_self : <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,176:::fn <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>::new(r : UInt, g : UInt, b : UInt, a : UInt) -> <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,186:::fn <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>::raw(self : <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,191:::fn <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>::rgba(self : <a href="gmlewis/image/color#NRGBA64">NRGBA64</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## NYCbCrA

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,271:::pub(all) struct NYCbCrA {
  y : Byte
  cb : Byte
  cr : Byte
  a : Byte
}
```
 NYCbCrA represents a non-alpha-premultiplied Y'CbCr-with-alpha color, having
8 bits each for one luma, two chroma and one alpha component.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,276:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/ycbcr.mbt,276:::fn op_equal(<a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>, <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,276:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/ycbcr.mbt,276:::fn output(<a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### model
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,287:::fn <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>::model(_self : <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,282:::fn <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>::new(y : Byte, cb : Byte, cr : Byte, a : Byte) -> <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,292:::fn <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>::raw(self : <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,297:::fn <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>::rgba(self : <a href="gmlewis/image/color#NYCbCrA">NYCbCrA</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## Palette

```moonbit
:::source,gmlewis/image/color/color.mbt,555:::pub(all) type Palette <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[<a href="gmlewis/image/color#Color">Color</a>]
```
 Palette is a palette of colors and satisfies the Model trait.

#### mooncakes-io-method-mark-Methods
- #### convert
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,610:::fn <a href="gmlewis/image/color#Palette">Palette</a>::convert(self : <a href="gmlewis/image/color#Palette">Palette</a>, c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Color">Color</a>
  ```
  >  convert returns the palette color closest to c in Euclidean R,G,B space.
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,580:::fn <a href="gmlewis/image/color#Palette">Palette</a>::from(arr : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/image/color#Color">Color</a>]) -> <a href="gmlewis/image/color#Palette">Palette</a>
  ```
  >  Palette::from makes a new palette from the provided colors.
- #### get\_palette
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,590:::fn <a href="gmlewis/image/color#Palette">Palette</a>::get_palette(self : <a href="gmlewis/image/color#Palette">Palette</a>) -> <a href="gmlewis/image/color#Palette">Palette</a>?
  ```
  > 
- #### index
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,620:::fn <a href="gmlewis/image/color#Palette">Palette</a>::index(self : <a href="gmlewis/image/color#Palette">Palette</a>, c : <a href="gmlewis/image/color#Color">Color</a>) -> Int
  ```
  >  index returns the index of the palette color closest to c in Euclidean
  > R,G,B,A space.
- #### length
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,600:::fn <a href="gmlewis/image/color#Palette">Palette</a>::length(self : <a href="gmlewis/image/color#Palette">Palette</a>) -> Int
  ```
  > 
- #### name
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,585:::fn <a href="gmlewis/image/color#Palette">Palette</a>::name(_self : <a href="gmlewis/image/color#Palette">Palette</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,561:::fn <a href="gmlewis/image/color#Palette">Palette</a>::new(n : Int) -> <a href="gmlewis/image/color#Palette">Palette</a>
  ```
  >  Palette::new makes a new palette with `n` colors (initially all black).
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,595:::fn <a href="gmlewis/image/color#Palette">Palette</a>::new_empty() -> <a href="gmlewis/image/color#Palette">Palette</a>
  ```
  > 
- #### op\_as\_view
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,605:::fn <a href="gmlewis/image/color#Palette">Palette</a>::op_as_view(self : <a href="gmlewis/image/color#Palette">Palette</a>, start~ : Int = .., end~ : Int) -> <a href="gmlewis/image/color#Palette">Palette</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,575:::fn <a href="gmlewis/image/color#Palette">Palette</a>::op_get(self : <a href="gmlewis/image/color#Palette">Palette</a>, idx : Int) -> <a href="gmlewis/image/color#Color">Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,570:::fn <a href="gmlewis/image/color#Palette">Palette</a>::op_set(self : <a href="gmlewis/image/color#Palette">Palette</a>, idx : Int, c : <a href="gmlewis/image/color#Color">Color</a>) -> Unit
  ```
  > 

## RGBA

```moonbit
:::source,gmlewis/image/color/color.mbt,52:::pub(all) struct RGBA {
  r : Byte
  g : Byte
  b : Byte
  a : Byte
}
```
 RGBA represents a traditional 32-bit alpha-premultiplied color, having 8
bits for each of red, green, blue and alpha.

 An alpha-premultiplied color component C has been scaled by alpha (A), so
has valid values 0 \<= C \<= A.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,57:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#RGBA">RGBA</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,57:::fn op_equal(<a href="gmlewis/image/color#RGBA">RGBA</a>, <a href="gmlewis/image/color#RGBA">RGBA</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,57:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#RGBA">RGBA</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,57:::fn output(<a href="gmlewis/image/color#RGBA">RGBA</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,390:::fn <a href="gmlewis/image/color#RGBA">RGBA</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#RGBA">RGBA</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,68:::fn <a href="gmlewis/image/color#RGBA">RGBA</a>::model(_self : <a href="gmlewis/image/color#RGBA">RGBA</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,63:::fn <a href="gmlewis/image/color#RGBA">RGBA</a>::new(r : Byte, g : Byte, b : Byte, a : Byte) -> <a href="gmlewis/image/color#RGBA">RGBA</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,73:::fn <a href="gmlewis/image/color#RGBA">RGBA</a>::raw(self : <a href="gmlewis/image/color#RGBA">RGBA</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,78:::fn <a href="gmlewis/image/color#RGBA">RGBA</a>::rgba(self : <a href="gmlewis/image/color#RGBA">RGBA</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## RGBA64

```moonbit
:::source,gmlewis/image/color/color.mbt,91:::pub(all) struct RGBA64 {
  r : UInt
  g : UInt
  b : UInt
  a : UInt
}
```
 RGBA64 represents a 64-bit alpha-premultiplied color, having 16 bits for
each of red, green, blue and alpha.

 An alpha-premultiplied color component C has been scaled by alpha (A), so
has valid values 0 \<= C \<= A.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,96:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#RGBA64">RGBA64</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,96:::fn op_equal(<a href="gmlewis/image/color#RGBA64">RGBA64</a>, <a href="gmlewis/image/color#RGBA64">RGBA64</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/color.mbt,96:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#RGBA64">RGBA64</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/color.mbt,96:::fn output(<a href="gmlewis/image/color#RGBA64">RGBA64</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### from
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,409:::fn <a href="gmlewis/image/color#RGBA64">RGBA64</a>::from(c : <a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#RGBA64">RGBA64</a>
  ```
  > 
- #### model
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,107:::fn <a href="gmlewis/image/color#RGBA64">RGBA64</a>::model(_self : <a href="gmlewis/image/color#RGBA64">RGBA64</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,102:::fn <a href="gmlewis/image/color#RGBA64">RGBA64</a>::new(r : UInt, g : UInt, b : UInt, a : UInt) -> <a href="gmlewis/image/color#RGBA64">RGBA64</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,112:::fn <a href="gmlewis/image/color#RGBA64">RGBA64</a>::raw(self : <a href="gmlewis/image/color#RGBA64">RGBA64</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,117:::fn <a href="gmlewis/image/color#RGBA64">RGBA64</a>::rgba(self : <a href="gmlewis/image/color#RGBA64">RGBA64</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## YCbCr

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,170:::pub(all) struct YCbCr {
  y : Byte
  cb : Byte
  cr : Byte
}
```
 YCbCr represents a fully opaque 24-bit Y'CbCr color, having 8 bits each for
one luma and two chroma components.

 JPEG, VP8, the MPEG family and other codecs use this color model. Such
codecs often use the terms YUV and Y'CbCr interchangeably, but strictly
speaking, the term YUV applies only to analog video signals, and Y' (luma)
is Y (luminance) after applying gamma correction.

 Conversion between RGB and Y'CbCr is lossy and there are multiple, slightly
different formulae for converting between the two. This package follows
the JFIF specification at https://www.w3.org/Graphics/JPEG/jfif3.pdf.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,174:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image/color#YCbCr">YCbCr</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/ycbcr.mbt,174:::fn op_equal(<a href="gmlewis/image/color#YCbCr">YCbCr</a>, <a href="gmlewis/image/color#YCbCr">YCbCr</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,174:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image/color#YCbCr">YCbCr</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/color/ycbcr.mbt,174:::fn output(<a href="gmlewis/image/color#YCbCr">YCbCr</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### model
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,185:::fn <a href="gmlewis/image/color#YCbCr">YCbCr</a>::model(_self : <a href="gmlewis/image/color#YCbCr">YCbCr</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,180:::fn <a href="gmlewis/image/color#YCbCr">YCbCr</a>::new(y : Byte, cb : Byte, cr : Byte) -> <a href="gmlewis/image/color#YCbCr">YCbCr</a>
  ```
  > 
- #### raw
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,190:::fn <a href="gmlewis/image/color#YCbCr">YCbCr</a>::raw(self : <a href="gmlewis/image/color#YCbCr">YCbCr</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 
- #### rgba
  ```moonbit
  :::source,gmlewis/image/color/ycbcr.mbt,195:::fn <a href="gmlewis/image/color#YCbCr">YCbCr</a>::rgba(self : <a href="gmlewis/image/color#YCbCr">YCbCr</a>) -> (UInt, UInt, UInt, UInt)
  ```
  > 

## alpha16\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,376:::let alpha16_model : <a href="gmlewis/image/color#Model">Model</a>
```


## alpha\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,373:::let alpha_model : <a href="gmlewis/image/color#Model">Model</a>
```


## black

```moonbit
:::source,gmlewis/image/color/color.mbt,675:::let black : <a href="gmlewis/image/color#Gray16">Gray16</a>
```
 Standard colors.

## cmyk\_model

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,457:::let cmyk_model : <a href="gmlewis/image/color#Model">Model</a>
```
 cmyk\_model is the \[Model\] for CMYK colors.

## cmyk\_to\_rgb

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,399:::fn cmyk_to_rgb(c : Byte, m : Byte, y : Byte, k : Byte) -> (Byte, Byte, Byte)
```
 cmyk\_to\_rgb converts a \[CMYK\] quadruple to an RGB triple.

## gray16\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,382:::let gray16_model : <a href="gmlewis/image/color#Model">Model</a>
```


## gray\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,379:::let gray_model : <a href="gmlewis/image/color#Model">Model</a>
```


## model\_func

```moonbit
:::source,gmlewis/image/color/color.mbt,324:::fn model_func(f : (<a href="gmlewis/image/color#Color">Color</a>) -> <a href="gmlewis/image/color#Color">Color</a>, name : String, palette : <a href="gmlewis/image/color#Palette">Palette</a>?) -> <a href="gmlewis/image/color#Model">Model</a>
```
 model\_func returns a \[Model\] that invokes f to implement the conversion.

## n\_y\_cb\_cr\_a\_model

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,343:::let n_y_cb_cr_a_model : <a href="gmlewis/image/color#Model">Model</a>
```
 n\_y\_cb\_cr\_a\_model is the \[Model\] for non-alpha-premultiplied Y'CbCr-with-alpha
colors.

## nrgba64\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,370:::let nrgba64_model : <a href="gmlewis/image/color#Model">Model</a>
```


## nrgba\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,367:::let nrgba_model : <a href="gmlewis/image/color#Model">Model</a>
```


## opaque

```moonbit
:::source,gmlewis/image/color/color.mbt,684:::let opaque : <a href="gmlewis/image/color#Alpha16">Alpha16</a>
```


## rgb\_to\_cmyk

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,377:::fn rgb_to_cmyk(r : Byte, g : Byte, b : Byte) -> (Byte, Byte, Byte, Byte)
```
 rgb\_to\_cmyk converts an RGB triple to a CMYK quadruple.

## rgb\_to\_y\_cb\_cr

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,9:::fn rgb_to_y_cb_cr(r : Byte, g : Byte, b : Byte) -> (Byte, Byte, Byte)
```
 rgb\_to\_y\_cb\_cr converts an RGB triple to a Y'CbCr triple.

## rgba64\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,364:::let rgba64_model : <a href="gmlewis/image/color#Model">Model</a>
```


## rgba\_model

```moonbit
:::source,gmlewis/image/color/color.mbt,361:::let rgba_model : <a href="gmlewis/image/color#Model">Model</a>
```
 Models for the standard color types.

## transparent

```moonbit
:::source,gmlewis/image/color/color.mbt,681:::let transparent : <a href="gmlewis/image/color#Alpha16">Alpha16</a>
```


## white

```moonbit
:::source,gmlewis/image/color/color.mbt,678:::let white : <a href="gmlewis/image/color#Gray16">Gray16</a>
```


## y\_cb\_cr\_model

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,253:::let y_cb_cr_model : <a href="gmlewis/image/color#Model">Model</a>
```
 y\_cb\_cr\_model is the \[Model\] for Y'CbCr colors.

## y\_cb\_cr\_to\_rgb

```moonbit
:::source,gmlewis/image/color/ycbcr.mbt,61:::fn y_cb_cr_to_rgb(y : Byte, cb : Byte, cr : Byte) -> (Byte, Byte, Byte)
```
 y\_cb\_cr\_to\_rgb converts a Y'CbCr triple to an RGB triple.

## Color


#### mooncakes-io-method-mark-Methods
- #### op\_equal
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,41:::fn <a href="gmlewis/image/color#Color">Color</a>::op_equal(self : <a href="gmlewis/image/color#Color">Color</a>, o : <a href="gmlewis/image/color#Color">Color</a>) -> Bool
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,gmlewis/image/color/color.mbt,35:::fn <a href="gmlewis/image/color#Color">Color</a>::to_string(self : <a href="gmlewis/image/color#Color">Color</a>) -> String
  ```
  > 
