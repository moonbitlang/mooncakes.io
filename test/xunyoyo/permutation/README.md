
<div id="mod-info">
    <h1 id="mod-title"> permutation <span id="mod-version">v0.1.3</span></h1>
    Array permutation.
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>xunyoyo</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/xunyoyo/permutation">https://github.com/xunyoyo/permutation</a></p>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add xunyoyo/permutation </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# xunyoyo/permutation

这是一个用Moonbit语言实现的项目，包含以下主要功能：
1. 生成数组的下一个字典序排列。
2. 生成数组的上一个字典序排列。
3. 检查两个数组是否为排列。

## 功能

### next_permutation

生成给定数组的下一个字典序排列。如果当前排列是最后一个排列，则返回`false`并将数组重新排列为第一个排列（升序）。

#### 示例

```moonbit
fn main {
  let a = [1, 2, 3]
  let has_next = next_permutation(a)
  println(a) // 输出: [1, 3, 2]
  println(has_next) // 输出: true
}
```

### prev_permutation

生成给定数组的上一个字典序排列。如果当前排列是第一个排列，则返回`false`并将数组重新排列为最后一个排列（降序）。

#### 示例

```moonbit
fn main {
  let a = [1, 2, 3]
  let has_prev = prev_permutation(a)
  println(a) // 输出: [3, 2, 1]
  println(has_prev) // 输出: true
}
```

### is_permutation

检查两个数组是否互为排列。

#### 示例

```moonbit
fn main {
  let a = [1, 2, 3, 4]
  let b = [3, 1, 4, 2]
  let result = is_permutation(a, b)
  println(result) // 输出: true
}
```