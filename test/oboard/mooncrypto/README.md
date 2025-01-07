
<div id="mod-info">
    <h1 id="mod-title"> mooncrypto <span id="mod-version">v0.1.8</span></h1>
    MoonBit Crypto Library
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>oboard</p>
        </div>
        <div>
            <p>License</p>
            <p>MIT</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/oboard/mooncrypto">https://github.com/oboard/mooncrypto</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>crypto</li>
                <li>加密</li>
                <li>md5</li>
                <li>sha</li>
                <li>base64</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add oboard/mooncrypto </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# oboard/mooncrypto

mooncrypto is a growing collection of standard and secure cryptographic algorithms implemented in MoonBit using best practices and patterns. They are fast, and they have a consistent and simple interface.

## Installation

```bash
moon install oboard/mooncrypto
```

## Usage

### MD5

```moonbit
println(@mooncrypto.md5("Hello, World!"))


println(@mooncrypto.core_md5(bytes))
```

### SHA256

```moonbit
println(@mooncrypto.sha256("Hello, World!"))


println(@mooncrypto.core_sha256(bytes))
```

### base64

```moonbit
println(@mooncrypto.base64_encode("Hello, World!"))

println(@mooncrypto.base64_decode("SGVsbG8sIFdvcmxkIQ=="))
```

## Algorithms

- [x] MD5
- [x] SHA1
- [ ] SHA3
- [x] SHA256
- [ ] RSA
- [ ] AES
- [ ] ECC
- [x] base64
