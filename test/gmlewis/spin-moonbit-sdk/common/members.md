# Documentation
|Trait|description|
|---|---|
|[@gmlewis/spin-moonbit-sdk/common.HashFunc](#@gmlewis/spin-moonbit-sdk/common.HashFunc)| \`HashFunc\` represents a hash algorithm like \`@md5\` or \`@sha256\`.|

## @gmlewis/spin-moonbit-sdk/common.HashFunc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/common/hash-func.mbt,2:::pub(open) trait @gmlewis/spin-moonbit-sdk/common.HashFunc {
  name(Self) -> String
  write(Self, Byte) -> Unit
  check_sum(Self) -> String
}
```
 `HashFunc` represents a hash algorithm like `@md5` or `@sha256`.
