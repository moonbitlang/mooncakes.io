///|
fn is_uri_component_byte(value : Int) -> Bool {
  (value >= 'a' && value <= 'z') ||
  (value >= 'A' && value <= 'Z') ||
  (value >= '0' && value <= '9') ||
  value == '-' ||
  value == '_' ||
  value == '.' ||
  value == '!' ||
  value == '~' ||
  value == '*' ||
  value == '\'' ||
  value == '(' ||
  value == ')'
}

///|
fn hex_digit(value : Int) -> Char {
  let code = if value < 10 {
    '0'.to_int() + value
  } else {
    'A'.to_int() + value - 10
  }
  code.to_char().unwrap_or('0')
}

///|
/// Percent-encodes a value with JavaScript `encodeURIComponent` semantics.
pub fn encode_uri_component(value : String) -> String {
  let output = StringBuilder()
  for byte in @utf8.encode(value) {
    let value = byte.to_int()
    if is_uri_component_byte(value) {
      output.write_char(value.to_char().unwrap_or('?'))
    } else {
      output.write_char('%')
      output.write_char(hex_digit(value / 16))
      output.write_char(hex_digit(value % 16))
    }
  }
  output.to_string()
}
