///|
pub enum MooncakesioPath {
  Home
  User(StringView)
  Docs(UnsolvedMooncakePath, fragment~ : String?)
  SkillsList
  SkillsDetail(String)
  BuildQueue
  NotFound(String)
  Assets(@url.Url)
}

///|
pub impl Show for MooncakesioPath with fn output(self, logger) {
  match self {
    Home => logger.write_string("home:")
    User(name) => logger.write_string("user:\{name.to_owned()}")
    Docs(p, fragment~) =>
      logger.write_string("docs: \{p.0}, fragment: \{to_repr(fragment)}")
    SkillsList => logger.write_string("skills:")
    SkillsDetail(entry) => logger.write_string("skills:\{entry}")
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
    ["skills"] => SkillsList
    ["skills", .. remain] => SkillsDetail(remain.join("/"))
    ["docs", .. remain] =>
      Docs(UnsolvedMooncakePath::new(remain.join("/")), fragment=url.fragment)
    xs => NotFound(xs.join("/"))
  }
}
