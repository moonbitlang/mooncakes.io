# Documentation
|Type|description|
|---|---|
|[CompileResult](#CompileResult)||

|Value|description|
|---|---|
|[compile](#compile)||
|[default\_mode](#default_mode)||
|[json\_cst\_json\_payload\_mode](#json_cst_json_payload_mode)||
|[json\_cst\_mode](#json_cst_mode)||
|[json\_cst\_no\_payload\_mode](#json_cst_no_payload_mode)||

## CompileResult

```moonbit
:::source,hackwaly/moonyacc/jsapi/jsapi.mbt,2:::pub(all) struct CompileResult {
  ok : Bool
  code : String
}
```


## compile

```moonbit
:::source,hackwaly/moonyacc/jsapi/jsapi.mbt,8:::fn compile(parser_spec_str : String, mode~ : <a href="hackwaly/moonyacc/lib/driver#Mode">@hackwaly/moonyacc/lib/driver.Mode</a> = ..) -> <a href="hackwaly/moonyacc/jsapi#CompileResult">CompileResult</a>
```


## default\_mode

```moonbit
:::source,hackwaly/moonyacc/jsapi/jsapi.mbt,22:::fn default_mode() -> <a href="hackwaly/moonyacc/lib/driver#Mode">@hackwaly/moonyacc/lib/driver.Mode</a>
```


## json\_cst\_json\_payload\_mode

```moonbit
:::source,hackwaly/moonyacc/jsapi/jsapi.mbt,37:::fn json_cst_json_payload_mode() -> <a href="hackwaly/moonyacc/lib/driver#Mode">@hackwaly/moonyacc/lib/driver.Mode</a>
```


## json\_cst\_mode

```moonbit
:::source,hackwaly/moonyacc/jsapi/jsapi.mbt,27:::fn json_cst_mode() -> <a href="hackwaly/moonyacc/lib/driver#Mode">@hackwaly/moonyacc/lib/driver.Mode</a>
```


## json\_cst\_no\_payload\_mode

```moonbit
:::source,hackwaly/moonyacc/jsapi/jsapi.mbt,32:::fn json_cst_no_payload_mode() -> <a href="hackwaly/moonyacc/lib/driver#Mode">@hackwaly/moonyacc/lib/driver.Mode</a>
```

