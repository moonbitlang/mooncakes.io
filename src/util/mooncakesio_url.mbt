///|
pub enum MooncakesioPath {
  Home
  User(StringView)
  Docs(UnsolvedMooncakePath, fragment~ : String?)
  BuildQueue
  NotFound(String)
  Assets(@url.Url)
}

///|
pub impl Show for MooncakesioPath with output(self, logger) {
  match self {
    Home => logger.write_string("home:")
    User(name) => logger.write_string("user:\{name.to_owned()}")
    Docs(p, fragment~) =>
      logger.write_string("docs: \{p.0}, fragment: \{to_repr(fragment)}")
    BuildQueue => logger.write_string("build-queue")
    NotFound(p) => logger.write_string("not-found:\{p}")
    Assets(url) => logger.write_string("assets:\{url.path}")
  }
}

///|
pub fn MooncakesioPath::resolve(url : @url.Url) -> Self {
  match url.path.split("/").collect() {
    ["/"] | [""] | [] => Home
    ["build-queue"] => BuildQueue
    ["user", name] => User(name)
    ["assets", ..] => Assets(url)
    ["docs", .. remain] =>
      Docs(UnsolvedMooncakePath::new(remain.join("/")), fragment=url.fragment)
    xs => NotFound(xs.join("/"))
  }
}
