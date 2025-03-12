///|
pub(all) enum Status[T] {
  Loading
  Failed
  Success(T)
} derive(Show, Eq)
