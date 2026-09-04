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
impl @json.FromJson for Profile with fn from_json(json : Json, path) {
  match json {
    {
      "modules": Array(modules),
      "username": String(username),
      "avatar_url"? : avatar_url,
      ..
    } => {
      let decoded_modules = []
      for x in modules {
        match x {
          { "name": String(name), "version": String(version), .. } =>
            decoded_modules.push((name, version))
          _ => raise JsonDecodeError((path, "failed to decode \{Repr(x)}"))
        }
      }
      let avatar_url = match avatar_url {
        Some(String(url)) => url
        _ => ""
      }
      { username, avatar_url, modules: decoded_modules, }
    }
    _ => raise JsonDecodeError((path, "failed to decode json \{Repr(json)}"))
  }
}

///|
impl @json.FromJson for CodeFrequencyResponse with fn from_json(
  json : Json,
  path,
) {
  match json {
    Object(dict) => {
      let result = Map([])
      for k, v in dict {
        match v {
          Number(i, ..) => result[k] = i.to_int()
          _ => raise JsonDecodeError((path, "failed to decode \{Repr(v)}"))
        }
      }
      { data: result, }
    }
    _ => raise JsonDecodeError((path, "failed to decode \{Repr(json)}"))
  }
}

///|
type CodeFrequency = Map[String, Int]

///|
priv struct CodeFrequencyResponse {
  data : CodeFrequency
} derive(Eq)

///|
type PublishedModules = Array[(String, String)]

///|
priv struct Profile {
  username : String
  avatar_url : String
  modules : PublishedModules
} derive(Eq)

///|
using @html {div, h1, h2, text, a, span, img, nothing}

///|
fn first_char_upper_or(value : String, fallback : String) -> String {
  if value == "" {
    fallback
  } else {
    let end = value.offset_of_nth_char(1).unwrap_or(value.length())
    value.sub(end~).to_owned().to_upper()
  }
}

///|
fn suffix_after_n_chars_or(
  value : String,
  n : Int,
  fallback : String,
) -> String {
  if n <= 0 {
    value
  } else if value.iter().count() < n {
    fallback
  } else {
    let start = value.offset_of_nth_char(n).unwrap_or(value.length())
    value.sub(start~).to_owned()
  }
}

///|
fn profile(profile : Status[Profile]) -> Html {
  match profile {
    Failed(_) => @view.load_failed("user")
    Pending => @view.skeleton_profile()
    Loaded({ username, avatar_url, .. }) =>
      div(class="flex flex-col items-center text-center animate-fade-in") <| [
        if avatar_url == "" {
          // Default avatar placeholder
          let initial = first_char_upper_or(username, "U")
          div(
            class="w-32 h-32 rounded-full bg-gradient-to-br from-blue-400 to-purple-500 flex items-center justify-center mb-4 border-4 border-white dark:border-zinc-800 shadow-lg",
            span(class="text-white text-4xl font-bold", initial),
          )
        } else {
          img(
            class="w-32 h-32 rounded-full object-cover mb-4 border-4 border-white dark:border-zinc-800 shadow-lg",
            src=avatar_url,
          )
        },
        h1(
          class="text-3xl font-bold text-gray-800 dark:text-slate-200",
          username,
        ),
      ]
  }
}

///|
fn published_modules(profile : Status[Profile]) -> Html {
  match profile {
    Failed(_) => @view.load_failed("published modules")
    Pending => @view.skeleton_published_modules(6)
    Loaded({ modules: module_list, .. }) => {
      if module_list.length() == 0 {
        return div(
          class="p-8 text-center text-gray-500 dark:text-gray-400",
          "No published modules yet",
        )
      }
      div(class="animate-fade-in") <| [
        h2(
          class="text-2xl font-semibold mb-6 text-gray-800 dark:text-slate-200",
          "Published Modules",
        ),
        div(
          class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4",
          module_list.map(fn(module_info) {
            let (name, version) = module_info
            // Extract module name (part after '/')
            let display_name = match name.split("/").to_array() {
              parts if parts.length() == 2 => parts[1].to_owned()
              _ => name
            }
            div(
              class="group border border-gray-200 dark:border-zinc-800 rounded-lg p-4 bg-white dark:bg-zinc-900 hover:border-blue-200 dark:hover:border-blue-900 hover:shadow-md transition-all duration-200",
            ) <| [
              div(class="flex flex-col h-full") <| [
                a(
                  href="/docs/\{name}@\{version}",
                  class="text-lg font-bold text-gray-900 dark:text-slate-50 group-hover:text-blue-600 dark:group-hover:text-blue-300 mb-3 transition-colors",
                  display_name,
                ),
                div(class="mt-auto flex justify-end") <| [
                  span(
                    class="inline-flex items-center px-2 py-1 rounded text-xs font-medium bg-blue-50 dark:bg-blue-950 text-blue-700 dark:text-indigo-400",
                    "v\{version}",
                  ),
                ],
              ],
            ]
          }),
        ),
      ]
    }
  }
}

///|
fn code_frequency(code_frequency : Status[CodeFrequencyResponse]) -> Html {
  match code_frequency {
    Failed(_) => @view.load_failed("code frequency")
    Pending => @view.skeleton_code_frequency()
    Loaded({ data, }) => {
      if data.length() == 0 {
        return div(
          class="my-6 text-sm text-gray-500 dark:text-gray-400",
          "No code frequency data",
        )
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
          let date_label = suffix_after_n_chars_or(date_raw, 5, date_raw)
          let abs_v = if value < 0 { -value } else { value }
          // target max bar segment height (one side) = 70px (leave padding)
          let h = if value == 0 { 2 } else { (abs_v * 70 / max_abs).max(3) }
          let color = if value > 0 {
            "bg-green-500"
          } else if value < 0 {
            "bg-red-500"
          } else {
            "bg-gray-400 dark:bg-gray-700"
          }
          let bar = if value == 0 {
            // small line on baseline
            div(
              class="absolute left-0 right-0 h-[2px] -translate-y-1/2 top-1/2 bg-gray-400 dark:bg-gray-700 rounded",
              nothing,
            )
          } else if value > 0 {
            // grow upward from baseline
            div(
              class="\{color} absolute w-4 sm:w-6",
              style=["height:\{h}px;", "bottom:50%;"],
              nothing,
            )
          } else {
            // grow downward from baseline
            div(
              class="\{color} absolute w-4 sm:w-6",
              style=["height:\{h}px;", "top:50%;"],
              nothing,
            )
          }
          let class = if value > 0 {
            "text-green-600 dark:text-green-300"
          } else if value < 0 {
            "text-red-600 dark:text-red-400"
          } else {
            "text-gray-500 dark:text-gray-400"
          }
          div(class="flex flex-col items-center flex-shrink-0 w-8 sm:w-10") <| [
            // graph area
            div(class="relative h-40 w-4 sm:w-6") <| [
              // baseline
              div(
                class="absolute left-0 right-0 top-1/2 h-px bg-gray-300 dark:bg-gray-800",
                nothing,
              ),
              bar,
            ],
            // value
            span(class="text-[8px] sm:text-[10px] mt-1 font-mono \{class}") <| [
              text(if value > 0 { "+\{value}" } else { value.to_string() }),
            ],
            // date
            span(
              class="text-[8px] sm:text-[10px] mt-0.5 text-gray-700 dark:text-slate-300",
              date_label,
            ),
          ]
        })
      div(class="animate-fade-in") <| [
        h2(
          class="text-2xl font-semibold mb-6 text-gray-800 dark:text-slate-200",
          "Code Frequency",
        ),
        div(
          class="bg-white dark:bg-zinc-900 rounded-xl border px-4 sm:px-6 lg:px-10 pb-6 pt-6 sm:pt-8 lg:pt-10",
        ) <| [
          // grid background
          div(class="relative overflow-hidden") <| [
            div(
              class="absolute inset-0 flex flex-col justify-between h-40 pointer-events-none",
            ) <| [
              div(
                class="border-t border-dashed border-gray-200 dark:border-zinc-800",
                nothing,
              ),
              div(
                class="border-t border-dashed border-gray-200 dark:border-zinc-800",
                nothing,
              ),
              div(
                class="border-t border-dashed border-gray-300 dark:border-zinc-700",
                nothing,
              ), // center line slightly darker
              div(
                class="border-t border-dashed border-gray-200 dark:border-zinc-800",
                nothing,
              ),
              div(
                class="border-t border-dashed border-gray-200 dark:border-zinc-800",
                nothing,
              ),
            ],
            div(
              class="flex items-end overflow-x-auto gap-1 sm:gap-2 lg:gap-3 pb-2",
            ) <| [
              div(class="flex items-end gap-2") <| [
                ..bars,
                div(id="right", nothing),
              ],
            ],
          ],
          div(class="flex flex-wrap gap-2 sm:gap-4 mt-4 text-xs") <| [
            div(class="flex items-center") <| [
              div(class="bg-green-500 w-4 h-2 rounded-sm mr-1", nothing),
              text("Added"),
            ],
            div(class="flex items-center") <| [
              div(class="bg-red-500 w-4 h-2 rounded-sm mr-1", nothing),
              text("Removed"),
            ],
            div(class="flex items-center") <| [
              div(
                class="bg-gray-400 dark:bg-gray-700 w-4 h-[2px] mr-1",
                nothing,
              ),
              text("No Change"),
            ],
          ],
        ],
      ]
    }
  }
}

///|
pub fn user_page(username : String, app_actions~ : Val[Html]) -> Val[Html] {
  let profile_resource : @rabbita.Resource[Profile] = @rabbita.create_resource(inject => {
    @http.get(@config.api_url("/api/v0/user/\{username}")).expect_json(inject)
  })
  let today = @util.utc_date_days_ago(0)
  let start_date = @util.utc_date_days_ago(120)
  let frequency_resource : @rabbita.Resource[CodeFrequencyResponse] = @rabbita.create_resource(inject => {
      @http.get(
        @config.api_url(
          "/api/v0/user/\{username}/code-frequency?start_date=\{start_date}&end_date=\{today}",
        ),
      ).expect_json(inject)
    },
  )
  profile_resource.view3(frequency_resource, app_actions, fn(
    profile_result,
    frequency_result,
    app_actions,
  ) {
    if profile_result is Failed(error) {
      println(error)
    }
    if frequency_result is Failed(error) {
      println(error)
    }
    @view.page(
      header=@view.navbar(right=app_actions),
      main=div(class="container lg:px-40 px-4 py-6") <| [
        div(class="flex justify-center mb-8", profile(profile_result)),
        div(class="space-y-8") <| [
          code_frequency(frequency_result),
          published_modules(profile_result),
        ],
      ],
      footer=@view.footer(),
    )
  })
}
