# moonbit的一个双向链表库

## 使用 Usage
```
let list: @linklist.LinkList[Int] = @linklist.LinkList::new().push(123).push(456).push(789)  
let last=list.peek()
if last==789{
    println(list.pop())
}
list.remove(123)
if list.shift()==456{
    list.unshift(123)
}
let _ = list.push(23).push(33).push(34)
for ele in list{
    println(ele)
}

println("下面是反向迭代")
let m = list.reverse_iter()
for str in m{
  println(str)    
}

let list = @linklist.LinkList::of([1,2,3,4,5,6,7,8,9])
let _ =list.drop_while(fn(value)->Bool{
  value % 2 == 0
})
println(list)
println(list[3])
```