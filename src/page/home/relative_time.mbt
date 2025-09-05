// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
extern "js" fn get_relative_time(date : String) -> String =
  #|function getRelativeTime(dateString) {
  #|  const date = new Date(dateString);
  #|  const now = new Date();
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