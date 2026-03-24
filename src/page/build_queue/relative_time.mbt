///|
extern "js" fn get_relative_time(date : String) -> String =
  #|function getRelativeTime(dateString) {
  #|  const utcDate = new Date(dateString);
  #|  const timezoneOffset = new Date().getTimezoneOffset();
  #|  const localDate = new Date(utcDate.getTime() - (timezoneOffset * 60 * 1000));
  #|  const now = new Date();
  #|  const diff = now - localDate;
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
