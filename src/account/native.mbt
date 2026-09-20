///|
#cfg(not(target="js"))
fn github_error() -> Bool {
  false
}

///|
#cfg(not(target="js"))
fn request(
  _path : String,
  _method : String,
  _body : Json,
  _done : Emit[(Int, String)],
) -> Cmd {
  none
}

///|
#cfg(not(target="js"))
fn on_mount(_command : Cmd, _hidden : Cmd) -> @sub.Sub {
  @sub.none
}
