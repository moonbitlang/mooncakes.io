# Moonbit/Core Time

## Overview

Package time provides functionality for measuring and manipulating time.

The calendrical calculations always assume a ISO 8601 calendar, with no leap seconds.

To create a datatime that represents the current time, you need to obtain the unix second and time zone offset from the [wasi](https://mooncakes.io/docs/#/peter-jerry-ye/wasi/) package (wasm-gc backend) or other FFI functions, and manually create a datetime.

```
// creates a UTC+8 fixed time zone.
let zone = @time.fixed_zone("Asia/Shanghai", 8*60*60)

// creates a ZonedDateTime from unix second and time zone.
let date_time = @time.unix(1714227729L, nanosecond=1000, ~zone) // Ok(2024-04-27T22:22:09.000001+08:00[Asia/Shanghai])
```

## TODOs

- Convert from/to RFC format string.
- Custom string formatter.
- Support the time zone offset transition at daylight saving time.
- Support monotonic clock to accurately measure the elapsed time.
- Support different calendar system, such as Chinese calendar system.

---
# Documentation
|Type|description|
|---|---|
|[Duration](#Duration)| An amount of time with nanosecond precision.|
|[Period](#Period)| An amount of time representing by years, months and days in the ISO-8601 calendar system.|
|[PlainDate](#PlainDate)| A date without a time zone in the ISO 8601 calendar system.|
|[PlainDateTime](#PlainDateTime)| A datetime without a time zone in the ISO 8601 calendar system.|
|[PlainTime](#PlainTime)| A time without a time zone|
|[Weekday](#Weekday)||
|[Zone](#Zone)| Time zone.|
|[ZoneOffset](#ZoneOffset)| Time offset from UTC.|
|[ZonedDateTime](#ZonedDateTime)| A datetime with a time zone and offset in the ISO 8601 calendar system.|

|Value|description|
|---|---|
|[date\_time](#date_time)| Creates a ZonedDateTime from year, month, day, hour, minute, second and a time zone.|
|[fixed\_zone](#fixed_zone)| Creates a time zone with fixed offset from time zone id and offset seconds.|
|[unix](#unix)| Creates a ZonedDateTime from elapsed seconds since the unix epoch and a time zone.|
|[utc\_offset](#utc_offset)| UTC+0 offset.|
|[utc\_zone](#utc_zone)| UTC time zone.|

## Duration

```moonbit
:::source,moonbitlang/x/time/duration.mbt,16:::type Duration
```
 An amount of time with nanosecond precision.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,19:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/x/time#Duration">Duration</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/duration.mbt,19:::fn compare(<a href="moonbitlang/x/time#Duration">Duration</a>, <a href="moonbitlang/x/time#Duration">Duration</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/time#Duration">Duration</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/duration.mbt,19:::fn op_equal(<a href="moonbitlang/x/time#Duration">Duration</a>, <a href="moonbitlang/x/time#Duration">Duration</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,142:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#Duration">Duration</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/duration.mbt,142:::fn output(self : <a href="moonbitlang/x/time#Duration">Duration</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add\_duration
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,213:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::add_duration(self : <a href="moonbitlang/x/time#Duration">Duration</a>, other : <a href="moonbitlang/x/time#Duration">Duration</a>) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds other duration to this duration, and returns a new duration.
- #### add\_hours
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,167:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::add_hours(self : <a href="moonbitlang/x/time#Duration">Duration</a>, hours : Int64) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified hours to this duration, and returns a new duration.
- #### add\_minutes
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,179:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::add_minutes(self : <a href="moonbitlang/x/time#Duration">Duration</a>, minutes : Int64) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified minutes to this duration, and returns a new duration.
- #### add\_nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,200:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::add_nanoseconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>, nanoseconds : Int64) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified nanoseconds to this duration, and returns a new duration.
- #### add\_seconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,191:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::add_seconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>, seconds : Int64) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified seconds to this duration, and returns a new duration.
- #### from\_string
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,53:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::from_string(str : String) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Parses a ISO 8601 format string like `PT[n]H[n]M[n].[n]S`.
- #### is\_neg
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,162:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::is_neg(self : <a href="moonbitlang/x/time#Duration">Duration</a>) -> Bool
  ```
  >  Checks if this duration is negative.
- #### is\_zero
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,157:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::is_zero(self : <a href="moonbitlang/x/time#Duration">Duration</a>) -> Bool
  ```
  >  Checks if this duration is zero length.
- #### nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,152:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::nanoseconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>) -> Int
  ```
  >  Returns the number of nanoseconds in this duration.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,22:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::of(hours~ : Int64 = .., minutes~ : Int64 = .., seconds~ : Int64 = .., nanoseconds~ : Int64 = ..) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a Duration from hours, minutes, seconds and nanoseconds.
- #### op\_add
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,229:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::op_add(self : <a href="moonbitlang/x/time#Duration">Duration</a>, other : <a href="moonbitlang/x/time#Duration">Duration</a>) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### seconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,147:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::seconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>) -> Int64
  ```
  >  Returns the number of seconds in this duration.
- #### to\_nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,250:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::to_nanoseconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>) -> Int64
  ```
  >  Converts this duration to the total length in nanoseconds.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,102:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::to_string(self : <a href="moonbitlang/x/time#Duration">Duration</a>) -> String
  ```
  >  Returns a string representation of this duration using ISO 8601 representation.
- #### with\_nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,242:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::with_nanoseconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>, nanoseconds : Int) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new duration with the specified nanosecond of second.
- #### with\_seconds
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,234:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::with_seconds(self : <a href="moonbitlang/x/time#Duration">Duration</a>, seconds : Int64) -> <a href="moonbitlang/x/time#Duration">Duration</a>
  ```
  >  Returns a new duration with the specified amount of seconds.
- #### zero
  ```moonbit
  :::source,moonbitlang/x/time/duration.mbt,48:::fn <a href="moonbitlang/x/time#Duration">Duration</a>::zero() -> <a href="moonbitlang/x/time#Duration">Duration</a>
  ```
  >  Returns a zero length duration.

## Period

```moonbit
:::source,moonbitlang/x/time/period.mbt,16:::type Period
```
 An amount of time representing by years, months and days in the ISO-8601 calendar system.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/period.mbt,20:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/x/time#Period">Period</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/period.mbt,20:::fn compare(<a href="moonbitlang/x/time#Period">Period</a>, <a href="moonbitlang/x/time#Period">Period</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/period.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/time#Period">Period</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/period.mbt,20:::fn op_equal(<a href="moonbitlang/x/time#Period">Period</a>, <a href="moonbitlang/x/time#Period">Period</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/period.mbt,92:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#Period">Period</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/period.mbt,92:::fn output(self : <a href="moonbitlang/x/time#Period">Period</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add\_days
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,139:::fn <a href="moonbitlang/x/time#Period">Period</a>::add_days(self : <a href="moonbitlang/x/time#Period">Period</a>, days : Int) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified days to this period, and returns a new period.
- #### add\_months
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,130:::fn <a href="moonbitlang/x/time#Period">Period</a>::add_months(self : <a href="moonbitlang/x/time#Period">Period</a>, months : Int) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified months to this period, and returns a new period.
- #### add\_period
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,148:::fn <a href="moonbitlang/x/time#Period">Period</a>::add_period(self : <a href="moonbitlang/x/time#Period">Period</a>, other : <a href="moonbitlang/x/time#Period">Period</a>) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds other period to this period, and returns a new period.
- #### add\_weeks
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,121:::fn <a href="moonbitlang/x/time#Period">Period</a>::add_weeks(self : <a href="moonbitlang/x/time#Period">Period</a>, weeks : Int) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified weeks to this period, and returns a new period.
- #### add\_years
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,112:::fn <a href="moonbitlang/x/time#Period">Period</a>::add_years(self : <a href="moonbitlang/x/time#Period">Period</a>, years : Int) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified years to this period, and returns a new period.
- #### days
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,107:::fn <a href="moonbitlang/x/time#Period">Period</a>::days(self : <a href="moonbitlang/x/time#Period">Period</a>) -> Int
  ```
  >  Returns the number of days in this duration.
- #### from\_string
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,37:::fn <a href="moonbitlang/x/time#Period">Period</a>::from_string(str : String) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Parses a ISO 8601 format string like `P[n]Y[n]M[n]D`.
- #### is\_neg
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,220:::fn <a href="moonbitlang/x/time#Period">Period</a>::is_neg(self : <a href="moonbitlang/x/time#Period">Period</a>) -> Bool
  ```
  >  Checks if this period is negative.
- #### is\_zero
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,215:::fn <a href="moonbitlang/x/time#Period">Period</a>::is_zero(self : <a href="moonbitlang/x/time#Period">Period</a>) -> Bool
  ```
  >  Checks if this period is zero length.
- #### months
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,102:::fn <a href="moonbitlang/x/time#Period">Period</a>::months(self : <a href="moonbitlang/x/time#Period">Period</a>) -> Int
  ```
  >  Returns the number of months in this duration.
- #### multiply
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,169:::fn <a href="moonbitlang/x/time#Period">Period</a>::multiply(self : <a href="moonbitlang/x/time#Period">Period</a>, n : Int) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new period with all elements in this period multiplied by the specified value.
- #### negated
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,183:::fn <a href="moonbitlang/x/time#Period">Period</a>::negated(self : <a href="moonbitlang/x/time#Period">Period</a>) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new period with all elements in this period negated.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,23:::fn <a href="moonbitlang/x/time#Period">Period</a>::of(years~ : Int = .., months~ : Int = .., days~ : Int = ..) -> <a href="moonbitlang/x/time#Period">Period</a>
  ```
  >  Creates a Period from years, months, and days.
- #### op\_add
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,159:::fn <a href="moonbitlang/x/time#Period">Period</a>::op_add(self : <a href="moonbitlang/x/time#Period">Period</a>, other : <a href="moonbitlang/x/time#Period">Period</a>) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### op\_sub
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,164:::fn <a href="moonbitlang/x/time#Period">Period</a>::op_sub(self : <a href="moonbitlang/x/time#Period">Period</a>, other : <a href="moonbitlang/x/time#Period">Period</a>) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,70:::fn <a href="moonbitlang/x/time#Period">Period</a>::to_string(self : <a href="moonbitlang/x/time#Period">Period</a>) -> String
  ```
  >  Returns a string representation of this period using ISO 8601 representation.
- #### to\_total\_months
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,225:::fn <a href="moonbitlang/x/time#Period">Period</a>::to_total_months(self : <a href="moonbitlang/x/time#Period">Period</a>) -> Int64
  ```
  >  Returns the total number of months in this period.
- #### with\_days
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,206:::fn <a href="moonbitlang/x/time#Period">Period</a>::with_days(self : <a href="moonbitlang/x/time#Period">Period</a>, days : Int) -> <a href="moonbitlang/x/time#Period">Period</a>
  ```
  >  Returns a new period with the specified amount of days.
- #### with\_months
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,197:::fn <a href="moonbitlang/x/time#Period">Period</a>::with_months(self : <a href="moonbitlang/x/time#Period">Period</a>, months : Int) -> <a href="moonbitlang/x/time#Period">Period</a>
  ```
  >  Returns a new period with the specified amount of months.
- #### with\_years
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,188:::fn <a href="moonbitlang/x/time#Period">Period</a>::with_years(self : <a href="moonbitlang/x/time#Period">Period</a>, years : Int) -> <a href="moonbitlang/x/time#Period">Period</a>
  ```
  >  Returns a new period with the specified amount of years.
- #### years
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,97:::fn <a href="moonbitlang/x/time#Period">Period</a>::years(self : <a href="moonbitlang/x/time#Period">Period</a>) -> Int
  ```
  >  Returns the number of years in this duration.
- #### zero
  ```moonbit
  :::source,moonbitlang/x/time/period.mbt,32:::fn <a href="moonbitlang/x/time#Period">Period</a>::zero() -> <a href="moonbitlang/x/time#Period">Period</a>
  ```
  >  Returns a zero length period.

## PlainDate

```moonbit
:::source,moonbitlang/x/time/plain_date.mbt,16:::type PlainDate
```
 A date without a time zone in the ISO 8601 calendar system.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,103:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#PlainDate">PlainDate</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_date.mbt,103:::fn output(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add\_days
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,306:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::add_days(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, days : Int64) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified days to this date, and returns a new date.
- #### add\_months
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,277:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::add_months(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, months : Int64) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified months to this date, and returns a new date.
- #### add\_period
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,317:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::add_period(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, period : <a href="moonbitlang/x/time#Period">Period</a>) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds a period to this date, and returns a new date.
- #### add\_weeks
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,297:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::add_weeks(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, weeks : Int64) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified weeks to this date, and returns a new date.
- #### add\_years
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,263:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::add_years(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, years : Int64) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified years to this date, and returns a new date.
- #### compare
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,113:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::compare(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, other : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  > 
- #### day
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,160:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::day(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the day of the month.
- #### days\_in\_month
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,195:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::days_in_month(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the number of days in the month.
- #### days\_in\_week
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,190:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::days_in_week(_self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the number of days in the week.
- #### days\_in\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,201:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::days_in_year(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the number of days in the year.
- #### era
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,132:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::era(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> String
  ```
  >  Returns the era of this date.
- #### era\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,141:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::era_year(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the year of the era of this date.
- #### from\_string
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,60:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::from_string(str : String) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainDate from a string, like "2008-08-08".
- #### from\_unix\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,46:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::from_unix_day(unix_day : Int64) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a date from the days count since unix epoch.
- #### from\_year\_ord
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,31:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::from_year_ord(year : Int, ordinal : Int) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainDate from year and ordinal day.
- #### in\_leap\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,211:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::in_leap_year(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Bool
  ```
  >  Checks if the date is in a leap year.
- #### month
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,155:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::month(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the ordinal number of month in the current year.
- #### months\_in\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,206:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::months_in_year(_self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the number of months in the year.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,23:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::of(year : Int, month : Int, day : Int) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainDate from the year, month and day.
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,108:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::op_equal(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, other : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Bool
  ```
  > 
- #### ordinal
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,183:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::ordinal(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the ordinal day of the year.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,89:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::to_string(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> String
  ```
  >  Returns a string representing the date.
- #### to\_unix\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,54:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::to_unix_day(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int64
  ```
  >  Returns the days count since unix epoch of this date.
- #### until
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,326:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::until(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, end : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> <a href="moonbitlang/x/time#Period">Period</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns the period between this date and another date.
- #### weekday
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,165:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::weekday(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> <a href="moonbitlang/x/time#Weekday">Weekday</a>
  ```
  >  Returns the weekday.
- #### with\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,242:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::with_day(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, day : Int) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new date with the specified day of month.
- #### with\_month
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,229:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::with_month(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, month : Int) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new date with the specified month.
- #### with\_ordinal
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,255:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::with_ordinal(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, ordinal : Int) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new date with the specified ordinal day of year.
- #### with\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,216:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::with_year(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>, year : Int) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new date with the specified year.
- #### year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date.mbt,150:::fn <a href="moonbitlang/x/time#PlainDate">PlainDate</a>::year(self : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> Int
  ```
  >  Returns the number of years relative to a calendar-specific epoch.

## PlainDateTime

```moonbit
:::source,moonbitlang/x/time/plain_date_time.mbt,16:::type PlainDateTime
```
 A datetime without a time zone in the ISO 8601 calendar system.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,19:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_date_time.mbt,19:::fn compare(<a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,19:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_date_time.mbt,19:::fn op_equal(<a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,84:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_date_time.mbt,84:::fn output(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add\_days
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,187:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_days(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, days : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified days to this datetime, and returns a new datetime.
- #### add\_duration
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,238:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_duration(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, duration : <a href="moonbitlang/x/time#Duration">Duration</a>) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds a duration of time to this datetime, and returns a new datetime.
- #### add\_hours
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,197:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_hours(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, hours : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified hours to this datetime, and returns a new datetime.
- #### add\_minutes
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,205:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_minutes(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, minutes : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified minutes to this datetime, and returns a new datetime.
- #### add\_months
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,177:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_months(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, months : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified months to this datetime, and returns a new datetime.
- #### add\_nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,227:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_nanoseconds(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, nanoseconds : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified nanoseconds to this datetime, and returns a new datetime.
- #### add\_period
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,192:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_period(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, period : <a href="moonbitlang/x/time#Period">Period</a>) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds a period of date to this datetime, and returns a new datetime.
- #### add\_seconds
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,216:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_seconds(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, seconds : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified seconds to this datetime, and returns a new datetime.
- #### add\_weeks
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,182:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_weeks(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, weeks : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified weeks to this datetime, and returns a new datetime.
- #### add\_years
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,172:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::add_years(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, years : Int64) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified years to this datetime, and returns a new datetime.
- #### day
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,112:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::day(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the day of month of this datetime.
- #### days\_in\_month
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,132:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::days_in_month(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the number of days in a month of this datetime.
- #### days\_in\_week
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,127:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::days_in_week(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the number of days in a week of this datetime.
- #### days\_in\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,137:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::days_in_year(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the number of days in a year of this datetime.
- #### era
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,92:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::era(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> String
  ```
  >  Returns the era of this datetime.
- #### era\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,97:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::era_year(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the year of era of this datetime.
- #### from\_string
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,63:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::from_string(str : String) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainTime from a string, like '2008-08-08T20:00:00'.
- #### from\_unix\_second
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,38:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::from_unix_second(second : Int64, nanosecond : Int, offset : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainDateTime from the elapsed seconds since the unix epoch.
- #### hour
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,152:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::hour(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the hour of this datetime.
- #### in\_leap\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,147:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::in_leap_year(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Bool
  ```
  >  Checks if this datetime is in a leap year.
- #### minute
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,157:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::minute(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the minute of this datetime.
- #### month
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,107:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::month(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the month of this datetime.
- #### months\_in\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,142:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::months_in_year(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the number of months in a year of this datetime.
- #### nanosecond
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,167:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::nanosecond(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the nanosecond of this datetime.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,22:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::of(year : Int, month : Int, day : Int, hour~ : Int = .., minute~ : Int = .., second~ : Int = .., nanosecond~ : Int = ..) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainDateTime from the year, month, day, hour, minute, second and nanosecond.
- #### ordinal
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,122:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::ordinal(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the ordinal day of year of this datetime.
- #### second
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,162:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::second(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the second of this datetime.
- #### to\_plain\_date
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,292:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::to_plain_date(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>
  ```
  >  Returns the date part of this datetime.
- #### to\_plain\_time
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,297:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::to_plain_time(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>
  ```
  >  Returns the time part of this datetime.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,75:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::to_string(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> String
  ```
  >  Returns a string representing the datetime.
- #### to\_unix\_second
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,57:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::to_unix_second(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int64
  ```
  >  Converts this datetime to the elapsed seconds since the unix epoch.
- #### weekday
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,117:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::weekday(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> <a href="moonbitlang/x/time#Weekday">Weekday</a>
  ```
  >  Returns the weekday of this datetime.
- #### with\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,259:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_day(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, day : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified day of month.
- #### with\_hour
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,269:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_hour(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, hour : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified hour.
- #### with\_minute
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,274:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_minute(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, minute : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified minute.
- #### with\_month
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,254:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_month(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, month : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified month.
- #### with\_nanosecond
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,284:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_nanosecond(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, nanosecond : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified nanosecond.
- #### with\_ordinal
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,264:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_ordinal(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, ordinal : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified ordinal day of year.
- #### with\_second
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,279:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_second(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, second : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified second.
- #### with\_year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,249:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::with_year(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, year : Int) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified year.
- #### year
  ```moonbit
  :::source,moonbitlang/x/time/plain_date_time.mbt,102:::fn <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>::year(self : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>) -> Int
  ```
  >  Returns the year of this datetime.

## PlainTime

```moonbit
:::source,moonbitlang/x/time/plain_time.mbt,16:::type PlainTime
```
 A time without a time zone

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,21:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="moonbitlang/x/time#PlainTime">PlainTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_time.mbt,21:::fn compare(<a href="moonbitlang/x/time#PlainTime">PlainTime</a>, <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,21:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/time#PlainTime">PlainTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_time.mbt,21:::fn op_equal(<a href="moonbitlang/x/time#PlainTime">PlainTime</a>, <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,81:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#PlainTime">PlainTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/plain_time.mbt,81:::fn output(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add\_duration
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,226:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::add_duration(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, duration : <a href="moonbitlang/x/time#Duration">Duration</a>) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds a duration to this time, and returns a new time.
- #### add\_hours
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,153:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::add_hours(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, hours : Int64) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified hours to this time, and returns a new time.
- #### add\_minutes
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,162:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::add_minutes(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, minutes : Int64) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified minutes to this time, and returns a new time.
- #### add\_nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,207:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::add_nanoseconds(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, nanoseconds : Int64) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified nanoseconds to this time, and returns a new time.
- #### add\_seconds
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,183:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::add_seconds(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, seconds : Int64) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified seconds to this time, and returns a new time.
- #### at\_date
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,272:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::at_date(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, date : <a href="moonbitlang/x/time#PlainDate">PlainDate</a>) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>
  ```
  >  Combines this time with a date to creates a PlainDateTime
- #### from\_nanosecond\_of\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,133:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::from_nanosecond_of_day(nanosecond : Int64) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainTime from the total nanoseconds of the day.
- #### from\_second\_of\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,120:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::from_second_of_day(second : Int) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainTime from the total seconds of the day.
- #### from\_string
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,38:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::from_string(str : String) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainTime from a string, like '10:20:30.45678'.
- #### hour
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,86:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::hour(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int
  ```
  >  Returns the hour of this time.
- #### minute
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,91:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::minute(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int
  ```
  >  Returns the minute of this time.
- #### nanosecond
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,101:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::nanosecond(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int
  ```
  >  Returns the nanosecond of this time.
- #### nanosecond\_of\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,114:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::nanosecond_of_day(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int64
  ```
  >  Returns the total nanoseconds of this time.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,24:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::of(hour : Int, minute : Int, second : Int, nanosecond : Int) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a PlainTime from the hour, minute, second and nanosecond.
- #### second
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,96:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::second(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int
  ```
  >  Returns the second of this time.
- #### second\_of\_day
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,106:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::second_of_day(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> Int
  ```
  >  Returns the total seconds of this time.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,63:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::to_string(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> String
  ```
  >  Returns a string representing the time.
- #### until
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,266:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::until(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, end : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>) -> <a href="moonbitlang/x/time#Duration">Duration</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns the duration between this time and another time.
- #### with\_hour
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,234:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::with_hour(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, hour : Int) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new time with the specified hour.
- #### with\_minute
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,242:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::with_minute(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, minute : Int) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new time with the specified minute.
- #### with\_nanosecond
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,258:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::with_nanosecond(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, nanosecond : Int) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new time with the specified nanosecond.
- #### with\_second
  ```moonbit
  :::source,moonbitlang/x/time/plain_time.mbt,250:::fn <a href="moonbitlang/x/time#PlainTime">PlainTime</a>::with_second(self : <a href="moonbitlang/x/time#PlainTime">PlainTime</a>, second : Int) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new time with the specified second.

## Weekday

```moonbit
:::source,moonbitlang/x/time/weekday.mbt,16:::pub(all) enum Weekday {
  Monday
  Tuesday
  Wednesday
  Thursday
  Friday
  Saturday
  Sunday
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/weekday.mbt,24:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/time#Weekday">Weekday</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/weekday.mbt,24:::fn op_equal(<a href="moonbitlang/x/time#Weekday">Weekday</a>, <a href="moonbitlang/x/time#Weekday">Weekday</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/weekday.mbt,24:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#Weekday">Weekday</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/weekday.mbt,24:::fn output(<a href="moonbitlang/x/time#Weekday">Weekday</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > automatically derived

## Zone

```moonbit
:::source,moonbitlang/x/time/zone.mbt,16:::type Zone
```
 Time zone.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/zone.mbt,20:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="moonbitlang/x/time#Zone">Zone</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/zone.mbt,20:::fn op_equal(<a href="moonbitlang/x/time#Zone">Zone</a>, <a href="moonbitlang/x/time#Zone">Zone</a>) -> Bool
    ```
    > automatically derived
- ```moonbit
  :::source,moonbitlang/x/time/zone.mbt,42:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#Zone">Zone</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/zone.mbt,42:::fn output(self : <a href="moonbitlang/x/time#Zone">Zone</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### is\_fixed
  ```moonbit
  :::source,moonbitlang/x/time/zone.mbt,32:::fn <a href="moonbitlang/x/time#Zone">Zone</a>::is_fixed(self : <a href="moonbitlang/x/time#Zone">Zone</a>) -> Bool
  ```
  >  Checks if this zone only has one offset.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/zone.mbt,37:::fn <a href="moonbitlang/x/time#Zone">Zone</a>::to_string(self : <a href="moonbitlang/x/time#Zone">Zone</a>) -> String
  ```
  >  Returns the zone id.

## ZoneOffset

```moonbit
:::source,moonbitlang/x/time/zone_offset.mbt,16:::type ZoneOffset
```
 Time offset from UTC.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,71:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/zone_offset.mbt,71:::fn output(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,81:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::compare(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>, other : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> Int
  ```
  > 
- #### from\_seconds
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,55:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::from_seconds(seconds : Int) -> <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a offset from seconds.
- #### id
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,86:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::id(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> String
  ```
  >  Returns the offset id.
- #### is\_dst
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,96:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::is_dst(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> Bool
  ```
  >  Checks if this offset is daylight saving time.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,42:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::of(hours~ : Int = .., minutes~ : Int = .., seconds~ : Int = ..) -> <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a offset from hours, minutes and seconds.
- #### op\_equal
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,76:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::op_equal(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>, other : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> Bool
  ```
  > 
- #### seconds
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,91:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::seconds(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> Int
  ```
  >  Returns the total seconds of this offset.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/zone_offset.mbt,66:::fn <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>::to_string(self : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>) -> String
  ```
  >  Returns the offset id.

## ZonedDateTime

```moonbit
:::source,moonbitlang/x/time/zoned_date_time.mbt,16:::type ZonedDateTime
```
 A datetime with a time zone and offset in the ISO 8601 calendar system.

#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,96:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>
  ```
  > 
  * ```moonbit
    :::source,moonbitlang/x/time/zoned_date_time.mbt,96:::fn output(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
    ```
    > 

#### mooncakes-io-method-mark-Methods
- #### add\_days
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,229:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_days(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, days : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified days to this datetime, and returns a new datetime.
- #### add\_hours
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,234:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_hours(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, hours : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified hours to this datetime, and returns a new datetime.
- #### add\_minutes
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,239:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_minutes(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, minutes : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified minutes to this datetime, and returns a new datetime.
- #### add\_months
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,219:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_months(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, months : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified months to this datetime, and returns a new datetime.
- #### add\_nanoseconds
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,255:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_nanoseconds(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, nanoseconds : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified nanoseconds to this datetime, and returns a new datetime.
- #### add\_seconds
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,247:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_seconds(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, seconds : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified seconds to this datetime, and returns a new datetime.
- #### add\_weeks
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,224:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_weeks(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, weeks : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified weeks to this datetime, and returns a new datetime.
- #### add\_years
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,214:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::add_years(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, years : Int64) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Adds specified years to this datetime, and returns a new datetime.
- #### day
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,144:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::day(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the day of month of this datetime.
- #### days\_in\_month
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,164:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::days_in_month(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the number of days in a month of this datetime.
- #### days\_in\_week
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,159:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::days_in_week(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the number of days in a month of this datetime.
- #### days\_in\_year
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,169:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::days_in_year(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the number of days in a year of this datetime.
- #### era
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,124:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::era(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> String
  ```
  >  Returns the era of this datetime.
- #### era\_year
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,129:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::era_year(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the year of era of this datetime.
- #### from\_plain\_datetime
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,63:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::from_plain_datetime(datetime : <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>, zone~ : <a href="moonbitlang/x/time#Zone">Zone</a> = ..) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>
  ```
  >  Creates a ZonedDateTime from a PlainDateTime and a time zone.
  > The default time zone is UTC+0.
- #### from\_unix\_second
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,72:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::from_unix_second(second : Int64, nanosecond~ : Int = .., zone~ : <a href="moonbitlang/x/time#Zone">Zone</a> = ..) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a ZonedDateTime from elapsed seconds since the unix epoch and a time zone.
  > The default time zone is UTC+0.
- #### hour
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,184:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::hour(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the hour of this datetime.
- #### in\_leap\_year
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,179:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::in_leap_year(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Bool
  ```
  >  Checks if this datetime is in a leap year.
- #### minute
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,189:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::minute(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the minute of this datetime.
- #### month
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,139:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::month(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the month of this datetime.
- #### months\_in\_year
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,174:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::months_in_year(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the number of months in a year of this datetime.
- #### nanosecond
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,199:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::nanosecond(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the nanosecond of this datetime.
- #### of
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,48:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::of(year : Int, month : Int, day : Int, hour~ : Int = .., minute~ : Int = .., second~ : Int = .., zone~ : <a href="moonbitlang/x/time#Zone">Zone</a> = ..) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Creates a ZonedDateTime from year, month, day, hour, minute and second.
  > The default time zone is UTC+0.
- #### offset
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,209:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::offset(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>
  ```
  >  Returns the time offset of this datetime.
- #### ordinal
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,154:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::ordinal(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the ordinal day of year of this datetime.
- #### second
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,194:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::second(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the second of this datetime.
- #### to\_plain\_date
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,109:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::to_plain_date(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> <a href="moonbitlang/x/time#PlainDate">PlainDate</a>
  ```
  >  Returns the date part of this datetime, without timezone.
- #### to\_plain\_date\_time
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,119:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::to_plain_date_time(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> <a href="moonbitlang/x/time#PlainDateTime">PlainDateTime</a>
  ```
  >  Returns the datetime part of this datetime, without timezone.
- #### to\_plain\_time
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,114:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::to_plain_time(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> <a href="moonbitlang/x/time#PlainTime">PlainTime</a>
  ```
  >  Returns the time part of this datetime, without timezone.
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,83:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::to_string(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> String
  ```
  >  Returns a string representing this datetime, like "2008-08-08T20:00:00+8:00\[Asia/Beijing\]"
- #### to\_unix\_second
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,104:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::to_unix_second(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int64
  ```
  >  Returns the elapsed seconds since the unix epoch.
- #### weekday
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,149:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::weekday(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> <a href="moonbitlang/x/time#Weekday">Weekday</a>
  ```
  >  Returns the weekday of this datetime.
- #### with\_day
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,273:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_day(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, day : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified day of the month.
- #### with\_hour
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,283:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_hour(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, hour : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified hour.
- #### with\_minute
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,288:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_minute(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, minute : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified minute.
- #### with\_month
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,268:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_month(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, month : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified month.
- #### with\_nanosecond
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,298:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_nanosecond(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, nanosecond : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified nanosecond.
- #### with\_ordinal
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,278:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_ordinal(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, ordinal : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified ordinal day of the year.
- #### with\_second
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,293:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_second(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, second : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified second.
- #### with\_year
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,263:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::with_year(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>, year : Int) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Returns a new datetime with the specified year.
- #### year
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,134:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::year(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> Int
  ```
  >  Returns the year of this datetime.
- #### zone
  ```moonbit
  :::source,moonbitlang/x/time/zoned_date_time.mbt,204:::fn <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>::zone(self : <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>) -> <a href="moonbitlang/x/time#Zone">Zone</a>
  ```
  >  Returns the time zone of this datetime.

## date\_time

```moonbit
:::source,moonbitlang/x/time/zoned_date_time.mbt,24:::fn date_time(year : Int, month : Int, day : Int, hour~ : Int = .., minute~ : Int = .., second~ : Int = .., zone~ : <a href="moonbitlang/x/time#Zone">Zone</a> = ..) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
```
 Creates a ZonedDateTime from year, month, day, hour, minute, second and a time zone.
The default time zone is UTC+0.

## fixed\_zone

```moonbit
:::source,moonbitlang/x/time/zone.mbt,26:::fn fixed_zone(id : String, offset_seconds : Int) -> <a href="moonbitlang/x/time#Zone">Zone</a>!<a href="moonbitlang/core/error#Error">Error</a>
```
 Creates a time zone with fixed offset from time zone id and offset seconds.

## unix

```moonbit
:::source,moonbitlang/x/time/zoned_date_time.mbt,38:::fn unix(second : Int64, nanosecond~ : Int = .., zone~ : <a href="moonbitlang/x/time#Zone">Zone</a> = ..) -> <a href="moonbitlang/x/time#ZonedDateTime">ZonedDateTime</a>!<a href="moonbitlang/core/error#Error">Error</a>
```
 Creates a ZonedDateTime from elapsed seconds since the unix epoch and a time zone.
The default time zone is UTC+0.

## utc\_offset

```moonbit
:::source,moonbitlang/x/time/zone_offset.mbt,35:::let utc_offset : <a href="moonbitlang/x/time#ZoneOffset">ZoneOffset</a>
```
 UTC+0 offset.

## utc\_zone

```moonbit
:::source,moonbitlang/x/time/zone.mbt,23:::let utc_zone : <a href="moonbitlang/x/time#Zone">Zone</a>
```
 UTC time zone.
