///|
fn search_bar() -> @html.Html[Msg] {
  div(
    class="text-center pt-14 pb-8  bg-cover bg-bottom bg-mooncake border-b mb-10",
    [
      div(class="flex items-center justify-center", [
        @html.img(
          src="favicon.svg",
          class="inline-block h-12 w-12",
          alt="Logo",
          [],
        ),
        h1(class="font-bold text-5xl p-4 text-gray-800", [text("mooncakes.io")]),
      ]),
      div(class="flex justify-center mt-4 relative", [
        @html.input(
          input_type=Text,
          placeholder="Search...",
          class="border rounded px-4 py-2 w-screen lg:w-1/2 focus:border-mooncake2 border-2 outline-none",
          input=Msg::FilterChanged,
        ),
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
fn simple_module_card(mod : ModuleIndex) -> @html.Html[Msg] {
  div(
    class="p-4 h-50 flex flex-col border-b bg-white lg:hover:outline-mooncake2 lg:border lg:rounded-md lg:outline outline-transparent transition-all",
    click=ClickModuleCard(mod.path),
    [
      div(class="flex flex-row text-lg font-semibold", [
        h2(class="text-gray-500", [text(mod.author)]),
        h2(class="px-1 text-gray-300", [text("/")]),
        h2(class="", [text(mod.name)]),
      ]),
      div(
        class="pt-2 flex justify-between items-center text-gray-600 text-sm",
        [text(mod.description.or(""))],
      ),
    ],
  )
}

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
      p(class="text-gray-700 py-3 overflow-ellipsis grow text-sm", [
        text(description),
      ])
  }
  let time = match mod.created_at {
    Some(t) => p([text(get_relative_time(t))])
    None => @html.nothing()
  }
  div(
    class="p-4 min-h-32 flex flex-col border-t bg-white hover:bg-gray-100 transition-all",
    click=ClickModuleCard(mod.path),
    [
      div(class="flex flex-row text-lg font-semibold", [
        h2(class="text-gray-500", [text(mod.author)]),
        h2(class="px-1 text-gray-300", [text("/")]),
        h2(class="", [text(mod.name)]),
      ]),
      description,
      div(class="flex justify-between items-center text-gray-600 text-sm", [
        keywords, time,
      ]),
    ],
  )
}

///|
fn recently_updated(recently : Array[ModuleIndex]) -> @html.Html[Msg] {
  let recently_updated = recently.map(simple_module_card)
  div([
    div(class="container lg:w-2/3 px-4", [
      h1(class="border-b p-4 text-sm font-bold text-gray-400 lg:border-0", [
        text("RECENTLY UPDATED"),
      ]),
      div(
        class="grid grid-cols-1 lg:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-4",
        recently_updated,
      ),
    ]),
  ])
}

///|
fn search_result(mods : Array[ModuleIndex]) -> @html.Html[Msg] {
  let module_cards = mods.map(module_card)
  div([
    div(class="container lg:w-3/5 px-4", [
      h1(class="p-4 text-sm font-bold text-gray-400 lg:border-0", [
        text("SEARCH RESULT"),
      ]),
      div(class="grid grid-cols-1 grid-cols-1", module_cards),
    ]),
  ])
}
