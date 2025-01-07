# Documentation
|Type|description|
|---|---|
|[ColumnNotFoundError](#ColumnNotFoundError)||
|[DType](#DType)||
|[DataFrame](#DataFrame)||
|[DuplicateColumnError](#DuplicateColumnError)||
|[EmptyArrayError](#EmptyArrayError)||
|[InconsistentSeriesLength](#InconsistentSeriesLength)||
|[IndexOutOfBounds](#IndexOutOfBounds)||
|[InvalidType](#InvalidType)||
|[Series](#Series)||
|[SeriesData](#SeriesData)||

## ColumnNotFoundError

```moonbit
:::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,22:::type ColumnNotFoundError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,22:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a> with output(<a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,22:::fn <a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>::output(<a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## DType

```moonbit
:::source,smallbearrr/pandas/lib/pandas/series.mbt,2:::pub(all) enum DType {
  Int(Int)
  Float(float)
  Bool(Bool)
  Str(String)
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,7:::impl <a href="moonbitlang/core/builtin#Compare">Compare</a> for <a href="smallbearrr/pandas/lib/pandas#DType">DType</a> with compare(<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>, <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>) -> Int
  ```
  > automatically derived
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,7:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="smallbearrr/pandas/lib/pandas#DType">DType</a> with op_equal(<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>, <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,7:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#DType">DType</a> with output(<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,7:::fn <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>::compare(<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>, <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>) -> Int
  ```
  > automatically derived
- #### op\_equal
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,7:::fn <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>::op_equal(<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>, <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,7:::fn <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>::output(<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#DType">DType</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## DataFrame

```moonbit
:::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,2:::pub(all) struct DataFrame {
  data : <a href="moonbitlang/core/array#Array">Array</a>[<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>]
  shape : <a href="moonbitlang/core/array#Array">Array</a>[Int]
  index : <a href="moonbitlang/core/builtin#Map">Map</a>[String, Int]
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,79:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a> with output(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  >  Trait Show for DataFrame

#### mooncakes-io-method-mark-Methods
- #### add\_column
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,157:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::add_column(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, col : <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Add a new column to the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `col` : The Series to be added as a new column
  > 
  >  #### Returns
  > 
  >  - `Unit!` : This function adds a new column to the DataFrame or raises an error
  > 
  >  #### Errors
  > 
  >  - `InconsistentSeriesLength`: Series length is not equal to the DataFrame length
  >  - `DuplicateColumnError`: Series name already exists
  > 
  >  #### Example
  >  ```
  >  let new_column = Series::new("B", SeriesData::Int([1, 2, 3]))
  >  df.add_column(new_column)
  >  ```
- #### add\_row
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,332:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::add_row(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, row : <a href="moonbitlang/core/array#Array">Array</a>[<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>]) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Add a new row to the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `row` : An array of DType representing the new row to be added
  > 
  >  #### Returns
  > 
  >  - `Unit` : This function adds a new row to the DataFrame
  > 
  >  #### Errors
  > 
  >  - `InconsistentSeriesLength` : Raised if the row length does not match the DataFrame column length
  >  - `InvalidType` : if there is a type mismatch
  > 
  >  #### Example
  >  ```
  >  let mut df = DataFrame::new([
  >    Series::new("A", SeriesData::Int([1, 2, 3])), 
  >    Series::new("B", SeriesData::Float([1.1, 2.2, 3.3]))
  >  ])
  >  df.add_row([DType::Int(4), DType::Float(4.4)])
  >  ```
- #### data
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,74:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::data(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>]
  ```
  > 
- #### drop\_column
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,188:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::drop_column(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, col_name : String) -> Unit!<a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>
  ```
  >  Drop a column from the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `col_name` : The name of the column to be dropped
  > 
  >  #### Returns
  > 
  >  - `Unit` : This function drops a column from the DataFrame
  > 
  >  #### Example
  >  ```
  >  df.drop_column("column_name")
  >  ```
- #### drop\_row
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,298:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::drop_row(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, row_index : Int) -> Unit!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Drop a row from the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `row` : The index of the row to be dropped
  > 
  >  #### Returns
  > 
  >  - `Unit` : This function drops a row from the DataFrame
  > 
  >  #### Errors
  > 
  >  - `IndexOutOfBounds` : Raised if the row index is out of bounds
  > 
  >  #### Example
  >  ```
  >  df.drop_row(0)
  >  ```
- #### filter
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,495:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::filter(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, name : String, f : (<a href="smallbearrr/pandas/lib/pandas#DType">DType</a>) -> Bool) -> <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>!<a href="moonbitlang/core/error#Error">Error</a>
  ```
  >  Filter rows in the DataFrame based on a condition
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `name` : The name of the column to apply the filter on
  >  - `f` : A function that takes a `DType` and returns a `Bool` indicating whether the row should be included
  > 
  >  #### Returns
  > 
  >  - `DataFrame` : A new DataFrame containing only the rows that satisfy the condition
  > 
  >  #### Example
  >  ```
  >  let df = DataFrame::new([Series::new("A", SeriesData::Int([1, 2, 3, 4, 5, 6]))])
  >  let filtered = df.filter("A", fn(x) -> Bool { x < DType::Int(3) })
  >  ```
- #### head
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,115:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::head(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>) -> Unit
  ```
  >  Display the first few rows of the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  > 
  >  #### Returns
  > 
  >  - `Unit` : This function prints the first few rows of the DataFrame
  > 
  >  #### Example
  >  ```
  >  df.head()
  >  ```
- #### new
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,53:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::new(data : <a href="moonbitlang/core/array#Array">Array</a>[<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>]) -> <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>!<a href="smallbearrr/pandas/lib/pandas#InconsistentSeriesLength">InconsistentSeriesLength</a>
  ```
  >  Create a new DataFrame
  > 
  >  #### Parameters
  > 
  >  - `data` : Array of Series
  > 
  >  #### Returns
  > 
  >  - `DataFrame!InconsistentSeriesLength` : A new DataFrame instance
  > 
  >  #### Errors
  > 
  >  - `InconsistentSeriesLength` : Raised if the lengths of the Series are not equal
  > 
  >  #### Example
  >  ```
  >  let df = DataFrame::new!([
  >    Series::new("A", SeriesData::Int([1, 1, 3, 1, 1, 6])),
  >    Series::new("B", SeriesData::Float([1.5, 2.0, 3.5, 4.0, 5.5, 6.0])),
  >    Series::new("C", SeriesData::Bool([true, false, true, false, true, false])),
  >    Series::new("D", SeriesData::Str(["a", "b", "c", "d", "e", "f"])),
  >  ])
  >  ```
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,79:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::output(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  >  Trait Show for DataFrame
- #### rename\_column
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,227:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::rename_column(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, old_name : String, new_name : String) -> Unit!<a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>
  ```
  >  Rename a column in the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `old_name` : The current name of the column to be renamed
  >  - `new_name` : The new name for the column
  > 
  >  #### Returns
  > 
  >  - `Unit` : This function renames a column in the DataFrame
  >  
  >  #### Errors
  >  
  >  - `ColumnNotFoundError` : Raised if the column is not found
  > 
  >  #### Example
  >  ```
  >  test {
  >    let mut df = DataFrame::new([Series::new("A", SeriesData::Int([1, 2]))])
  >    df.rename("A", "B")
  >    inspect!(df.data()[0].name(), context="B")
  >  }
  >  ```
- #### select\_columns
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,257:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::select_columns(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, cols : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>!<a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>
  ```
  >  Select specific columns from the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `cols` : An array of column names to be selected
  > 
  >  #### Returns
  > 
  >  - `DataFrame` : A new DataFrame containing only the selected columns
  >  
  >  #### Errors
  >  
  >  - `ColumnNotFoundError` : Raised if a column is not found
  > 
  >  #### Example
  >  ```
  >  let df_selected = df.select_columns(["col_name1", "col_name2"])
  >  ```
- #### select\_rows
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,387:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::select_rows(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, range? : (Int, Int), indices? : <a href="moonbitlang/core/array#Array">Array</a>[Int]) -> <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>!<a href="smallbearrr/pandas/lib/pandas#IndexOutOfBounds">IndexOutOfBounds</a>
  ```
  >  Select specific rows from the DataFrame
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `range` : An optional tuple representing the range of rows to be selected (inclusive start, exclusive end)
  >  - `indices` : An optional array of row indices to be selected
  > 
  >  #### Returns
  > 
  >  - `DataFrame` : A new DataFrame containing only the selected rows
  >  
  >  #### Errors
  >  
  >  - `IndexOutOfBounds` : Raised if the row index is out of bounds
  > 
  >  #### Example
  >  ```
  >  let df_selected_range = df.select_rows(range=(1, 4))
  >  
  >  let df_selected_indices = df.select_rows(indices=[1, 3, 5])
  >  ```
- #### shape
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,69:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::shape(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[Int]
  ```
  > 
- #### sort
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,569:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::sort(self : <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>, col_name : String, decrease~ : Bool = ..) -> Unit!<a href="smallbearrr/pandas/lib/pandas#ColumnNotFoundError">ColumnNotFoundError</a>
  ```
  >  Sort the DataFrame by a specified column
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the DataFrame
  >  - `col_name` : The name of the column to sort by
  >  - `decrease~` : Whether to sort in descending order (default is false)
  > 
  >  #### Returns
  > 
  >  - `Unit` : This function sorts the DataFrame in place
  > 
  >  #### Errors
  > 
  >  - `ColumnNotFoundError` : Raised if the specified column is not found
  > 
  >  #### Example
  >  ```
  >  let df = DataFrame::new([
  >    Series::new("A", SeriesData::Int([3, 1, 2])), 
  >    Series::new("B", SeriesData::Float([3.3, 1.1, 2.2]))
  >  ])
  >  df.sort("A", decrease=true)
  >  inspect!(df.data()[0].data(), content="Int([1, 2, 3])")
  >  ```
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#DataFrame">DataFrame</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## DuplicateColumnError

```moonbit
:::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,19:::type DuplicateColumnError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,19:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#DuplicateColumnError">DuplicateColumnError</a> with output(<a href="smallbearrr/pandas/lib/pandas#DuplicateColumnError">DuplicateColumnError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,19:::fn <a href="smallbearrr/pandas/lib/pandas#DuplicateColumnError">DuplicateColumnError</a>::output(<a href="smallbearrr/pandas/lib/pandas#DuplicateColumnError">DuplicateColumnError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#DuplicateColumnError">DuplicateColumnError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## EmptyArrayError

```moonbit
:::source,smallbearrr/pandas/lib/pandas/series.mbt,58:::type EmptyArrayError
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,58:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#EmptyArrayError">EmptyArrayError</a> with output(<a href="smallbearrr/pandas/lib/pandas#EmptyArrayError">EmptyArrayError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,58:::fn <a href="smallbearrr/pandas/lib/pandas#EmptyArrayError">EmptyArrayError</a>::output(<a href="smallbearrr/pandas/lib/pandas#EmptyArrayError">EmptyArrayError</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#EmptyArrayError">EmptyArrayError</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InconsistentSeriesLength

```moonbit
:::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,16:::type InconsistentSeriesLength
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,16:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#InconsistentSeriesLength">InconsistentSeriesLength</a> with output(<a href="smallbearrr/pandas/lib/pandas#InconsistentSeriesLength">InconsistentSeriesLength</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,16:::fn <a href="smallbearrr/pandas/lib/pandas#InconsistentSeriesLength">InconsistentSeriesLength</a>::output(<a href="smallbearrr/pandas/lib/pandas#InconsistentSeriesLength">InconsistentSeriesLength</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#InconsistentSeriesLength">InconsistentSeriesLength</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## IndexOutOfBounds

```moonbit
:::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,25:::type IndexOutOfBounds
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,25:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#IndexOutOfBounds">IndexOutOfBounds</a> with output(<a href="smallbearrr/pandas/lib/pandas#IndexOutOfBounds">IndexOutOfBounds</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,25:::fn <a href="smallbearrr/pandas/lib/pandas#IndexOutOfBounds">IndexOutOfBounds</a>::output(<a href="smallbearrr/pandas/lib/pandas#IndexOutOfBounds">IndexOutOfBounds</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#IndexOutOfBounds">IndexOutOfBounds</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## InvalidType

```moonbit
:::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,28:::type InvalidType
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,28:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#InvalidType">InvalidType</a> with output(<a href="smallbearrr/pandas/lib/pandas#InvalidType">InvalidType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/data_frame.mbt,28:::fn <a href="smallbearrr/pandas/lib/pandas#InvalidType">InvalidType</a>::output(<a href="smallbearrr/pandas/lib/pandas#InvalidType">InvalidType</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#InvalidType">InvalidType</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## Series

```moonbit
:::source,smallbearrr/pandas/lib/pandas/series.mbt,18:::pub(all) struct Series {
  name : String
  data : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,21:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="smallbearrr/pandas/lib/pandas#Series">Series</a> with op_equal(<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>, <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,21:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#Series">Series</a> with output(<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### argsort
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,155:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::argsort(self : <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>, decrease~ : Bool = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[Int]
  ```
  >  Sort the SeriesData in Series and return the indices of the sorted elements
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the SeriesData
  >  - `decrease` : A boolean indicating whether to sort in descending order (default is false)
  > 
  >  #### Returns
  > 
  >  - `Array[Int]` : An array of indices representing the sorted order of the elements
  > 
  >  #### Example
  >  ```
  >  let series = Series :: { name: "A", data: SeriesData::Int([3, 1, 2]) }
  >  let sorted_indices = series.argsort()
  >  ```
- #### data
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,165:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::data(self : <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>) -> <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>
  ```
  > 
- #### name
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,160:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::name(self : <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>) -> String
  ```
  > 
- #### new
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,38:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::new(name : String, values : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>) -> <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>
  ```
  >  Create a new Series
  > 
  >  #### Parameters
  > 
  >  - `name` : The name of the Series
  >  - `values` : The data contained in the Series
  > 
  >  #### Returns
  > 
  >  - `Series` : A new Series instance
  > 
  >  #### Example
  >  ```
  >  let series = Series::new("A", SeriesData::Int([1, 2, 3]))
  >  ```
- #### op\_equal
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,21:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::op_equal(<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>, <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,21:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::output(<a href="smallbearrr/pandas/lib/pandas#Series">Series</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#Series">Series</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 

## SeriesData

```moonbit
:::source,smallbearrr/pandas/lib/pandas/series.mbt,10:::pub(all) enum SeriesData {
  Int(<a href="moonbitlang/core/array#Array">Array</a>[Int])
  Float(<a href="moonbitlang/core/array#Array">Array</a>[float])
  Bool(<a href="moonbitlang/core/array#Array">Array</a>[Bool])
  Str(<a href="moonbitlang/core/array#Array">Array</a>[String])
}
```


#### mooncakes-io-implementation-mark-Implementations
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,15:::impl <a href="moonbitlang/core/builtin#Eq">Eq</a> for <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a> with op_equal(<a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>, <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>) -> Bool
  ```
  > automatically derived
- ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,15:::impl <a href="moonbitlang/core/builtin#Show">Show</a> for <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a> with output(<a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived

#### mooncakes-io-method-mark-Methods
- #### argsort
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,130:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::argsort(self : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>, decrease~ : Bool = ..) -> <a href="moonbitlang/core/array#Array">Array</a>[Int]
  ```
  >  Sort the SeriesData and return the indices of the sorted elements
  > 
  >  #### Parameters
  > 
  >  - `self` : An instance of the SeriesData
  >  - `decrease` : A boolean indicating whether to sort in descending order (default is false)
  > 
  >  #### Returns
  > 
  >  - `Array[Int]` : An array of indices representing the sorted order of the elements
  > 
  >  #### Example
  >  ```
  >  let data = SeriesData::Int([3, 1, 2])
  >  let sorted_indices = data.argsort()
  >  ```
- #### empty
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,53:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::empty(self : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>) -> Bool
  ```
  >  Check if the SeriesData is empty
- #### erase
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,61:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::erase(self : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>, index : Int) -> Unit!<a href="smallbearrr/pandas/lib/pandas#EmptyArrayError">EmptyArrayError</a>
  ```
  >  erase the element at the given index
- #### length
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,43:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::length(self : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>) -> Int
  ```
  >  Get the length of the SeriesData
- #### op\_equal
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,15:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::op_equal(<a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>, <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>) -> Bool
  ```
  > automatically derived
- #### output
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,15:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::output(<a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>, <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > automatically derived
- #### sort
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/series.mbt,77:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::sort(self : <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>) -> Unit
  ```
  >  Sort the SeriesData
- #### to\_string
  ```moonbit
  :::source,smallbearrr/pandas/lib/pandas/traits.mbt,85:::fn <a href="smallbearrr/pandas/lib/pandas#SeriesData">SeriesData</a>::to_string[Self : <a href="moonbitlang/core/builtin#Show">Show</a>](self : Self) -> String
  ```
  > 
