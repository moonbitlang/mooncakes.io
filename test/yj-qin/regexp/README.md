
<div id="mod-info">
    <h1 id="mod-title"> regexp <span id="mod-version">v0.3.3</span></h1>
    A regular expression library based on a backtracking engine.
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>yj-qin</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/yj-qin/regexp">https://github.com/yj-qin/regexp</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>regexp</li>
                <li>regular</li>
                <li>expression</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add yj-qin/regexp </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# RegExp
[![check](https://github.com/yj-qin/regexp/actions/workflows/check.yml/badge.svg)](https://github.com/yj-qin/regexp/actions/workflows/check.yml)

A regular expression module based on a backtracking engine. Due to backtracking during matching, some regular expressions will run for a long time under specific inputs, also known as catastrophic backtracking.
The design of the bytecode and interpreter was heavily inspired by the .NET regular expression library.

## Usage

```
let regexp = @regexp.compile("^(?<addr>[a-zA-Z0-9._%+-]+)@(?<host>[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})$")?
let match_result = regexp.matches("12345@test.com")
println(match_result.success()) // true
println(match_result.captures()) // ["12345@test.com", "12345", "test.com"]
println(match_result.named_captures()) // {"addr": "12345", "host": "test.com"}
```

## Features

### Character classes

- [x] Character range
- [x] Escapes (e.g. `\d`, `\D`, `\s`, `\S`, `\w`, `\W`)

### Assertions

- [x] Begin of input
- [x] End of input
- [ ] Word boundary
- [ ] Lookaround

### Groups

- [x] Capturing group
- [x] Non-capturing group
- [x] Named capturing group

### Backreferences

- [ ] Group backreference
- [ ] Named backreference

### Quantifiers

- [x] Zero or more (\*)
- [x] Zero or one (?)
- [x] One or more (+)
- [x] Range ({n}, {n,}, {n, m})
- [x] Non-greedy

### Encodings

- [ ] Unicode
