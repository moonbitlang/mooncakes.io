///|
pub fn deprecation_notice(yanked : String?) -> @html.Html {
  guard yanked is Some(reason) else { return @html.nothing }
  @html.p(
    class="mt-2 min-w-0 text-xs font-normal leading-5 text-gray-500 dark:text-gray-400 break-words [overflow-wrap:anywhere]",
  ) <| [
    @html.span(class="text-amber-700 dark:text-amber-400/80", "Deprecated"),
    if !reason.trim().is_empty() {
      @html.text(": \{reason}")
    } else {
      @html.nothing
    },
  ]
}
