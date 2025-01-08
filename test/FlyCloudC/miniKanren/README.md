# FlyFloudC/miniKanren

miniKanren implemented in MoonBit.

It a Domain Specific Languages for logic programming.

http://minikanren.org/

## Example

```moonbit
run_and_display(
  n=10,
  fn {
    v =>
      listo(v) & //
      membero(Int(1), v) &
      membero(Int(0), v)
  },
)
```

The result is

```scheme
(1 0)
(0 1)
(1 0 _₀)
(1 _₀ 0)
(0 1 _₀)
(_₀ 1 0)
(1 0 _₀ _₁)
(0 _₀ 1)
(1 _₀ 0 _₁)
(1 _₀ _₁ 0)
```
