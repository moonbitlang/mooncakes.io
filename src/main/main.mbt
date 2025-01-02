///|
enum Message {
  ToggleSidebar
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
} derive(Show)

///|
const URL_BASE = "http://127.0.0.1:3000"

///|
struct ModelBody {
  now_path : String
  now_item : String
  sidebar : SidebarModel
  navbar : NavbarModel
  detail_cards : Array[DetailCardModel]
  meta_info : MetaInfoModel
}

///|
enum Model {
  Failure
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
                    navbar: { title: "🥮 mooncakes.io" },
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
                          name: model.meta_info.readme,
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
            if model.meta_info.readme != "" {
              @http.get(
                URL_BASE + "/" + url + "/" + model.meta_info.readme,
                expect=Text(Message::GotReadme),
              )
            } else {
              @tea.task(GotReadme(Ok("")))
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
                Success({ ..model, detail_cards: details }),
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
        ToggleSidebar =>
          (
            @tea.none(),
            Success({
              ..model,
              sidebar: { ..model.sidebar, hide: not(model.sidebar.hide) },
            }),
          )
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
              sidebar: { ..model.sidebar, cards_expanded: false },
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
            (@tea.none(), model_)
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

///| Todo: Adjust position
fn floating_view(cards_expanded : Bool) -> @html.Html[Message] {
  let button = if cards_expanded {
    icon_button_view("expansion.svg", text="Fold cards", click=FoldAllCards)
  } else {
    icon_button_view("reduction.svg", text="Expand cards", click=ExpandAllCards)
  }
  div(class="absolute top-4 right-4", [button])
}

///|
fn view(state : Model) -> @html.Html[Message] {
  match state {
    Failure => h1(class="text-gray-800 text-2xl", [text("Failure")])
    Success(model) =>
      div(class="flex flex-col", [
        div([navbar_view(model.navbar)]),
        div(class="flex w-screen", [
          div(class="w-1/4 p-3 min-w-[300px] max-w-[400px] border-r", [
            meta_info_view(model.meta_info),
            div(class="sticky top-[-1px] overflow-y-scroll h-screen", [
              sidebar_view(model.sidebar),
            ]),
          ]),
          div(class="flex-grow overflow-hidden bg-[#fcfcfd]", [
            detail_cards_view(model.detail_cards),
          ]),
        ]),
        div(class=" ", [footer_view()]),
      ])
    LoadingModuleIndex(_) | LoadingModuleInfo(_) =>
      h1(class="text-gray-800 text-2xl", [text("Loading")])
    LoadingPackage(model, _, _) | LoadingReadme(model, _, _) =>
      view(Success(model))
  }
}

///|
fn main {
  @tea.startup(
    model=LoadingModuleInfo("moonbitlang/core"),
    update~,
    view~,
    initialize=LoadModuleInfo,
  )
}
