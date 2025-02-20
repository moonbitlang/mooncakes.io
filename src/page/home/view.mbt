///|
fn welcome() -> @html.Html[Msg] {
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
fn module_card(mod : ModuleIndex) -> @html.Html[Msg] {
  let keywords = match mod.keywords {
    None => @html.nothing()
    Some(keywords) =>
      div(
        class="flex gap-2 h-8 flex-wrap overflow-y-hidden shrink-0",
        keywords.map(fn {
          keyword =>
            @html.span(
              class="text-sm/4 h-5 bg-gray-50 text-gray-600 px-2 my-2 border-gray-200  border rounded",
              [text(keyword)],
            )
        }),
      )
  }
  let description = match mod.description {
    None => div(class="flex-grow", [])
    Some(description) =>
      p(class="text-gray-700 overflow-ellipsis grow text-sm", [
        text(description),
      ])
  }
  let time = match mod.created_at {
    Some(t) => p([text(get_relative_time(t))])
    None => @html.nothing()
  }
  div(
    class="p-4 h-50 flex flex-col border-b bg-white lg:hover:outline-moonbit lg:border lg:rounded-md lg:outline outline-transparent transition-all",
    click=ClickModuleCard(mod.path),
    [
      h2(class="text-xl font-semibold", [text(mod.name)]),
      description,
      div(class="flex justify-between items-center text-gray-600 text-sm", [
        p([text(mod.author)]),
        time,
      ]),
      keywords,
    ],
  )
}

///|
fn module_list(indices : Indices) -> @html.Html[Msg] {
  fn card_list(xs) {
    div(
      class="grid grid-cols-1 lg:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4",
      xs,
    )
  }

  let recently_updated = indices.recently_updated
    .iter()
    .map(module_card)
    .collect()
  let all_modules = indices.all_modules
    .iter()
    .map(fn(couple) {
      let (letter, indices) = couple
      div([
        div([
          h2(
            class="sticky top-0 px-4 py-2 border-b text-sm bg-mooncake text-gray-900 font-semibold lg:bg-transparent lg:border-0",
            [text(letter.to_string())],
          ),
          card_list(indices.map(module_card)),
        ]),
      ])
    })
    .collect()
  div(class="lg:bg-mooncake", [
    div(
      class="container",
      [
        h1(class="border-b p-4 text-xl font-bold text-gray-900 lg:border-0", [
          text("Recently Updated"),
        ]),
        card_list(recently_updated),
        h1(
          class="border-b pt-10 p-4 text-xl font-bold text-gray-900 lg:border-0",
          [text("All mooncakes")],
        ),
        ..all_modules,
      ],
    ),
  ])
}
