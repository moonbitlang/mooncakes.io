
<div id="mod-info">
    <h1 id="mod-title"> json <span id="mod-version">v0.4.0</span></h1>
    simple json parser
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>mizchi</p>
        </div>
        <div>
            <p>License</p>
            <p>MIT</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/mizchi/moonbit-libs/json">https://github.com/mizchi/moonbit-libs/json</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>json</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add mizchi/json </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# mizchi/json

json utils

```bash
$ moon add mizchi/json
```

moon.pkg.json

Avoid `json` to use builtin `@json`

```json
{
  "import": [
    {
      "path": "mizchi/json",
      "alias": "jsonutil"
    }
  ]
}
```

## Usage

```rust
fn main {
  // use moonbitlang/core/json5
  let j = @json5.parse(
    #|{
    #|  "a": 1.1,
    #|  "b": [1, 2, 3],
    #|  "c": {
    #|    "d": 4
    #|  },
    #|  "d": null,
    #|  "e": true,
    #|  "f": false
    #|}
    ,
  ).unwrap()
  // like JSON.stringify({}, null, 2)
  let s = @jsonutil.stringify(j, spaces=2, newline=true)
}
```

Implment `ToJson` for struct

```rust
priv struct TestTree {
  val : Int
  child : Option[TestTree]
}

impl @jsonutil.ToJson for TestTree with to_json(self) {
  // list ToJson values with keys
  @jsonutil.from_entries([("val", self.val), ("child", self.child)])
}

test {
  let v : TestTree = { val: 1, child: Some({ val: 2, child: None }) }
  let j = @jsonutil.to_json(v)
  inspect(
    j,
    content="Object(Map::[(\"val\", Number(1.0)), (\"child\", Object(Map::[(\"val\", Number(2.0)), (\"child\", Null)]))])",
  )?
  inspect(@jsonutil.stringify(j), content="{val:1,child:{val:2,child:null}}")?
}
```

(I'm researching derive trait)

## Related works

- https://mooncakes.io/docs/#/peter-jerry-ye/json/

## LICENSE

MIT