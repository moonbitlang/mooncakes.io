///|
priv enum Thunk[T] {
  Thunk(() -> T)
  Value(T)
}

///|
struct Lazy[T] {
  mut thunk : Thunk[T]
}

///|
pub fn[T] Lazy::new(f : () -> T) -> Lazy[T] {
  { thunk: Thunk(f) }
}

///|
pub fn[T] Lazy::force(self : Self[T]) -> T {
  match self.thunk {
    Value(v) => v
    Thunk(f) => {
      let v = f()
      self.thunk = Value(v)
      v
    }
  }
}
