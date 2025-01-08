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