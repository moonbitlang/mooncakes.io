///|
pub(all) enum Loading[T] {
  Loading
  Failed
  Success(T)
}

///|
/// QueuedLoading is a special Loading enum.
/// When we need to wait for the main model to load before rendering the framework,
/// and other request results have returned but cannot be rendered yet,
/// we can cache the information in Loading
pub(all) enum QueuedLoading[T, U] {
  Loading(U)
  Failed
  Success(T)
}
