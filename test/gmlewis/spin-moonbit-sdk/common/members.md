# Documentation
|Trait|description|
|---|---|
|[HashFunc](#HashFunc)| \`HashFunc\` represents a hash algorithm like \`@md5\` or \`@sha256\`.|

## HashFunc

```moonbit
:::source,gmlewis/spin-moonbit-sdk/common/hash-func.mbt,2:::pub(open) trait HashFunc {
  name(Self) -> String
  write(Self, Byte) -> Unit
  check_sum(Self) -> String
}
```
 `HashFunc` represents a hash algorithm like `@md5` or `@sha256`.
