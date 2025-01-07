# moonbitlang/x/benchmark

## Overview

This section provides some benchmark APIs, which are unstable and may be removed or modified at any time.

## Usage

You can create Criterion and add tasks(by `add` and `Task::new`) to them like this:

```moonbit
fn sum(x : Int) -> Int {
  let mut result = 0
  for i = 1; i <= x; i = i + 1 {
    result += x
    result %= 11451419
    result -= 2
    result = result | 1
    result *= 19190
    result %= 11451419
  }
  result
}

let criterion = Criterion::new()
criterion.add(Task::new("sum", fn() { sum(10000000) |> ignore }, count=100))
```

You need to specify a name and a function to test for each task, with an optional parameter being the number of times it will be executed. In statistical experience, the higher the number of times, the more accurate the results will be, and the default value for the number of times is 10.

Next, you can run these tests：

```moonbit
let result=criterion.run()
println(result["sum"])
```

The return type is Map[String, TaskResult], which indexes the results of each run by name. Additionally, TaskResult implements the show trait, so it can be directly output.

The following is a detailed definition of Task/TaskResult:

```moonbit
struct Task {
  name : String // The name of the task
  f : () -> Unit // The tested function
  count : Int // Number of tests conducted
}

struct TaskResult {
  task : Task // Task corresponding to the result
  average : Double // Average execution time
  max : Double // Maximum execution time per execution
  min : Double // Minimum execution time per execution
}
```

---
# Documentation
|Type|description|
|---|---|
|[Criterion](#Criterion)||
|[Task](#Task)||
|[TaskResult](#TaskResult)||

## Criterion

```moonbit
:::source,moonbitlang/x/benchmark/types.mbt,31:::type Criterion
```


#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,60:::fn <a href="moonbitlang/x/benchmark#Criterion">Criterion</a>::add(self : <a href="moonbitlang/x/benchmark#Criterion">Criterion</a>, task : <a href="moonbitlang/x/benchmark#Task">Task</a>) -> Unit
  ```
  > 
- #### new
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,55:::fn <a href="moonbitlang/x/benchmark#Criterion">Criterion</a>::new() -> <a href="moonbitlang/x/benchmark#Criterion">Criterion</a>
  ```
  > 
- #### run
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,65:::fn <a href="moonbitlang/x/benchmark#Criterion">Criterion</a>::run(self : <a href="moonbitlang/x/benchmark#Criterion">Criterion</a>) -> <a href="moonbitlang/core/builtin#Map">Map</a>[String, <a href="moonbitlang/x/benchmark#TaskResult">TaskResult</a>]
  ```
  > 

## Task

```moonbit
:::source,moonbitlang/x/benchmark/types.mbt,16:::type Task
```


#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,16:::fn <a href="moonbitlang/x/benchmark#Task">Task</a>::new(name : String, f : () -> Unit, count~ : Int = ..) -> <a href="moonbitlang/x/benchmark#Task">Task</a>
  ```
  > 
- #### run
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,21:::fn <a href="moonbitlang/x/benchmark#Task">Task</a>::run(self : <a href="moonbitlang/x/benchmark#Task">Task</a>) -> <a href="moonbitlang/x/benchmark#TaskResult">TaskResult</a>
  ```
  > 

## TaskResult

```moonbit
:::source,moonbitlang/x/benchmark/types.mbt,23:::pub struct TaskResult {
  task : <a href="moonbitlang/x/benchmark#Task">Task</a>
  average : Double
  max : Double
  min : Double
}
```


#### mooncakes-io-method-mark-Methods
- #### output
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,50:::fn <a href="moonbitlang/x/benchmark#TaskResult">TaskResult</a>::output(self : <a href="moonbitlang/x/benchmark#TaskResult">TaskResult</a>, logger : <a href="moonbitlang/core/builtin#Logger">Logger</a>) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,moonbitlang/x/benchmark/benchmark.mbt,40:::fn <a href="moonbitlang/x/benchmark#TaskResult">TaskResult</a>::to_string(self : <a href="moonbitlang/x/benchmark#TaskResult">TaskResult</a>) -> String
  ```
  > 
