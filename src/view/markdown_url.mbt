///|
/// HTML attribute escaping does not make executable URL schemes safe. Check
/// both the source destination and any application-generated replacement.
fn markdown_url(
  raw : String,
  transform_link? : (String) -> String,
  image? : Bool = false,
) -> String {
  guard allowed_markdown_url(raw, image~) else { return "#" }
  let transformed = if transform_link is Some(f) { f(raw) } else { raw }
  if allowed_markdown_url(transformed, image~) {
    transformed
  } else {
    "#"
  }
}

///|
fn allowed_markdown_url(value : String, image~ : Bool) -> Bool {
  if value.iter().any(c => c.is_ascii_control() || c == '\\') {
    return false
  }
  let value = value.trim().to_owned()
  let boundary = value.find_by(c => c == ':' || c == '/' || c == '?' || c == '#')
  if boundary is Some(pos) && value[pos] == ':' {
    let scheme = value[:pos].to_owned().to_lower()
    scheme == "https" || scheme == "http" || (!image && scheme == "mailto")
  } else {
    true
  }
}
