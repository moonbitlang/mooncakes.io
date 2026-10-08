///|
pub(all) enum AuthFormKind {
  Login
  Register
  ResetPassword
} derive(Eq)

///|
pub(all) enum SettingPage {
  Auth(AuthFormKind)
  Settings
  GithubFailed
} derive(Eq)

///|
pub extend AuthFormKind with Eq::{equal, not_equal}

///|
pub extend SettingPage with Eq::{equal, not_equal}

///|
pub enum MooncakesioPath {
  Home
  Setting(SettingPage)
  User(StringView)
  Docs(UnsolvedMooncakePath, fragment~ : String?)
  SkillsList
  SkillsDetail(String)
  BuildQueue
  NotFound(String)
  Assets(@url.Url)
}

///|
pub extend MooncakesioPath with Show::{to_string, output}

///|
pub impl Show for MooncakesioPath with fn output(self, logger) {
  match self {
    Home => logger.write_string("home:")
    Setting(page) =>
      logger.write_string(
        match page {
          Auth(Login) => "setting:login"
          Auth(Register) => "setting:register"
          Auth(ResetPassword) => "setting:reset-password"
          Settings => "setting:settings"
          GithubFailed => "setting:github-failed"
        },
      )
    User(name) => logger.write_string("user:\{name.to_owned()}")
    Docs(p, fragment~) =>
      logger.write_string("docs: \{p.0}, fragment: \{Repr(fragment)}")
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
    ["/"] | [""] | [] =>
      if url.host == @config.skills_host() {
        SkillsList
      } else {
        Home
      }
    ["build-queue"] => BuildQueue
    ["login"] => Setting(Auth(Login))
    ["register"] => Setting(Auth(Register))
    ["reset-password"] => Setting(Auth(ResetPassword))
    ["settings"] => Setting(Settings)
    ["github-failed"] => Setting(GithubFailed)
    ["user", name] => User(name)
    ["assets", ..] => Assets(url)
    ["skills"] => SkillsList
    ["skills", .. remain] => SkillsDetail(remain.join("/"))
    ["docs", .. remain] =>
      Docs(UnsolvedMooncakePath::new(remain.join("/")), fragment=url.fragment)
    xs => NotFound(xs.join("/"))
  }
}
