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
fn decode_user_profile(json : Json) -> Result[Profile, String] {
  match json {
    {
      "modules": Array(modules),
      "username": String(username),
      "avatar_url"? : avatar_url,
      ..
    } =>
      try {
        let modules = modules.map(fn(x) {
          match x {
            { "name": String(name), "version": String(version), .. } =>
              (name, version)
            _ => fail("failed to decode \{x}")
          }
        })
        let avatar_url = match avatar_url {
          Some(String(url)) => url
          _ => ""
        }
        Ok({ username, avatar_url, modules })
      } catch {
        e => Err(e.to_string())
      }
    _ => Err("failed to decode json \{json}")
  }
}

///|
fn decode_code_frequency(json : Json) -> Result[CodeFrequency, String] {
  match json {
    Object(dict) => {
      let result = {}
      try {
        for k, v in dict {
          match v {
            Number(i, ..) => result[k] = i.to_int()
            _ => fail("failed to decode \{v}")
          }
        }
        Ok(result)
      } catch {
        e => Err(e.to_string())
      }
    }
    _ => Err("failed to decode \{json}")
  }
}

///|
enum Msg {
  GotUserProfile(Result[Profile, String])
  GotCodeFrequency(Result[CodeFrequency, String])
}

///|
struct Model {
  profile : Status[Profile]
  code_frequency : Status[CodeFrequency]
}

///|
typealias Map[String, Int] as CodeFrequency

///|
typealias Array[(String, String)] as PublishedModules

///|
struct Profile {
  username : String
  avatar_url : String
  modules : PublishedModules
}

///|
// JavaScript FFI for date operations
extern "js" fn get_today_iso() -> String =
  #|function getTodayISO() {
  #|  const date = new Date();
  #|  const year = date.getFullYear();
  #|  const month = String(date.getMonth() + 1).padStart(2, '0');
  #|  const day = String(date.getDate()).padStart(2, '0');
  #|  return `${year}-${month}-${day}`;
  #|}

///|
extern "js" fn get_date_days_ago(days : Int) -> String =
  #|function getDateDaysAgo(days) {
  #|  const date = new Date();
  #|  date.setDate(date.getDate() - days);
  #|  const year = date.getFullYear();
  #|  const month = String(date.getMonth() + 1).padStart(2, '0');
  #|  const day = String(date.getDate()).padStart(2, '0');
  #|  return `${year}-${month}-${day}`;
  #|}

///|
pub fn load(username : String) -> (Cmd[Msg], Model) {
  let today = get_today_iso()
  let start_date = get_date_days_ago(120)
  (
    batch([
      @http.get(
        "/api/v0/user/\{username}",
        expect=Json(GotUserProfile(_), decode_user_profile),
      ),
      @http.get(
        "/api/v0/user/\{username}/code-frequency?start_date=\{start_date}&end_date=\{today}",
        expect=Json(GotCodeFrequency(_), decode_code_frequency),
      ),
    ]),
    { profile: Loading, code_frequency: Loading },
  )
}

///|
fnalias @html.(div, h1, h2, text, a, span, img)

///|
fnalias @cmd.(none, batch)

///|
typealias @cmd.Cmd

///|
typealias @util.Status

///|
pub fn profile(profile : Status[Profile]) -> Html[Msg] {
  match profile {
    Failed => @view.load_failed("user")
    Loading => @view.loading()
    Success({ username, avatar_url, .. }) =>
      div(class="flex flex-col items-center text-center", [
        if avatar_url == "" {
          // Default avatar placeholder
          let initial = username.sub(start=0, end=1).to_string().to_upper() catch {
            _ => "U"
          }
          div(
            class="w-32 h-32 rounded-full bg-gradient-to-br from-blue-400 to-purple-500 flex items-center justify-center mb-4 border-4 border-white shadow-lg",
            [span(class="text-white text-4xl font-bold", [text(initial)])],
          )
        } else {
          img(
            class="w-32 h-32 rounded-full object-cover mb-4 border-4 border-white shadow-lg",
            src=avatar_url,
            [],
          )
        },
        h1(class="text-3xl font-bold text-gray-800", [text(username)]),
      ])
  }
}

///|
pub fn published_modules(modules : Status[PublishedModules]) -> Html[Msg] {
  match modules {
    Failed => @view.load_failed("published modules")
    Loading => @view.loading()
    Success(module_list) => {
      if module_list.length() == 0 {
        return div(class="p-8 text-center text-gray-500", [
          text("No published modules yet"),
        ])
      }
      div([
        h2(class="text-2xl font-semibold mb-6 text-gray-800", [
          text("Published Modules"),
        ]),
        div(
          class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4",
          module_list.map(fn(module_info) {
            let (name, version) = module_info
            // Extract module name (part after '/')
            let display_name = match name.split("/").to_array() {
              parts if parts.length() == 2 => parts[1].to_string()
              _ => name
            }
            div(
              class="group border border-gray-200 rounded-lg p-4 bg-white hover:border-blue-200 hover:shadow-md transition-all duration-200",
              [
                div(class="flex flex-col h-full", [
                  a(
                    href="/docs/\{name}",
                    class="text-lg font-bold text-gray-900 group-hover:text-blue-600 mb-3 transition-colors",
                    [text(display_name)],
                  ),
                  div(class="mt-auto flex justify-end", [
                    span(
                      class="inline-flex items-center px-2 py-1 rounded text-xs font-medium bg-blue-50 text-blue-700",
                      [text("v\{version}")],
                    ),
                  ]),
                ]),
              ],
            )
          }),
        ),
      ])
    }
  }
}

///|
pub fn code_frequency(code_frequency : Status[Map[String, Int]]) -> Html[Msg] {
  match code_frequency {
    Failed => @view.load_failed("code frequency")
    Loading => @view.loading()
    Success(data) => {
      if data.size() == 0 {
        return div(class="my-6 text-sm text-gray-500", [
          text("No code frequency data"),
        ])
      }

      // find max absolute value for symmetric scaling
      let mut max_abs = 1
      for v in data.values() {
        let abs_v = if v < 0 { -v } else { v }
        if abs_v > max_abs {
          max_abs = abs_v
        }
      }
      let bars = data
        .to_array()
        .map(fn(entry) {
          let (date_raw, value) = entry
          let date_label = date_raw.sub(start=5).to_string() catch {
            _ => date_raw
          }
          let abs_v = if value < 0 { -value } else { value }
          // target max bar segment height (one side) = 70px (leave padding)
          let h = if value == 0 { 2 } else { (abs_v * 70 / max_abs).max(3) }
          let color = if value > 0 {
            "bg-green-500"
          } else if value < 0 {
            "bg-red-500"
          } else {
            "bg-gray-400"
          }
          let bar = if value == 0 {
            // small line on baseline
            div(
              class="absolute left-0 right-0 h-[2px] -translate-y-1/2 top-1/2 bg-gray-400 rounded",
              [],
            )
          } else if value > 0 {
            // grow upward from baseline
            div(
              class="\{color} absolute w-4 sm:w-6",
              style=["height:\{h}px;", "bottom:50%;"],
              [],
            )
          } else {
            // grow downward from baseline
            div(
              class="\{color} absolute w-4 sm:w-6",
              style=["height:\{h}px;", "top:50%;"],
              [],
            )
          }
          let class = if value > 0 {
            "text-green-600"
          } else if value < 0 {
            "text-red-600"
          } else {
            "text-gray-500"
          }
          div(class="flex flex-col items-center flex-shrink-0 w-8 sm:w-10", [
            // graph area
            div(class="relative h-40 w-4 sm:w-6", [
              // baseline
              div(class="absolute left-0 right-0 top-1/2 h-px bg-gray-300", []),
              bar,
            ]),
            // value
            span(class="text-[8px] sm:text-[10px] mt-1 font-mono \{class}", [
              text(if value > 0 { "+\{value}" } else { value.to_string() }),
            ]),
            // date
            span(class="text-[8px] sm:text-[10px] mt-0.5 text-gray-700", [
              text(date_label),
            ]),
          ])
        })
      div([
        h2(class="text-2xl font-semibold mb-6 text-gray-800", [
          text("Code Frequency"),
        ]),
        div(
          class="bg-white rounded-xl border px-4 sm:px-6 lg:px-10 pb-6 pt-6 sm:pt-8 lg:pt-10",
          [
            // grid background
            div(class="relative overflow-hidden", [
              div(
                class="absolute inset-0 flex flex-col justify-between h-40 pointer-events-none",
                [
                  div(class="border-t border-dashed border-gray-200", []),
                  div(class="border-t border-dashed border-gray-200", []),
                  div(class="border-t border-dashed border-gray-300", []), // center line slightly darker
                  div(class="border-t border-dashed border-gray-200", []),
                  div(class="border-t border-dashed border-gray-200", []),
                ],
              ),
              div(
                class="flex items-end overflow-x-auto gap-1 sm:gap-2 lg:gap-3 pb-2",
                [
                  div(
                    class="flex items-end gap-2",
                    [..bars, div(id="right", [])],
                  ),
                ],
              ),
            ]),
            div(class="flex flex-wrap gap-2 sm:gap-4 mt-4 text-xs", [
              div(class="flex items-center", [
                div(class="bg-green-500 w-4 h-2 rounded-sm mr-1", []),
                text("Added"),
              ]),
              div(class="flex items-center", [
                div(class="bg-red-500 w-4 h-2 rounded-sm mr-1", []),
                text("Removed"),
              ]),
              div(class="flex items-center", [
                div(class="bg-gray-400 w-4 h-[2px] mr-1", []),
                text("No Change"),
              ]),
            ]),
          ],
        ),
      ])
    }
  }
}

///|
pub fn view(model : Model) -> Html[Msg] {
  @view.page(
    main=div(class="container lg:px-40 px-4 py-6", [
      // Top: User profile (centered)
      div(class="flex justify-center mb-8", [profile(model.profile)]),
      // Content area: vertical layout
      div(class="space-y-8", [
        // Top: Code frequency
        code_frequency(model.code_frequency),
        // Bottom: Published modules
        published_modules(
          match model.profile {
            Success({ modules, .. }) => Success(modules)
            Loading => Loading
            Failed => Failed
          },
        ),
      ]),
    ]),
    footer=@view.footer(),
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    GotUserProfile(Ok(profile)) =>
      (none(), { ..model, profile: Success(profile) })
    GotCodeFrequency(Ok(data)) =>
      (@nav.scroll_to("right"), { ..model, code_frequency: Success(data) })
    GotCodeFrequency(Err(msg)) => {
      println(msg)
      (none(), { ..model, code_frequency: Failed })
    }
    GotUserProfile(Err(msg)) => {
      println(msg)
      (none(), { ..model, profile: Failed })
    }
  }
}
