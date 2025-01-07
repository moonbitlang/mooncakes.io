# Documentation
|Type|description|
|---|---|
|[DateTime](#DateTime)||
|[SystemDate](#SystemDate)||
|[SystemDateTime](#SystemDateTime)||
|[SystemTime](#SystemTime)||
|[TimeZone](#TimeZone)||

|Value|description|
|---|---|
|[is\_leap\_year](#is_leap_year)||
|[parse\_datetime](#parse_datetime)||

## DateTime

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,4:::pub(all) type DateTime Double
```

  日期时间类型,1899-12-30 00:00:00作为0时间
日期规则为到1899-12-30号的天数+当前的毫秒数/一天的总共毫秒数集合

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,778:::impl <a href="moonbitlang/core/strconv#FromStr">@moonbitlang/core/strconv.FromStr</a> for <a href="suiyunonghen/datetime#DateTime">DateTime</a> with from_string(str : String) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>!<a href="moonbitlang/core/strconv#StrConvError">@moonbitlang/core/strconv.StrConvError</a>
  ```
  > 
- ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,267:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/datetime#DateTime">DateTime</a> with output(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### day\_span
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,456:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::day_span(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Double
  ```
  > 
- #### days\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,537:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::days_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int
  ```
  > 
- #### decode
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,345:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::decode(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>
  ```
  > 
- #### decode\_date
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,283:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::decode_date(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>
  ```
  > 
- #### decode\_time
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,331:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::decode_time(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>
  ```
  > 
- #### from\_string
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,778:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::from_string(str : String) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>!<a href="moonbitlang/core/strconv#StrConvError">@moonbitlang/core/strconv.StrConvError</a>
  ```
  > 
- #### from\_timezone
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,32:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::from_timezone(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, timezone : <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### from\_unix\_mseconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,355:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::from_unix_mseconds(seconds : Int64) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### from\_unix\_seconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,350:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::from_unix_seconds(seconds : Int64) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### hours\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,480:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::hours_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### inc\_day
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,565:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_day(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, days : Int) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### inc\_hour
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,220:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_hour(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, hour : Int64) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### inc\_milliseconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,203:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_milliseconds(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, milliseconds : Int64) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### inc\_minutes
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,215:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_minutes(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, minutes : Int64) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### inc\_month
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,547:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_month(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, monthNum : Int) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### inc\_seconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,210:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_seconds(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, seconds : Int64) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### inc\_year
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,560:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::inc_year(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, yearNum : Int) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### milliseconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,225:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::milliseconds(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### milliseconds\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,507:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::milliseconds_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### minutes\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,490:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::minutes_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### month\_span
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,470:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::month_span(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Double
  ```
  > 
- #### months\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,527:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::months_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int
  ```
  > 
- #### new
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,405:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::new(year : Int, month : Int, day : Int, hour : Int, minute : Int, seconds : Int, milliseconds : Int) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>?
  ```
  > 
- #### new\_date
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,360:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::new_date(year : Int, month : Int, day : Int) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>?
  ```
  > 
- #### new\_time
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,388:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::new_time(hour : Int, minute : Int, seconds : Int, milliseconds : Int) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>?
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,450:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::op_sub(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, other : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Double
  ```
  > 
- #### output
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,267:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::output(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### seconds\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,497:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::seconds_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/datetime/traits.mbt,85:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
- #### to\_timezone
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,26:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::to_timezone(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, timezone : <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### unix\_millseconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,230:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::unix_millseconds(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### unix\_seconds
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,235:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::unix_seconds(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int64
  ```
  > 
- #### week\_span
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,475:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::week_span(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Double
  ```
  > 
- #### year\_span
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,465:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::year_span(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Double
  ```
  > 
- #### years\_between
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,517:::fn <a href="suiyunonghen/datetime#DateTime">DateTime</a>::years_between(self : <a href="suiyunonghen/datetime#DateTime">DateTime</a>, then : <a href="suiyunonghen/datetime#DateTime">DateTime</a>) -> Int
  ```
  > 

## SystemDate

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,58:::pub(all) struct SystemDate {
  dayofweek : Int
  year : Int
  month : Int
  day : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,93:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/datetime#SystemDate">SystemDate</a> with output(self : <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### inc\_month
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,71:::fn <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>::inc_month(self : <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>, numMonth : Int) -> (<a href="suiyunonghen/datetime#SystemDate">SystemDate</a>, <a href="moonbitlang/core/array#Array">Array</a>[Int])
  ```
  > 
- #### output
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,93:::fn <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>::output(self : <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_datetime
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,66:::fn <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>::to_datetime(self : <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/datetime/traits.mbt,85:::fn <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## SystemDateTime

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,118:::pub(all) struct SystemDateTime {
  date : <a href="suiyunonghen/datetime#SystemDate">SystemDate</a>
  time : <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,137:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a> with output(self : <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,137:::fn <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>::output(self : <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_datetime
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,124:::fn <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>::to_datetime(self : <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/datetime/traits.mbt,85:::fn <a href="suiyunonghen/datetime#SystemDateTime">SystemDateTime</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## SystemTime

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,98:::pub(all) struct SystemTime {
  hour : Int
  minute : Int
  second : Int
  milliseconds : Int
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,111:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="suiyunonghen/datetime#SystemTime">SystemTime</a> with output(self : <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,111:::fn <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>::output(self : <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>, l : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_datetime
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,106:::fn <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>::to_datetime(self : <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,suiyunonghen/datetime/traits.mbt,85:::fn <a href="suiyunonghen/datetime#SystemTime">SystemTime</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## TimeZone

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,7:::pub(all) struct TimeZone {
  offset_hours : Int
  offset_minutes : Int
}
```


#### mooncakes-io-method-mark-Methods
- #### difference
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,41:::fn <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>::difference(self : <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>, other : <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>) -> Int
  ```
  > 
- #### new\_timezone
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,13:::fn <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>::new_timezone(offset_hours : Int, offset_minutes : Int) -> <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>
  ```
  > 
- #### offset\_in\_minutes
  ```moonbit
  :::source,suiyunonghen/datetime/datetime.mbt,21:::fn <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>::offset_in_minutes(self : <a href="suiyunonghen/datetime#TimeZone">TimeZone</a>) -> Int
  ```
  > 

## is\_leap\_year

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,240:::fn is_leap_year(year : Int) -> Bool
```


## parse\_datetime

```moonbit
:::source,suiyunonghen/datetime/datetime.mbt,599:::fn parse_datetime(str : String) -> <a href="suiyunonghen/datetime#DateTime">DateTime</a>!<a href="moonbitlang/core/strconv#StrConvError">@moonbitlang/core/strconv.StrConvError</a>
```

 datetime formats
YYYY-MM-DD HH:MM:SS.zzz
YYYY-MM-DDTHH:MM:SS.zzz
YYYY-MM-DD
YY-MM-DD
HH:MM:SS.zzz
HH:MM:SS
