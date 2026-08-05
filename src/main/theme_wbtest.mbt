///|
test "theme preference parsing uses system as its safe default" {
  assert_eq(theme_preference_from_string("").to_string(), "system")
  assert_eq(theme_preference_from_string("system").to_string(), "system")
  assert_eq(theme_preference_from_string("light").to_string(), "light")
  assert_eq(theme_preference_from_string("dark").to_string(), "dark")
  assert_eq(theme_preference_from_string("unexpected").to_string(), "system")
}

///|
test "theme preference cycles system light dark" {
  let system : Theme = {
    preference: theme_preference_from_string("system"),
    system_dark: false,
  }
  let light = system.next_preference()
  let dark = light.next_preference()
  assert_eq(light.preference.to_string(), "light")
  assert_eq(dark.preference.to_string(), "dark")
  assert_eq(dark.next_preference().preference.to_string(), "system")
}

///|
test "resolved theme follows the preference and system matrix" {
  let preferences = ["system", "light", "dark"]
  let expected_light_system = ["light", "light", "dark"]
  let expected_dark_system = ["dark", "light", "dark"]
  for i = 0; i < preferences.length(); i = i + 1 {
    let preference = theme_preference_from_string(preferences[i])
    assert_eq(
      ({ preference, system_dark: false } : Theme).resolved(),
      expected_light_system[i],
    )
    assert_eq(
      ({ preference, system_dark: true } : Theme).resolved(),
      expected_dark_system[i],
    )
  }
}

///|
test "system changes update cached state for every preference" {
  for preference in ["system", "light", "dark"] {
    let model : Model = {
      theme: {
        preference: theme_preference_from_string(preference),
        system_dark: false,
      },
      page: Redirect,
    }
    let (_, updated) = update(_ => none, SystemSchemeChanged(true), model)
    assert_true(updated.theme.system_dark)
    let expected = if preference == "light" { "light" } else { "dark" }
    assert_eq(updated.theme.resolved(), expected)
  }
}

///|
test "page replacement preserves root theme state" {
  let model : Model = {
    theme: {
      preference: theme_preference_from_string("dark"),
      system_dark: true,
    },
    page: Redirect,
  }
  let routed = { ..model, page: NotFound }
  assert_eq(routed.theme.preference.to_string(), "dark")
  assert_true(routed.theme.system_dark)
}
