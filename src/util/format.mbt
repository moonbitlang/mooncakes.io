///|
pub fn format_downloads(n : Int) -> String {
  if n >= 1000000 {
    "\{n / 1000000}M"
  } else if n >= 1000 {
    "\{n / 1000}K"
  } else {
    n.to_string()
  }
}
