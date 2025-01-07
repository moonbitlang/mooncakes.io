
<div id="mod-info">
    <h1 id="mod-title"> fmt <span id="mod-version">v0.1.3</span></h1>
    simple printf utils
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>kesmeey</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/kesmeey/fmt">https://github.com/kesmeey/fmt</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>format</li>
                <li>utils</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add kesmeey/fmt </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>





# fmt

一个类似于 C++ printf 和 Go fmt 的字符串格式化库。

## 功能特点

- 支持多种数据类型格式化
- 提供宽度和精度控制
- 支持左对齐/右对齐
- 支持零填充
- 支持科学计数法

## 支持的格式化选项

- `%d` - 整数
- `%u` - 无符号整数
- `%f` - 浮点数
- `%e/%E` - 科学计数法
- `%g/%G` - 自动选择 %f 或 %e
- `%s` - 字符串
- `%x/%X` - 十六进制（小写/大写）
- `%o` - 八进制

### 标志位

- `-` : 左对齐
- `+` : 显示正号
- `0` : 零填充
- 数字 : 指定宽度
- `.数字` : 指定精度

## 使用示例

%s %d %f 用法样例

```
fn main { 
 // 定义格式化字符串
    let fmt_str = "Hello %s, you have %05d unread messages. Pi is approximately %.2f.";

    // 初始化Formatter
    let formatter = Formatter::new(fmt_str);

    // 定义参数
    let args: Array[Args_Type] = [
        Args_Type::String("Alice".to_string()), // %s 替换为 "Alice"
        Args_Type::Int(42),                    // %05d 替换为 "00042"
        Args_Type::Double(3.14159),            // %.2f 替换为 "3.14"
    ];

    // 使用Formatter进行格式化
    let result = formatter.fmt(args);

    // 打印结果
    println(result);

}
```

```
Hello Alice, you have 00042 unread messages. Pi is approximately 3.14.
```

%u %X %x %o 用法样例

```
fn main { 
    // 定义格式化字符串
    let fmt_str = "Unsigned: %u, Hex Upper: %X, Hex Lower: %x, Octal: %o";

    // 初始化Formatter
    let formatter = Formatter::new(fmt_str);

    // 定义参数
    let args: Array[Args_Type] = [
        Args_Type::UInt(4294967295),  // %u 替换为 "4294967295"
        Args_Type::Int(255),          // %X 替换为 "FF"
        Args_Type::Int(255),          // %x 替换为 "ff"
        Args_Type::Int(255)           // %o 替换为 "377"
    ];

    // 使用Formatter进行格式化
    let result = formatter.fmt(args);

    // 打印结果
    println(result); 
}

```

```
"Unsigned: 4294967295, Hex Upper: FF, Hex Lower: ff, Octal: 377"
```

科学技术法 %e %E 用法样例

```
fn main { 
 // 示例：科学计数法格式化
    let fmt_str = "Scientific notation: %10.3e, Uppercase: %12.2E";

    // 初始化Formatter
    let formatter = Formatter::new(fmt_str);

    // 定义参数
    let args: Array[Args_Type] = [
        Args_Type::Double(0.00012345), // 科学计数法格式化（小写）
        Args_Type::Double(-98765.4321), // 科学计数法格式化（大写）
    ];

    // 使用Formatter进行格式化
    let result = formatter.fmt(args);

    // 打印结果
    println(result);

}
```

```
Scientific notation:  1.234e-04, Uppercase:   -9.-87E+04
```

标识符用法样例

```
fn main { 
   //  标志位组合测试
    let fmt1 = "整数标志位测试:\n正数显示: %+d\n空格填充: %8d\n零填充: %08d\n";
    let args1: Array[Args_Type] = [
        Args_Type::Int(42),    // 测试显示正号
        Args_Type::Int(123),   // 测试空格填充
        Args_Type::Int(456)    // 测试零填充
    ];
    println(Formatter::new(fmt1).fmt(args1));
}
```

```
整数标志位测试:
正数显示: +42
空格填充:      123
零填充: 00000456
```

字符串对齐用法样例

```
fn main { 
    // 定义格式化字符串
    let fmt_str = "Left aligned: '%-10s', Right aligned: '%10s'";

    // 初始化Formatter
    let formatter = Formatter::new(fmt_str);

    // 定义参数
    let args: Array[Args_Type] = [
        Args_Type::String("left"),   // %-10s 替换为 "left      "
        Args_Type::String("right")   // %10s 替换为 "     right"
    ];

    // 使用Formatter进行格式化
    let result = formatter.fmt(args);

    // 打印结果
    println(result);  
}
```

```
Left aligned: 'left      ', Right aligned: '     right'
```



 通用格式(%g/%G)用法样例

```
fn main { 
    //通用格式(%g/%G)测试
    let fmt2 = "通用格式测试:\n小数: %g\n科学计数: %g\n大写形式: %G\n精度控制: %.3g\n";
    let args2: Array[Args_Type] = [
        Args_Type::Double(123.456),      // 常规小数
        Args_Type::Double(0.000123),     // 自动使用科学计数
        Args_Type::Double(1.23e+6),      // 大写形式测试
        Args_Type::Double(1234.5678)     // 精度控制测试
    ];
    println(Formatter::new(fmt2).fmt(args2));

}
```

```
通用格式测试:
小数: 123.456
科学计数: 0.123000
大写形式: 1.23000E+06
精度控制: 1.23e+03
```

特殊值（正无穷大 负无穷大） 用法样例

```
 fn main { 
 // 特殊值测试
    let fmt4 = "特殊值测试:\n%g\n%G\n";
    let args4: Array[Args_Type] = [
        Args_Type::Double(1.0/0.0),      // 正无穷
        Args_Type::Double(-1.0/0.0)      // 负无穷
    ];
    println(Formatter::new(fmt4).fmt(args4));
}
```

```
特殊值测试:
inf
-INF
```



