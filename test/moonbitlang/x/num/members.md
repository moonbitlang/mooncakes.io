# Documentation
|Trait|description|
|---|---|
|[@moonbitlang/x/num.Num](#@moonbitlang/x/num.Num)||

## @moonbitlang/x/num.Num

```moonbit
:::source,moonbitlang/x/num/num.mbt,16:::pub trait @moonbitlang/x/num.Num {
  from_int(Int) -> Self
  op_add(Self, Self) -> Self
  op_sub(Self, Self) -> Self
  op_mul(Self, Self) -> Self
  op_div(Self, Self) -> Self
  op_neg(Self) -> Self
  abs(Self) -> Self
  signum(Self) -> Self
}
```

