///|
test "relative time respects timezone offsets" {
  let now = "2026-07-24T10:45:13.000+00:00"
  assert_eq(
    format_relative_time("2026-07-24T09:45:13.000000", now),
    "1 hour ago",
  )
  assert_eq(
    format_relative_time("2026-07-24T09:45:13.000000+00:00", now),
    "1 hour ago",
  )
  assert_eq(
    format_relative_time("2026-07-24T17:45:13.000000+08:00", now),
    "1 hour ago",
  )
}
