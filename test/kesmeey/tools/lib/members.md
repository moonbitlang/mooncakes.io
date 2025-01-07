# Documentation
|Type|description|
|---|---|
|[CityCode](#CityCode)||
|[IdCard](#IdCard)||

|Value|description|
|---|---|
|[check\_birthday](#check_birthday)||
|[check\_length](#check_length)||
|[convert\_15\_to\_18](#convert_15_to_18)| 15位转18位身份证号码|
|[convert\_18\_to\_15](#convert_18_to_15)| 18位身份证转15位|
|[get\_province\_name](#get_province_name)||
|[hide\_after](#hide_after)||
|[hide\_before](#hide_before)||
|[hide\_between](#hide_between)||
|[hide\_id\_card](#hide_id_card)| 隐藏身份证号码指定位置的数字，替换为 "\*"|
|[is\_chinese](#is_chinese)||
|[is\_credit\_code](#is_credit_code)||
|[is\_credit\_code\_simple](#is_credit_code_simple)||
|[is\_leap\_year](#is_leap_year)||
|[is\_mobile\_cn](#is_mobile_cn)||
|[is\_mobile\_hk](#is_mobile_hk)||
|[is\_mobile\_mo](#is_mobile_mo)||
|[is\_mobile\_tw](#is_mobile_tw)||
|[is\_number](#is_number)||
|[is\_tel](#is_tel)||
|[is\_tel\_400\_800](#is_tel_400_800)||
|[is\_valid\_18\_card](#is_valid_18_card)||
|[is\_valid\_card\_10](#is_valid_card_10)||
|[is\_valid\_card\_15](#is_valid_card_15)||
|[is\_valid\_email](#is_valid_email)| 验证邮箱是否合法|
|[is\_valid\_hk\_card](#is_valid_hk_card)||
|[is\_valid\_tw\_card](#is_valid_tw_card)||
|[parse\_id\_card](#parse_id_card)||
|[random\_credit\_code](#random_credit_code)| 生成随机的统一社会信用代码|
|[sub\_after](#sub_after)||
|[sub\_before](#sub_before)||
|[sub\_between](#sub_between)||

## CityCode

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,6:::pub(all) struct CityCode {
  code : String
  name : String
}
```


## IdCard

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,53:::pub(all) struct IdCard {
  province_code : String
  city_code : String
  birth_year : Int
  birth_month : Int
  birth_day : Int
  gender : Int
  age : Int
}
```


#### mooncakes-io-method-mark-Methods
- #### get\_age
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,317:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::get_age(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> Int
  ```
  > 
- #### get\_birth\_date
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,298:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::get_birth_date(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> String
  ```
  > 
- #### get\_city\_code
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,290:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::get_city_code(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> String
  ```
  > 
- #### get\_gender
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,295:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::get_gender(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> Int
  ```
  > 
- #### get\_province
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,285:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::get_province(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> String
  ```
  > 
- #### get\_province\_code
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,280:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::get_province_code(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> String
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,kesmeey/tools/lib/IdcardUtil.mbt,322:::fn <a href="kesmeey/tools/lib#IdCard">IdCard</a>::to_string(self : <a href="kesmeey/tools/lib#IdCard">IdCard</a>) -> String
  ```
  > 

## check\_birthday

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,70:::fn check_birthday(year : Int, month : Int, day : Int) -> Bool
```


## check\_length

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,64:::fn check_length(id : String) -> Bool
```


## convert\_15\_to\_18

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,347:::fn convert_15_to_18(id : String) -> String?
```
 15位转18位身份证号码

## convert\_18\_to\_15

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,384:::fn convert_18_to_15(id : String) -> String?
```
 18位身份证转15位

## get\_province\_name

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,11:::fn get_province_name(code : String) -> String
```


## hide\_after

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,88:::fn hide_after(phone : String) -> String
```


## hide\_before

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,74:::fn hide_before(phone : String) -> String
```


## hide\_between

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,81:::fn hide_between(phone : String) -> String
```


## hide\_id\_card

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,332:::fn hide_id_card(id : String, start_include : Int, end_exclude : Int) -> String
```
 隐藏身份证号码指定位置的数字，替换为 "\*"

## is\_chinese

```moonbit
:::source,kesmeey/tools/lib/StrUtil.mbt,28:::fn is_chinese(str : String) -> Bool
```


## is\_credit\_code

```moonbit
:::source,kesmeey/tools/lib/OtherUtil.mbt,25:::fn is_credit_code(code : String) -> Bool
```


## is\_credit\_code\_simple

```moonbit
:::source,kesmeey/tools/lib/OtherUtil.mbt,13:::fn is_credit_code_simple(code : String) -> Bool
```


## is\_leap\_year

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,91:::fn is_leap_year(year : Int) -> Bool
```


## is\_mobile\_cn

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,23:::fn is_mobile_cn(phone : String) -> Bool
```


## is\_mobile\_hk

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,30:::fn is_mobile_hk(phone : String) -> Bool
```


## is\_mobile\_mo

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,47:::fn is_mobile_mo(phone : String) -> Bool
```


## is\_mobile\_tw

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,38:::fn is_mobile_tw(phone : String) -> Bool
```


## is\_number

```moonbit
:::source,kesmeey/tools/lib/StrUtil.mbt,4:::fn is_number(str : String) -> Bool
```


## is\_tel

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,56:::fn is_tel(phone : String) -> Bool
```


## is\_tel\_400\_800

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,65:::fn is_tel_400_800(phone : String) -> Bool
```


## is\_valid\_18\_card

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,96:::fn is_valid_18_card(id : String) -> Bool
```


## is\_valid\_card\_10

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,231:::fn is_valid_card_10(id : String) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
```


## is\_valid\_card\_15

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,141:::fn is_valid_card_15(id : String) -> Bool
```


## is\_valid\_email

```moonbit
:::source,kesmeey/tools/lib/OtherUtil.mbt,86:::fn is_valid_email(email : String) -> Bool
```
 验证邮箱是否合法

## is\_valid\_hk\_card

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,167:::fn is_valid_hk_card(id : String) -> Bool
```


## is\_valid\_tw\_card

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,203:::fn is_valid_tw_card(id : String) -> Bool
```


## parse\_id\_card

```moonbit
:::source,kesmeey/tools/lib/IdcardUtil.mbt,257:::fn parse_id_card(id : String) -> <a href="kesmeey/tools/lib#IdCard">IdCard</a>?
```


## random\_credit\_code

```moonbit
:::source,kesmeey/tools/lib/OtherUtil.mbt,59:::fn random_credit_code() -> String
```
 生成随机的统一社会信用代码

## sub\_after

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,107:::fn sub_after(phone : String) -> String
```


## sub\_before

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,95:::fn sub_before(phone : String) -> String
```


## sub\_between

```moonbit
:::source,kesmeey/tools/lib/PhoneUtil.mbt,102:::fn sub_between(phone : String) -> String
```

