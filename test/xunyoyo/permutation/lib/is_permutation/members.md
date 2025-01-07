# Next Permutation

这是一个用Moonbit语言实现的`is_permutation`函数，用于检查一个数组是否为另一个数组的排列。

## 功能

`is_permutation`函数检查一个数组是否为另一个数组的排列。如果给定数组是另一个数组的排列，则返回`true`，反之，返回`false`。

## 使用方法

### 直接比较

```moonbit
fn main {
  let a = [1, 2, 3, 4]
  let b = [3, 1, 4, 2]
  let result = is_permutation(a, b)
  println(result) // 输出: true
}
```

### 范围比较

`start1`表示第一个数组的起始位置，`start2`表示第二个数组的起始位置，`end1`表示第一个数组的终止位置，数组下标前闭后开。

```moonbit
fn main {
  let a = [1, 2, 3, 4]
  let b = [3, 1, 4, 2]
  let result = is_permutation(a, b, start1=0, end1=3, start2=0)
  println(result) // 输出: false
}
```
---
# Documentation
|Value|description|
|---|---|
|[is\_permutation](#is_permutation)| \||

## is\_permutation

```moonbit
:::source,xunyoyo/permutation/lib/is_permutation/is_permutation.mbt,31:::fn is_permutation[T : <a href="moonbitlang/core/builtin#Compare">Compare</a> + <a href="moonbitlang/core/builtin#Eq">Eq</a>](arr1 : <a href="moonbitlang/core/array#Array">Array</a>[T], arr2 : <a href="moonbitlang/core/array#Array">Array</a>[T], start1~ : Int = .., end1~ : Int = .., start2~ : Int = ..) -> Bool
```
 \|
检查两个数组是否为排列。

 #### Example
 ```
 let a = [1, 2, 3, 4]
 let b = [3, 1, 4, 2]
 let result = is_permutation(a, b)
 println(result) // 输出: true
 ```
 @alert unsafe "如果数组长度不一致，将返回 false。"
