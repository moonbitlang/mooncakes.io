///|
enum Message {
  ReturnToModuleReadme
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ItemClick(String, String)
  PackageClick(PackageModel)
  FilterChange(String)
  LoadModuleInfo
  GotModuleInfo(Result[Json, String])
  LoadModuleIndex
  GotModuleIndex(Result[Json, String])
  LoadReadme
  GotReadme(Result[String, String])
  LoadPackage
  GotPackageInfo(Result[Json, String])
  LoadMenu
  GotMenuInfo(Result[Json, String])
} derive(Show)

///|
struct ModelBody {
  now_path : String
  now_item : String
  sidebar : SidebarModel
  detail_cards : Array[DetailCardModel]
  meta_info : MetaInfoModel
}

///|
enum Model {
  Failure
  Menu
  LoadingMenu
  LoadingModuleInfo(String)
  LoadingModuleIndex(MetaInfoModel, String)
  LoadingReadme(ModelBody, String, Bool)
  LoadingPackage(ModelBody, String, String)
  Success(ModelBody)
}

///|
fn update(msg : Message, model_ : Model) -> (@tea.Command[Message], Model) {
  match model_ {
    Failure => (@tea.none(), model_)
    LoadingModuleInfo(url) =>
      match msg {
        GotModuleInfo(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(info) =>
              (
                @tea.task(LoadModuleIndex),
                LoadingModuleIndex(parse_metadata(info), url),
              )
          }
        LoadModuleInfo =>
          (
            @http.get(
              URL_BASE + "/" + url + "/moon.mod.json",
              expect=Json(Message::GotModuleInfo),
            ),
            model_,
          )
        _ => panic()
      }
    LoadingModuleIndex(meta, url) =>
      match msg {
        GotModuleIndex(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(index) =>
              (
                @tea.task(LoadReadme),
                LoadingReadme(
                  {
                    now_path: meta.module_path,
                    now_item: "",
                    sidebar: generate_sidebar_from_module_index(
                      parse_module_index(index),
                    ),
                    meta_info: meta,
                    detail_cards: [],
                  },
                  url,
                  false,
                ),
              )
          }
        LoadModuleIndex =>
          (
            @http.get(
              URL_BASE + "/" + url + "/module_index.json",
              expect=Json(Message::GotModuleIndex),
            ),
            model_,
          )
        _ => panic()
      }
    LoadingReadme(model, url, tag) =>
      match msg {
        GotReadme(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(r) =>
              (
                @tea.none(),
                Success({
                  ..model,
                  sidebar: {
                    ..model.sidebar,
                    items: (if r == "" || tag {
                      []
                    } else {
                      [
                        {
                          name: model.meta_info.readme.or_default(),
                          target: model.meta_info.module_path,
                          kind: ModuleReadme,
                        },
                      ]
                    }) +
                    model.sidebar.items,
                  },
                  detail_cards: if r == "" {
                    []
                  } else {
                    [ReadmeCard(folded=false, r)]
                  },
                }),
              )
          }
        LoadReadme =>
          (
            match model.meta_info.readme {
              Some(readme) =>
                @http.get(
                  URL_BASE + "/" + url + "/" + readme,
                  expect=Text(Message::GotReadme),
                )
              None => @tea.task(GotReadme(Ok("")))
            },
            model_,
          )
        _ => panic()
      }
    LoadingPackage(model, url, target) =>
      match msg {
        GotPackageInfo(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(result) => {
              let details = process_pacakge_info(result)
              (
                @browser.scroll_to(target),
                Success({ ..model, now_path: url, detail_cards: details }),
              )
            }
          }
        LoadPackage =>
          (
            @http.get(
              URL_BASE + "/" + url + "/package_data.json",
              expect=Json(Message::GotPackageInfo),
            ),
            model_,
          )
        _ => panic()
      }
    Success(model) =>
      match msg {
        ToggleCardDetail(card) => {
          card.toggle_folded()
          (@tea.none(), model_)
        }
        FoldAllCards => {
          for card in model.detail_cards {
            card.toggle_folded()
          }
          (
            @tea.none(),
            Success({
              ..model,
              sidebar: { ..model.sidebar, cards_expanded: false },
            }),
          )
        }
        ExpandAllCards => {
          for card in model.detail_cards {
            card.toggle_folded()
          }
          (
            @tea.none(),
            Success({
              ..model,
              sidebar: { ..model.sidebar, cards_expanded: true },
            }),
          )
        }
        PackageClick(pkg_model) => {
          pkg_model.folded = not(pkg_model.folded)
          (@tea.none(), model_)
        }
        ReturnToModuleReadme =>
          (
            @tea.task(LoadReadme),
            LoadingReadme(model, model.meta_info.module_path, true),
          )
        ItemClick(path, target) =>
          if path == model.now_path {
            (@browser.scroll_to(target), model_)
          } else {
            (@tea.task(LoadPackage), LoadingPackage(model, path, target))
          }
        FilterChange(value) => {
          model.sidebar.filter = value
          (@tea.none(), model_)
        }
        msg => {
          println("Got message \{msg}")
          (@tea.none(), model_)
        }
      }
  }
}

///|
fn menu_button_view(href : String, text_ : String) -> @html.Html[Message] {
  @html.a(
    class="rounded-full border-[#cf4f89] border-2 hover:bg-[#cf4f89] hover:text-white transition-all lg:px-10 px-4 py-2 text-center font-semibold text-[#cf4f89] lg:py-2 lg:text-lg",
    href~,
    [text(text_)],
  )
}

///|
fn view(state : Model) -> @html.Html[Message] {
  match state {
    Menu =>
      div(class="flex min-h-screen flex-col", [
        div([navbar_view(NAVBAR)]),
        div(class="flex flex-grow flex-col items-center justify-center", [
          div(
            class="flex py-10 w-full flex-col-reverse justify-center lg:max-w-6xl lg:flex-row lg:justify-between",
            [
              div(
                class="flex flex-1 flex-col justify-center gap-4 px-4 lg:max-w-[50%] lg:gap-8",
                [
                  div(
                    class="flex flex-col items-center gap-2 px-4 lg:items-start lg:gap-4",
                    [
                      p(
                        class="text-xl font-semibold text-gray-600 lg:text-3xl",
                        [text("Hi! This is")],
                      ),
                      h1(class="text-2xl font-semibold lg:text-7xl", [
                        text("mooncakes."),
                      ]),
                      p(
                        class="text-center text-gray-600 lg:text-start lg:text-3xl lg:leading-tight",
                        [
                          text(
                            "The centralized MoonBit package management platform.",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              div(
                class="flex flex-grow-0 items-center justify-center gap-4 lg:justify-start lg:gap-8",
                [
                  menu_button_view(
                    "https://www.moonbitlang.com/download/", "Install Moon",
                  ),
                  menu_button_view(
                    "https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
                    "Getting Started",
                  ),
                ],
              ),
              div(class="flex justify-center px-4", [
                @html.img(
                  src="mooncake-pic.png",
                  alt="logo",
                  class="h-80 lg:h-96",
                  [],
                ),
              ]),
            ],
          ),
        ]),
      ])
    Success(model) =>
      div(
        class="flex flex-col overflow-scroll scrollbar-thin h-screen scrollbar-thumb-purple-300 scrollbar-track-transparent",
        [
          div([navbar_view(NAVBAR)]),
          div([floating_view(model.sidebar.cards_expanded)]),
          div(class="flex w-full flex-1", [
            div(class="w-1/4 p-3 min-w-[300px] max-w-[400px] border-r", [
              meta_info_view(model.meta_info),
              div(
                class="sticky top-[-1px] overflow-y-scroll max-h-screen scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
                [sidebar_view(model.sidebar)],
              ),
            ]),
            div(class="flex-grow overflow-y-auto w-screen bg-[#fcfcfd]", [
              detail_cards_view(model.detail_cards),
            ]),
          ]),
          footer_view(),
        ],
      )
    Failure => h1(class="text-gray-800 text-2xl", [text("Failure")])
    LoadingMenu(_) | LoadingModuleIndex(_) | LoadingModuleInfo(_) =>
      h1(class="text-gray-800 text-2xl", [text("Loading")])
    LoadingPackage(model, _, _) | LoadingReadme(model, _, _) =>
      view(Success(model))
  } // ↑ to be changed
}

///|
fn main {
  @tea.startup(
    model=LoadingModuleInfo("moonbitlang/core"),
    update~,
    view~,
    initialize=LoadModuleInfo,
  )
  // @tea.startup(model=Menu, update~, view~)
}
