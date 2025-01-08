# Documentation
|Value|description|
|---|---|
|[ascii\_digit\_to\_int](#ascii_digit_to_int)||
|[ascii\_hexdigit\_to\_int](#ascii_hexdigit_to_int)||
|[ascii\_octdigit\_to\_int](#ascii_octdigit_to_int)||
|[at](#at)||
|[at\_checked](#at_checked)||
|[from\_int\_checked](#from_int_checked)||
|[is\_ascii](#is_ascii)||
|[is\_ascii\_alpha](#is_ascii_alpha)||
|[is\_ascii\_alphanum](#is_ascii_alphanum)||
|[is\_ascii\_blank](#is_ascii_blank)||
|[is\_ascii\_control](#is_ascii_control)||
|[is\_ascii\_digit](#is_ascii_digit)||
|[is\_ascii\_graphic](#is_ascii_graphic)||
|[is\_ascii\_hexdigit](#is_ascii_hexdigit)||
|[is\_ascii\_lower](#is_ascii_lower)||
|[is\_ascii\_octdigit](#is_ascii_octdigit)||
|[is\_ascii\_punctuation](#is_ascii_punctuation)||
|[is\_ascii\_upper](#is_ascii_upper)||
|[is\_ascii\_whitespace](#is_ascii_whitespace)||
|[is\_high\_surrogate](#is_high_surrogate)||
|[is\_low\_surrogate](#is_low_surrogate)||
|[length\_utf16](#length_utf16)||
|[length\_utf32](#length_utf32)||
|[length\_utf8](#length_utf8)||
|[next\_char](#next_char)||
|[prev\_char](#prev_char)||
|[rep](#rep)||
|[sub\_includes](#sub_includes)||
|[to\_ascii\_lower](#to_ascii_lower)||
|[to\_ascii\_upper](#to_ascii_upper)||
|[utf\_16\_clean\_raw](#utf_16_clean_raw)||
|[utf\_16\_clean\_unesc\_unref](#utf_16_clean_unesc_unref)||
|[utf\_16\_clean\_unref](#utf_16_clean_unref)||

## ascii\_digit\_to\_int

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,99:::fn ascii_digit_to_int(c : Char) -> Int
```


## ascii\_hexdigit\_to\_int

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,131:::fn ascii_hexdigit_to_int(c : Char) -> Int
```


## ascii\_octdigit\_to\_int

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,115:::fn ascii_octdigit_to_int(c : Char) -> Int
```


## at

```moonbit
:::source,rami3l/cmark/char/text.mbt,2:::fn at(s : String, idx : Int) -> Char
```


## at\_checked

```moonbit
:::source,rami3l/cmark/char/text.mbt,7:::fn at_checked(s : String, idx : Int) -> <a href="moonbitlang/core/result#Result">Result</a>[Char, Char]
```


## from\_int\_checked

```moonbit
:::source,rami3l/cmark/char/rune.mbt,6:::fn from_int_checked(ord : Int) -> Char?
```


## is\_ascii

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,2:::fn is_ascii(c : Char) -> Bool
```


## is\_ascii\_alpha

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,70:::fn is_ascii_alpha(c : Char) -> Bool
```


## is\_ascii\_alphanum

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,65:::fn is_ascii_alphanum(c : Char) -> Bool
```


## is\_ascii\_blank

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,25:::fn is_ascii_blank(c : Char) -> Bool
```


## is\_ascii\_control

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,41:::fn is_ascii_control(c : Char) -> Bool
```


## is\_ascii\_digit

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,91:::fn is_ascii_digit(c : Char) -> Bool
```


## is\_ascii\_graphic

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,57:::fn is_ascii_graphic(c : Char) -> Bool
```


## is\_ascii\_hexdigit

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,123:::fn is_ascii_hexdigit(c : Char) -> Bool
```


## is\_ascii\_lower

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,83:::fn is_ascii_lower(c : Char) -> Bool
```


## is\_ascii\_octdigit

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,107:::fn is_ascii_octdigit(c : Char) -> Bool
```


## is\_ascii\_punctuation

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,49:::fn is_ascii_punctuation(c : Char) -> Bool
```


## is\_ascii\_upper

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,75:::fn is_ascii_upper(c : Char) -> Bool
```


## is\_ascii\_whitespace

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,33:::fn is_ascii_whitespace(c : Char) -> Bool
```


## is\_high\_surrogate

```moonbit
:::source,rami3l/cmark/char/rune.mbt,14:::fn is_high_surrogate(ord : Int) -> Bool
```


## is\_low\_surrogate

```moonbit
:::source,rami3l/cmark/char/rune.mbt,19:::fn is_low_surrogate(ord : Int) -> Bool
```


## length\_utf16

```moonbit
:::source,rami3l/cmark/char/rune.mbt,42:::fn length_utf16(ch : Char) -> Int
```


## length\_utf32

```moonbit
:::source,rami3l/cmark/char/rune.mbt,52:::fn length_utf32(_ch : Char) -> Int
```


## length\_utf8

```moonbit
:::source,rami3l/cmark/char/rune.mbt,26:::fn length_utf8(ch : Char) -> Int
```


## next\_char

```moonbit
:::source,rami3l/cmark/char/text.mbt,91:::fn next_char(s : String, last~ : Int, after~ : Int) -> Char
```


## prev\_char

```moonbit
:::source,rami3l/cmark/char/text.mbt,68:::fn prev_char(s : String, first~ : Int, before~ : Int) -> Char
```


## rep

```moonbit
:::source,rami3l/cmark/char/rune.mbt,2:::let rep : Char
```


## sub\_includes

```moonbit
:::source,rami3l/cmark/char/text.mbt,16:::fn sub_includes(affix~ : String, s : String, first~ : Int, last~ : Int) -> Bool
```


## to\_ascii\_lower

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,7:::fn to_ascii_lower(c : Char) -> Char
```


## to\_ascii\_upper

```moonbit
:::source,rami3l/cmark/char/ascii.mbt,16:::fn to_ascii_upper(c : Char) -> Char
```


## utf\_16\_clean\_raw

```moonbit
:::source,rami3l/cmark/char/text.mbt,99:::fn utf_16_clean_raw(pad~ : Int = .., buf : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, s : String, first~ : Int, last~ : Int) -> String
```


## utf\_16\_clean\_unesc\_unref

```moonbit
:::source,rami3l/cmark/char/text.mbt,195:::fn utf_16_clean_unesc_unref(buf : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, s : String, first~ : Int, last~ : Int) -> String
```


## utf\_16\_clean\_unref

```moonbit
:::source,rami3l/cmark/char/text.mbt,205:::fn utf_16_clean_unref(buf : <a href="moonbitlang/core/builtin#StringBuilder">StringBuilder</a>, s : String, first~ : Int, last~ : Int) -> String
```

