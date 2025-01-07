# Documentation
|Value|description|
|---|---|
|[from\_graphic](#from_graphic)| from\_graphics returns an SVG from a Graphic.|

## from\_graphic

```moonbit
:::source,gmlewis/fonts/svg/svg.mbt,22:::fn from_graphic(g : <a href="gmlewis/fonts/draw#Graphic">@gmlewis/fonts/draw.Graphic</a>, y_up~ : Bool = ..) -> String
```
 from\_graphics returns an SVG from a Graphic.
Note that if the design was created with Y being "up", then it
must be flipped to render properly as an SVG.
