# gmlewis/image
[![check](https://github.com/gmlewis/moonbit-image/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-image/actions/workflows/check.yml)

This is a simple image representation based on Go's implementation:
https://cs.opensource.google/go/go/+/refs/tags/go1.23.3:src/image/image.go
which has the copyright notice:

```
// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
```

## Status

The code has been updated to support compiler:

```bash
$ moon version --all
moon 0.1.20241216 (b57ed1c 2024-12-16) ~/.moon/bin/moon
moonc v0.1.20241216+68e710374 ~/.moon/bin/moonc
moonrun 0.1.20241216 (b57ed1c 2024-12-16) ~/.moon/bin/moonrun
```

Use `moonup` to manage `moon` compiler versions:
https://github.com/chawyehsu/moonup

---
# Documentation
|Trait|description|
|---|---|
|[@gmlewis/image.Image](#@gmlewis/image.Image)| Image is a finite rectangular grid of \[color.Color\] values taken from a color|
|[@gmlewis/image.RGBA64Image](#@gmlewis/image.RGBA64Image)| RGBA64Image is an \[Image\] whose pixels can be converted directly to a|

|Type|description|
|---|---|
|[Alpha](#Alpha)||
|[Alpha16](#Alpha16)||
|[CMYK](#CMYK)||
|[Config](#Config)| Config holds an image's color model and dimensions.|
|[Gray](#Gray)||
|[Gray16](#Gray16)||
|[NRGBA](#NRGBA)||
|[NRGBA64](#NRGBA64)||
|[Paletted](#Paletted)||
|[Point](#Point)||
|[RGBA](#RGBA)| RGBA is an in-memory image whose At method returns \[color.RGBA\] values.|
|[RGBA64](#RGBA64)||
|[Rectangle](#Rectangle)| A Rectangle contains the points with Min.X \<= X \< Max.X, Min.Y \<= Y \< Max.Y.|
|[SizeError](#SizeError)||
|[Image](#Image)||

|Value|description|
|---|---|
|[add2\_non\_neg](#add2_non_neg)| add2\_non\_neg returns (x + y), unless at least one argument is negative or if|
|[mul3\_non\_neg](#mul3_non_neg)| mul3\_non\_neg returns (x \* y \* z), unless at least one argument is negative or|
|[pt](#pt)| pt is shorthand for \[Point\]{X, Y}.|
|[rect](#rect)| rect is shorthand for \[Rectangle\]{Pt(x0, y0), \[Pt\](x1, y1)}. The returned|

## @gmlewis/image.Image

```moonbit
:::source,gmlewis/image/image.mbt,42:::pub(open) trait @gmlewis/image.Image {
  color_model(Self) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  bounds(Self) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  at(Self, Int, Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  opaque(Self) -> Bool
  set(Self, Int, Int, <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  sub_image(Self, <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  raw_data(Self) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  get_bytes_per_pixel(Self) -> Int
  get_stride(Self) -> Int
  pix_offset(Self, Int, Int) -> Int
  color_index_at(Self, Int, Int) -> Byte
}
```
 Image is a finite rectangular grid of \[color.Color\] values taken from a color
model.

## @gmlewis/image.RGBA64Image

```moonbit
:::source,gmlewis/image/image.mbt,81:::pub(open) trait @gmlewis/image.RGBA64Image {
  rgba64_at(Self, Int, Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  color_model(Self) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  bounds(Self) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  at(Self, Int, Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
}
```
 RGBA64Image is an \[Image\] whose pixels can be converted directly to a
color.RGBA64.

## Alpha

```moonbit
:::source,gmlewis/image/image.mbt,843:::pub(all) struct Alpha {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### alpha\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,909:::fn <a href="gmlewis/image#Alpha">Alpha</a>::alpha_at(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Alpha">@gmlewis/image/color.Alpha</a>
  ```
  > 
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,897:::fn <a href="gmlewis/image#Alpha">Alpha</a>::at(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,887:::fn <a href="gmlewis/image#Alpha">Alpha</a>::bounds(self : <a href="gmlewis/image#Alpha">Alpha</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,877:::fn <a href="gmlewis/image#Alpha">Alpha</a>::color_index_at(_self : <a href="gmlewis/image#Alpha">Alpha</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,882:::fn <a href="gmlewis/image#Alpha">Alpha</a>::color_model(_self : <a href="gmlewis/image#Alpha">Alpha</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,867:::fn <a href="gmlewis/image#Alpha">Alpha</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#Alpha">Alpha</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,872:::fn <a href="gmlewis/image#Alpha">Alpha</a>::get_stride(self : <a href="gmlewis/image#Alpha">Alpha</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,994:::fn <a href="gmlewis/image#Alpha">Alpha</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Alpha">Alpha</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,857:::fn <a href="gmlewis/image#Alpha">Alpha</a>::new_empty() -> <a href="gmlewis/image#Alpha">Alpha</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,892:::fn <a href="gmlewis/image#Alpha">Alpha</a>::op_get(self : <a href="gmlewis/image#Alpha">Alpha</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,925:::fn <a href="gmlewis/image#Alpha">Alpha</a>::op_set(self : <a href="gmlewis/image#Alpha">Alpha</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,974:::fn <a href="gmlewis/image#Alpha">Alpha</a>::opaque(self : <a href="gmlewis/image#Alpha">Alpha</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,920:::fn <a href="gmlewis/image#Alpha">Alpha</a>::pix_offset(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,862:::fn <a href="gmlewis/image#Alpha">Alpha</a>::raw_data(self : <a href="gmlewis/image#Alpha">Alpha</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,902:::fn <a href="gmlewis/image#Alpha">Alpha</a>::rgba64_at(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,930:::fn <a href="gmlewis/image#Alpha">Alpha</a>::set(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_alpha
  ```moonbit
  :::source,gmlewis/image/image.mbt,949:::fn <a href="gmlewis/image#Alpha">Alpha</a>::set_alpha(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Alpha">@gmlewis/image/color.Alpha</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,940:::fn <a href="gmlewis/image#Alpha">Alpha</a>::set_rgba64(self : <a href="gmlewis/image#Alpha">Alpha</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,960:::fn <a href="gmlewis/image#Alpha">Alpha</a>::sub_image(self : <a href="gmlewis/image#Alpha">Alpha</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## Alpha16

```moonbit
:::source,gmlewis/image/image.mbt,1004:::pub(all) struct Alpha16 {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### alpha16\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1069:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::alpha16_at(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Alpha16">@gmlewis/image/color.Alpha16</a>
  ```
  > 
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1058:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::at(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,1048:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::bounds(self : <a href="gmlewis/image#Alpha16">Alpha16</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1038:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::color_index_at(_self : <a href="gmlewis/image#Alpha16">Alpha16</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,1043:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::color_model(_self : <a href="gmlewis/image#Alpha16">Alpha16</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,1028:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#Alpha16">Alpha16</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,1033:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::get_stride(self : <a href="gmlewis/image#Alpha16">Alpha16</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,1163:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Alpha16">Alpha16</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,1018:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::new_empty() -> <a href="gmlewis/image#Alpha16">Alpha16</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,1053:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::op_get(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1086:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::op_set(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,1143:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::opaque(self : <a href="gmlewis/image#Alpha16">Alpha16</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,1081:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::pix_offset(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,1023:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::raw_data(self : <a href="gmlewis/image#Alpha16">Alpha16</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1063:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::rgba64_at(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1091:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::set(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_alpha16
  ```moonbit
  :::source,gmlewis/image/image.mbt,1112:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::set_alpha16(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Alpha16">@gmlewis/image/color.Alpha16</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,1102:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::set_rgba64(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,1129:::fn <a href="gmlewis/image#Alpha16">Alpha16</a>::sub_image(self : <a href="gmlewis/image#Alpha16">Alpha16</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## CMYK

```moonbit
:::source,gmlewis/image/image.mbt,1474:::pub(all) struct CMYK {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1528:::fn <a href="gmlewis/image#CMYK">CMYK</a>::at(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,1518:::fn <a href="gmlewis/image#CMYK">CMYK</a>::bounds(self : <a href="gmlewis/image#CMYK">CMYK</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### cmyk\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1539:::fn <a href="gmlewis/image#CMYK">CMYK</a>::cmyk_at(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#CMYK">@gmlewis/image/color.CMYK</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1508:::fn <a href="gmlewis/image#CMYK">CMYK</a>::color_index_at(_self : <a href="gmlewis/image#CMYK">CMYK</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,1513:::fn <a href="gmlewis/image#CMYK">CMYK</a>::color_model(_self : <a href="gmlewis/image#CMYK">CMYK</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,1498:::fn <a href="gmlewis/image#CMYK">CMYK</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#CMYK">CMYK</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,1503:::fn <a href="gmlewis/image#CMYK">CMYK</a>::get_stride(self : <a href="gmlewis/image#CMYK">CMYK</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,1624:::fn <a href="gmlewis/image#CMYK">CMYK</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#CMYK">CMYK</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,1488:::fn <a href="gmlewis/image#CMYK">CMYK</a>::new_empty() -> <a href="gmlewis/image#CMYK">CMYK</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,1523:::fn <a href="gmlewis/image#CMYK">CMYK</a>::op_get(self : <a href="gmlewis/image#CMYK">CMYK</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,1618:::fn <a href="gmlewis/image#CMYK">CMYK</a>::opaque(_self : <a href="gmlewis/image#CMYK">CMYK</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,1555:::fn <a href="gmlewis/image#CMYK">CMYK</a>::pix_offset(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,1493:::fn <a href="gmlewis/image#CMYK">CMYK</a>::raw_data(self : <a href="gmlewis/image#CMYK">CMYK</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1533:::fn <a href="gmlewis/image#CMYK">CMYK</a>::rgba64_at(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1560:::fn <a href="gmlewis/image#CMYK">CMYK</a>::set(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_cmyk
  ```moonbit
  :::source,gmlewis/image/image.mbt,1590:::fn <a href="gmlewis/image#CMYK">CMYK</a>::set_cmyk(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#CMYK">@gmlewis/image/color.CMYK</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,1573:::fn <a href="gmlewis/image#CMYK">CMYK</a>::set_rgba64(self : <a href="gmlewis/image#CMYK">CMYK</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,1604:::fn <a href="gmlewis/image#CMYK">CMYK</a>::sub_image(self : <a href="gmlewis/image#CMYK">CMYK</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## Config

```moonbit
:::source,gmlewis/image/image.mbt,29:::pub(all) struct Config {
  color_model : <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  width : Int
  height : Int
}
```
 Config holds an image's color model and dimensions.

#### mooncakes-io-method-mark-Methods
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,36:::fn <a href="gmlewis/image#Config">Config</a>::new_empty() -> <a href="gmlewis/image#Config">Config</a>
  ```
  > 

## Gray

```moonbit
:::source,gmlewis/image/image.mbt,1173:::pub(all) struct Gray {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1227:::fn <a href="gmlewis/image#Gray">Gray</a>::at(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,1217:::fn <a href="gmlewis/image#Gray">Gray</a>::bounds(self : <a href="gmlewis/image#Gray">Gray</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1207:::fn <a href="gmlewis/image#Gray">Gray</a>::color_index_at(_self : <a href="gmlewis/image#Gray">Gray</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,1212:::fn <a href="gmlewis/image#Gray">Gray</a>::color_model(_self : <a href="gmlewis/image#Gray">Gray</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,1197:::fn <a href="gmlewis/image#Gray">Gray</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#Gray">Gray</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,1202:::fn <a href="gmlewis/image#Gray">Gray</a>::get_stride(self : <a href="gmlewis/image#Gray">Gray</a>) -> Int
  ```
  > 
- #### gray\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1239:::fn <a href="gmlewis/image#Gray">Gray</a>::gray_at(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Gray">@gmlewis/image/color.Gray</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,1312:::fn <a href="gmlewis/image#Gray">Gray</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Gray">Gray</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,1187:::fn <a href="gmlewis/image#Gray">Gray</a>::new_empty() -> <a href="gmlewis/image#Gray">Gray</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,1222:::fn <a href="gmlewis/image#Gray">Gray</a>::op_get(self : <a href="gmlewis/image#Gray">Gray</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1255:::fn <a href="gmlewis/image#Gray">Gray</a>::op_set(self : <a href="gmlewis/image#Gray">Gray</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,1306:::fn <a href="gmlewis/image#Gray">Gray</a>::opaque(_self : <a href="gmlewis/image#Gray">Gray</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,1250:::fn <a href="gmlewis/image#Gray">Gray</a>::pix_offset(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,1192:::fn <a href="gmlewis/image#Gray">Gray</a>::raw_data(self : <a href="gmlewis/image#Gray">Gray</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1232:::fn <a href="gmlewis/image#Gray">Gray</a>::rgba64_at(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1260:::fn <a href="gmlewis/image#Gray">Gray</a>::set(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_gray
  ```moonbit
  :::source,gmlewis/image/image.mbt,1281:::fn <a href="gmlewis/image#Gray">Gray</a>::set_gray(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Gray">@gmlewis/image/color.Gray</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,1270:::fn <a href="gmlewis/image#Gray">Gray</a>::set_rgba64(self : <a href="gmlewis/image#Gray">Gray</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,1292:::fn <a href="gmlewis/image#Gray">Gray</a>::sub_image(self : <a href="gmlewis/image#Gray">Gray</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## Gray16

```moonbit
:::source,gmlewis/image/image.mbt,1322:::pub(all) struct Gray16 {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1376:::fn <a href="gmlewis/image#Gray16">Gray16</a>::at(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,1366:::fn <a href="gmlewis/image#Gray16">Gray16</a>::bounds(self : <a href="gmlewis/image#Gray16">Gray16</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1356:::fn <a href="gmlewis/image#Gray16">Gray16</a>::color_index_at(_self : <a href="gmlewis/image#Gray16">Gray16</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,1361:::fn <a href="gmlewis/image#Gray16">Gray16</a>::color_model(_self : <a href="gmlewis/image#Gray16">Gray16</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,1346:::fn <a href="gmlewis/image#Gray16">Gray16</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#Gray16">Gray16</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,1351:::fn <a href="gmlewis/image#Gray16">Gray16</a>::get_stride(self : <a href="gmlewis/image#Gray16">Gray16</a>) -> Int
  ```
  > 
- #### gray16\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1387:::fn <a href="gmlewis/image#Gray16">Gray16</a>::gray16_at(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Gray16">@gmlewis/image/color.Gray16</a>
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,1464:::fn <a href="gmlewis/image#Gray16">Gray16</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Gray16">Gray16</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,1336:::fn <a href="gmlewis/image#Gray16">Gray16</a>::new_empty() -> <a href="gmlewis/image#Gray16">Gray16</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,1371:::fn <a href="gmlewis/image#Gray16">Gray16</a>::op_get(self : <a href="gmlewis/image#Gray16">Gray16</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1404:::fn <a href="gmlewis/image#Gray16">Gray16</a>::op_set(self : <a href="gmlewis/image#Gray16">Gray16</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,1458:::fn <a href="gmlewis/image#Gray16">Gray16</a>::opaque(_self : <a href="gmlewis/image#Gray16">Gray16</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,1399:::fn <a href="gmlewis/image#Gray16">Gray16</a>::pix_offset(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,1341:::fn <a href="gmlewis/image#Gray16">Gray16</a>::raw_data(self : <a href="gmlewis/image#Gray16">Gray16</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1381:::fn <a href="gmlewis/image#Gray16">Gray16</a>::rgba64_at(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1409:::fn <a href="gmlewis/image#Gray16">Gray16</a>::set(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_gray16
  ```moonbit
  :::source,gmlewis/image/image.mbt,1432:::fn <a href="gmlewis/image#Gray16">Gray16</a>::set_gray16(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Gray16">@gmlewis/image/color.Gray16</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,1420:::fn <a href="gmlewis/image#Gray16">Gray16</a>::set_rgba64(self : <a href="gmlewis/image#Gray16">Gray16</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,1444:::fn <a href="gmlewis/image#Gray16">Gray16</a>::sub_image(self : <a href="gmlewis/image#Gray16">Gray16</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## NRGBA

```moonbit
:::source,gmlewis/image/image.mbt,463:::pub(all) struct NRGBA {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,517:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::at(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,507:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::bounds(self : <a href="gmlewis/image#NRGBA">NRGBA</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,497:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::color_index_at(_self : <a href="gmlewis/image#NRGBA">NRGBA</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,502:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::color_model(_self : <a href="gmlewis/image#NRGBA">NRGBA</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,487:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#NRGBA">NRGBA</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,492:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::get_stride(self : <a href="gmlewis/image#NRGBA">NRGBA</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,635:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#NRGBA">NRGBA</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,477:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::new_empty() -> <a href="gmlewis/image#NRGBA">NRGBA</a>
  ```
  > 
- #### nrgba\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,528:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::nrgba_at(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#NRGBA">@gmlewis/image/color.NRGBA</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,512:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::op_get(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,549:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::op_set(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,615:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::opaque(self : <a href="gmlewis/image#NRGBA">NRGBA</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,544:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::pix_offset(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,482:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::raw_data(self : <a href="gmlewis/image#NRGBA">NRGBA</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,522:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::rgba64_at(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,554:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::set(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_nrgba
  ```moonbit
  :::source,gmlewis/image/image.mbt,587:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::set_nrgba(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#NRGBA">@gmlewis/image/color.NRGBA</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,567:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::set_rgba64(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,601:::fn <a href="gmlewis/image#NRGBA">NRGBA</a>::sub_image(self : <a href="gmlewis/image#NRGBA">NRGBA</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## NRGBA64

```moonbit
:::source,gmlewis/image/image.mbt,645:::pub(all) struct NRGBA64 {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,699:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::at(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,689:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::bounds(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,679:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::color_index_at(_self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,684:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::color_model(_self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,669:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,674:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::get_stride(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,833:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#NRGBA64">NRGBA64</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,659:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::new_empty() -> <a href="gmlewis/image#NRGBA64">NRGBA64</a>
  ```
  > 
- #### nrgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,710:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::nrgba64_at(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#NRGBA64">@gmlewis/image/color.NRGBA64</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,694:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::op_get(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,730:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::op_set(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,813:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::opaque(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,725:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::pix_offset(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,664:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::raw_data(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,704:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::rgba64_at(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,735:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::set(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_nrgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,776:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::set_nrgba64(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#NRGBA64">@gmlewis/image/color.NRGBA64</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,752:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::set_rgba64(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,799:::fn <a href="gmlewis/image#NRGBA64">NRGBA64</a>::sub_image(self : <a href="gmlewis/image#NRGBA64">NRGBA64</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## Paletted

```moonbit
:::source,gmlewis/image/image.mbt,1634:::pub(all) struct Paletted {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
  palette : <a href="gmlewis/image/color#Palette">@gmlewis/image/color.Palette</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1680:::fn <a href="gmlewis/image#Paletted">Paletted</a>::at(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,1670:::fn <a href="gmlewis/image#Paletted">Paletted</a>::bounds(self : <a href="gmlewis/image#Paletted">Paletted</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1738:::fn <a href="gmlewis/image#Paletted">Paletted</a>::color_index_at(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,1665:::fn <a href="gmlewis/image#Paletted">Paletted</a>::color_model(self : <a href="gmlewis/image#Paletted">Paletted</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,1655:::fn <a href="gmlewis/image#Paletted">Paletted</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#Paletted">Paletted</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,1660:::fn <a href="gmlewis/image#Paletted">Paletted</a>::get_stride(self : <a href="gmlewis/image#Paletted">Paletted</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,1808:::fn <a href="gmlewis/image#Paletted">Paletted</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>, p : <a href="gmlewis/image/color#Palette">@gmlewis/image/color.Palette</a>) -> <a href="gmlewis/image#Paletted">Paletted</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,1820:::fn <a href="gmlewis/image#Paletted">Paletted</a>::new_empty() -> <a href="gmlewis/image#Paletted">Paletted</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,1675:::fn <a href="gmlewis/image#Paletted">Paletted</a>::op_get(self : <a href="gmlewis/image#Paletted">Paletted</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1715:::fn <a href="gmlewis/image#Paletted">Paletted</a>::op_set(self : <a href="gmlewis/image#Paletted">Paletted</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,1782:::fn <a href="gmlewis/image#Paletted">Paletted</a>::opaque(self : <a href="gmlewis/image#Paletted">Paletted</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,1710:::fn <a href="gmlewis/image#Paletted">Paletted</a>::pix_offset(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,1650:::fn <a href="gmlewis/image#Paletted">Paletted</a>::raw_data(self : <a href="gmlewis/image#Paletted">Paletted</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,1692:::fn <a href="gmlewis/image#Paletted">Paletted</a>::rgba64_at(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,1720:::fn <a href="gmlewis/image#Paletted">Paletted</a>::set(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_color\_index
  ```moonbit
  :::source,gmlewis/image/image.mbt,1747:::fn <a href="gmlewis/image#Paletted">Paletted</a>::set_color_index(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int, index : Byte) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,1729:::fn <a href="gmlewis/image#Paletted">Paletted</a>::set_rgba64(self : <a href="gmlewis/image#Paletted">Paletted</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,1758:::fn <a href="gmlewis/image#Paletted">Paletted</a>::sub_image(self : <a href="gmlewis/image#Paletted">Paletted</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## Point

```moonbit
:::source,gmlewis/image/geom.mbt,10:::pub(all) struct Point {
  x : Int
  y : Int
}
```


#### mooncakes-io-method-mark-Methods
- #### div
  ```moonbit
  :::source,gmlewis/image/geom.mbt,36:::fn <a href="gmlewis/image#Point">Point</a>::div(self : <a href="gmlewis/image#Point">Point</a>, k : Int) -> <a href="gmlewis/image#Point">Point</a>
  ```
  >  div returns the vector p/k.
- #### is\_in
  ```moonbit
  :::source,gmlewis/image/geom.mbt,41:::fn <a href="gmlewis/image#Point">Point</a>::is_in(self : <a href="gmlewis/image#Point">Point</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Bool
  ```
  >  is\_in reports whether p is in r.
- #### mod
  ```moonbit
  :::source,gmlewis/image/geom.mbt,47:::fn <a href="gmlewis/image#Point">Point</a>::mod(self : <a href="gmlewis/image#Point">Point</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Point">Point</a>
  ```
  >  mod returns the point q in r such that p.X-q.X is a multiple of r's width
  > and p.Y-q.Y is a multiple of r's height.
- #### mul
  ```moonbit
  :::source,gmlewis/image/geom.mbt,31:::fn <a href="gmlewis/image#Point">Point</a>::mul(self : <a href="gmlewis/image#Point">Point</a>, k : Int) -> <a href="gmlewis/image#Point">Point</a>
  ```
  >  mul returns the vector p\*k.
- #### op\_add
  ```moonbit
  :::source,gmlewis/image/geom.mbt,21:::fn <a href="gmlewis/image#Point">Point</a>::op_add(self : <a href="gmlewis/image#Point">Point</a>, q : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image#Point">Point</a>
  ```
  >  op\_add (+) returns the vector p+q.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/image/geom.mbt,62:::fn <a href="gmlewis/image#Point">Point</a>::op_equal(self : <a href="gmlewis/image#Point">Point</a>, q : <a href="gmlewis/image#Point">Point</a>) -> Bool
  ```
  >  op\_equal reports whether p and q are equal.
- #### op\_sub
  ```moonbit
  :::source,gmlewis/image/geom.mbt,26:::fn <a href="gmlewis/image#Point">Point</a>::op_sub(self : <a href="gmlewis/image#Point">Point</a>, q : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image#Point">Point</a>
  ```
  >  op\_sub (-) returns the vector p-q.
- #### to\_string
  ```moonbit
  :::source,gmlewis/image/geom.mbt,16:::fn <a href="gmlewis/image#Point">Point</a>::to_string(self : <a href="gmlewis/image#Point">Point</a>) -> String
  ```
  >  to\_string returns a string representation of p like "(3,4)".

## RGBA

```moonbit
:::source,gmlewis/image/image.mbt,116:::pub(all) struct RGBA {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```
 RGBA is an in-memory image whose At method returns \[color.RGBA\] values.

#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,170:::fn <a href="gmlewis/image#RGBA">RGBA</a>::at(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,160:::fn <a href="gmlewis/image#RGBA">RGBA</a>::bounds(self : <a href="gmlewis/image#RGBA">RGBA</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,150:::fn <a href="gmlewis/image#RGBA">RGBA</a>::color_index_at(_self : <a href="gmlewis/image#RGBA">RGBA</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,155:::fn <a href="gmlewis/image#RGBA">RGBA</a>::color_model(_self : <a href="gmlewis/image#RGBA">RGBA</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,140:::fn <a href="gmlewis/image#RGBA">RGBA</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#RGBA">RGBA</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,145:::fn <a href="gmlewis/image#RGBA">RGBA</a>::get_stride(self : <a href="gmlewis/image#RGBA">RGBA</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,290:::fn <a href="gmlewis/image#RGBA">RGBA</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#RGBA">RGBA</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,130:::fn <a href="gmlewis/image#RGBA">RGBA</a>::new_empty() -> <a href="gmlewis/image#RGBA">RGBA</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,165:::fn <a href="gmlewis/image#RGBA">RGBA</a>::op_get(self : <a href="gmlewis/image#RGBA">RGBA</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,213:::fn <a href="gmlewis/image#RGBA">RGBA</a>::op_set(self : <a href="gmlewis/image#RGBA">RGBA</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,270:::fn <a href="gmlewis/image#RGBA">RGBA</a>::opaque(self : <a href="gmlewis/image#RGBA">RGBA</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,208:::fn <a href="gmlewis/image#RGBA">RGBA</a>::pix_offset(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,135:::fn <a href="gmlewis/image#RGBA">RGBA</a>::raw_data(self : <a href="gmlewis/image#RGBA">RGBA</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,175:::fn <a href="gmlewis/image#RGBA">RGBA</a>::rgba64_at(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### rgba\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,192:::fn <a href="gmlewis/image#RGBA">RGBA</a>::rgba_at(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA">@gmlewis/image/color.RGBA</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,218:::fn <a href="gmlewis/image#RGBA">RGBA</a>::set(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_rgba
  ```moonbit
  :::source,gmlewis/image/image.mbt,243:::fn <a href="gmlewis/image#RGBA">RGBA</a>::set_rgba(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA">@gmlewis/image/color.RGBA</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,231:::fn <a href="gmlewis/image#RGBA">RGBA</a>::set_rgba64(self : <a href="gmlewis/image#RGBA">RGBA</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,256:::fn <a href="gmlewis/image#RGBA">RGBA</a>::sub_image(self : <a href="gmlewis/image#RGBA">RGBA</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  >  sub\_image returns an image representing the portion of the image p visible
  > through r. The returned value shares pixels with the original image.

## RGBA64

```moonbit
:::source,gmlewis/image/image.mbt,300:::pub(all) struct RGBA64 {
  pix : <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  stride : Int
  rect : <a href="gmlewis/image#Rectangle">Rectangle</a>
}
```


#### mooncakes-io-method-mark-Methods
- #### at
  ```moonbit
  :::source,gmlewis/image/image.mbt,354:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::at(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### bounds
  ```moonbit
  :::source,gmlewis/image/image.mbt,344:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::bounds(self : <a href="gmlewis/image#RGBA64">RGBA64</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  > 
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,334:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::color_index_at(_self : <a href="gmlewis/image#RGBA64">RGBA64</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/image.mbt,339:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::color_model(_self : <a href="gmlewis/image#RGBA64">RGBA64</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  > 
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/image.mbt,324:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#RGBA64">RGBA64</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/image.mbt,329:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::get_stride(self : <a href="gmlewis/image#RGBA64">RGBA64</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,gmlewis/image/image.mbt,453:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::new(r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#RGBA64">RGBA64</a>!<a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,314:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::new_empty() -> <a href="gmlewis/image#RGBA64">RGBA64</a>
  ```
  > 
- #### op\_get
  ```moonbit
  :::source,gmlewis/image/image.mbt,349:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::op_get(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  > 
- #### op\_set
  ```moonbit
  :::source,gmlewis/image/image.mbt,379:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::op_set(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, p : <a href="gmlewis/image#Point">Point</a>, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### opaque
  ```moonbit
  :::source,gmlewis/image/image.mbt,433:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::opaque(self : <a href="gmlewis/image#RGBA64">RGBA64</a>) -> Bool
  ```
  > 
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/image.mbt,374:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::pix_offset(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, x : Int, y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/image.mbt,319:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::raw_data(self : <a href="gmlewis/image#RGBA64">RGBA64</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/image.mbt,359:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::rgba64_at(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  > 
- #### set
  ```moonbit
  :::source,gmlewis/image/image.mbt,384:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::set(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### set\_rgba64
  ```moonbit
  :::source,gmlewis/image/image.mbt,401:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::set_rgba64(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, x : Int, y : Int, c : <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>) -> Unit
  ```
  > 
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/image.mbt,419:::fn <a href="gmlewis/image#RGBA64">RGBA64</a>::sub_image(self : <a href="gmlewis/image#RGBA64">RGBA64</a>, r : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 

## Rectangle

```moonbit
:::source,gmlewis/image/geom.mbt,79:::pub(all) struct Rectangle {
  min : <a href="gmlewis/image#Point">Point</a>
  max : <a href="gmlewis/image#Point">Point</a>
}
```
 A Rectangle contains the points with Min.X \<= X \< Max.X, Min.Y \<= Y \< Max.Y.
It is well-formed if Min.X \<= Max.X and likewise for Y. Points are always
well-formed. A rectangle's methods always return well-formed outputs for
well-formed inputs.

 A Rectangle is also an \[Image\] whose bounds are the rectangle itself. At
returns color.Opaque for points in the rectangle and color.Transparent
otherwise.

#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,gmlewis/image/geom.mbt,163:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::add(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  add returns the rectangle r translated by p.
- #### at
  ```moonbit
  :::source,gmlewis/image/geom.mbt,302:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::at(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>
  ```
  >  at implements the \[Image\] trait.
- #### bounds
  ```moonbit
  :::source,gmlewis/image/geom.mbt,318:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::bounds(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  bounds implements the \[Image\] trait.
- #### canon
  ```moonbit
  :::source,gmlewis/image/geom.mbt,286:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::canon(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  canon returns the canonical version of r. The returned rectangle has minimum
  > and maximum coordinates swapped if necessary so that it is well-formed.
- #### color\_index\_at
  ```moonbit
  :::source,gmlewis/image/geom.mbt,128:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::color_index_at(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>, _x : Int, _y : Int) -> Byte
  ```
  > 
- #### color\_model
  ```moonbit
  :::source,gmlewis/image/geom.mbt,323:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::color_model(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image/color#Model">@gmlewis/image/color.Model</a>
  ```
  >  color\_model implements the \[Image\] trait.
- #### copy
  ```moonbit
  :::source,gmlewis/image/geom.mbt,138:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::copy(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  copy makes a copy of the provided rectangle without changing it.
- #### dx
  ```moonbit
  :::source,gmlewis/image/geom.mbt,148:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::dx(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Int
  ```
  >  dx returns r's width.
- #### dy
  ```moonbit
  :::source,gmlewis/image/geom.mbt,153:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::dy(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Int
  ```
  >  dy returns r's height.
- #### empty
  ```moonbit
  :::source,gmlewis/image/geom.mbt,251:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::empty(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Bool
  ```
  >  empty reports whether the rectangle contains no points.
- #### get\_bytes\_per\_pixel
  ```moonbit
  :::source,gmlewis/image/geom.mbt,118:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::get_bytes_per_pixel(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Int
  ```
  > 
- #### get\_stride
  ```moonbit
  :::source,gmlewis/image/geom.mbt,123:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::get_stride(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Int
  ```
  > 
- #### inset
  ```moonbit
  :::source,gmlewis/image/geom.mbt,181:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::inset(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, n : Int) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  inset returns the rectangle r inset by n, which may be negative. If either
  > of r's dimensions is less than 2\*n then an empty rectangle near the center
  > of r will be returned.
- #### intersect
  ```moonbit
  :::source,gmlewis/image/geom.mbt,202:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::intersect(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, s : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  intersect returns the largest rectangle contained by both r and s. If the
  > two rectangles do not overlap then the zero rectangle will be returned.
- #### is\_in
  ```moonbit
  :::source,gmlewis/image/geom.mbt,272:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::is_in(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, s : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Bool
  ```
  >  is\_in reports whether every point in r is in s.
- #### new
  ```moonbit
  :::source,gmlewis/image/geom.mbt,88:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::new() -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  Rectangle::new returns an empty (all zeros) rectangle.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/image/geom.mbt,257:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::op_equal(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, s : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Bool
  ```
  >  op\_equal reports whether r and s contain the same set of points. All empty
  > rectangles are considered equal.
- #### opaque
  ```moonbit
  :::source,gmlewis/image/geom.mbt,93:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::opaque(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Bool
  ```
  > 
- #### overlaps
  ```moonbit
  :::source,gmlewis/image/geom.mbt,262:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::overlaps(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, s : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> Bool
  ```
  >  overlaps reports whether r and s have a non-empty intersection.
- #### pix\_offset
  ```moonbit
  :::source,gmlewis/image/geom.mbt,133:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::pix_offset(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>, _x : Int, _y : Int) -> Int
  ```
  > 
- #### raw\_data
  ```moonbit
  :::source,gmlewis/image/geom.mbt,113:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::raw_data(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/io#Slice">@gmlewis/io.Slice</a>[Byte]
  ```
  > 
- #### rgba64\_at
  ```moonbit
  :::source,gmlewis/image/geom.mbt,310:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::rgba64_at(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, x : Int, y : Int) -> <a href="gmlewis/image/color#RGBA64">@gmlewis/image/color.RGBA64</a>
  ```
  >  rgba64\_at implements the \[RGBA64Image\] trait.
- #### set
  ```moonbit
  :::source,gmlewis/image/geom.mbt,98:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::set(_self : <a href="gmlewis/image#Rectangle">Rectangle</a>, _x : Int, _y : Int, _c : <a href="gmlewis/image/color#Color">@gmlewis/image/color.Color</a>) -> Unit
  ```
  > 
- #### size
  ```moonbit
  :::source,gmlewis/image/geom.mbt,158:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::size(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Point">Point</a>
  ```
  >  size returns r's width and height.
- #### sub
  ```moonbit
  :::source,gmlewis/image/geom.mbt,171:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::sub(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, p : <a href="gmlewis/image#Point">Point</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  sub returns the rectangle r translated by -p.
- #### sub\_image
  ```moonbit
  :::source,gmlewis/image/geom.mbt,108:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::sub_image(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, _o : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,gmlewis/image/geom.mbt,143:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::to_string(self : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> String
  ```
  >  to\_string returns a string representation of r like "(3,4)-(6,5)".
- #### union
  ```moonbit
  :::source,gmlewis/image/geom.mbt,227:::fn <a href="gmlewis/image#Rectangle">Rectangle</a>::union(self : <a href="gmlewis/image#Rectangle">Rectangle</a>, s : <a href="gmlewis/image#Rectangle">Rectangle</a>) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
  ```
  >  union returns the smallest rectangle that contains both r and s.

## SizeError

```moonbit
:::source,gmlewis/image/image.mbt,94:::type SizeError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/image/image.mbt,94:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/image.mbt,94:::fn op_equal(<a href="gmlewis/image#SizeError">SizeError</a>, <a href="gmlewis/image#SizeError">SizeError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/image/image.mbt,94:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/image#SizeError">SizeError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/image/image.mbt,94:::fn output(<a href="gmlewis/image#SizeError">SizeError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## add2\_non\_neg

```moonbit
:::source,gmlewis/image/geom.mbt,356:::fn add2_non_neg(x : Int, y : Int) -> Int
```
 add2\_non\_neg returns (x + y), unless at least one argument is negative or if
the computation overflows the int type, in which case it returns -1.

## mul3\_non\_neg

```moonbit
:::source,gmlewis/image/geom.mbt,338:::fn mul3_non_neg(x : Int, y : Int, z : Int) -> Int
```
 mul3\_non\_neg returns (x \* y \* z), unless at least one argument is negative or
if the computation overflows the int type, in which case it returns -1.

## pt

```moonbit
:::source,gmlewis/image/geom.mbt,67:::fn pt(x : Int, y : Int) -> <a href="gmlewis/image#Point">Point</a>
```
 pt is shorthand for \[Point\]{X, Y}.

## rect

```moonbit
:::source,gmlewis/image/geom.mbt,330:::fn rect(x0 : Int, y0 : Int, x1 : Int, y1 : Int) -> <a href="gmlewis/image#Rectangle">Rectangle</a>
```
 rect is shorthand for \[Rectangle\]{Pt(x0, y0), \[Pt\](x1, y1)}. The returned
rectangle has minimum and maximum coordinates swapped if necessary so that
it is well-formed.

## Image


#### mooncakes-io-method-mark-Methods
- #### empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,75:::fn <a href="gmlewis/image#Image">Image</a>::empty(self : <a href="gmlewis/image#Image">Image</a>) -> Bool
  ```
  > 
- #### new\_empty
  ```moonbit
  :::source,gmlewis/image/image.mbt,70:::fn <a href="gmlewis/image#Image">Image</a>::new_empty() -> <a href="gmlewis/image#Image">Image</a>
  ```
  > 
