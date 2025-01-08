# gmlewis/moonbit-fonts
[![check](https://github.com/gmlewis/moonbit-fonts/actions/workflows/check.yml/badge.svg)](https://github.com/gmlewis/moonbit-fonts/actions/workflows/check.yml)

This is an experimental package to manipulate open source fonts with [MoonBit].

All fonts are open source and their licenses can all be found in their corresponding
repos which are organized by the first letter of the name of the font:

* font: https://github.com/gmlewis/mbt-fonts-a/tree/master/aaarghnormal
* license: https://github.com/gmlewis/go-fonts-a/tree/master/fonts/aaarghnormal
* ...
* font: https://github.com/gmlewis/mbt-fonts-b/tree/master/baloo
* license: https://github.com/gmlewis/go-fonts-b/tree/master/fonts/baloo
* ...
* font: https://github.com/gmlewis/mbt-fonts-z/tree/master/znikomitno24
* license: https://github.com/gmlewis/go-fonts-z/tree/master/fonts/znikomitno24

[MoonBit]: https://www.moonbitlang.com/

## Examples

### checkerboard

`checkerboard` is a simple example to create a `draw.Graphic` using the `@draw` API.

### canvas-checkerboard

`canvas-checkerboard` renders the `checkerboard` Graphic to an HTML5 canvas.
Type `./run-canvas-checkerboard.sh` in a terminal then open your browser to
http://localhost:8080/examples/canvas-checkerboard to view it.

### svg-checkerboard

`svg-checkerboard` "renders" the `checkerboard` Graphic to an SVG file.
Type `moon run examples/svg-checkerboard > examples/svg-checkerboard/checkerboard.svg`
in a terminal then open this file in your browser to view it.
For example, `google-chrome examples/svg-checkerboard/checkerboard.svg`.

## Status

The code has been updated to support compiler:

```bash
$ moon version --all
moon 0.1.20241231 (16670d0 2024-12-31) ~/.moon/bin/moon
moonc v0.1.20241231+ba15a9a4e ~/.moon/bin/moonc
moonrun 0.1.20241231 (16670d0 2024-12-31) ~/.moon/bin/moonrun
```

Use `moonup` to manage `moon` compiler versions:
https://github.com/chawyehsu/moonup

----------------------------------------------------------------------

Enjoy!

----------------------------------------------------------------------

# License

Please note that all fonts have their own licenses which are included
in their respective original directories (see above).

Copyright 2019-2024 Glenn M. Lewis. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

----------------------------------------------------------------------

---
# Documentation
|Type|description|
|---|---|
|[AbsoluteCmd](#AbsoluteCmd)| \`AbsoluteCmd\` represents a supported absolute SVG command.|
|[Anchor](#Anchor)| Anchor represents where to place the origin (0,0) of the glyph relative|
|[Cmd](#Cmd)| \`Cmd\` represents an SVG command along with its parameters.|
|[Font](#Font)| \`Font\` represents an entire font.|
|[FontError](#FontError)||
|[GerberLP](#GerberLP)| \`GerberLP\` represents whether a subpath is \`Dark\` or \`Clear\`.|
|[Glyph](#Glyph)| \`Glyph\` represents a single glyph within each \`Font\` and also represents|
|[ParamPair](#ParamPair)| \`ParamPair\` represents an X,Y absolute coordinate pair of parameters.|
|[Params](#Params)| \`Params\` represents the parameters to an SVG command.|
|[Path](#Path)| A \`Path\` is identical to a \`Glyph\` but has been optimized internally|
|[PathCmd](#PathCmd)| \`Cmd\` represents an individual absolute SVG command.|
|[PathCmdFn](#PathCmdFn)| \`PathCmdFn\` represents a function that processes or transforms individual commands.|
|[Point](#Point)||
|[Rectangle](#Rectangle)| A Rectangle contains the points with Min.X \<= X \< Max.X, Min.Y \<= Y \< Max.Y.|

|Value|description|
|---|---|
|[all\_fonts](#all_fonts)||
|[glyph\_bbox](#glyph_bbox)| \`glyph\_bbox\` returns the conservative bounding box of a Glyph path.|
|[pt](#pt)| pt is shorthand for \[Point\]{X, Y}.|
|[rect](#rect)| rect is shorthand for Rectangle::{min: pt(x0, y0), max: pt(x1, y1)}. The returned|
|[translate\_path](#translate_path)| \`translate\_path\` translates (moves) an SVG path by the provided offsets.|

## AbsoluteCmd

```moonbit
:::source,gmlewis/fonts/path.mbt,23:::pub(all) enum AbsoluteCmd {
  M
  L
  C
  Q
  Z
}
```
 `AbsoluteCmd` represents a supported absolute SVG command.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/path.mbt,34:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#AbsoluteCmd">AbsoluteCmd</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path.mbt,34:::fn op_equal(<a href="gmlewis/fonts#AbsoluteCmd">AbsoluteCmd</a>, <a href="gmlewis/fonts#AbsoluteCmd">AbsoluteCmd</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/path.mbt,34:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#AbsoluteCmd">AbsoluteCmd</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path.mbt,34:::fn output(<a href="gmlewis/fonts#AbsoluteCmd">AbsoluteCmd</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Anchor

```moonbit
:::source,gmlewis/fonts/anchor.mbt,3:::pub(all) enum Anchor {
  Unchanged
  TopLeft
  TopCenter
  TopRight
  CenterLeft
  Center
  CenterRight
  BaselineLeft
  BaselineCenter
  BaselineRight
  BottomLeft
  BottomCenter
  BottomRight
  RatioXY(Double, Double)
}
```
 Anchor represents where to place the origin (0,0) of the glyph relative
to its minimum bounding box.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/anchor.mbt,25:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#Anchor">Anchor</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/anchor.mbt,25:::fn op_equal(<a href="gmlewis/fonts#Anchor">Anchor</a>, <a href="gmlewis/fonts#Anchor">Anchor</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/anchor.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#Anchor">Anchor</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/anchor.mbt,25:::fn output(<a href="gmlewis/fonts#Anchor">Anchor</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Cmd

```moonbit
:::source,gmlewis/fonts/split-path.mbt,2:::type Cmd
```
 `Cmd` represents an SVG command along with its parameters.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/split-path.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#Cmd">Cmd</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/split-path.mbt,5:::fn op_equal(<a href="gmlewis/fonts#Cmd">Cmd</a>, <a href="gmlewis/fonts#Cmd">Cmd</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/split-path.mbt,5:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#Cmd">Cmd</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/split-path.mbt,5:::fn output(<a href="gmlewis/fonts#Cmd">Cmd</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Font

```moonbit
:::source,gmlewis/fonts/fonts.mbt,2:::pub(all) struct Font {
  id : String
  horiz_adv_x : Double
  units_per_em : Double
  ascent : Double
  descent : Double
  glyphs : <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="gmlewis/fonts#Glyph">Glyph</a>]
}
```
 `Font` represents an entire font.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/fonts.mbt,9:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#Font">Font</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/fonts.mbt,9:::fn op_equal(<a href="gmlewis/fonts#Font">Font</a>, <a href="gmlewis/fonts#Font">Font</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/fonts.mbt,9:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#Font">Font</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/fonts.mbt,9:::fn output(<a href="gmlewis/fonts#Font">Font</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/fonts.mbt,9:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts#Font">Font</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/fonts.mbt,9:::fn to_json(<a href="gmlewis/fonts#Font">Font</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/fonts.mbt,9:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts#Font">Font</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/fonts.mbt,9:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts#Font">Font</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### gen\_path
  ```moonbit
  :::source,gmlewis/fonts/gen-path.mbt,17:::fn <a href="gmlewis/fonts#Font">Font</a>::gen_path(self : <a href="gmlewis/fonts#Font">Font</a>, text : String, anchor~ : <a href="gmlewis/fonts#Anchor">Anchor</a> = .., y_up~ : Bool = ..) -> <a href="gmlewis/fonts#Glyph">Glyph</a>!<a href="gmlewis/fonts#FontError">FontError</a>
  ```
  >  `gen_path` "renders" the provided text string into an SVG path
  > using the provided font information. It performs the necessary
  > path translations in order to combine the individual glyphs into
  > a "super glyph" that can be rendered as a whole.
  > 
  >  Note that `gen_path` operates on the string as a left-justified whole
  > and anchors the entire path relative to `anchor` accordingly.
  > 
  >  If you want multiple lines centered horizontally, use `gen_paths` instead.
  > 
  >  Note that the SVG standard states that positive-Y is "down" with origin
  > coordinates in the upper-left, however, all SVG fonts appear to have their
  > origin in the lower left with positive-Y moving "up". This package
  > attempts to convert the SVG paths such that the font is equally readable
  > in both the "y\_up=false" SVG canvas environment or in a 3D "y\_up=true"
  > rendering environment.
- #### gen\_paths
  ```moonbit
  :::source,gmlewis/fonts/gen-paths.mbt,3:::fn <a href="gmlewis/fonts#Font">Font</a>::gen_paths(self : <a href="gmlewis/fonts#Font">Font</a>, lines : <a href="moonbitlang/core/array#Array">Array</a>[String], anchor~ : <a href="gmlewis/fonts#Anchor">Anchor</a> = .., y_up~ : Bool = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts#Glyph">Glyph</a>]!<a href="gmlewis/fonts#FontError">FontError</a>
  ```
  >  `gen_paths` handles multiple strings independently so that they
  > can be aligned and distributed more flexibly.

## FontError

```moonbit
:::source,gmlewis/fonts/fonts.mbt,12:::pub(all) type! FontError String

```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/fonts.mbt,12:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#FontError">FontError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/fonts.mbt,12:::fn op_equal(<a href="gmlewis/fonts#FontError">FontError</a>, <a href="gmlewis/fonts#FontError">FontError</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/fonts.mbt,12:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#FontError">FontError</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/fonts.mbt,12:::fn output(<a href="gmlewis/fonts#FontError">FontError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## GerberLP

```moonbit
:::source,gmlewis/fonts/path.mbt,37:::pub(all) enum GerberLP {
  Dark
  Clear
}
```
 `GerberLP` represents whether a subpath is `Dark` or `Clear`.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/path.mbt,40:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#GerberLP">GerberLP</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path.mbt,40:::fn op_equal(<a href="gmlewis/fonts#GerberLP">GerberLP</a>, <a href="gmlewis/fonts#GerberLP">GerberLP</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/path.mbt,40:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#GerberLP">GerberLP</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path.mbt,40:::fn output(<a href="gmlewis/fonts#GerberLP">GerberLP</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Glyph

```moonbit
:::source,gmlewis/fonts/glyph.mbt,5:::pub(all) struct Glyph {
  char : String
  horiz_adv_x : Double
  gerber_lp : String
  d : String
  xmin : Double
  ymin : Double
  xmax : Double
  ymax : Double
}
```
 `Glyph` represents a single glyph within each `Font` and also represents
multiple glyphs combined together (for example after using `Font.gen_path`
and switching back and forth between `Glyphs` which are optimized for storage,
and `Paths` which are optimized for processing).

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/glyph.mbt,25:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#Glyph">Glyph</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/glyph.mbt,25:::fn op_equal(<a href="gmlewis/fonts#Glyph">Glyph</a>, <a href="gmlewis/fonts#Glyph">Glyph</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/glyph.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#Glyph">Glyph</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/glyph.mbt,25:::fn output(<a href="gmlewis/fonts#Glyph">Glyph</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/glyph.mbt,25:::impl <a href="moonbitlang/core/builtin#ToJson">ToJson</a> for <a href="gmlewis/fonts#Glyph">Glyph</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/glyph.mbt,25:::fn to_json(<a href="gmlewis/fonts#Glyph">Glyph</a>) -> <a href="moonbitlang/core/json#Json">Json</a>
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/glyph.mbt,25:::impl <a href="moonbitlang/core/json#FromJson">@moonbitlang/core/json.FromJson</a> for <a href="gmlewis/fonts#Glyph">Glyph</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/glyph.mbt,25:::fn from_json(<a href="moonbitlang/core/json#Json">Json</a>, <a href="moonbitlang/core/json#JsonPath">@moonbitlang/core/json.JsonPath</a>) -> <a href="gmlewis/fonts#Glyph">Glyph</a>!<a href="moonbitlang/core/json#JsonDecodeError">@moonbitlang/core/json.JsonDecodeError</a>
    ```
    > automatically derived

## ParamPair

```moonbit
:::source,gmlewis/fonts/path-cmd.mbt,2:::pub(all) struct ParamPair {
  x : Double
  y : Double
}
```
 `ParamPair` represents an X,Y absolute coordinate pair of parameters.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,5:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#ParamPair">ParamPair</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path-cmd.mbt,5:::fn op_equal(<a href="gmlewis/fonts#ParamPair">ParamPair</a>, <a href="gmlewis/fonts#ParamPair">ParamPair</a>) -> Bool
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,8:::fn <a href="gmlewis/fonts#ParamPair">ParamPair</a>::to_string(self : <a href="gmlewis/fonts#ParamPair">ParamPair</a>) -> String
  ```
  > 

## Params

```moonbit
:::source,gmlewis/fonts/parse-params.mbt,2:::type Params
```
 `Params` represents the parameters to an SVG command.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/parse-params.mbt,2:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#Params">Params</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/parse-params.mbt,2:::fn op_equal(<a href="gmlewis/fonts#Params">Params</a>, <a href="gmlewis/fonts#Params">Params</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/parse-params.mbt,2:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#Params">Params</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/parse-params.mbt,2:::fn output(<a href="gmlewis/fonts#Params">Params</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### length
  ```moonbit
  :::source,gmlewis/fonts/parse-params.mbt,5:::fn <a href="gmlewis/fonts#Params">Params</a>::length(self : <a href="gmlewis/fonts#Params">Params</a>) -> Int
  ```
  > 

## Path

```moonbit
:::source,gmlewis/fonts/path.mbt,5:::pub(all) struct Path {
  char : String
  cmds : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts#PathCmd">PathCmd</a>]
  xmin : Double
  ymin : Double
  xmax : Double
  ymax : Double
}
```
 A `Path` is identical to a `Glyph` but has been optimized internally
for further manipulation, whereas a `Glyph` is optimized for compact
storage of font data within all the font packages.
A `Path` can be converted to a `Glpyh` and vice versa.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/path.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#Path">Path</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path.mbt,20:::fn op_equal(<a href="gmlewis/fonts#Path">Path</a>, <a href="gmlewis/fonts#Path">Path</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/path.mbt,20:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#Path">Path</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path.mbt,20:::fn output(<a href="gmlewis/fonts#Path">Path</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/path.mbt,135:::fn <a href="gmlewis/fonts#Path">Path</a>::clone(self : <a href="gmlewis/fonts#Path">Path</a>) -> <a href="gmlewis/fonts#Path">Path</a>
  ```
  >  `clone` makes a deep copy of a Path.
- #### from\_glyph
  ```moonbit
  :::source,gmlewis/fonts/path.mbt,46:::fn <a href="gmlewis/fonts#Path">Path</a>::from_glyph(g : <a href="gmlewis/fonts#Glyph">Glyph</a>, path_cmd_fn~ : <a href="gmlewis/fonts#PathCmdFn">PathCmdFn</a>? = ..) -> <a href="gmlewis/fonts#Path">Path</a>!<a href="gmlewis/fonts#FontError">FontError</a>
  ```
  >  `from_glyph` returns a `Path` from a `Glyph`, optionally processing
  > every `Cmd` with a processing function.
  > Note that apart from `path_cmd_fn`, `from_glyph` makes no attempt to process the
  > invidual glyphs and simply transforms the representation.
- #### to\_glyph
  ```moonbit
  :::source,gmlewis/fonts/path.mbt,92:::fn <a href="gmlewis/fonts#Path">Path</a>::to_glyph(self : <a href="gmlewis/fonts#Path">Path</a>, path_cmd_fn~ : <a href="gmlewis/fonts#PathCmdFn">PathCmdFn</a>? = ..) -> <a href="gmlewis/fonts#Glyph">Glyph</a>
  ```
  >  `to_glyph` returns a "super" `Glyph` from a `Path`, optionally processing
  > every `PathCmd` with a processing function.
  > Note that apart from `path_cmd_fn`, `to_glyph` makes no attempt to process the
  > invidual glyphs and simply transforms the representation.

## PathCmd

```moonbit
:::source,gmlewis/fonts/path-cmd.mbt,18:::pub(all) struct PathCmd {
  cmd : <a href="gmlewis/fonts#AbsoluteCmd">AbsoluteCmd</a>
  gerber_lp : <a href="gmlewis/fonts#GerberLP">GerberLP</a>
  params : <a href="moonbitlang/core/array#Array">Array</a>[<a href="gmlewis/fonts#ParamPair">ParamPair</a>]
}
```
 `Cmd` represents an individual absolute SVG command.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,22:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="gmlewis/fonts#PathCmd">PathCmd</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path-cmd.mbt,22:::fn op_equal(<a href="gmlewis/fonts#PathCmd">PathCmd</a>, <a href="gmlewis/fonts#PathCmd">PathCmd</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,22:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="gmlewis/fonts#PathCmd">PathCmd</a>
  ```
  > 
  * ```moonbit
    :::source,gmlewis/fonts/path-cmd.mbt,22:::fn output(<a href="gmlewis/fonts#PathCmd">PathCmd</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

#### mooncakes-io-method-mark-Methods
- #### bbox
  ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,80:::fn <a href="gmlewis/fonts#PathCmd">PathCmd</a>::bbox(self : <a href="gmlewis/fonts#PathCmd">PathCmd</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  `bbox` returns the minimum bounding box of a PathCmd.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,100:::fn <a href="gmlewis/fonts#PathCmd">PathCmd</a>::clone(self : <a href="gmlewis/fonts#PathCmd">PathCmd</a>) -> <a href="gmlewis/fonts#PathCmd">PathCmd</a>
  ```
  >  `clone` makes a deep copy of a PatchCmd.
- #### from\_svg\_cmd
  ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,25:::fn <a href="gmlewis/fonts#PathCmd">PathCmd</a>::from_svg_cmd(svg_cmd : <a href="gmlewis/fonts#Cmd">Cmd</a>, gerber_lp : <a href="gmlewis/fonts#GerberLP">GerberLP</a>) -> <a href="gmlewis/fonts#PathCmd">PathCmd</a>!<a href="gmlewis/fonts#FontError">FontError</a>
  ```
  > 
- #### to\_svg\_cmd
  ```moonbit
  :::source,gmlewis/fonts/path-cmd.mbt,60:::fn <a href="gmlewis/fonts#PathCmd">PathCmd</a>::to_svg_cmd(self : <a href="gmlewis/fonts#PathCmd">PathCmd</a>) -> (<a href="gmlewis/fonts#Cmd">Cmd</a>, String)
  ```
  > 

## PathCmdFn

```moonbit
:::source,gmlewis/fonts/path-cmd.mbt,97:::pub(all) type PathCmdFn (Int, <a href="gmlewis/fonts#PathCmd">PathCmd</a>) -> <a href="gmlewis/fonts#PathCmd">PathCmd</a>
```
 `PathCmdFn` represents a function that processes or transforms individual commands.
The first argument is the index within the command.

## Point

```moonbit
:::source,gmlewis/fonts/geom.mbt,10:::pub(all) struct Point {
  x : Double
  y : Double
}
```


#### mooncakes-io-method-mark-Methods
- #### div
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,36:::fn <a href="gmlewis/fonts#Point">Point</a>::div(self : <a href="gmlewis/fonts#Point">Point</a>, k : Double) -> <a href="gmlewis/fonts#Point">Point</a>
  ```
  >  div returns the vector p/k.
- #### is\_in
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,41:::fn <a href="gmlewis/fonts#Point">Point</a>::is_in(self : <a href="gmlewis/fonts#Point">Point</a>, r : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Bool
  ```
  >  is\_in reports whether p is in r.
- #### mul
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,31:::fn <a href="gmlewis/fonts#Point">Point</a>::mul(self : <a href="gmlewis/fonts#Point">Point</a>, k : Double) -> <a href="gmlewis/fonts#Point">Point</a>
  ```
  >  mul returns the vector p\*k.
- #### op\_add
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,21:::fn <a href="gmlewis/fonts#Point">Point</a>::op_add(self : <a href="gmlewis/fonts#Point">Point</a>, q : <a href="gmlewis/fonts#Point">Point</a>) -> <a href="gmlewis/fonts#Point">Point</a>
  ```
  >  op\_add (+) returns the vector p+q.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,62:::fn <a href="gmlewis/fonts#Point">Point</a>::op_equal(self : <a href="gmlewis/fonts#Point">Point</a>, q : <a href="gmlewis/fonts#Point">Point</a>) -> Bool
  ```
  >  op\_equal reports whether p and q are equal.
- #### op\_sub
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,26:::fn <a href="gmlewis/fonts#Point">Point</a>::op_sub(self : <a href="gmlewis/fonts#Point">Point</a>, q : <a href="gmlewis/fonts#Point">Point</a>) -> <a href="gmlewis/fonts#Point">Point</a>
  ```
  >  op\_sub (-) returns the vector p-q.
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,16:::fn <a href="gmlewis/fonts#Point">Point</a>::to_string(self : <a href="gmlewis/fonts#Point">Point</a>) -> String
  ```
  >  to\_string returns a string representation of p like "(3,4)".

## Rectangle

```moonbit
:::source,gmlewis/fonts/geom.mbt,79:::pub(all) struct Rectangle {
  min : <a href="gmlewis/fonts#Point">Point</a>
  max : <a href="gmlewis/fonts#Point">Point</a>
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
  :::source,gmlewis/fonts/geom.mbt,120:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::add(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, p : <a href="gmlewis/fonts#Point">Point</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  add returns the rectangle r translated by p.
- #### bounds
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,90:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::bounds(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> (Double, Double, Double, Double)
  ```
  >  `bounds` returns the tuple `(xmin, ymin, xmax, ymax)`.
- #### canon
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,259:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::canon(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  canon returns the canonical version of r. The returned rectangle has minimum
  > and maximum coordinates swapped if necessary so that it is well-formed.
- #### clone
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,95:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::clone(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  `clone` makes a copy of the provided rectangle without changing it.
- #### dx
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,105:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::dx(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Double
  ```
  >  dx returns r's width.
- #### dy
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,110:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::dy(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Double
  ```
  >  dy returns r's height.
- #### empty
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,224:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::empty(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Bool
  ```
  >  empty reports whether the rectangle contains no points.
- #### extend
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,184:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::extend(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, pt : <a href="gmlewis/fonts#Point">Point</a>) -> Unit
  ```
  >  `extend` extends the current rectangle to include the provided point.
- #### inset
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,138:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::inset(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, n : Double) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  inset returns the rectangle r inset by n, which may be negative. If either
  > of r's dimensions is less than 2\*n then an empty rectangle near the center
  > of r will be returned.
- #### intersect
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,159:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::intersect(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, s : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  intersect returns the largest rectangle contained by both r and s. If the
  > two rectangles do not overlap then the zero rectangle will be returned.
- #### is\_in
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,245:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::is_in(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, s : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Bool
  ```
  >  is\_in reports whether every point in r is in s.
- #### new
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,85:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::new() -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  Rectangle::new returns an empty (all zeros) rectangle.
- #### op\_equal
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,230:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::op_equal(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, s : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Bool
  ```
  >  op\_equal reports whether r and s contain the same set of points. All empty
  > rectangles are considered equal.
- #### overlaps
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,235:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::overlaps(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, s : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> Bool
  ```
  >  overlaps reports whether r and s have a non-empty intersection.
- #### size
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,115:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::size(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> <a href="gmlewis/fonts#Point">Point</a>
  ```
  >  size returns r's width and height.
- #### sub
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,128:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::sub(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, p : <a href="gmlewis/fonts#Point">Point</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  sub returns the rectangle r translated by -p.
- #### to\_string
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,100:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::to_string(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> String
  ```
  >  to\_string returns a string representation of r like "(3,4)-(6,5)".
- #### union
  ```moonbit
  :::source,gmlewis/fonts/geom.mbt,200:::fn <a href="gmlewis/fonts#Rectangle">Rectangle</a>::union(self : <a href="gmlewis/fonts#Rectangle">Rectangle</a>, s : <a href="gmlewis/fonts#Rectangle">Rectangle</a>) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
  ```
  >  union returns the smallest rectangle that contains both r and s.

## all\_fonts

```moonbit
:::source,gmlewis/fonts/all-fonts.mbt,2:::let all_fonts : <a href="moonbitlang/core/array#Array">Array</a>[String]
```


## glyph\_bbox

```moonbit
:::source,gmlewis/fonts/bbox.mbt,10:::fn glyph_bbox(d : String) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>!<a href="gmlewis/fonts#FontError">FontError</a>
```
 `glyph_bbox` returns the conservative bounding box of a Glyph path.
It only supports the absolute SVG commands: M, L, C, Q, Z.

 Note that this function does _NOT_ fully analyze the Cubic or Quadratic
Bézier curves to determine their exact bounding boxes, but instead
takes a naive and concervative approach by encapsulating the bounds
of all control points in addition to curve anchor points which may result
in returning a much larger bounding box than is actually needed to fully
contain the glyph.

## pt

```moonbit
:::source,gmlewis/fonts/geom.mbt,67:::fn pt(x : Double, y : Double) -> <a href="gmlewis/fonts#Point">Point</a>
```
 pt is shorthand for \[Point\]{X, Y}.

## rect

```moonbit
:::source,gmlewis/fonts/geom.mbt,277:::fn rect(x0 : Double, y0 : Double, x1 : Double, y1 : Double) -> <a href="gmlewis/fonts#Rectangle">Rectangle</a>
```
 rect is shorthand for Rectangle::{min: pt(x0, y0), max: pt(x1, y1)}. The returned
rectangle has minimum and maximum coordinates swapped if necessary so that
it is well-formed.

## translate\_path

```moonbit
:::source,gmlewis/fonts/translate-path.mbt,3:::fn translate_path(d : String, x : Double, y : Double, invert_y~ : Bool = ..) -> String!<a href="gmlewis/fonts#FontError">FontError</a>
```
 `translate_path` translates (moves) an SVG path by the provided offsets.
If `invert_y` is true, all `y` values are scaled by -1.
