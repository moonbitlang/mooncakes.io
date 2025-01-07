
<div id="mod-info">
    <h1 id="mod-title"> parsem <span id="mod-version">v0.0.3</span></h1>
    Parser combinator for Moonbit
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>yoshitsugu</p>
        </div>
        <div>
            <p>License</p>
            <p>MIT</p>
        </div>
        <div>
            <p>Repository</p>
            <p><a href="https://github.com/yoshitsugu/parsem">https://github.com/yoshitsugu/parsem</a></p>
        </div>
        <div>
            <p>Keywords</p>
            <ul id="mod-keywords">
                <li>parser</li>
                <li>parser combinator</li>
            </ul>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add yoshitsugu/parsem </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# Parsem

Parser combinator for Moonbit

## Example

- Simple "add" operator parser

```moonbit
let result : @parsem.ParseResult[(Int, Int)] = @parsem.parse(
    @parsem.sequence(
      @parsem.string("add ").then(@parsem.digits()).precede(@parsem.char(' ')),
      @parsem.digits(),
    ),
    "add 10 20",
)
// => ParseResult(Ok(((10, 20), @list.of([]))))

let ((left, right), _) = result._.unwrap()
left + right
// => 30
```

- More complex example which parse into `Expr` enum

```moonbit
  enum Expr {
    IntValue(Int)
    Add(Expr, Expr)
    Mul(Expr, Expr)
  } derive(Show)
  fn int_value() -> @parsem.Parser[Expr] {
    @parsem.map(@parsem.digits(), fn(digits : Int) { IntValue(digits) })
  }

  fn add() -> @parsem.Parser[Expr] {
    mul().bind(fn(expr1 : Expr) {
      @parsem.option(
        expr1,
        @parsem.many(@parsem.char(' '))
        .then(@parsem.char('+'))
        .then(@parsem.many(@parsem.char(' ')))
        .then(mul())
        .map(fn(expr2) { Add(expr1, expr2) }),
      )
    })
  }

  fn mul() -> @parsem.Parser[Expr] {
    expr().bind(fn(expr1 : Expr) {
      @parsem.option(
        expr1,
        @parsem.many(@parsem.char(' '))
        .then(@parsem.char('*'))
        .then(@parsem.many(@parsem.char(' ')))
        .then(expr())
        .map(fn(expr2) { Mul(expr1, expr2) }),
      )
    })
  }

  // To avoid infinite loops, @parsem.choice cannot be used in this context.
  fn expr() -> @parsem.Parser[Expr] {
    return @parsem.Parser(fn(input) {
      match @parsem.parse(@parsem.char('('), input)._ {
        Ok((_, rest)) => @parsem.parse(add().precede(@parsem.char(')')), rest)
        Err(_) => @parsem.parse(int_value(), input)
      }
    })
  }

  inspect!(
    @parsem.parse(add(), "1 + 2"),
    content="ParseResult(Ok((Add(IntValue(1), IntValue(2)), @list.of([]))))",
  )
  inspect!(
    @parsem.parse(expr(), "((12 +  24) * 2)"),
    content="ParseResult(Ok((Mul(Add(IntValue(12), IntValue(24)), IntValue(2)), @list.of([]))))",
  )
```
