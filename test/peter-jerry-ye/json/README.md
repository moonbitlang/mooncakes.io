
<div id="mod-info">
    <h1 id="mod-title"> json <span id="mod-version">v0.4.0</span></h1>
    
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>peter-jerry-ye</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add peter-jerry-ye/json </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# 一个简单的JSON解析器

一个简单的JSON解析器，基于[解析器组合子](https://mooncakes.io/docs/#/peter-jerry-ye/parser-combinator/)，经过[nst/JSONTestSuite](https://github.com/nst/JSONTestSuite)测试。

⚠️：无法正确处理嵌套层数过多的情况。请参考[具体测试结果](https://github.com/peter-jerry-ye/JSONTestSuite/blob/2f0a2c5555a750ccaaaba5885267e02a074e933b/results/logs.txt)

## 使用说明

可以利用下方的代码：
```moonbit
let parser : @parsec.Parser[Char, JValue] = parser()
let result : Option[(JValue, @parsec.Seq[Char])] = parser.parse(
  @parsec.Seq::from_string("[[["),
)
match result {
  Some(_) => abort("failed")
  _ => ()
}
```

核心代码签名：
```moonbit
pub fn parser[J : JSON]() -> @parsec.Parser[Char, J]
```

利用Tagless Final定义`JSON`接口。使用时需加类型声明指明解析的结果类型（需实现`JSON`接口）。默认提供传统的`JValue`抽象语法树。