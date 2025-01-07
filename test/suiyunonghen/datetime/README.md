
<div id="mod-info">
    <h1 id="mod-title"> datetime <span id="mod-version">v0.1.5</span></h1>
    datetime type of moonbit
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>suiyunonghen</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/suiyunonghen/datetime">https://github.com/suiyunonghen/datetime</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>datetime</li>
                <li>date</li>
                <li>time</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add suiyunonghen/datetime </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



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