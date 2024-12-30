///|
enum Message {
  SwitchElement(String)
  ToggleSidebar
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ItemClick(PackageModel)
  FilterChange(String)
  LoadModuleInfo
  GotModuleInfo(Result[Json, String])
  LoadModuleIndex
  GotModuleIndex(Result[Json, String])
  LoadReadme
  GotReadme(Result[String, String])
  LoadPackage
  GotPackageInfo(Result[Json, String])
  LoadPackageReadme(String)
  GotPackageReadme(Result[String, String])
} derive(Show)

///|
struct ModelBody {
  sidebar : SidebarModel
  navbar : NavbarModel
  detail_cards : Array[DetailCardModel]
  meta_info : MetaInfoModel
  module_index : ModuleIndex
}

///|
enum Model {
  Failure
  LoadingModuleInfo(String)
  LoadingModuleIndex(MetaInfoModel, String)
  LoadingReadme(SidebarModel, MetaInfoModel, ModuleIndex, String)
  LoadingPackage(ModelBody, String, String)
  LoadingPackageReadme(ModelBody, String, String)
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
              url + "/moon.mod.json",
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
            Ok(index) => {
              let index = parse_module_index(index)
              (
                @tea.task(LoadReadme),
                LoadingReadme(
                  generate_sidebar_from_module_index(index),
                  meta,
                  index,
                  url,
                ),
              )
            }
          }
        LoadModuleIndex =>
          (
            @http.get(
              url + "/module_index.json",
              expect=Json(Message::GotModuleIndex),
            ),
            model_,
          )
      }
    LoadingReadme(sidebar, meta, index, url) =>
      match msg {
        GotReadme(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(r) =>
              (
                @tea.none(),
                Success({
                  sidebar,
                  meta_info: meta,
                  module_index: index,
                  navbar: { title: "🥮 mooncakes.io" },
                  detail_cards: [ReadmeCard(folded=false, r)],
                }),
              )
          }
        LoadReadme =>
          (
            if meta.readme != "" {
              @http.get(
                url + "/" + meta.readme,
                expect=Text(Message::GotReadme),
              )
            } else {
              @tea.task(GotReadme(Ok("")))
            },
            model_,
          )
      }
    LoadingPackage(model, url, path) =>
      match msg {
        GotPackageInfo(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(result) => {
              let (readme, details) = process_pacakge_info(result)
              if readme != "" {
                (
                  @tea.task(LoadPackageReadme(readme)),
                  LoadingPackageReadme(
                    { ..model, detail_cards: details },
                    url,
                    path,
                  ),
                )
              } else {
                (@tea.none(), Success({ ..model, detail_cards: details }))
              }
            }
          }
        LoadPackage =>
          (@http.get(url, expect=Json(Message::GotPackageInfo)), model_)
      }
    LoadingPackageReadme(model, url, path) =>
      match msg {
        GotPackageReadme(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(result) =>
              (
                @tea.none(),
                Success({
                  ..model,
                  detail_cards: [ReadmeCard(result, folded=false)] +
                  model.detail_cards,
                }),
              )
          }
        LoadPackageReadme(readme) =>
          (
            @http.get(
              "\{url}/\{path}/\{readme}",
              expect=Text(Message::GotPackageReadme),
            ),
            model_,
          )
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
        ItemClick(pkg_model) => {
          pkg_model.folded = not(pkg_model.folded)
          (@tea.none(), model_)
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
    _ => h1(class="text-gray-800 text-2xl", [text("Loading")])
  }
}

///| NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  @tea.startup(
    model=LoadingModuleInfo("http://127.0.0.1:3000"),
    update~,
    view~,
    initialize=LoadModuleInfo,
  )
}
