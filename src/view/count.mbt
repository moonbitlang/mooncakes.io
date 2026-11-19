///|
pub fn format_stat_text(value : String) -> String {
  let chars = value.to_array()
  let length = chars.length()
  let sb = StringBuilder(capacity=length + length / 3)
  for i, c in chars {
    if i > 0 && (length - i) % 3 == 0 {
      sb.write_char(',')
    }
    sb.write_char(c)
  }
  sb.to_string()
}
