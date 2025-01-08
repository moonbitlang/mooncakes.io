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
