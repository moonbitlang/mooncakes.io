///|
fn view_menu(meta : Map[String, ModuleIndex]) -> @html.Html[Msg] {
  div(class="flex min-h-screen flex-col", [
    @view.navbar(),
    div(class="flex flex-grow flex-col items-center justify-center", [
      view_welcome(),
      view_packages_info(meta),
    ]),
    @view.footer(),
  ])
}

///|
fn view_welcome() -> @html.Html[Msg] {
  div(
    class="font-title flex py-10 w-full flex-col-reverse justify-center lg:max-w-6xl lg:flex-row lg:justify-between",
    [
      div(
        class="flex flex-1 flex-col justify-center gap-4 px-4 lg:max-w-[50%] lg:gap-8",
        [
          section(
            class="flex flex-col items-center gap-2 px-4 lg:items-start lg:gap-4",
            [
              p(class="text-xl font-semibold text-gray-600 lg:text-3xl", [
                text("Hi This is"),
              ]),
              h1(class="text-2xl font-semibold lg:text-7xl", [
                text("mooncakes."),
              ]),
              p(
                class="text-center text-gray-600 lg:text-start lg:text-3xl lg:leading-tight",
                [text("The centralized MoonBit package management platform.")],
              ),
            ],
          ),
          div(
            class="flex flex-grow-0 items-center justify-center gap-4 lg:justify-start lg:gap-8",
            [
              @html.a(
                href="https://www.moonbitlang.com/download/",
                class="rounded-full border-[#cf4f89] border-2 bg-[#cf4f89] text-white transition-all lg:px-10 px-4 py-2 text-center font-semibold lg:py-2 lg:text-lg",
                [text("Install Moon")],
              ),
              @html.a(
                href="https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
                class="rounded-full border-[#cf4f89] border-2 hover:bg-[#cf4f89] hover:text-white transition-all lg:px-10 px-4 py-2 text-center font-semibold text-[#cf4f89] lg:py-2 lg:text-lg",
                [text("Getting Started")],
              ),
            ],
          ),
        ],
      ),
      div(class="flex justify-center px-4", [
        @html.img(src=@config.LOGO, alt="logo", class="h-80 lg:h-96", []),
      ]),
    ],
  )
}

///|
fn to_upper(c : Char) -> Char {
  if c >= 'a' && c <= 'z' {
    Char::from_int(c.to_int() - 'a'.to_int() + 'A'.to_int())
  } else {
    c
  }
}

///|
extern "js" fn get_relative_time(date : String) -> String =
  #|function getRelativeTime(dateString) {
  #|  const date = new Date(dateString);
  #|  const now = new Date();
  #|  const diff = now - date;
  #|  const rtf = new Intl.RelativeTimeFormat("zh-CN", { numeric: "auto" });
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
fn view_module_card(mod : ModuleIndex) -> @html.Html[Msg] {
  let keywords = match mod.keywords {
    None => @html.nothing()
    Some(keywords) =>
      div(
        class="mx-3 pb-3 flex gap-2 overflow-hidden",
        keywords.map(fn {
          keyword =>
            @html.span(
              class="text-tiny/5 bg-gray-50 text-gray-600 px-2 py-0 border-gray-200  border rounded",
              [text(keyword)],
            )
        }),
      )
  }
  let description = match mod.description {
    None => @html.nothing()
    Some(description) =>
      div([
        hr(class="mt-2"),
        p(
          class="mx-4 my-3 max-h-16 text-gray-500 text-xs text-ellipsis overflow-hidden",
          [text(description)],
        ),
      ])
  }
  let time = match mod.created_at {
    Some(t) => p([text(get_relative_time(t))])
    None => @html.nothing()
  }
  div(
    class="flex select-none bg-white shadow-sm hover:outline-moonbit hover:outline outline-1 outline-transparent hover:shadow-lg border transition-all border-gray-200 rounded-lg flex w-80 flex-col",
    click=ClickModuleCard(mod.path),
    [
      div(class="px-5 pt-4", [
        div(class="flex flex-wrap justify-between items-center", [
          h2(class="font-semibold text-gray-800 text-xl", [text(mod.name)]),
          div(class="text-gray-500 text-tiny flex gap-x-1", [
            @html.span(class="text-gray-500 text-tiny flex flex-row gap-2", [
              text("v\{mod.version}"),
              time,
            ]),
          ]),
        ]),
        @html.span(class="text-gray-500 text-xs overflow-hidden", [
          text(mod.author),
        ]),
      ]),
      div(class="min-h-10 flex-grow", [description]),
      keywords,
    ],
  )
}

///|
fn view_packages_info(meta : Map[String, ModuleIndex]) -> @html.Html[Msg] {
  div(class="w-full", [
    div(class="bg-[#fbfaf5] flex justify-center", [
      div(class="p-10", [
        h1(
          class="py-5 text-2xl text-gray-800 font-semibold",
          [text("All Mooncakes"), ..view_all_package(meta)],
        ),
      ]),
    ]),
  ])
}

///|
fn view_all_package(meta : Map[String, ModuleIndex]) -> Array[@html.Html[Msg]] {
  let index_map : Map[Char, Array[ModuleIndex]] = {}
  @config.INDICES.iter().each(fn(c) { index_map.set(c, []) })
  meta
  .iter()
  .map(fn(p) {
    (
      String::from_array(
        p.0.iter().drop_while(fn(x) { x != '/' }).drop(1).collect(),
      ),
      p.1,
    )
  })
  .each(fn(p) {
    let letter = to_upper(p.0[0])
    index_map.get(letter).unwrap().push(p.1)
  })
  index_map
  .iter()
  .map(fn(couple) {
    let (letter, packages) = couple
    if couple.1.length() > 0 {
      div([
        div([
          h2(class="px-1 py-4 text-xl text-gray-900 font-semibold", [
            text(letter.to_string()),
          ]),
          div(
            class="grid xl:grid-cols-3 lg:grid-cols-2 sm:grid-cols-1 gird-flow-row auto-rows-max gap-y-4 gap-x-4",
            packages.map(view_module_card),
          ),
          hr(class="mt-8 mb-4"),
        ]),
      ])
    } else {
      @html.nothing()
    }
  })
  .collect()
}
