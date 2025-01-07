
<div id="mod-info">
    <h1 id="mod-title"> wasi <span id="mod-version">v0.18.1</span></h1>
    
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>peter-jerry-ye</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/peter-jerry-ye/wasi">https://github.com/peter-jerry-ye/wasi</a></p>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add peter-jerry-ye/wasi </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# WASI Preview 1 implementation for MoonBit

⚠️ It's a complete rewrite since 0.17.0

- [x] Wasm Backend
- [ ] Wasm-GC Backend

Note: not all APIs are fully tested.

## Implemented functions

- [x] `args_get`
- [x] `args_sizes_get`
- [x] `environ_get`
- [x] `environ_sizes_get`
- [x] `clock_res_get`
- [x] `clock_time_get`
- [x] `fd_advise`
- [x] `fd_allocate`
- [x] `fd_close`
- [x] `fd_datasync`
- [x] `fd_fdstat_get`
- [x] `fd_fdstat_set_flags`
- [x] `fd_fdstat_set_rights`
- [x] `fd_filestat_get`
- [x] `fd_filestat_set_size`
- [x] `fd_filestat_set_times`
- [x] `fd_pread`
- [x] `fd_prestat_get`
- [x] `fd_prestat_dir_name`
- [x] `fd_pwrite`
- [x] `fd_read`
- [x] `fd_readdir`
- [x] `fd_renumber`
- [x] `fd_seek`
- [x] `fd_sync`
- [x] `fd_tell`
- [x] `fd_write`
- [x] `path_create_directory`
- [x] `path_filestat_get`
- [x] `path_filestat_set_times`
- [x] `path_link`
- [x] `path_open`
- [x] `path_readlink`
- [x] `path_remove_directory`
- [x] `path_rename`
- [x] `path_symlink`
- [x] `path_unlink_file`
- [x] `poll_oneoff`
- [x] `proc_exit`
- [x] `proc_raise`
- [x] `sched_yield`
- [x] `random_get`
- [x] `sock_accept`
- [x] `sock_recv`
- [x] `sock_send`
- [x] `sock_shutdown`

## Develop

### Testing

- Requirements: you need wasmtime & deno. You may use wasmedge or wamr if you replace the `wasmtime` in `test.ts`, but it may cause different testing result.
- Comamnds: `deno task test:build && deno task test`