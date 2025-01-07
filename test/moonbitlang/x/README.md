
<div id="mod-info">
    <h1 id="mod-title"> x <span id="mod-version">v0.4.16</span></h1>
    experimental packages for moonbitlang/core
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>moonbitlang</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/moonbitlang/x">https://github.com/moonbitlang/x</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>experimental</li>
                <li>moonbitlang</li>
                <li>json</li>
                <li>time</li>
                <li>crypto</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add moonbitlang/x </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# MoonBit Experimental

[![Coverage Status](https://coveralls.io/repos/github/moonbitlang/x/badge.svg?branch=main)](https://coveralls.io/github/moonbitlang/x?branch=main)

This repository contains a module `moonbitlang/x`, which is an experimental 
library consisting of multiple packages that are subject to frequent changes or are 
not yet mature. These packages are initially placed here for testing and development.

As packages become stable and depending on the actual situation and community feedback, 
they may be merged into the standard library [moonbitlang/core](https://github.com/moonbitlang/core).

## Usage

To use a package from this repository, add module `moonbitlang/x` to 
dependencies by command

```
moon add moonbitlang/x
``` 

And import any packages in your `moon.pkg.json` file. for example:

```json
{
  "import": [
    "moonbitlang/x/json5"
  ]
}
```

**Please note that the packages in this repository may change frequently.**

# Contributing

We welcome contributions! If you find a bug or have a suggestion, please open an issue. 
If you'd like to contribute code, please check the [contribution guide](https://github.com/moonbitlang/core/blob/main/CONTRIBUTING.md).

