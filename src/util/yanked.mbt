///|
pub fn decode_yanked(json : Json) -> String? {
  match json {
    { "yanked": true, "yanked_reason": String(reason), .. } => Some(reason)
    { "yanked": true, .. } => Some("")
    _ => None
  }
}
