# Documentation
|Type|description|
|---|---|
|[CanavsLineCap](#CanavsLineCap)||
|[Canvas2D](#Canvas2D)| CanvasRenderingContext2D|
|[CanvasFillRule](#CanvasFillRule)| Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill|
|[CanvasGradient](#CanvasGradient)| CanvasGradient|
|[CanvasImageSource](#CanvasImageSource)||
|[CanvasLineJoin](#CanvasLineJoin)||
|[CanvasPattern](#CanvasPattern)| CanvasPattern|
|[CanvasStrokeFillStyle](#CanvasStrokeFillStyle)| String \| CanvasGradient \| CanvasPattern|
|[HTMLCanvasElement](#HTMLCanvasElement)||
|[HTMLImageElement](#HTMLImageElement)||
|[KeyboardEvent](#KeyboardEvent)||
|[MouseEvent](#MouseEvent)||
|[Path2D](#Path2D)| Path2D|
|[WheelEvent](#WheelEvent)||

|Value|description|
|---|---|
|[cancel\_animation\_frame](#cancel_animation_frame)| Reference: https://developer.mozilla.org/en-US/docs/Web/API/Window/cancelAnimationFrame|
|[request\_animation\_frame](#request_animation_frame)| Reference: https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame|
|[set\_on\_key\_down](#set_on_key_down)| Reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/keydown\_event|
|[set\_on\_key\_up](#set_on_key_up)| Reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/keyup\_event|
|[set\_on\_mouse\_enter](#set_on_mouse_enter)| Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/Element/mouseenter\_event|
|[set\_on\_mouse\_move](#set_on_mouse_move)| Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/Element/mousemove\_event|
|[set\_on\_wheel](#set_on_wheel)| Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/Element/wheel\_event|

## CanavsLineCap

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,49:::pub(all) enum CanavsLineCap {
  Butt
  Round
  Square
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/types.mbt,55:::fn <a href="peter-jerry-ye/canvas/lib#CanavsLineCap">CanavsLineCap</a>::to_string(self : <a href="peter-jerry-ye/canvas/lib#CanavsLineCap">CanavsLineCap</a>) -> String
  ```
  > 

## Canvas2D

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,18:::pub(all) type Canvas2D
```
 CanvasRenderingContext2D
 
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D

#### mooncakes-io-method-mark-Methods
- #### begin\_path
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,43:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::begin_path(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/beginPath
- #### clear\_rect
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,34:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::clear_rect(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, x : Double, y : Double, width : Double, height : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/clearRect
- #### close\_path
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,46:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::close_path(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/closePath
- #### draw\_image
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,339:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::draw_image(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, image : <a href="peter-jerry-ye/canvas/lib#CanvasImageSource">CanvasImageSource</a>, dx : Double, dy : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage
  >  
  >  3-argument syntax
- #### draw\_image\_subpart\_with\_dimention
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,377:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::draw_image_subpart_with_dimention(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, image : <a href="peter-jerry-ye/canvas/lib#CanvasImageSource">CanvasImageSource</a>, sx : Double, sy : Double, swidth : Double, sheight : Double, dx : Double, dy : Double, dwidth : Double, dheight : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage
  >  
  >  7-argument syntax
- #### draw\_image\_with\_dimension
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,356:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::draw_image_with_dimension(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, image : <a href="peter-jerry-ye/canvas/lib#CanvasImageSource">CanvasImageSource</a>, dx : Double, dy : Double, dwidth : Double, dheight : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage
  >  
  >  5-argument syntax
- #### fill
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,79:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::fill(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, path~ : <a href="peter-jerry-ye/canvas/lib#Path2D">Path2D</a>? = .., fillRule~ : <a href="peter-jerry-ye/canvas/lib#CanvasFillRule">CanvasFillRule</a>? = ..) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill
- #### fill\_rect
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,25:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::fill_rect(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, x : Double, y : Double, width : Double, height : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillRect
- #### fill\_text
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,113:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::fill_text(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, text : String, x : Double, y : Double, max_width~ : Double? = ..) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillText
- #### get\_line\_cap
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,176:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::get_line_cap(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> <a href="peter-jerry-ye/canvas/lib#CanavsLineCap">CanavsLineCap</a>
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
- #### get\_line\_dash
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,224:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::get_line_dash(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Double]
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/getLineDash
- #### get\_line\_join
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,197:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::get_line_join(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> <a href="peter-jerry-ye/canvas/lib#CanvasLineJoin">CanvasLineJoin</a>
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
  >  
  >  `join` is one of : "round" "bevel" "miter
- #### get\_line\_width
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,168:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::get_line_width(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth
- #### get\_miter\_limit
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,216:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::get_miter_limit(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/miterLimit
- #### line\_to
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,52:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::line_to(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, x : Double, y : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineTo
- #### move\_to
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,49:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::move_to(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, x : Double, y : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/moveTo
- #### scale
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,402:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::scale(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, x : Double, y : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/scale
- #### set\_fill\_style
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,262:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_fill_style(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, style : <a href="peter-jerry-ye/canvas/lib#CanvasStrokeFillStyle">CanvasStrokeFillStyle</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle
  >  
  >  The parameter is a string parsed as CSS <color> value.
- #### set\_font
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,274:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_font(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, font : String) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/font
- #### set\_line\_cap
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,188:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_line_cap(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, cap : <a href="peter-jerry-ye/canvas/lib#CanavsLineCap">CanavsLineCap</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
- #### set\_line\_dash
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,231:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_line_dash(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, segments : <a href="moonbitlang/core/array#Array">Array</a>[Double]) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/setLineDash
- #### set\_line\_join
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,211:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_line_join(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, join : <a href="peter-jerry-ye/canvas/lib#CanvasLineJoin">CanvasLineJoin</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
  >  
  >  `join` is one of : "round" "bevel" "miter"
- #### set\_line\_width
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,171:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_line_width(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, width : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth
- #### set\_miter\_limit
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,219:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_miter_limit(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, limit : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/miterLimit
- #### set\_stroke\_style
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,244:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::set_stroke_style(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, style : <a href="peter-jerry-ye/canvas/lib#CanvasStrokeFillStyle">CanvasStrokeFillStyle</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeStyle
  >  
  >  The parameter is a string parsed as CSS <color> value.
- #### stroke
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,59:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::stroke(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, path~ : <a href="peter-jerry-ye/canvas/lib#Path2D">Path2D</a>? = ..) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/stroke
- #### stroke\_rect
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,16:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::stroke_rect(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, x : Double, y : Double, width : Double, height : Double) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeRect
- #### stroke\_text
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/canvas.wasm-gc.mbt,148:::fn <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>::stroke_text(self : <a href="peter-jerry-ye/canvas/lib#Canvas2D">Canvas2D</a>, text : String, x : Double, y : Double, max_width~ : Double? = ..) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeText

## CanvasFillRule

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,64:::pub(all) enum CanvasFillRule {
  Nonzero
  Evenodd
}
```
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/types.mbt,69:::fn <a href="peter-jerry-ye/canvas/lib#CanvasFillRule">CanvasFillRule</a>::to_string(self : <a href="peter-jerry-ye/canvas/lib#CanvasFillRule">CanvasFillRule</a>) -> String
  ```
  > 

## CanvasGradient

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,28:::pub(all) type CanvasGradient
```
 CanvasGradient
 
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasGradient

## CanvasImageSource

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,93:::pub(all) enum CanvasImageSource {
  HTMLImageElement(<a href="peter-jerry-ye/canvas/lib#HTMLImageElement">HTMLImageElement</a>)
  HTMLCanvasElement(<a href="peter-jerry-ye/canvas/lib#HTMLCanvasElement">HTMLCanvasElement</a>)
}
```


## CanvasLineJoin

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,35:::pub(all) enum CanvasLineJoin {
  Bevel
  Miter
  Round
}
```


#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/types.mbt,41:::fn <a href="peter-jerry-ye/canvas/lib#CanvasLineJoin">CanvasLineJoin</a>::to_string(self : <a href="peter-jerry-ye/canvas/lib#CanvasLineJoin">CanvasLineJoin</a>) -> String
  ```
  > 

## CanvasPattern

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,23:::pub(all) type CanvasPattern
```
 CanvasPattern
 
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasPattern

## CanvasStrokeFillStyle

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,77:::pub(all) enum CanvasStrokeFillStyle {
  Color(String)
  Gradient(<a href="peter-jerry-ye/canvas/lib#CanvasGradient">CanvasGradient</a>)
  Pattern(<a href="peter-jerry-ye/canvas/lib#CanvasPattern">CanvasPattern</a>)
}
```
 String \| CanvasGradient \| CanvasPattern

## HTMLCanvasElement

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,91:::pub(all) type HTMLCanvasElement
```


## HTMLImageElement

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,89:::pub(all) type HTMLImageElement
```


#### mooncakes-io-method-mark-Methods
- #### make
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/image.wasm-gc.mbt,25:::fn <a href="peter-jerry-ye/canvas/lib#HTMLImageElement">HTMLImageElement</a>::make(width~ : Int? = .., height~ : Int? = ..) -> <a href="peter-jerry-ye/canvas/lib#HTMLImageElement">HTMLImageElement</a>
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/Image
- #### set\_src
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/image.wasm-gc.mbt,42:::fn <a href="peter-jerry-ye/canvas/lib#HTMLImageElement">HTMLImageElement</a>::set_src(image : <a href="peter-jerry-ye/canvas/lib#HTMLImageElement">HTMLImageElement</a>, src : String) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/src

## KeyboardEvent

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,83:::pub(all) type KeyboardEvent
```


#### mooncakes-io-method-mark-Methods
- #### code
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/keyboard_event.wasm-gc.mbt,23:::fn <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>::code(self : <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>) -> String
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/code
- #### is\_composing
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/keyboard_event.wasm-gc.mbt,30:::fn <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>::is_composing(self : <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/isComposing
- #### key
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/keyboard_event.wasm-gc.mbt,16:::fn <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>::key(self : <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>) -> String
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key
- #### prevent\_default
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/keyboard_event.wasm-gc.mbt,33:::fn <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>::prevent_default(self : <a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault

## MouseEvent

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,85:::pub(all) type MouseEvent
```


#### mooncakes-io-method-mark-Methods
- #### alt\_key
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,22:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::alt_key(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Bool
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/altKey
- #### buttons
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,16:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::buttons(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Int
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/buttons
- #### ctrl\_key
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,25:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::ctrl_key(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Bool
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/ctrlKey
- #### offset\_x
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,31:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::offset_x(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/offsetX
- #### offset\_y
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,34:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::offset_y(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/offsetY
- #### prevent\_default
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,19:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::prevent_default(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
- #### shift\_key
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/mouse_event.wasm-gc.mbt,28:::fn <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>::shift_key(self : <a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Bool
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/shiftKey

## Path2D

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,33:::pub(all) type Path2D
```
 Path2D
 
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/Path2D

## WheelEvent

```moonbit
:::source,peter-jerry-ye/canvas/lib/types.mbt,87:::pub(all) type WheelEvent
```


#### mooncakes-io-method-mark-Methods
- #### delta\_mode
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/wheel_event.wasm-gc.mbt,25:::fn <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>::delta_mode(self : <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>) -> Int
  ```
  >  Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaMode
- #### delta\_x
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/wheel_event.wasm-gc.mbt,16:::fn <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>::delta_x(self : <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaX
- #### delta\_y
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/wheel_event.wasm-gc.mbt,19:::fn <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>::delta_y(self : <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaY
- #### delta\_z
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/wheel_event.wasm-gc.mbt,22:::fn <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>::delta_z(self : <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>) -> Double
  ```
  >  Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaZ
- #### prevent\_default
  ```moonbit
  :::source,peter-jerry-ye/canvas/lib/wheel_event.wasm-gc.mbt,28:::fn <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>::prevent_default(self : <a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>) -> Unit
  ```
  >  Reference: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault

## cancel\_animation\_frame

```moonbit
:::source,peter-jerry-ye/canvas/lib/animation.wasm-gc.mbt,25:::fn cancel_animation_frame(requestID : Int64) -> Unit
```
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/Window/cancelAnimationFrame

## request\_animation\_frame

```moonbit
:::source,peter-jerry-ye/canvas/lib/animation.wasm-gc.mbt,18:::fn request_animation_frame(callback : (Int64) -> Unit) -> Int64
```
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame

## set\_on\_key\_down

```moonbit
:::source,peter-jerry-ye/canvas/lib/event.wasm-gc.mbt,16:::fn set_on_key_down(callback : (<a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit) -> Unit
```
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/keydown\_event

## set\_on\_key\_up

```moonbit
:::source,peter-jerry-ye/canvas/lib/event.wasm-gc.mbt,19:::fn set_on_key_up(callback : (<a href="peter-jerry-ye/canvas/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit) -> Unit
```
 Reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/keyup\_event

## set\_on\_mouse\_enter

```moonbit
:::source,peter-jerry-ye/canvas/lib/event.wasm-gc.mbt,28:::fn set_on_mouse_enter(callback : (<a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Unit) -> Unit
```
 Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/Element/mouseenter\_event

## set\_on\_mouse\_move

```moonbit
:::source,peter-jerry-ye/canvas/lib/event.wasm-gc.mbt,25:::fn set_on_mouse_move(callback : (<a href="peter-jerry-ye/canvas/lib#MouseEvent">MouseEvent</a>) -> Unit) -> Unit
```
 Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/Element/mousemove\_event

## set\_on\_wheel

```moonbit
:::source,peter-jerry-ye/canvas/lib/event.wasm-gc.mbt,22:::fn set_on_wheel(callback : (<a href="peter-jerry-ye/canvas/lib#WheelEvent">WheelEvent</a>) -> Unit) -> Unit
```
 Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/Element/wheel\_event
