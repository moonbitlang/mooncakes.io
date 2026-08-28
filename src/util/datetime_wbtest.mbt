///|
test "relative time follows lang" {
  inspect(relative_time_from_seconds(0L, En), content="now")
  inspect(relative_time_from_seconds(5L, En), content="5 seconds ago")
  inspect(relative_time_from_seconds(86400L, En), content="yesterday")
  inspect(relative_time_from_seconds(0L, Zh), content="刚刚")
  inspect(relative_time_from_seconds(5L, Zh), content="5 秒前")
  inspect(relative_time_from_seconds(60L, Zh), content="1 分钟前")
  inspect(relative_time_from_seconds(3600L, Zh), content="1 小时前")
  inspect(relative_time_from_seconds(86400L, Zh), content="昨天")
  inspect(relative_time_from_seconds(2592000L, Zh), content="上个月")
  inspect(relative_time_from_seconds(31536000L, Zh), content="去年")
}
