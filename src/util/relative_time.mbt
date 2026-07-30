///|
extern "js" fn format_relative_time(date : String, now : String) -> String =
  #|function formatRelativeTime(dateString, nowString) {
  #|  const value = dateString.trim();
  #|  const hasTimezone = /(?:Z|[+-]\d{2}:?\d{2})$/i.test(value);
  #|  const date = new Date(hasTimezone ? value : `${value}Z`);
  #|  const now = new Date(nowString);
  #|  const diff = now - date;
  #|  const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
  #|  const seconds = Math.floor(diff / 1000);
  #|  const minutes = Math.floor(seconds / 60);
  #|  const hours = Math.floor(minutes / 60);
  #|  const days = Math.floor(hours / 24);
  #|  const months = Math.floor(days / 30);
  #|  const years = Math.floor(days / 365);
  #|  if (years > 0) return rtf.format(-years, "year");
  #|  if (months > 0) return rtf.format(-months, "month");
  #|  if (days > 0) return rtf.format(-days, "day");
  #|  if (hours > 0) return rtf.format(-hours, "hour");
  #|  if (minutes > 0) return rtf.format(-minutes, "minute");
  #|  return rtf.format(-seconds, "second");
  #|}

///|
extern "js" fn current_time_iso() -> String =
  #|() => new Date().toISOString()

///|
pub fn get_relative_time(date : String) -> String {
  format_relative_time(date, current_time_iso())
}
