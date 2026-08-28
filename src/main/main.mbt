///|
extern "js" fn current_hostname() -> String =
  #|() => String(globalThis.location?.hostname || '')

///|
#warnings("-alert_experimental")
fn main {
  let lang : @i18n.Lang = match current_hostname() {
    @config.ZH_SITE => Zh
    _ => En
  }
  @app.app(lang).hydrate()
}
