
<div id="mod-info">
    <h1 id="mod-title"> moonetx <span id="mod-version">v0.1.5</span></h1>
    MoonBit网络分析扩展
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
            <p><a href="https://github.com/oboard/moonetx">https://github.com/oboard/moonetx</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>moonbit</li>
                <li>moonetx</li>
                <li>network</li>
                <li>networkx</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add oboard/moonetx </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# oboard/moonetx

> MoonBit Network Analysis Library

## 📖Table of Contents

- [Introduction](#-introduction)
- [Getting Started](#-getting-started)
- [Contributing](#-contributing)
- [License](#-license)

## ✨Introduction

**MoonetX** is an open-source MoonBit library that provides support for network analytic tools.


## 🚀Getting Started

```sh
moon add oboard/moonetx
```

> Graph

```rust
fn find_neighbors() -> Array[Int] {
  let graph = @nx.Graph::new()
  graph.add_nodes_from([0, 1, 2, 3, 4, 5])
  graph.add_edges_from([(1, 2), (2, 5)])
  graph.neighbors(2)
}
```

> DiGraph

```rust
fn get_in_degree() -> Int {
  let graph = @nx.DiGraph::new()
  graph.add_nodes_from([0, 1, 2, 3, 4, 5])
  graph.add_edges_from([(1, 2), (2, 5)])
  graph.in_degree(2)
}

Output: 1
```

## 🤝Contributing

Contributions, issues and feature requests are welcome!<

Feel free to check [issues page](https://github.com/oboard/moonetx/issues). 

## 📝License

This project is [MIT](LICENSE.md) licensed.