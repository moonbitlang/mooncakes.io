///|
test "profile bootstrap excludes credentials and escapes HTML parser delimiters" {
  let value : Json = {
    "username": "</script><script>alert(1)</script>",
    "email": "hello@example.com",
    "gh_id": 42,
    "access_token": "jwt-secret",
    "tokens": ["api-secret"],
  }
  let encoded = profile_bootstrap(value)
  assert_false(encoded.contains("<"))
  assert_false(encoded.contains("jwt-secret"))
  assert_false(encoded.contains("api-secret"))
  assert_eq(@json.parse(encoded), public_profile(value))
  assert_eq(public_profile({ "tokens": [] }), (null : Json))
}
