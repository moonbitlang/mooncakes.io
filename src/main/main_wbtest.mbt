///|
test "theme preference storage uses system as its safe default" {
  assert_eq(theme_to_storage(theme_from_storage("")), "system")
  assert_eq(theme_to_storage(theme_from_storage("system")), "system")
  assert_eq(theme_to_storage(theme_from_storage("light")), "light")
  assert_eq(theme_to_storage(theme_from_storage("dark")), "dark")
  assert_eq(theme_to_storage(theme_from_storage("unexpected")), "system")
}

///|
test "theme toggle cycles through system light and dark" {
  assert_eq(theme_to_storage(toggle_theme(System)), "light")
  assert_eq(theme_to_storage(toggle_theme(Light)), "dark")
  assert_eq(theme_to_storage(toggle_theme(Dark)), "system")
}

///|
test "theme resolution separates preference from system appearance" {
  assert_eq(resolved_theme_class(System, false), "theme-light")
  assert_eq(resolved_theme_class(System, true), "theme-dark")
  assert_eq(resolved_theme_class(Light, true), "theme-light")
  assert_eq(resolved_theme_class(Dark, false), "theme-dark")
  assert_eq(preference_theme_class(System), "theme-pref-system")
  assert_eq(preference_theme_class(Light), "theme-pref-light")
  assert_eq(preference_theme_class(Dark), "theme-pref-dark")
}
