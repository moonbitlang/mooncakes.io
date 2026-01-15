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
fn simple_module_card(mod : ModuleIndex) -> Html[Msg] {
  div(
    class="h-24 lg:h-30 flex-nowrap bg-white text-gray-700 select-none py-3 px-4 flex outline outline-transparent flex-col border-gray-200 border-b lg:hover:outline-mooncake2 lg:hover:border-transparent lg:hover:shadow-md border rounded-md transition-colors",
    [
      div(
        class="shrink-0 whitespace-nowrap flex flex-row text-base font-semibold",
        [
          a(
            href="/user/\{mod.author}",
            class="hover:bg-gray-200 text-gray-600 font-medium transition-colors rounded px-1 -mx-1",
            [span([text(mod.author)])],
          ),
          a(href="/docs/\{mod.path}", class="flex", [
            span(class="px-1 text-gray-300", [text("/")]),
            span(class="text-black", [text(mod.name)]),
          ]),
        ],
      ),
      a(
        href="/docs/\{mod.path}",
        class="overflow-hidden flex-1 py1 flex flex-col",
        [
          div(class="overflow-hidden flex-1 py1", [
            p(class="line-clamp-1 lg:line-clamp-2 py-1 text-gray-500 text-sm", [
              text(mod.description.unwrap_or("")),
            ]),
          ]),
          div(class="flex items-end", [
            if mod.is_new {
              @view.badge(class="bg-gray-700 text-white", [text("NEW")])
            } else {
              nothing()
            },
            p(class="text-sm w-full text-right pt-1", [
              text(mod.created_at.map(get_relative_time).unwrap_or("")),
            ]),
          ]),
        ],
      ),
    ],
  )
}

///|
fn module_card(mod : ModuleIndex) -> Html[Msg] {
  let keywords = match mod.keywords {
    None => nothing()
    Some(keywords) =>
      div(
        class="flex gap-2 h-8 flex-wrap overflow-y-hidden shrink-0",
        keywords.map(keyword => span(
          class="text-xs h-5 bg-gray-50 text-gray-600 px-2 my-2 border-gray-200  border rounded",
          [text(keyword)],
        )),
      )
  }
  let description = match mod.description {
    None => div(class="flex-grow", [])
    Some(description) =>
      p(class="text-gray-700 py-3 overflow-ellipsis grow text-sm", [
        text(description),
      ])
  }
  let time = match mod.created_at {
    Some(t) => p([text(get_relative_time(t))])
    None => nothing()
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
        a(href="/docs/\{mod.path}", class="flex", [
          h2(class="px-1 text-gray-300", [text("/")]),
          h2(class="", [text(mod.name)]),
        ]),
      ]),
      a(href="/docs/\{mod.path}", class="flex-1 flex flex-col", [
        description,
        div(class="flex justify-between items-center text-gray-600 text-sm", [
          keywords, time,
        ]),
      ]),
    ],
  )
}

///|
fn pinned() -> Html[Msg] {
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
  div(class="container lg:w-4/5 px-4", [
    h1(class="p-4 text-sm font-bold text-gray-400 lg:border-0", [
      text("Pinned modules"),
    ]),
    div(
      class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-2 lg:gap-4",
      pinned.map(simple_module_card),
    ),
  ])
}

///|
fn recently_updated(recently : Array[ModuleIndex]) -> Html[Msg] {
  let recently_updated = recently.map(simple_module_card)
  div(class="container lg:w-4/5 px-4", [
    h1(class="p-4 text-sm font-bold text-gray-400 lg:border-0", [
      text("Recently updated"),
    ]),
    div(
      class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-2 lg:gap-4",
      recently_updated,
    ),
  ])
}

///|
fn all_modules(modules : Map[Char, Array[ModuleIndex]]) -> Html[Msg] {
  let all_modules = modules
    .iter2()
    .to_array()
    ..sort_by(fn(a, b) { a.0.to_int() - b.0.to_int() })
    .map(fn(x) {
      let (key, value) = x
      let modules = value.map(simple_module_card)
      div(class="pt-2", [
        div(class="container lg:w-4/5 px-4", [
          h1(class="p-3 text-sm font-bold text-gray-400", [
            text(key.to_string()),
          ]),
          div(
            class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-2 lg:gap-4",
            modules,
          ),
        ]),
      ])
    })
  div(class="pt-10", [
    div(class="container lg:w-4/5 px-4", [
      h1(class="border-b p-4 text-sm font-bold text-gray-400 lg:border-0", [
        text("All modules"),
      ]),
    ]),
    div(all_modules),
  ])
}

///|
fn search_result(mods : Array[ModuleIndex]) -> Html[Msg] {
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
fn banner(total_lines~ : Int, total_packages~ : Int) -> Html[Msg] {
  fn button(value, target, color) {
    a(
      href=target,
      class="py-1 px-3 text-nowrap lg:py-2 lg:px-6 select-none text-sm lg:text-base rounded-full hover:opacity-80 transition-opacity \{color}",
      [text(value)],
    )
  }

  fn stat_card(label, value : Int, invisible : Bool, child : Html[Msg]?) {
    let bottom = match child {
      None => "pb-6"
      Some(_) => "pb-2"
    }
    let invisible = if invisible { " invisible " } else { " " }
    div(
      class="home-stat-card border overflow-clip rounded-xl min-w-27 pl-6 pr-2 mt-4 lg:mt-0 pt-6 \{bottom} \{invisible} flex-col gap-2 items-end grow-1 lg:border-b-gray-300/50 lg:bg-white/50 lg:backdrop-blur",
      [
        p(class="text-xl lg:text-3xl font-extralight", [
          text(value.to_string()),
          text("+"),
        ]),
        div(class="flex items-center justify-between", [
          p(class="text-sm lg:text-base text-gray-700 font-light", [text(label)]),
        ]),
        div(class="hidden md:flex w-full flex-col-reverse", [
          child.unwrap_or(nothing()),
        ]),
      ],
    )
  }

  div(
    class="container lg:w-3/4 flex flex-col lg:flex-row items-center justify-between lg:py-8",
    [
      div(class="text-center lg:text-left mx-4 bg-bottom rounded-xl flex-col", [
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
        div(class="flex mt-2 lg:mt-8 gap-4 justify-center lg:justify-start", [
          button(
            "Getting Started", "https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
            "bg-yellow-600 text-white",
          ),
          button(
            "Install Moon", "https://www.moonbitlang.com/download/", "bg-gray-200 text-gray-800",
          ),
        ]),
      ]),
      div(
        class="home-hero-media flex relative w-4/5 lg:flex-row-reverse lg:w-2/5",
        [
          img(
            class="home-hero-image hidden lg:block lg:absolute left-0 w-[35%] lg:w-[240px] lg:h-[240px] object-cover object-center",
            src="mooncake-pic-small.png",
            [],
          ),
          div(
            class="text-xl flex w-full lg:flex-col gap-2 z-10 lg:w-3/5 select-none",
            [
              stat_card("Lines of code", total_lines, true, None),
              stat_card("Packages", total_packages, false, None),
            ],
          ),
        ],
      ),
    ],
  )
}

///|
pub fn view(model : Model) -> Html[Msg] {
  let module_list = if model.filter == "" {
    let pinned_modules = pinned()
    let recently_updated = match model.recent_modules {
      Loading => @view.loading()
      Failed => @view.load_failed("recently updated modules")
      Success(xs) => recently_updated(xs)
    }
    let all_modules = match model.all_modules {
      Loading => @view.loading()
      Failed => @view.load_failed("module indices")
      Success(xs) => all_modules(xs)
    }
    div([pinned_modules, recently_updated, all_modules])
  } else {
    match model.all_modules {
      Loading => @view.loading()
      Failed => @view.load_failed("module indices")
      Success(_) => search_result(model.filtered_modules)
    }
  }
  let banner = if model.filter == "" {
    banner(
      total_lines=model.showing_lines,
      total_packages=model.showing_packages,
    )
  } else {
    nothing()
  }
  let theme_toggle = @view.theme_toggle(click=ToggleTheme)
  @view.page(
    header=@view.navbar(
      style=Fusion,
      middle=input(
        input_type=Text,
        placeholder="Search modules ...",
        class="border rounded-full my-2 lg:my-0 max-w-1/3 text-sm lg:text-base px-4 w-full py-2 bg-white focus:border-mooncake2 focus:shadow-2xl shadow-yellow-200/10 outline-none transition-colors",
        input=FilterChanged(_),
      ),
      right=theme_toggle,
    ),
    main=div(class="w-full", [banner, module_list]),
  )
}
