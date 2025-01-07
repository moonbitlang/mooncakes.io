# Documentation
|Type|description|
|---|---|
|[BackGroundColors](#BackGroundColors)||
|[Chalk](#Chalk)||
|[Colors](#Colors)||
|[Modifier](#Modifier)||
|[Render](#Render)||

|Value|description|
|---|---|
|[chalk](#chalk)||

## BackGroundColors

```moonbit
:::source,Lampese/moonbit-chalk/background.mbt,2:::pub(all) enum BackGroundColors {
  BgBlack
  BgRed
  BgGreen
  BgYellow
  BgBlue
  BgMagenta
  BgCyan
  BgWhite
  BgBlackBright
  BgRedBright
  BgGreenBright
  BgYellowBright
  BgBlueBright
  BgMagentaBright
  BgCyanBright
  BgWhiteBright
}
```


## Chalk

```moonbit
:::source,Lampese/moonbit-chalk/chalk.mbt,2:::pub(all) enum Chalk {
  Cons(<a href="Lampese/moonbit-chalk#Chalk">Chalk</a>, <a href="Lampese/moonbit-chalk#Render">Render</a>)
  Nil
}
```


#### mooncakes-io-method-mark-Methods
- #### background
  ```moonbit
  :::source,Lampese/moonbit-chalk/chalk.mbt,13:::fn <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>::background(self : <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>, color : <a href="Lampese/moonbit-chalk#BackGroundColors">BackGroundColors</a>) -> <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>
  ```
  > 
- #### color
  ```moonbit
  :::source,Lampese/moonbit-chalk/chalk.mbt,23:::fn <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>::color(self : <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>, color : <a href="Lampese/moonbit-chalk#Colors">Colors</a>) -> <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>
  ```
  > 
- #### modifier
  ```moonbit
  :::source,Lampese/moonbit-chalk/chalk.mbt,18:::fn <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>::modifier(self : <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>, modifier : <a href="Lampese/moonbit-chalk#Modifier">Modifier</a>) -> <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>
  ```
  > 
- #### render
  ```moonbit
  :::source,Lampese/moonbit-chalk/chalk.mbt,28:::fn <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>::render[T : <a href="moonbitlang/core/builtin#Show">Show</a>](self : <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>, to_render : T) -> String
  ```
  > 

## Colors

```moonbit
:::source,Lampese/moonbit-chalk/color.mbt,2:::pub(all) enum Colors {
  Black
  Red
  Green
  Yellow
  Blue
  Magenta
  Cyan
  White
  BlackBright
  RedBright
  GreenBright
  YellowBright
  BlueBright
  MagentaBright
  CyanBright
  WhiteBright
}
```


## Modifier

```moonbit
:::source,Lampese/moonbit-chalk/modifier.mbt,2:::pub(all) enum Modifier {
  Reset
  Bold
  Dim
  Italic
  Underline
  Overline
  Inverse
  Hidden
  Strikethrough
}
```


## Render

```moonbit
:::source,Lampese/moonbit-chalk/render.mbt,2:::pub(all) enum Render {
  RenderBackGround(<a href="Lampese/moonbit-chalk#BackGroundColors">BackGroundColors</a>)
  RenderColor(<a href="Lampese/moonbit-chalk#Colors">Colors</a>)
  RenderModifier(<a href="Lampese/moonbit-chalk#Modifier">Modifier</a>)
}
```


## chalk

```moonbit
:::source,Lampese/moonbit-chalk/chalk.mbt,8:::fn chalk() -> <a href="Lampese/moonbit-chalk#Chalk">Chalk</a>
```

