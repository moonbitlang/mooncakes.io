///|
test "theme preference storage uses system as its safe default" {
  assert_eq(theme_to_storage(theme_from_storage("")), "system")
  assert_eq(theme_to_storage(theme_from_storage("system")), "system")
  assert_eq(theme_to_storage(theme_from_storage("light")), "light")
  assert_eq(theme_to_storage(theme_from_storage("dark")), "dark")
  assert_eq(theme_to_storage(theme_from_storage("unexpected")), "system")
}
