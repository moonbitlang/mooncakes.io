
<div id="mod-info">
    <h1 id="mod-title"> moonvalue <span id="mod-version">v0.1.12</span></h1>
    moonbitlang实现的msgpack,bson库
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>suiyunonghen</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/suiyunonghen/moonvalue">https://github.com/suiyunonghen/moonvalue</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>msgpack</li>
                <li>bson</li>
                <li>moonValue</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add suiyunonghen/moonvalue </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# messagepack moonvalue
Bson serializer MessagePack serializer implementation for Moonbitlang

# decode msgpack
You can use the _MsgPackParser::new_ function to parse the binary data of a msgpack. The parameter shareBinary indicates whether to share binary content. If enabled, VT-ShareString will be used,
VT_ShareBin, VT_ShareExt, and other shared binary data contents are parsed when needed (ensuring the security and lifecycle of the shared binary data). The parameter binary represents the binary data to be decoded, the parameter utf8Reader is used to customize the user to read the utf8 string function, and the parameter binReader is used to read the decoded binary function   

_MsgPackParser::newparser_with_str_array_ will create a **MgPackParser[String,Array[Byte]]**, which will parse **MoonValue [String,Array[Byte]]**, using Moonbit string for strings and Array[Byte] for binary   

_MsgPackParser::newparser_with_str_bytes_ will create a **MgPackParser[String,Bytes]**, which will parse **MoonValue [String,Bytes]**, using Moonbit string for strings and Bytes for binary   

```MoonBit
let b : Array[Byte] = [
  134, 164, 110, 97, 109, 101, 169, 228, 184, 141, 229, 190, 151, 233, 151, 178,
  163, 97, 103, 101, 40, 163, 109, 101, 110, 195, 163, 110, 111, 119, 203, 64,
  230, 69, 246, 246, 72, 195, 95, 167, 99, 117, 114, 116, 105, 109, 101, 215, 255,
  69, 36, 64, 76, 103, 60, 86, 173, 165, 97, 114, 114, 97, 121, 146, 34, 205, 1,
  89,
]
let parser : MsgPackParser[String, Array[Byte]] = MsgPackParser::newparser_with_str_array(true, b)
match parser.parse?() {
  Ok(result) => println(result.to_string())
  _ => println("error")
}
```

# encode msgpack
you can use MsgpackEncoder
```MoonBit
let w: Array[Byte] = Array::new()
let encoder = MsgpackEncoder::new(w)
encoder.encode(result)
println(w)
```

# decode bson
You can use the _BsonParser::new_ function to parse the binary data of a msgpack
```MoonBit
  let arr : Array[Byte] = [
    98, 1, 0, 0, 16, 49, 0, 255, 255, 255, 255, 1, 100, 111, 117, 98, 108, 101, 230,
    181, 174, 231, 130, 185, 230, 149, 176, 0, 46, 144, 160, 248, 49, 182, 64, 64,
    16, 78, 111, 0, 1, 0, 0, 0, 2, 229, 167, 147, 229, 144, 141, 0, 10, 0, 0, 0,
    228, 184, 141, 229, 190, 151, 233, 151, 178, 0, 3, 105, 110, 102, 111, 0, 66,
    0, 0, 0, 16, 97, 103, 101, 0, 38, 0, 0, 0, 8, 105, 115, 109, 101, 110, 0, 1,
    2, 103, 105, 116, 104, 117, 98, 0, 32, 0, 0, 0, 104, 116, 116, 112, 115, 58,
    47, 47, 103, 105, 116, 104, 117, 98, 46, 99, 111, 109, 47, 115, 117, 105, 121,
    117, 110, 111, 110, 103, 104, 101, 110, 0, 0, 4, 115, 116, 117, 100, 101, 110,
    116, 115, 0, 205, 0, 0, 0, 3, 48, 0, 99, 0, 0, 0, 2, 110, 97, 109, 101, 0, 11,
    0, 0, 0, 228, 184, 141, 229, 190, 151, 233, 151, 178, 49, 0, 16, 97, 103, 101,
    0, 38, 0, 0, 0, 8, 105, 115, 119, 111, 109, 101, 110, 0, 0, 2, 103, 105, 116,
    104, 117, 98, 0, 42, 0, 0, 0, 104, 116, 116, 112, 115, 58, 47, 47, 103, 105,
    116, 104, 117, 98, 46, 99, 111, 109, 47, 115, 117, 105, 121, 117, 110, 111, 110,
    103, 104, 101, 110, 47, 109, 111, 111, 110, 118, 97, 108, 117, 101, 0, 0, 10,
    49, 0, 3, 50, 0, 92, 0, 0, 0, 2, 110, 97, 109, 101, 0, 5, 0, 0, 0, 103, 105,
    114, 108, 0, 16, 97, 103, 101, 0, 39, 0, 0, 0, 8, 105, 115, 119, 111, 109, 101,
    110, 0, 1, 2, 103, 105, 116, 104, 117, 98, 0, 41, 0, 0, 0, 104, 116, 116, 112,
    115, 58, 47, 47, 103, 105, 116, 104, 117, 98, 46, 99, 111, 109, 47, 115, 117,
    105, 121, 117, 110, 111, 110, 103, 104, 101, 110, 47, 100, 97, 116, 101, 116,
    105, 109, 101, 0, 0, 0, 0,
  ]
  let parser : BsonParser[String, Array[Byte]] = BsonParser::newparser_with_str_array(false, arr)
  match parser.parse?() {
    Ok(v) => {
      inspect!(v["students"].unwrap()["1"].unwrap().to_string(), content="null")
      println(v.to_string())
    }
    Err(e) => println(e)
  }
```


# Design concept
VT_String stores string types. As moonbit may generate multiple backends, the string could be either Jstring or moonbit string, so it is designed as a generic type here 
The type starting with VT_Share*** represents shared memory data. When parsing, it does not perform a copy operation, but directly records the binary block area and binary. VT_ShareString will only be parsed when it is actually needed. Therefore, when using shared mode, it is important to ensure that the shared memory area is valid and not overwritten by writing, otherwise it will result in inconsistent data
# write moonvalue
You can create objects or array types using functions such as _@moonvalue.new_object_ , _new_array_, etc. Set map key value pairs using _set_key_*** _  related functions, and IntMap key value pairs  using set_intkey_***  
Set_index_*** Set array value 
```MoonBit
let v : @moonvalue.MoonValue[String, Bytes] = @moonvalue.new_object({})
v.set_key_string("name", "dxsoft")
let child = @moonvalue.new_object({})
child.set_key_string("name", "huzimo")
let cc = child.add_key_object("children", StrMap)
cc.set_key_int("age", 234)
v["children"] = child
println(child.to_string())
println(child.parent().unwrap().to_string())
let c = v.add_key_object("name", StrMap)
c.set_key_int("year", 123)
let m = c["year"].unwrap().add_key_object("month", StrMap)
m.set_key_string("y", "gg")
println(v.to_string())
println(c["year"].unwrap().parent().unwrap().to_string())
```
# read moonvalue
A function similar to xxx_by_key reads data from the map type  
eg.
> string_by_key read string from map    
> bool_by_key read bool from map   
> value_by_key return MoonValue from map    

A function similar to xxx_by_index reads data from an array  
eg.
> string_by_index read string from array  
> bool_by_index read bool from array  
> value_by_index return MoonValue from array  

as_xxx retrieves the value from Moonvalue 
eg.
> as_bool  
> as_double   

```MoonBit
assert_eq!(result.string_by_key("name",""),"不得闲")
assert_eq!(result.bool_by_key("men",false),true)
assert_eq!(result.value_by_key("array").unwrap().int_by_index(1,0),345)
println(result.to_string())
```