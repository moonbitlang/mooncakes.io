
<div id="mod-info">
    <h1 id="mod-title"> pandas <span id="mod-version">v0.1.9</span></h1>
    
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>smallbearrr</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/smallbearrr/pandas">https://github.com/smallbearrr/pandas</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>pandas</li>
                <li>dataframe</li>
                <li>data cleaning</li>
                <li>data manipulation</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add smallbearrr/pandas </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# Pandas In Moonbit

## Introduction
This is a data processing library written in Moonbit. It provides a DataFrame data structure for efficient data manipulation and analysis.

## Usage

### Create a DataFrame
```moonbit
let col1 = Series::new("A", SeriesData::Int([1, 2, 3, 4, 5, 6]))
let col2 = Series::new("B", SeriesData::Float([1.1, 2.2, 3.3, 4.4, 5.5, 6.6]))
let df = DataFrame::new([col1, col2])
```

### Display the first few rows of the DataFrame
```moonbit
df.head()
```

### Print the DataFrame structure
DataFrame already traits the `Show`, so you can print the structure of the DataFrame directly:
```moonbit
println(df)
```

### Add a new column
```moonbit
let new_col = Series::new("C", SeriesData::Bool([true, false, true, false, true, false]))
df.add_column!(new_col)
```

### Drop a column
```moonbit
df.drop_column!("C")
```

### Rename a column
```moonbit
df.rename_column!("A", "A1")
```

### Select specific columns
```moonbit
let df_selected = df.select_columns!(["A1", "B"])
```

### Drop a row
```moonbit
df.drop_row!(0)
```

### Add a new row
```moonbit
df.add_row!([DType::Int(7), DType::Float(7.5), DType::Bool(true), DType::Str("g")])
```

### Select specific rows
Select rows by range or by specific indices:
```moonbit
let row_selected_range = df.select_rows!(range=(1, 3))

let row_selected_indices = df.select_rows!(indices=[1, 3, 5])
```

### Filter rows based on a condition
Filter rows based on a condition applied to a specific column:
```moonbit
let filtered = df.filter!("A", fn(x) -> Bool { x < DType::Int(3) })
```

### Sort the DataFrame by a specified column
Sort the DataFrame by a specified column in ascending or descending order:
```moonbit
df.sort!("A")
df.sort!("B", decrease=true)

## Contributing
Issues and pull requests are welcome. Please make sure to run all tests before submitting.

## Contact
If you have questions, feel free to open an issue in the repository. For other inquiries, contact me via email: [2421342308a@gmail.com].

## License
This project is licensed under the Apache-2.0 License. See the LICENSE file for details.