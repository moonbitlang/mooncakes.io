///|
pub(all) enum Status[T] {
  Loading
  Failed
  Success(T)
}

///|
pub(all) struct Path {
  author : String
  name : String
  module_path : String
  target : String?
}
