# Pandas In Moonbit

## Introduction
This is a data processing library written in Moonbit. It provides a DataFrame data structure for efficient data manipulation and analysis.

## Usage

### DataFrame
create a DataFrame
```moonbit
let col1 = Series::new("A", SeriesData::Int([1, 2, 3, 4, 5, 6]))
let col2 = Series::new("B", SeriesData::Float([1.1, 2.2, 3.3, 4.4, 5.5, 6.6]))
let df = DataFrame::new([col1, col2])
```

Display the first few(min(size, 5)) rows of the DataFrame
```moonbit
df.head()
```

DataFrame already traits the `Show`, it can print the DataFrame directly:
```moonbit
println(df)
```

Add a new column
```moonbit
let new_col = Series::new("C", SeriesData::Bool([true, false, true, false, true, false]))
df.add_column!(new_col)
```

Drop a column
```moonbit
df.drop_column!("C")
```

Rename a column
```moonbit
df.rename!("A", "A1")
```

Select a column
```moonbit
let df_col = df.column("A")
```

Select specific columns
```moonbit
let df_cols = df.select_columns!(["A1", "B"])
```

Drop a row
```moonbit
df.drop_row!(0)
```

Add a new row
```moonbit
df.add_row!([DType::Int(7), DType::Float(7.5), DType::Bool(true), DType::Str("g")])
```

Select rows by range or by specific indices:
```moonbit
let row_selected_range = df.select_rows!(range=(1, 3))
let row_selected_indices = df.select_rows!(indices=[1, 3, 5])
```

Filter rows based on a condition applied to a specific column:
```moonbit
let filtered = df.filter!("A", fn(x) -> Bool { x < DType::Int(3) })
```

Sort the DataFrame by a specified column in ascending or descending order:
```moonbit
df.sort!("A")
df.sort!("B", descending=true)
```

Vertically stack two DataFrame
```moonbit
let new_df = df1.vstack!(df2)
```

Horizontally stack two DataFra
```moonbit
let new_df = df1.hstack!(df2)
```

### Series
Create a Series
```moonbit
let series_int = Series::new("IntColumn", SeriesData::Int([1, 2, 3, 4, 5]))
let series_float = Series::new("FloatColumn", SeriesData::Float([1.1, 2.2, 3.3, 4.4, 5.5]))
let series_bool = Series::new("BoolColumn", SeriesData::Bool([true, false, true, false, true]))
let series_str = Series::new("StrColumn", SeriesData::Str(["a", "b", "c", "d", "e"]))
```

Erase element
```moonbit
series.erase(1)
```

Sort the SeriesData in Series and return the indices of the sorted elements
```moonbit
let indices = series.sort()
```

Add two Series
```moonbit
let series1 = Series::new("A", SeriesData::Int([1, 2, 3]))
let series2 = Series::new("B", SeriesData::Float([1.5, 2.0, 3.5]))
let add = series1 + series2
```

Operation of add, subtract, multiply and divide
```moonbit
let add_op = series1 + series2
let sub_op = series1 - series2
let mul_op = series1 * series2
let div_op = series1 / series2
```

## Contributing
Issues and pull requests are welcome. Please make sure to run all tests before submitting.

## Contact
If you have questions, feel free to open an issue in the repository. For other inquiries, contact me via email: [2421342308a@gmail.com].

## License
This project is licensed under the Apache-2.0 License. See the LICENSE file for details.