# Documentation
|Type|description|
|---|---|
|[Mode](#Mode)||
|[TokenPayloadRewrite](#TokenPayloadRewrite)||

|Value|description|
|---|---|
|[compile](#compile)||
|[exit](#exit)||
|[println\_to\_stderr](#println_to_stderr)||

## Mode

```moonbit
:::source,hackwaly/moonyacc/lib/driver/driver.mbt,2:::pub(all) enum Mode {
  Default
  JsonCst(<a href="hackwaly/moonyacc/lib/driver#TokenPayloadRewrite">TokenPayloadRewrite</a>?)
  OnlyTokens
}
```


## TokenPayloadRewrite

```moonbit
:::source,hackwaly/moonyacc/lib/driver/driver.mbt,9:::pub(all) enum TokenPayloadRewrite {
  NoPayload
  JsonPayload
}
```


## compile

```moonbit
:::source,hackwaly/moonyacc/lib/driver/driver.mbt,15:::fn compile(parser_spec_str : String, mode~ : <a href="hackwaly/moonyacc/lib/driver#Mode">Mode</a> = .., filename~ : String, external_tokens~ : Bool = .., no_comments~ : Bool = ..) -> String
```


## exit

```moonbit
:::source,hackwaly/moonyacc/lib/driver/util_nonjs.mbt,8:::fn exit[T](code : Int) -> T
```


## println\_to\_stderr

```moonbit
:::source,hackwaly/moonyacc/lib/driver/util_nonjs.mbt,2:::fn println_to_stderr(msg : String) -> Unit
```

