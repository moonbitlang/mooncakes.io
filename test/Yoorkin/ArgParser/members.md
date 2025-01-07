# ArgParser

Command line parser for MoonBit. It use a declarative style to specify command line interface.

# Usage 

```moonbit
fn main {
  let argv = ["-o", "out.mbt", "file1", "file2", "--verbose"]
  let verbose = @ref.ref(false)
  let output = @ref.ref("output")
  let files = @vec.new()
  let usage =
    #| Awesome CLI tool!
    #| usage: 
    #|      mytool [options] <file1> [<file2>] ... -o <output>
    #|

  parse(
    [
      ("--verbose", "-v", Set(verbose), "enable verbose message"),
      ("--output", "-o", Set_string(output), "output file name"),
    ],
    fn { file => files.push(file) },
    usage,
    argv,
  )
  println(verbose)
  println(output)
  println(files[0]) 
  println(files[1]) 
}
```

output: 

```
{val: true}
{val: out.mbt}
file1
file2
```

## `help` options

ArgParser will automatically generate `--help` and `-h` options.

```moonbit
fn main {
  let argv = ["--help"]
  let usage =
    #| Awesome CLI tool!
    #| usage: 
    #|      mytool [options] <file1> [<file2>] ... -o <output>
    #|

  parse(
    [
      ("--verbose", "-v", Set(verbose), "enable verbose message"),
      ("--output", "-o", Set_string(output), "output file name"),
    ],
    ignore,
    usage,
    argv,
  )
}
```

output: 

```bash
Awesome CLI tool!
usage: 
    mytool [options] \<file1\> [<file2>] ... -o \<output\>
options:
  --verbose     -v      enable verbose message
  --output      -o      output file name
```









---
# Documentation
|Type|description|
|---|---|
|[Spec](#Spec)||

|Value|description|
|---|---|
|[parse](#parse)||

## Spec

```moonbit
:::source,Yoorkin/ArgParser/arg.mbt,1:::pub(all) enum Spec {
  Unit(() -> Unit)
  String((String) -> Unit)
  Set_string(<a href="moonbitlang/core/ref#Ref">Ref</a>[String])
  Set(<a href="moonbitlang/core/ref#Ref">Ref</a>[Bool])
  Clear(<a href="moonbitlang/core/ref#Ref">Ref</a>[Bool])
}
```


## parse

```moonbit
:::source,Yoorkin/ArgParser/arg.mbt,51:::fn parse(speclist : <a href="moonbitlang/core/array#Array">Array</a>[(String, String, <a href="Yoorkin/ArgParser#Spec">Spec</a>, String)], rest : (String) -> Unit, usage_msg : String, argv : <a href="moonbitlang/core/array#Array">Array</a>[String]) -> Unit
```

