///|
fn parse_int(value : StringView) -> Int? {
  try @string.parse_int(value) catch {
    _ => None
  } noraise {
    value => Some(value)
  }
}

///|
fn parse_plain_datetime(value : StringView) -> Int64? {
  let value = if value.contains("T") {
    value.to_owned()
  } else {
    "\{value}T00:00:00"
  }
  try @time.PlainDateTime::from_str(value) catch {
    _ => None
  } noraise {
    value => Some(value.to_unix_second())
  }
}

///|
fn parse_timezone_offset(value : StringView) -> Int? {
  let fields = value.split(":").to_array()
  let parts = match fields {
    [hours, minutes] => Some((hours, minutes))
    [compact] if compact.length() == 4 =>
      if compact.get_view(end=2) is Some(hours) &&
        compact.get_view(start=2) is Some(minutes) {
        Some((hours, minutes))
      } else {
        None
      }
    _ => None
  }
  guard parts is Some((hours_text, minutes_text)) else { return None }
  guard parse_int(hours_text) is Some(hours) &&
    parse_int(minutes_text) is Some(minutes) else {
    return None
  }
  if hours > 23 || minutes > 59 {
    None
  } else {
    Some(hours * 3600 + minutes * 60)
  }
}

///|
/// Parses the ISO-8601 forms emitted by the mooncakes.io APIs.
/// A timestamp without an explicit offset is interpreted as UTC.
pub fn iso8601_to_unix_seconds(value : String) -> Int64? {
  let value = value.trim()
  if value.strip_suffix("Z") is Some(body) {
    return parse_plain_datetime(body)
  }
  if value.strip_suffix("z") is Some(body) {
    return parse_plain_datetime(body)
  }
  let mut offset_start : Int? = None
  let mut offset_sign = '+'
  for index, char in value.iter2() {
    if index > 10 && (char == '+' || char == '-') {
      offset_start = Some(index)
      offset_sign = char
    }
  }
  if offset_start is Some(index) {
    guard value.get_view(end=index) is Some(datetime) &&
      value.get_view(start=index + 1) is Some(offset_text) else {
      return None
    }
    guard parse_plain_datetime(datetime) is Some(timestamp) &&
      parse_timezone_offset(offset_text) is Some(offset) else {
      return None
    }
    let offset = offset.to_int64()
    if offset_sign == '+' {
      Some(timestamp - offset)
    } else {
      Some(timestamp + offset)
    }
  } else {
    parse_plain_datetime(value)
  }
}

///|
fn two_digits(value : Int) -> String {
  if value < 10 {
    "0\{value}"
  } else {
    value.to_string()
  }
}

///|
fn civil_date_from_unix_day(unix_day : Int64) -> (Int, Int, Int) {
  let shifted = unix_day + 719468L
  let era = if shifted >= 0L {
    shifted / 146097L
  } else {
    (shifted - 146096L) / 146097L
  }
  let day_of_era = shifted - era * 146097L
  let year_of_era = (
      day_of_era -
      day_of_era / 1460L +
      day_of_era / 36524L -
      day_of_era / 146096L
    ) /
    365L
  let mut year = year_of_era + era * 400L
  let day_of_year = day_of_era -
    (365L * year_of_era + year_of_era / 4L - year_of_era / 100L)
  let month_prime = (5L * day_of_year + 2L) / 153L
  let day = day_of_year - (153L * month_prime + 2L) / 5L + 1L
  let month_offset = if month_prime < 10L { 3L } else { -9L }
  let month = month_prime + month_offset
  if month <= 2L {
    year += 1L
  }
  (year.to_int(), month.to_int(), day.to_int())
}

///|
/// Returns a UTC calendar date relative to today.
pub fn utc_date_days_ago(days : Int) -> String {
  let unix_day = @env.now().reinterpret_as_int64() / 86400000L - days.to_int64()
  let (year, month, day) = civil_date_from_unix_day(unix_day)
  "\{year}-\{two_digits(month)}-\{two_digits(day)}"
}

///|
fn pluralized_ago(value : Int64, unit : String) -> String {
  let label = if value == 1L { unit } else { "\{unit}s" }
  "\{value} \{label} ago"
}

///|
fn relative_time_from_seconds(elapsed_seconds : Int64) -> String {
  let seconds = if elapsed_seconds < 0L { 0L } else { elapsed_seconds }
  let minutes = seconds / 60L
  let hours = minutes / 60L
  let days = hours / 24L
  let months = days / 30L
  let years = days / 365L
  if years > 0L {
    if years == 1L {
      "last year"
    } else {
      pluralized_ago(years, "year")
    }
  } else if months > 0L {
    if months == 1L {
      "last month"
    } else {
      pluralized_ago(months, "month")
    }
  } else if days > 0L {
    if days == 1L {
      "yesterday"
    } else {
      pluralized_ago(days, "day")
    }
  } else if hours > 0L {
    pluralized_ago(hours, "hour")
  } else if minutes > 0L {
    pluralized_ago(minutes, "minute")
  } else if seconds == 0L {
    "now"
  } else {
    pluralized_ago(seconds, "second")
  }
}

///|
pub fn get_relative_time(date : String) -> String {
  guard iso8601_to_unix_seconds(date) is Some(date_seconds) else { return date }
  let now_seconds = @env.now().reinterpret_as_int64() / 1000L
  relative_time_from_seconds(now_seconds - date_seconds)
}

///|
pub fn recency_penalty(date : String) -> Int {
  guard iso8601_to_unix_seconds(date) is Some(date_seconds) else { return 200 }
  let now_seconds = @env.now().reinterpret_as_int64() / 1000L
  let elapsed = if now_seconds > date_seconds {
    now_seconds - date_seconds
  } else {
    0L
  }
  let penalty = elapsed / 86400L * 3L
  if penalty > 200L {
    200
  } else {
    penalty.to_int()
  }
}
