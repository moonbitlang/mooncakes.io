// Temporary cleanup for package summaries with appended keyword metadata.
// TODO: Remove this workaround once the API returns summary and keywords as
// separate structured fields instead of appending a Keywords: section.

///|
fn clean_package_summary(summary : String) -> String {
  guard summary.split_once("\nKeywords:") is Some((body, _)) else { summary }
  "\{body.trim_end()}"
}

///|
fn clean_package_summary_fragments(
  fragments : Array[SummaryFragment],
) -> Array[SummaryFragment] {
  let summary = fragments.iter().map(fragment => fragment.text).join("")
  let body = clean_package_summary(summary)
  guard body != summary else { fragments }
  let cleaned : Array[SummaryFragment] = []
  for index = 0, remaining = body.length(); index < fragments.length() &&
     remaining > 0; {
    let fragment = fragments[index]
    let length = fragment.text.length()
    if length <= remaining {
      cleaned.push(fragment)
      continue index + 1, remaining - length
    }
    guard fragment.text.get_view(end=remaining) is Some(prefix) else { break }
    cleaned.push({ text: "\{prefix}", matched: fragment.matched, })
    break
  }
  cleaned
}
