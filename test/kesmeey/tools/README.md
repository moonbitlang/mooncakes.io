
<div id="mod-info">
    <h1 id="mod-title"> tools <span id="mod-version">v0.1.2</span></h1>
    A utility library similar to Hutool in Java.
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
                <li>tools</li>
                <li>utility</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add kesmeey/tools </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# tools

该库是模仿 Java 的[hutool](https://github.com/dromara/hutool)工具库进行编写，编写一些实用的工具库（判断身份证是否合法，手机号是否合法等）

检测18位身份证是否合法

```

fn main {
    let id1 = "11010519491231002X";
    let id2 = "11010519491231002Y";
    let id3 = "123456789012345678";
    println(@tools.is_valid_18_card(id1)); // 应输出 true
    println(@tools.is_valid_18_card(id2)); // 应输出 false
    println(@tools.is_valid_18_card(id3)); // 应输出 false
}
```

隐藏身份证的部分号码

```
fn main {
    let id_18 = "110105199001011234"
    println("原始号码: " + id_18)///原始号码: 110105199001011234
    println("隐藏生日: " + @tools.hide_id_card(id_18, 6, 14))///隐藏生日: 110105********1234
    println("隐藏尾号: " + @tools.hide_id_card(id_18, 14, 18))///隐藏尾号: 11010519900101****
    
}
```



提取身份证的信息

```
fn main {
    let id_18 = "210202200107285894"
 // 提取身份证信息
    match @tools.parse_id_card(id_18) {
        Some(info) => {
            println("\n身份证信息:")
            println("省份代码: " + info.get_province_code()) ///省份代码: 21
            println("省份名称: " + info.get_province())///省份名称: 辽宁
            println("出生日期: " + info.get_birth_date())///出生日期: 2001-07-28
            let gender = if info.get_gender() == 1 { "男" } else { "女" }
            println("性别: " + gender)///性别: 男
            println("年龄: " + info.get_age().to_string())///年龄: 23
        }
        None => println("解析身份证信息失败")
    }
    
}

```



输出全部身份证信息

```

fn main {
    let id_18 = "210202200107285894"
 // 提取身份证信息
    match @tools.parse_id_card(id_18) {
        Some(info) => {
          print(info.to_string())
        }
        None => println("解析身份证信息失败")
    }
    
}
///输出IdCard{provinceCode='21', cityCode='2102', birthDate=2001-7-28, gender=1, age=23}
```

检测社会信用卡是否合法

```
fn main {
     let valid_code = "92371000MA3MXH0E3W"
     let invalid_code = "1234567890123456789"
     println(@tools.is_credit_code(valid_code))///true
     println(@tools.is_credit_code(invalid_code))///false
}
```

生成随机社会信用卡字符串

```
fn main {
     let valid_code = @tools.random_credit_code()
     println(valid_code)
     println(@tools.is_credit_code(valid_code))// 应输出true
   
}
```



验证邮箱是否合法

```

fn main {
  let valid_email = "test@example.com"
  let invalid_email = "testexample.com"
  println(@tools.is_valid_email(valid_email)) // true
  println(@tools.is_valid_email(invalid_email))//false
}
```





检测手机号是否合法

```
fn main {
    let phone1 = "13800138000";
    let phone2 = "12800138000";
    let phone3 = "1234567890";
    println(@tools.is_mobile_cn(phone1)); // 应输出 true
    println(@tools.is_mobile_cn(phone2)); // 应输出 false
    println(@tools.is_mobile_cn(phone3)); // 应输出 false
}

```
