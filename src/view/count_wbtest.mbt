///|
test "format_stat_text groups digits and placeholders" {
  inspect(format_stat_text("12"), content="12")
  inspect(format_stat_text("1000"), content="1,000")
  inspect(format_stat_text("1234567"), content="1,234,567")
  inspect(format_stat_text("----"), content="-,---")
}
