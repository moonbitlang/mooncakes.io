# Documentation
|Type|description|
|---|---|
|[Config](#Config)| \`Config\` provides methods to get "config" data from the host.|

## Config

```moonbit
:::source,extism/moonbit-pdk/pdk/config/config.mbt,2:::pub(all) type Config
```
 `Config` provides methods to get "config" data from the host.

#### mooncakes-io-method-mark-Methods
- #### get
  ```moonbit
  :::source,extism/moonbit-pdk/pdk/config/config.mbt,23:::fn <a href="extism/moonbit-pdk/pdk/config#Config">Config</a>::get(key : String) -> String?
  ```
  >  `Config::get` returns a "config" String from the host that is keyed by `key`.
  > Note that the Extism host strings are UTF-8 and therefore the returned
  > String is encoded as UTF-16 in compliance with MoonBit Strings.
- #### get\_memory
  ```moonbit
  :::source,extism/moonbit-pdk/pdk/config/config.mbt,6:::fn <a href="extism/moonbit-pdk/pdk/config#Config">Config</a>::get_memory(key : String) -> <a href="extism/moonbit-pdk/pdk/host#Memory">@extism/moonbit-pdk/pdk/host.Memory</a>?
  ```
  >  `Config::get_memory` returns a "config" Memory block from the host that is keyed by `key`.
  > Note that no processing is performed on this block of memory.
