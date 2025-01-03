# Documentation
|Value|description|
|---|---|
|[PI](#PI)||
|[acos](#acos)||
|[asin](#asin)||
|[atan](#atan)||
|[atan2](#atan2)||
|[ceil](#ceil)||
|[cos](#cos)||
|[exp](#exp)||
|[floor](#floor)||
|[ln](#ln)||
|[log10](#log10)||
|[log2](#log2)||
|[maximum](#maximum)||
|[minimum](#minimum)||
|[pi](#pi)||
|[round](#round)||
|[sin](#sin)||
|[tan](#tan)||
|[trunc](#trunc)||

## PI

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,25:::let PI : Double
```


## acos

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,273:::fn acos(x : Double) -> Double
```


## asin

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,257:::fn asin(x : Double) -> Double
```


## atan

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,246:::fn atan(x : Double) -> Double
```


## atan2

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,291:::fn atan2(y : Double, x : Double) -> Double
```


## ceil

```moonbit
:::source,moonbitlang/core/math/round.mbt,26:::fn ceil(input : Double) -> Double
```


## cos

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,101:::fn cos(x : Double) -> Double
```


## exp

```moonbit
:::source,moonbitlang/core/math/exp.mbt,16:::fn exp(input : Double) -> Double
```


## floor

```moonbit
:::source,moonbitlang/core/math/round.mbt,39:::fn floor(input : Double) -> Double
```


## ln

```moonbit
:::source,moonbitlang/core/math/log.mbt,31:::fn ln(input : Double) -> Double
```

 Calculates the natural logarithm (base e) of the input.

 Parameters:

 - `input` : The floating-point number for which to calculate the natural
   logarithm.

 Returns the natural logarithm of the input.

 Examples:

 ```
 assert_eq!(ln(1.0), 0.0)
 assert_eq!(ln(0.5), -0.6931471805599453)
 ```

## log10

```moonbit
:::source,moonbitlang/core/math/log.mbt,68:::fn log10(input : Double) -> Double
```

 Calculates the base-10 logarithm of the input number.

 Parameters:

 - `input` : The floating-point number for which to calculate the logarithm.

 Returns the base-10 logarithm of the input number.

 Example:

 ```
 assert_eq!(log10(100.0), 2.0)
 ```

## log2

```moonbit
:::source,moonbitlang/core/math/log.mbt,50:::fn log2(input : Double) -> Double
```

 Calculates the base-2 logarithm of the input number.

 Parameters:

 - `input` : The floating-point number for which the logarithm is to be
   calculated.

 Returns the base-2 logarithm of the input number.

 Example:

 ```
 assert_eq!(log2(8.0), 3.0)
 ```

## maximum

```moonbit
:::source,moonbitlang/core/math/algebraic.mbt,26:::fn maximum[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](x : T, y : T) -> T
```

 Compares and returns the maximum of two values.

 Returns the second argument if the comparison determines them to be equal.

 #### Examples

 ```
 assert_eq!(@math.maximum(1, 2), 2)
 assert_eq!(@math.maximum(2, 2), 2)
 ```

## minimum

```moonbit
:::source,moonbitlang/core/math/algebraic.mbt,45:::fn minimum[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](x : T, y : T) -> T
```

 Compares and returns the minimum of two values.

 Returns the first argument if the comparison determines them to be equal.

 #### Examples

 ```
 assert_eq!(@math.minimum(1, 2), 1)
 assert_eq!(@math.minimum(2, 2), 2)
 ```

## pi

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,29:::let pi : Double
```

@alert deprecated "Use `PI` instead"

## round

```moonbit
:::source,moonbitlang/core/math/round.mbt,16:::fn round(input : Double) -> Double
```


## sin

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,42:::fn sin(x : Double) -> Double
```


## tan

```moonbit
:::source,moonbitlang/core/math/trigonometric.mbt,164:::fn tan(x : Double) -> Double
```


## trunc

```moonbit
:::source,moonbitlang/core/math/round.mbt,52:::fn trunc(input : Double) -> Double
```

