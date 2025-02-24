///|
pub(all) enum Status[T] {
  Loading
  Failed
  Success(T)
}

///|
pub fn union[T : Hash + Eq](
  a : @immut/hashset.T[T],
  b : @immut/hashset.T[T]
) -> @immut/hashset.T[T] {
  a.iter().fold(init=b, fn(acc, x) { acc.add(x) })
}

///|
pub fn difference[T : Hash + Eq](
  a : @immut/hashset.T[T],
  b : @immut/hashset.T[T]
) -> @immut/hashset.T[T] {
  b.iter().fold(init=a, fn(acc, x) { acc.remove(x) })
}
