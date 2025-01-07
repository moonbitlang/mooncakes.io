
<div id="mod-info">
    <h1 id="mod-title"> myers-diff <span id="mod-version">v0.1.0</span></h1>
    Myers diff algorithm
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>myfreess</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>diff</li>
                <li>meyers</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add myfreess/myers-diff </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# myfreess/myers-diff

simple implementation of myers diff algorithm, include native/linear version

## Example

```rust
fn diff_a_c_program() -> Unit {
  let before =
    #|void Chunk_copy(Chunk *src, size_t src_start, Chunk *dst, size_t dst_start, size_t n)
    #|{
    #|    if (!Chunk_bounds_check(src, src_start, n)) return;
    #|    if (!Chunk_bounds_check(dst, dst_start, n)) return;
    #|
    #|    memcpy(dst->data + dst_start, src->data + src_start, n);
    #|}
    #|
    #|int Chunk_bounds_check(Chunk *chunk, size_t start, size_t n)
    #|{
    #|    if (chunk == NULL) return 0;
    #|
    #|    return start <= chunk->length && n <= chunk->length - start;
    #|}

  let after =
    #|int Chunk_bounds_check(Chunk *chunk, size_t start, size_t n)
    #|{
    #|    if (chunk == NULL) return 0;
    #|
    #|    return start <= chunk->length && n <= chunk->length - start;
    #|}
    #|
    #|void Chunk_copy(Chunk *src, size_t src_start, Chunk *dst, size_t dst_start, size_t n)
    #|{
    #|    if (!Chunk_bounds_check(src, src_start, n)) return;
    #|    if (!Chunk_bounds_check(dst, dst_start, n)) return;
    #|
    #|    memcpy(dst->data + dst_start, src->data + src_start, n);
    #|}
  
  let a = @diff.lines(before)
  let b = @diff.lines(after)
  match @diff.linear_diff(a, b) {
    Some(v) => @diff.print_diff(v)
    None => println("failed to calculate diff")
  }
  // use @diff.diff switch to native algorithm
}
```

