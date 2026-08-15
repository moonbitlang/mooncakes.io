///|
#cfg(not(target="js"))
fn initial_theme_preference() -> String {
  "system"
}

///|
#cfg(not(target="js"))
fn system_prefers_dark() -> Bool {
  false
}

///|
#cfg(not(target="js"))
fn persist_theme_preference(_preference : ThemePreference) -> Cmd {
  none
}

///|
#cfg(not(target="js"))
fn apply_theme(_theme : Theme) -> Cmd {
  none
}

///|
#cfg(not(target="js"))
fn apply_theme_now(_theme : Theme) -> Unit {
  ()
}

///|
#cfg(not(target="js"))
fn on_system_scheme_changed(_emit : @cmd.Emit[Bool]) -> @sub.Sub {
  @sub.none
}
