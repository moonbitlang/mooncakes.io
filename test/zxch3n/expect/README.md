
<div id="mod-info">
    <h1 id="mod-title"> expect <span id="mod-version">v0.3.1</span></h1>
    &#x60;expect&#x60; is used to create various assertions easily
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>zxch3n</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/zxch3n/moon-expect">https://github.com/zxch3n/moon-expect</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>test</li>
                <li>utils</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add zxch3n/expect </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# expect for MoonBit

`expect` that works like [Jest/Vitest's expect](https://jestjs.io/docs/expect).

You can use it to create various assertions easily.

# Example Usage

```
expect("hello").equal("hello")
expect("hello").not().equal("hello") // abort
expect("hello").equal("hello1") // abort
expect("hello").not().equal("hello1") 

let a : Option[Int] = Some(1)
let b : Option[Int] = None
expect(a).to_be_some() 
expect(b).to_be_none() 

expect("hello").to_have_length(5)
expect("hello").not().to_have_length(6)

expect(1).to_be_less_than(4)

let a : Result[Int, Int] = Ok(1)
let b : Result[Int, Int] = Err(1)
expect(a).to_be_ok()
expect(b).to_be_err()

expect(1.0).close_to(1.0, 0.1)
```

## Example Error Messages

```
AssertionError: expected 1.0 to be close to 1.2 (±0.1)

- Expected: 
+ Received: 

- 1.2
+ 1.0
```

```
AssertionError: expected "hello" to equal "hello1"

- Expected: 
+ Received: 

- "hello1"
+ "hello"
```
