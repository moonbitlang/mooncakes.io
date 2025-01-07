
<div id="mod-info">
    <h1 id="mod-title"> moonbit-eval <span id="mod-version">v0.1.5</span></h1>
    MoonBit Eval Package
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>oboard</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/oboard/moonbit-eval">https://github.com/oboard/moonbit-eval</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>moonbit</li>
                <li>eval</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add oboard/moonbit-eval </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# MoonBit Eval

## Introduction
MoonBit Eval is a interpreter of MoonBit language.


## Progress
- [x] Expression
- [x] Variable
- [x] Basic Types
- [x] If
- [x] Let (Mut)
- [x] Assign
- [x] For
- [ ] While
- [ ] Match
- [ ] Struct
- [ ] Trait


## Examples

### Fibonacci Test
```moonbit
test "fibonacci" {
  let vm = MoonBitVM::new(log=true)
  inspect!(
    vm.eval(
      #|fn fib(n : Int) -> Int {
      #|  if n <= 1 {
      #|    1
      #|  } else {
      #|    fib(n - 1) + fib(n - 2)
      #|  }
      #|}
    ),
    content="Unit",
  )
  inspect!(vm.eval("fib(10)"), content="Int(89)")
}
```

### Mutable Variables Test
```moonbit
test "mutable variables" {
  let vm = MoonBitVM::new()
  inspect!(vm.eval("let mut a = 1"), content="Unit")
  inspect!(vm.eval("a = 12"), content="Unit")
  inspect!(vm.eval("a"), content="Int(12)")
}
```

### Function Test
```moonbit
test "function" {
  let vm = MoonBitVM::new()
  inspect!(vm.eval("fn double(x: Int) -> Int { x*2 }"), content="Unit")
  inspect!(vm.eval("double(2)"), content="Int(4)")
}
```



MoonBit Eval 是 MoonBit 语言的解释器，它宛如一颗待打磨的宝石，充满潜力。

感谢 `lijiajun3029` 提供的 `minimoonbit-public` 项目，它是 MoonBit Eval 的基础。

https://github.com/lijiajun3029/minimoonbit-public


🎉欢迎大家参与 MoonBit Eval 项目的代码贡献！🎉


🙌快来吧！🙌

QQ 群号：**949886784**

![QQ群](qrcode.jpg)