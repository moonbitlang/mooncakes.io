# Cirru Parser in Moonbit

Docs: https://mooncakes.io/docs/#/tiye/cirru-parser/lib/members

```bash
moon add tiye/cirru-parser
```

```moon
// parse Cirru code
@cirru_parser.parse(code: String) : Array[Cirru]!CirruParseError

// format Cirru code
@cirru_parser.format(cirru: Array[Cirru], {use_inline: false}) : String!FormatCirruError
```

### License

Apache-2.0
