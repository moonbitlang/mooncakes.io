# suiyunonghen/datetime
datetime type of moonbit
# Design rules
Take 1899-12-30 0:0:0.0 as the zero time  
DateTime is a double type, where the integer part represents the number of days from 1899-12-30 to time, and the decimal part represents the percentage of milliseconds in the current day's time 
(milliseconds from 0:00 to the current time/total milliseconds in the day)
# usage
```MoonBit
let date1 = new(2024, 11, 18, 18, 23, 43, 199).unwrap()
let date = date1.decode_date()
let week=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
println("\{date.year}-\{date.month}-\{date.day} \{week[date.dayofweek-1]}")
let time = date1.decode_time()
println("\{time.hour}:\{time.minute}:\{time.second}.\{time.milliseconds}")
```

# create dateTime
You can generate a new timestamp type using methods such as From_unix_deconds, From_unix_maconds, new_date, new_time, new, etc
```MoonBit
let date1 = new(2024, 11, 18, 18, 23, 43, 199).unwrap()
let date2 = from_unix_seconds(1731934794)
```

# datetime conversion
You can use the inc_*** series of methods, such as inc_milliseconds, inc_seconds, inc_year, etc., to convert time
The difference between two times can be calculated using methods such as ***_betweek series, such as hours_betweek, mintes_betweek, etc
Datetime1-Datetime2 obtains the interval of days between two times, such as 0.5 days

# decode
You can use methods such as decode_date, decode_time, and decode to decode the year, month, day, and time information
```MoonBit
let date1 = new(2024, 11, 18, 18, 23, 43, 199).unwrap()
let date = date1.decode_date()
let week=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
println("\{date.year}-\{date.month}-\{date.day} \{week[date.dayofweek-1]}")
```

# parse from string
Implemented @strconv.FromStr trait
```MoonBit
match parse_datetime?("2024-12-03 12:32:33.981"){
    Ok(v)=>println(v)
    _=>()
}
```