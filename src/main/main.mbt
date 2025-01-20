///|
enum Message {
  ReturnToModuleReadme
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ClickModuleCard(String)
  ItemClick(String, String)
  PackageClick(PackageModel)
  FilterChange(String)
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
struct ModelBodyPackage {
  now_path : String
  sidebar : SidebarModel
  detail_cards : Array[DetailCardModel]
  meta_info : MetaInfoModel
}

///|
enum Model {
  Failure
  Menu(Map[String, MetaInfoModel])
  LoadingMenu
  LoadingModuleIndex(MetaInfoModel, String)
  LoadingReadme(ModelBodyPackage, String, Bool)
  LoadingPackage(ModelBodyPackage, String, String)
  Success(ModelBodyPackage)
}

///|
fn update(msg : Message, model_ : Model) -> (@tea.Command[Message], Model) {
  match model_ {
    Failure => (@tea.none(), model_)
    Menu(metas) =>
      match msg {
        ClickModuleCard(path) => {
          println(path)
          (
            @tea.task(LoadModuleIndex),
            LoadingModuleIndex(metas[path].unwrap(), path),
          )
        }
      }
    LoadingMenu =>
      match msg {
        LoadMenu =>
          (
            @http.get(
              URL_BASE + "/modules.json",
              expect=Json(Message::GotMenuInfo),
            ),
            model_,
          )
        GotMenuInfo(result) =>
          match result {
            Err(_) => (@tea.none(), Failure)
            Ok(r) => (@tea.none(), Menu(parse_metadata(r)))
          }
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
        ItemClick(path, target) =>{
          println(target)
          if path == model.now_path {
            (@browser.scroll_to(target), model_)
          } else {
            (@tea.task(LoadPackage), LoadingPackage(model, path, target))
          }
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
fn view(state : Model) -> @html.Html[Message] {
  match state {
    Menu(meta) => view_menu(meta)
    Success(model) => view_package(model)
    Failure => h1(class="text-gray-800 text-2xl", [text("Failure")])
    LoadingMenu(_) | LoadingModuleIndex(_) =>
      h1(class="text-gray-800 text-2xl", [text("Loading")])
    LoadingPackage(model, _, _) | LoadingReadme(model, _, _) =>
      view(Success(model))
  } // ↑ to be changed
}

///|
fn load(url : @url.Url) -> (@tea.Command[Message], Model) {
  (@tea.task(LoadMenu), LoadingMenu)
}

///|
fn main {
  @tea.application(initialize=load, update~, view~)
}
