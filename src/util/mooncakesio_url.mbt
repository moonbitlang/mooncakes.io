///|
#derive(Eq)
pub(all) enum AuthFormKind {
  Login
  Register
  ResetPassword
}

///|
#derive(Eq)
pub(all) enum SettingPage {
  Auth(AuthFormKind)
  Settings
  GithubFailed
}

///|
pub extend AuthFormKind with Eq::{equal, not_equal}

///|
pub extend SettingPage with Eq::{equal, not_equal}

///|
pub enum MooncakesioPath {
  Home
  Search(String)
  Setting(SettingPage)
  User(StringView)
  Docs(UnsolvedMooncakePath, fragment~ : String?)
  SkillsList
  Cli(Int32)
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
    Search(query) => logger.write_string("search:\{query}")
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
    Cli(page) => logger.write_string("cli:\{page}")
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
    ["search"] | ["search", ""] => Search(search_query(url))
    ["build-queue"] => BuildQueue
    ["login"] => Setting(Auth(Login))
    ["register"] => Setting(Auth(Register))
    ["reset-password"] => Setting(Auth(ResetPassword))
    ["settings"] => Setting(Settings)
    ["github-failed"] => Setting(GithubFailed)
    ["user", name] => User(name)
    ["assets", ..] => Assets(url)
    ["skills"] | ["skills", ""] => SkillsList
    ["cli"] | ["cli", ""] => {
      let mut page = 1
      for part in url.query.unwrap_or("").split("&") {
        let (name, value) = part.split_once("=").unwrap_or((part, ""))
        if name == "page" {
          let parsed = @string.parse_int(value) catch { _ => 1 }
          page = if parsed > 0 { parsed } else { 1 }
          break
        }
      }
      Cli(page)
    }
    ["skills", .. remain] => SkillsDetail(remain.join("/"))
    ["docs", .. remain] =>
      Docs(UnsolvedMooncakePath::new(remain.join("/")), fragment=url.fragment)
    xs => NotFound(xs.join("/"))
  }
}

///|
fn search_query(url : @url.Url) -> String {
  for part in url.query.unwrap_or("").split("&") {
    let (name, value) = part.split_once("=").unwrap_or((part, ""))
    if name == "q" {
      let encoded = value.split("+").join(" ")
      return @utf8.decode_lossy(@percent.decode(encoded).exact_view())
    }
  }
  ""
}
