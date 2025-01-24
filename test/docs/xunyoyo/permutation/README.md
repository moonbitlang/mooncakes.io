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