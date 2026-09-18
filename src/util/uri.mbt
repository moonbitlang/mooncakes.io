///|
let uri_component_escape_chars : String = @percent.controls +
  " \"#$%&+,/:;<=>?@[\\]^`{|}"

///|
/// Percent-encodes a value with JavaScript `encodeURIComponent` semantics.
pub fn encode_uri_component(value : String) -> String {
  @percent.encode(value, escape_chars=uri_component_escape_chars)
}
