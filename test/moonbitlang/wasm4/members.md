# Wasm4 Binding for MoonBit

This is an opinionated binding for [Wasm4](https://wasm4.org) in MoonBit.

## Prerequisites

- MoonBit toolchain
- [Node.js](https://nodejs.org/en)

## Usage

- Add this package: `moon add moonbitlang/wasm4`
- Develop with this package as other packages
- Optionally export a function called `start` that will be executed once on
  initialization and export a function called `update` that will be executed at
  60Hz for the expected backend
- Import a memory with the module of `env` and name of `memory`
- Build with `moon build --target <wasm-gc or wasm>` with the respective backend
- Execute `npx wasm4 run <target>.wasm`. The target should be located in
  `target/wasm/release/build/<package path>/<package name>.wasm` for wasm
  backend, or `target/wasm-gc/release/build/<package path>/<package name>.wasm`
  for wasm-gc backend. The browser should open automatically and display the
  game. Enjoy

## Examples

The snake example (adapted from the Wasm4 documentation) demonstrates the usage. You may execute

```bash
moon build --source-dir example/snake --target wasm
npx wasm4 run example/snake/target/wasm/release/build/snake.wasm
```

and enjoy the game.

## References

- For more information about MoonBit, visit:
  [MoonBit official website](https://www.moonbitlang.com/docs/syntax)
- For more information about Wasm4 and how to play, visit:
  [WASM-4 Documentation](https://wasm4.org/docs/)

---
# Documentation
|Type|description|
|---|---|
|[ADSR](#ADSR)| An ADSR volume envelop|
|[ADSRVolume](#ADSRVolume)| The volume of an ADSR envelope|
|[BlitFlag](#BlitFlag)| one\_bit\_per\_pixel: Sprite pixel format: 1BPP or 2BPP|
|[Color](#Color)||
|[GamePad](#GamePad)||
|[Mouse](#Mouse)||
|[Netplay](#Netplay)| Status of netplay|
|[Note](#Note)| Notes with pitch bend|
|[Sprite](#Sprite)||
|[ToneChannel](#ToneChannel)||
|[ToneFlag](#ToneFlag)| Flags that modify behavior of \`tone\`|
|[ToneMode](#ToneMode)||
|[TonePan](#TonePan)||

|Value|description|
|---|---|
|[disk\_read](#disk_read)| Reads up to \`size\` bytes from persistent storage into \`bytes\`.|
|[disk\_write](#disk_write)| Writes up to \`size\` bytes from \`bytes\` into persistent storage.|
|[get\_draw\_colors](#get_draw_colors)| Gets the draw color at the given index.|
|[get\_frame\_buffer](#get_frame_buffer)| Get the palette index of the pixel at the specified index.|
|[get\_gamepad](#get_gamepad)| Gets the state of the gamepads.|
|[get\_mouse](#get_mouse)| Gets the state of the mouse.|
|[get\_netplay](#get_netplay)| Gets the state of the netplay.|
|[get\_palette](#get_palette)| Gets the color of the palette at the given index.|
|[get\_system\_hide\_gamepad\_overlay](#get_system_hide_gamepad_overlay)||
|[get\_system\_preserve\_framebuffer](#get_system_preserve_framebuffer)||
|[hline](#hline)| Draws a horizontal line between \`(x, y)\` and \`(x + len - 1, y)\`|
|[line](#line)| Draws a line between two points|
|[oval](#oval)| Draws an oval (or circle).|
|[rect](#rect)| Draws a rectangle.|
|[rgb](#rgb)||
|[screen\_height](#screen_height)||
|[screen\_width](#screen_width)||
|[set\_draw\_colors](#set_draw_colors)| Sets the draw color at the given index.|
|[set\_frame\_buffer](#set_frame_buffer)| Manipulate the framebuffer directly.|
|[set\_palette](#set_palette)| Sets the color of the palette at the given index.|
|[set\_system\_hide\_gamepad\_overlay](#set_system_hide_gamepad_overlay)||
|[set\_system\_preserve\_framebuffer](#set_system_preserve_framebuffer)||
|[sprite](#sprite)||
|[text](#text)| Draws text using the built-in system font. The string may contain new-line (\`\\n\`) characters.|
|[tone](#tone)| Plays a sound tone|
|[tone\_note\_mode](#tone_note_mode)| Plays a sound tone in note mode|
|[trace](#trace)| Prints a message to the debug console|
|[vline](#vline)| Draws a vertical line between \`(x, y)\` and \`(x, y + len - 1)\`|

## ADSR

```moonbit
:::source,moonbitlang/wasm4/function.mbt,135:::pub struct ADSR {
  sustain : UInt
  release : UInt
  decay : UInt
  attack : UInt
}
```
 An ADSR volume envelop
 
 The envelope starts at zero volume,
then raises to the peak volume over the attack time,
lowers to the sustain volume during the decay time,
remains at the sustain volume during the sustain time,
and finally fades to zero volume during the release time.  
Duration of each phase is specified in frames (1/60th of a second).

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/wasm4/function.mbt,150:::fn <a href="moonbitlang/wasm4#ADSR">ADSR</a>::new(sustain : UInt, release~ : UInt = .., decay~ : UInt = .., attack~ : UInt = ..) -> <a href="moonbitlang/wasm4#ADSR">ADSR</a>
  ```
  >  An ADSR volume envelop
  >  
  >  The envelope starts at zero volume,
  > then raises to the peak volume over the attack time,
  > lowers to the sustain volume during the decay time,
  > remains at the sustain volume during the sustain time,
  > and finally fades to zero volume during the release time.  
  > Duration of each phase is specified in frames (1/60th of a second).

## ADSRVolume

```moonbit
:::source,moonbitlang/wasm4/function.mbt,162:::pub struct ADSRVolume {
  sustain : UInt
  peak : UInt
}
```
 The volume of an ADSR envelope
 
 The volume used for the sustain duration, and the peak volume (default to 100 if zero) reached by the attack duration.

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/wasm4/function.mbt,170:::fn <a href="moonbitlang/wasm4#ADSRVolume">ADSRVolume</a>::new(sustain : UInt, peak~ : UInt = ..) -> <a href="moonbitlang/wasm4#ADSRVolume">ADSRVolume</a>
  ```
  >  The volume of an ADSR envelope
  >  
  >  The volume used for the sustain duration, and the peak volume (default to 100 if zero) reached by the attack duration.

## BlitFlag

```moonbit
:::source,moonbitlang/wasm4/function.mbt,25:::pub(all) struct BlitFlag {
  one_bit_per_pixel : Bool
  flip_x : Bool
  flip_y : Bool
  rotate : Bool
}
```
 one\_bit\_per\_pixel: Sprite pixel format: 1BPP or 2BPP
flip\_x: flip the sprite horizontally
flip\_y: flip the sprite vertically
rotate: rotate the sprite anti-clockwise 90 degrees, applied after any flipping

## Color

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,15:::type Color
```


## GamePad

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,74:::pub struct GamePad {
  button_1 : Bool
  button_2 : Bool
  button_left : Bool
  button_right : Bool
  button_up : Bool
  button_down : Bool
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/wasm4/memory.mbt,81:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="moonbitlang/wasm4#GamePad">GamePad</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/wasm4/memory.mbt,81:::fn default() -> <a href="moonbitlang/wasm4#GamePad">GamePad</a>
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/wasm4/memory.mbt,81:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/wasm4#GamePad">GamePad</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/wasm4/memory.mbt,81:::fn op_equal(<a href="moonbitlang/wasm4#GamePad">GamePad</a>, <a href="moonbitlang/wasm4#GamePad">GamePad</a>) -> Bool
    ```
    > automatically derived

## Mouse

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,103:::pub struct Mouse {
  x : Int
  y : Int
  left : Bool
  middle : Bool
  right : Bool
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/wasm4/memory.mbt,109:::impl <a href="moonbitlang/core/builtin#Default">Default</a> for <a href="moonbitlang/wasm4#Mouse">Mouse</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/wasm4/memory.mbt,109:::fn default() -> <a href="moonbitlang/wasm4#Mouse">Mouse</a>
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/wasm4/memory.mbt,109:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/wasm4#Mouse">Mouse</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/wasm4/memory.mbt,109:::fn op_equal(<a href="moonbitlang/wasm4#Mouse">Mouse</a>, <a href="moonbitlang/wasm4#Mouse">Mouse</a>) -> Bool
    ```
    > automatically derived

## Netplay

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,170:::pub struct Netplay {
  index : UInt
  active : Bool
}
```
 Status of netplay
 
 The index is from 1 to 4 (inclusive)

## Note

```moonbit
:::source,moonbitlang/wasm4/function.mbt,178:::pub struct Note {
  note : UInt
  bend : UInt
}
```
 Notes with pitch bend
 
 @param note Specified in MIDI note format, e.g. 60 = C4, 69 = A4.  
@param bend Bend note upwards. 0 = Nothing, 255 = One 256th away from the next note above

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/wasm4/function.mbt,187:::fn <a href="moonbitlang/wasm4#Note">Note</a>::new(note : UInt, bend~ : UInt = ..) -> <a href="moonbitlang/wasm4#Note">Note</a>
  ```
  >  Notes with pitch bend
  >  
  >  @param note Specified in MIDI note format, e.g. 60 = C4, 69 = A4.  
  > @param bend Bend note upwards. 0 = Nothing, 255 = One 256th away from the next note above

## Sprite

```moonbit
:::source,moonbitlang/wasm4/function.mbt,15:::type Sprite
```


#### mooncakes-io-method-mark-Methods
- #### blit
  ```moonbit
  :::source,moonbitlang/wasm4/function.mbt,47:::fn <a href="moonbitlang/wasm4#Sprite">Sprite</a>::blit(self : <a href="moonbitlang/wasm4#Sprite">Sprite</a>, x : Int, y : Int, width : Int, height : Int, flags : <a href="moonbitlang/wasm4#BlitFlag">BlitFlag</a>) -> Unit
  ```
  >  Copies pixels to the framebuffer.
  >  
  >  @param spritePtr raw pixel data stored in either 1BPP or 2BPP format.
  > @param x X position in the destination framebuffer.
  > @param y Y position in the destination framebuffer.
  > @param width Width of the sprite.
  > @param height Height of the sprite.
  > @param flags Flags that modify behavior.
- #### blit\_sub
  ```moonbit
  :::source,moonbitlang/wasm4/function.mbt,65:::fn <a href="moonbitlang/wasm4#Sprite">Sprite</a>::blit_sub(self : <a href="moonbitlang/wasm4#Sprite">Sprite</a>, x : Int, y : Int, width : Int, height : Int, src_x : Int, src_y : Int, stride : Int, flags : <a href="moonbitlang/wasm4#BlitFlag">BlitFlag</a>) -> Unit
  ```
  >  Copies a subregion within a larger sprite atlas to the framebuffer. Same as blit, but with 3 additional parameters.
  >  
  >  @param srcX Source X position of the sprite region.
  > @param srcY Source Y position of the sprite region.
  > @param stride Total width of the overall sprite atlas. This is typically larger than width.
  > For info on other parameters, see blit().

## ToneChannel

```moonbit
:::source,moonbitlang/wasm4/function.mbt,207:::pub(all) enum ToneChannel {
  Pulse1
  Pulse2
  Triangle
  Noise
}
```


## ToneFlag

```moonbit
:::source,moonbitlang/wasm4/function.mbt,192:::pub struct ToneFlag {
  channel : <a href="moonbitlang/wasm4#ToneChannel">ToneChannel</a>
  mode : <a href="moonbitlang/wasm4#ToneMode">ToneMode</a>
  pan : <a href="moonbitlang/wasm4#TonePan">TonePan</a>
}
```
 Flags that modify behavior of `tone`

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/wasm4/function.mbt,199:::fn <a href="moonbitlang/wasm4#ToneFlag">ToneFlag</a>::new(channel~ : <a href="moonbitlang/wasm4#ToneChannel">ToneChannel</a> = .., mode~ : <a href="moonbitlang/wasm4#ToneMode">ToneMode</a> = .., pan~ : <a href="moonbitlang/wasm4#TonePan">TonePan</a> = ..) -> <a href="moonbitlang/wasm4#ToneFlag">ToneFlag</a>
  ```
  >  Flags that modify behavior of `tone`

## ToneMode

```moonbit
:::source,moonbitlang/wasm4/function.mbt,214:::pub(all) enum ToneMode {
  Duty_1_8
  Duty_1_4
  Duty_1_2
  Duty_3_4
}
```


## TonePan

```moonbit
:::source,moonbitlang/wasm4/function.mbt,221:::pub(all) enum TonePan {
  Center
  Left
  Right
}
```


## disk\_read

```moonbit
:::source,moonbitlang/wasm4/function.mbt,327:::fn disk_read(bytes : Bytes, size : UInt) -> Int
```
 Reads up to `size` bytes from persistent storage into `bytes`.
 
 @return the number of bytes read, which may be less than `size`

## disk\_write

```moonbit
:::source,moonbitlang/wasm4/function.mbt,316:::fn disk_write(bytes : Bytes, size : UInt) -> Int
```
 Writes up to `size` bytes from `bytes` into persistent storage.

 Any previously saved data on the disk is replaced.
@return the number of bytes written, which may be less than `size`.

## get\_draw\_colors

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,66:::fn get_draw_colors(index : UInt) -> UInt
```
 Gets the draw color at the given index.

 @param index the index of the draw color to get, from 1 to 4 (inclusive)
@return the index of the palette that the draw color is set to

## get\_frame\_buffer

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,158:::fn get_frame_buffer(index : UInt) -> UInt
```
 Get the palette index of the pixel at the specified index.

 #### Parameters

 - `index` : The index of the frame buffer to retrieve. Must be a `UInt` and
   should be within the valid range of the frame buffer (0 to 160 \* 160 - 1).

 #### Returns

 - the index of the palette.

## get\_gamepad

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,87:::fn get_gamepad(index~ : UInt = ..) -> <a href="moonbitlang/wasm4#GamePad">GamePad</a>
```
 Gets the state of the gamepads.
 
 @param index the index of the gamepad to get, from 1 to 4 (inclusive)  
@return the state of the gamepads

## get\_mouse

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,114:::fn get_mouse() -> <a href="moonbitlang/wasm4#Mouse">Mouse</a>
```
 Gets the state of the mouse.
 
 @return the state of the mouse

## get\_netplay

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,178:::fn get_netplay() -> <a href="moonbitlang/wasm4#Netplay">Netplay</a>
```
 Gets the state of the netplay.
 
 @return the state of the netplay

## get\_palette

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,40:::fn get_palette(index : UInt) -> <a href="moonbitlang/wasm4#Color">Color</a>
```
 Gets the color of the palette at the given index.
 
 @param index the index of the palette to get, from 1 to 4 (inclusive)  
@return the color at the given index

## get\_system\_hide\_gamepad\_overlay

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,218:::fn get_system_hide_gamepad_overlay() -> Bool
```


## get\_system\_preserve\_framebuffer

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,198:::fn get_system_preserve_framebuffer() -> Bool
```


## hline

```moonbit
:::source,moonbitlang/wasm4/function.mbt,98:::fn hline(x : Int, y : Int, len : Int) -> Unit
```
 Draws a horizontal line between `(x, y)` and `(x + len - 1, y)`
 
 `DRAW_COLORS` color 1 is used as the line color

## line

```moonbit
:::source,moonbitlang/wasm4/function.mbt,93:::fn line(x1 : Int, y1 : Int, x2 : Int, y2 : Int) -> Unit
```
 Draws a line between two points
 
 `DRAW_COLORS` color 1 is used as the line color

## oval

```moonbit
:::source,moonbitlang/wasm4/function.mbt,108:::fn oval(x : Int, y : Int, width : Int, height : Int) -> Unit
```
 Draws an oval (or circle).
 
 `DRAW_COLORS` color 1 is used as the fill color, `DRAW_COLORS` color 2 is used as the outline color.

## rect

```moonbit
:::source,moonbitlang/wasm4/function.mbt,113:::fn rect(x : Int, y : Int, width : Int, height : Int) -> Unit
```
 Draws a rectangle.
 
 `DRAW_COLORS` color 1 is used as the fill color, `DRAW_COLORS` color 2 is used as the outline color.

## rgb

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,17:::fn rgb(color : UInt) -> <a href="moonbitlang/wasm4#Color">Color</a>
```


## screen\_height

```moonbit
:::source,moonbitlang/wasm4/function.mbt,346:::let screen_height : UInt
```


## screen\_width

```moonbit
:::source,moonbitlang/wasm4/function.mbt,344:::let screen_width : UInt
```


## set\_draw\_colors

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,52:::fn set_draw_colors(palette : UInt, index~ : UInt = ..) -> Unit
```
 Sets the draw color at the given index.

 @param index the index of the draw color to set, from 1 to 4 (inclusive)
@param palette the index of the palette to set the draw color to, from 1 to 4 (inclusive), or 0 for transparent

## set\_frame\_buffer

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,129:::fn set_frame_buffer(index : UInt, palette : UInt) -> Unit
```
 Manipulate the framebuffer directly.
 
 @param index the index of the pixel to set, from 0 to 160 \* 160 (exclusive)  
@param palette the index of the palette to set the pixel to, from 1 to 4 (inclusive)

## set\_palette

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,25:::fn set_palette(index : UInt, color : <a href="moonbitlang/wasm4#Color">Color</a>) -> Unit
```
 Sets the color of the palette at the given index.
 
 @param index the index of the palette to set, from 1 to 4 (inclusive)  
@param color the color to set

## set\_system\_hide\_gamepad\_overlay

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,203:::fn set_system_hide_gamepad_overlay(b : Bool) -> Unit
```


## set\_system\_preserve\_framebuffer

```moonbit
:::source,moonbitlang/wasm4/memory.mbt,183:::fn set_system_preserve_framebuffer(b : Bool) -> Unit
```


## sprite

```moonbit
:::source,moonbitlang/wasm4/function.mbt,17:::fn sprite(bytes : Bytes) -> <a href="moonbitlang/wasm4#Sprite">Sprite</a>
```


## text

```moonbit
:::source,moonbitlang/wasm4/function.mbt,119:::fn text(s : String, x : Int, y : Int) -> Unit
```
 Draws text using the built-in system font. The string may contain new-line (`\n`) characters.
 
 The font is 8x8 pixels per character  
`DRAW_COLORS` color 1 is used as the text color, `DRAW_COLORS` color 2 is used as the background color.

## tone

```moonbit
:::source,moonbitlang/wasm4/function.mbt,233:::fn tone(frequency : (UInt, UInt), duration : <a href="moonbitlang/wasm4#ADSR">ADSR</a>, volume : <a href="moonbitlang/wasm4#ADSRVolume">ADSRVolume</a>, flags : <a href="moonbitlang/wasm4#ToneFlag">ToneFlag</a>) -> Unit
```
 Plays a sound tone
 
 @param frequency Start frequency and optional end frequency presented in hertz  
@param duration Duration of the tone in frames (1/60th of a second), up to 255 frames for each phase  
@param volume Volume of the sustain and attack durations, between 0 and 100  
@param flags Flags that modify behavior

## tone\_note\_mode

```moonbit
:::source,moonbitlang/wasm4/function.mbt,274:::fn tone_note_mode(frequency : (<a href="moonbitlang/wasm4#Note">Note</a>, <a href="moonbitlang/wasm4#Note">Note</a>?), duration : <a href="moonbitlang/wasm4#ADSR">ADSR</a>, volume : <a href="moonbitlang/wasm4#ADSRVolume">ADSRVolume</a>, flags : <a href="moonbitlang/wasm4#ToneFlag">ToneFlag</a>) -> Unit
```
 Plays a sound tone in note mode
 
 @param frequency Start frequency and optional end frequency presented in MIDI note  
@param duration Duration of the tone in frames (1/60th of a second), up to 255 frames for each phase  
@param volume Volume of the sustain and attack durations, between 0 and 100  
@param flags Flags that modify behavior

## trace

```moonbit
:::source,moonbitlang/wasm4/function.mbt,336:::fn trace(s : String) -> Unit
```
 Prints a message to the debug console

## vline

```moonbit
:::source,moonbitlang/wasm4/function.mbt,103:::fn vline(x : Int, y : Int, len : Int) -> Unit
```
 Draws a vertical line between `(x, y)` and `(x, y + len - 1)`
 
 `DRAW_COLORS` color 1 is used as the line color
