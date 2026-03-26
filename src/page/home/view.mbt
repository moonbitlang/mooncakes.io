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
fn versioned_path(mod : ModuleIndex) -> String {
  if mod.version.is_empty() || mod.path == "moonbitlang/core" {
    mod.path
  } else {
    mod.path + "@" + mod.version
  }
}

///|
fn simple_module_card(mod : ModuleIndex) -> Html {
  let href = "/docs/\{versioned_path(mod)}"
  div(
    class="h-24 lg:h-30 flex-nowrap bg-white text-gray-700 select-none py-3 px-4 flex outline outline-transparent flex-col border-gray-200 border-b lg:hover:outline-mooncake2 lg:hover:border-transparent lg:hover:shadow-md border rounded-md transition-shadow",
    [
      div(
        class="shrink-0 whitespace-nowrap flex flex-row text-base font-semibold",
        [
          a(
            href="/user/\{mod.author}",
            class="hover:bg-gray-200 text-gray-600 font-medium transition-colors rounded px-1 -mx-1",
            [span([text(mod.author)])],
          ),
          a(href~, class="flex", [
            span(class="px-1 text-gray-300", [text("/")]),
            span(class="text-black", [text(mod.name)]),
          ]),
        ],
      ),
      a(href~, class="overflow-hidden flex-1 py1 flex flex-col", [
        div(class="overflow-hidden flex-1 py1", [
          p(class="line-clamp-1 lg:line-clamp-2 py-1 text-gray-500 text-sm", [
            text(mod.description.unwrap_or("")),
          ]),
        ]),
        div(class="flex items-baseline gap-2", [
          if mod.is_new {
            @view.badge(class="bg-gray-700 text-white", [text("NEW")])
          } else {
            nothing
          },
          span(class="text-xs text-gray-500", [text(mod.version)]),
          p(class="text-xs flex-1 text-right text-gray-500", [
            text(mod.created_at.map(get_relative_time).unwrap_or("")),
          ]),
        ]),
      ]),
    ],
  )
}

///|
fn module_card(mod : ModuleIndex) -> Html {
  let keywords = match mod.keywords {
    None => nothing
    Some(keywords) =>
      div(
        class="flex gap-2 h-8 flex-wrap overflow-y-hidden shrink-0",
        keywords.map(keyword => {
          span(
            class="text-xs h-5 bg-gray-50 text-gray-600 px-2 my-2 border-gray-200  border rounded",
            [text(keyword)],
          )
        }),
      )
  }
  let description = match mod.description {
    None => div(class="flex-grow", nothing)
    Some(description) =>
      p(class="text-gray-700 py-3 overflow-ellipsis grow text-sm", [
        text(description),
      ])
  }
  let time = match mod.created_at {
    Some(t) => p([text(get_relative_time(t))])
    None => nothing
  }
  div(
    class="select-none p-4 min-h-32 rounded flex flex-col border bg-white hover:bg-gray-100 transition-colors",
    [
      div(class="flex flex-row text-base font-semibold", [
        a(
          href="/user/\{mod.author}",
          class="hover:bg-gray-200 transition-colors rounded px-1 -mx-1",
          [h2(class="text-gray-500", [text(mod.author)])],
        ),
        a(href="/docs/\{versioned_path(mod)}", class="flex", [
          h2(class="px-1 text-gray-300", [text("/")]),
          h2(class="", [text(mod.name)]),
        ]),
      ]),
      a(href="/docs/\{versioned_path(mod)}", class="flex-1 flex flex-col", [
        description,
        div(
          class="flex justify-between items-center text-gray-600 text-sm gap-2",
          [
            keywords,
            div(class="flex items-center gap-2 shrink-0", [
              span(class="text-xs text-gray-400", [text(mod.version)]),
              time,
            ]),
          ],
        ),
      ]),
    ],
  )
}

///|
fn pinned() -> Html {
  let pinned = [
    {
      author: "moonbitlang",
      name: "core",
      path: "moonbitlang/core",
      version: "",
      keywords: None,
      description: Some(
        "Always up-to-date documentation for the MoonBit standard library API.",
      ),
      created_at: None,
      is_new: false,
    },
    {
      author: "moonbitlang",
      name: "async",
      path: "moonbitlang/async",
      version: "",
      keywords: None,
      description: Some(
        "Asynchronous programming library for MoonBit. Including fs, http, io, and more.",
      ),
      created_at: None,
      is_new: false,
    },
    {
      author: "moonbitlang",
      name: "x",
      path: "moonbitlang/x",
      version: "",
      keywords: None,
      description: Some("Experimental and extended libraries for MoonBit."),
      created_at: None,
      is_new: false,
    },
  ]
  div(class="container lg:w-4/5 px-4 mt-4 mb-6", [
    h1(class="py-2 text-sm font-bold text-gray-400", [text("Pinned modules")]),
    div(
      class="grid grid-cols-1 lg:grid-cols-3 gap-2",
      pinned.map(fn(m) { compact_module_card(m) }),
    ),
  ])
}

///|
fn compact_module_card(mod : ModuleIndex, show_time? : Bool = false) -> Html {
  let href = "/docs/\{versioned_path(mod)}"
  let badge = if show_time {
    text(mod.created_at.map(get_relative_time).unwrap_or(""))
  } else {
    text(mod.version)
  }
  a(
    href~,
    class="block bg-white border border-gray-200 rounded-md px-4 py-3.5 hover:border-mooncake2 hover:shadow-sm transition-all",
    [
      div(class="flex items-baseline gap-1 text-sm", [
        span(class="text-gray-400 font-normal truncate", [text(mod.author)]),
        span(class="text-gray-300", [text("/")]),
        span(class="text-black font-semibold truncate", [text(mod.name)]),
        span(class="text-xs text-gray-400 ml-auto shrink-0", [badge]),
      ]),
      p(class="text-xs text-gray-500 line-clamp-2 mt-2.5 min-h-[2lh]", [
        text(mod.description.unwrap_or("")),
      ]),
    ],
  )
}

///|
fn module_list_column(
  title : String,
  modules : Array[ModuleIndex],
  show_time? : Bool = false,
) -> Html {
  div(
    class="flex flex-col gap-2",
    [
      h2(class="py-2 text-sm font-bold text-gray-400", [text(title)]),
      ..modules
      .iter()
      .take(12)
      .map(fn(m) { compact_module_card(m, show_time~) })
      .collect(),
    ],
  )
}

///|
fn highlights_section(
  recent : Array[ModuleIndex],
  new_published : Array[ModuleIndex],
  popular : Array[ModuleIndex],
) -> Html {
  div(class="container lg:w-4/5 px-4 animate-fade-in", [
    div(class="grid grid-cols-1 lg:grid-cols-3 gap-4", [
      module_list_column("Recently updated", recent, show_time=true),
      module_list_column("Newly published", new_published, show_time=true),
      module_list_column("Most downloaded", popular),
    ]),
  ])
}

///|
fn all_modules(modules : Map[Char, Array[ModuleIndex]]) -> Html {
  let all_modules = modules
    .iter2()
    .to_array()
    ..sort_by(fn(a, b) {
      match (a.0, b.0) {
        ('#', '#') => 0
        ('#', _) => 1
        (_, '#') => -1
        _ => a.0.to_int() - b.0.to_int()
      }
    })
    .map(fn(x) {
      let (key, value) = x
      let modules = value.map(simple_module_card)
      div(class="pt-2", [
        h1(class="py-2 text-sm font-bold text-gray-400", [text(key.to_string())]),
        div(
          class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-2 lg:gap-4",
          modules,
        ),
      ])
    })
  div(class="animate-fade-in", all_modules)
}

///|
fn search_result(mods : Array[ModuleIndex]) -> Html {
  let module_cards = mods.map(module_card)
  div([
    div(class="container lg:w-4/5 px-4", [
      h1(class="p-4 text-sm font-bold text-gray-400 lg:border-0", [
        text("SEARCH RESULT"),
      ]),
      div(class="grid grid-cols-1 gap-2", module_cards),
    ]),
  ])
}

///|
fn format_stat_text(value : String) -> String {
  let chars = value.to_array()
  let length = chars.length()
  let sb = StringBuilder::new(size_hint=length + length / 3)
  for i, c in chars {
    if i > 0 && (length - i) % 3 == 0 {
      sb.write_char(',')
    }
    sb.write_char(c)
  }
  sb.to_string()
}

///|
test "format_stat_text groups digits and placeholders" {
  inspect(format_stat_text("12"), content="12")
  inspect(format_stat_text("1000"), content="1,000")
  inspect(format_stat_text("1234567"), content="1,234,567")
  inspect(format_stat_text("----"), content="-,---")
}

///|
fn banner(total_downloads~ : Int, total_packages~ : Int) -> Html {
  fn button(value, target, color) {
    a(
      href=target,
      class="py-1 px-3 text-nowrap lg:py-2 lg:px-6 select-none text-sm lg:text-base rounded-full hover:opacity-80 transition-opacity \{color}",
      [text(value)],
    )
  }

  fn stat_card(label, value : Int, invisible : Bool, child : Html?) {
    let bottom = match child {
      None => "pb-2 lg:pb-6"
      Some(_) => "pb-2"
    }
    let value = if value == 0 {
      [text(format_stat_text("----"))]
    } else {
      [text(format_stat_text(value.to_string()))]
    }
    let invisible = if invisible { " invisible hidden lg:block " } else { " " }
    div(
      class="home-stat-card lg:bg-white/50 lg:shadow-sm lg:border overflow-clip lg:rounded-xl min-w-27 w-full lg:max-w-[240px] lg:pl-6 lg:pr-2 mt-2 lg:mt-0 pt-2 lg:pt-6 \{bottom} \{invisible} flex-col gap-2 items-center lg:items-end grow-1 lg:border-b-gray-300/50 lg:backdrop-blur text-center lg:text-left",
      [
        p(class="text-2xl lg:text-3xl font-extralight", value),
        div(class="flex items-center justify-center lg:justify-between", [
          p(class="text-sm lg:text-base text-gray-700 font-light", [text(label)]),
        ]),
        div(class="hidden md:flex w-full flex-col-reverse", [
          child.unwrap_or(nothing),
        ]),
      ],
    )
  }

  div(
    class="container lg:w-3/4 px-5 sm:px-6 flex flex-col gap-3 lg:flex-row items-center justify-start lg:justify-center lg:gap-12 lg:py-8",
    [
      div(
        class="text-center lg:text-left mx-4 bg-bottom rounded-xl flex-col lg:max-w-[520px] mt-4 lg:mt-0",
        [
          div(class="text-slate-700 home-hero-copy", [
            h1(class="text-2xl font-semibold lg:text-4xl", [
              text("The Package Registry"),
            ]),
            h1(class="text-3xl font-semibold lg:text-4xl lg:mt-0", [
              text("for"),
              span(class="text-moonbit font-extrabold", [text(" MoonBit ")]),
              text("community"),
            ]),
            h2(class="hidden lg:block text-xl mt-4 text-zinc-500 gap-1", [
              text("Browse, search and share package and documentation"),
            ]),
          ]),
          div(
            class="hidden sm:flex mt-2 lg:mt-8 gap-4 justify-center lg:justify-start",
            [
              button(
                "Getting Started", "https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
                "bg-yellow-600 text-white",
              ),
              button(
                "Install Moon", "https://www.moonbitlang.com/download/", "bg-gray-200 text-gray-800",
              ),
            ],
          ),
        ],
      ),
      div(
        class="home-hero-media flex relative w-full mt-2 lg:mt-0 sm:w-4/5 lg:flex-row-reverse lg:w-2/5 lg:translate-x-9",
        [
          img(
            class="home-hero-image hidden lg:block lg:absolute lg:left-0 lg:translate-x-6 w-[35%] lg:w-[240px] lg:h-[240px] object-cover object-center",
            src="mooncake-pic-small.png",
            nothing,
          ),
          div(
            class="flex w-full flex-row lg:flex-col gap-3 z-10 lg:w-3/5 select-none",
            [
              stat_card("Packages", total_packages, false, None),
              stat_card("Download", total_downloads, false, None),
            ],
          ),
        ],
      ),
    ],
  )
}

///|
pub fn view(model : Model, dispatch~ : (Msg) -> Cmd) -> Html {
  let module_list = if model.filter == "" {
    let pinned_modules = pinned()
    let highlights = match model.highlights {
      Success(h) => highlights_section(h.recent, h.new_modules, h.popular)
      Failed => @view.load_failed("recently updated modules")
      Loading =>
        div(class="container lg:w-4/5 px-4", [
          @view.skeleton_module_cards(highlights_limit),
        ])
    }
    let chevron_down : Html = @svg.svg(
      width=16,
      height=16,
      view_box="0 0 16 16",
      class="shrink-0",
      [
        @svg.path(
          d="M4 6L8 10L12 6",
          fill="none",
          stroke="currentColor",
          stroke_width=2,
        ),
      ],
    )
    let chevron_up : Html = @svg.svg(
      width=16,
      height=16,
      view_box="0 0 16 16",
      class="shrink-0",
      [
        @svg.path(
          d="M4 10L8 6L12 10",
          fill="none",
          stroke="currentColor",
          stroke_width=2,
        ),
      ],
    )
    let all_modules_section = div(class="pt-10 container lg:w-4/5 px-4", [
      div(class="flex justify-center py-2", [
        div(
          class="flex items-center gap-1.5 cursor-pointer select-none text-sm font-semibold text-yellow-700 hover:text-yellow-900 transition-colors px-6 py-2 rounded-md hover:bg-gray-100",
          on_click=dispatch(ToggleAllModules),
          [
            text(
              if model.show_all_modules {
                "Hide modules"
              } else {
                "Show more modules"
              },
            ),
            if model.show_all_modules {
              chevron_up
            } else {
              chevron_down
            },
          ],
        ),
      ]),
      if model.show_all_modules {
        match model.all_modules {
          Idle | Loading => @view.skeleton_module_cards(9)
          Failed => @view.load_failed("module indices")
          Success(xs) => all_modules(xs.indices)
        }
      } else {
        nothing
      },
    ])
    div([pinned_modules, highlights, all_modules_section])
  } else {
    match model.all_modules {
      Idle | Loading => @view.loading()
      Failed => @view.load_failed("module indices")
      Success(_) => search_result(model.filtered_modules)
    }
  }
  let banner = if model.filter == "" {
    banner(
      total_downloads=model.showing_downloads,
      total_packages=model.showing_packages,
    )
  } else {
    nothing
  }
  let theme_toggle = @view.theme_toggle(on_click=dispatch(ToggleTheme))
  let hero = div(class="home-hero-shell pb-2 sm:pb-8", [
    @view.navbar(
      style=Fusion,
      middle=input(
        input_type=Text,
        value=model.filter,
        placeholder="Search modules ...",
        class="border rounded-full my-1 lg:my-0 w-full lg:w-[380px] text-sm lg:text-base px-4 py-2 bg-white/90 shadow-sm shadow-black/5 focus:border-mooncake2 focus:shadow-2xl outline-none transition-colors",
        on_input=x => dispatch(FilterChanged(x)),
        nothing,
      ),
      right=theme_toggle,
    ),
    div(class="hero-banner", [banner]),
  ])
  @view.page(header=hero, main=div(class="w-full", [module_list]))
}
