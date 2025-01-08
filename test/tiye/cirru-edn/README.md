# tiye/cirru-edn

> Experimental port from cirru-edn.rs .

```bash
moon install tiye/cirru-edn
```

import it as `edn`:

```moonbit
match @edn.parse?(demo) {
  Ok(x) => {
    println(x.to_string())
    println(@edn.format?(x, false).unwrap())
  }
  Err(e) => println("error:" + e.to_string())
}
```

TODO

- tests
- any ref
