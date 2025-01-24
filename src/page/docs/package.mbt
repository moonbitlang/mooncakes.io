///|
enum Msg {
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ItemClick(String, String)
  PackageClick(PackageModel)
  FilterChange(String)
  GotMetaInfo(Result[@meta.MetaInfoModel, String])
  GotModuleIndex(Result[ModuleIndex, String])
  GotPackageInfo(Result[Array[DetailCardModel], String])
}

///|
struct Model {
  now_path : String
  sidebar : @util.Status[SidebarModel]
  detail_cards : Array[DetailCardModel]
  meta_info : @util.Status[@meta.MetaInfoModel]
}

///|
fn Model::empty() -> Model {
  { now_path: "", sidebar: Loading, detail_cards: [], meta_info: Loading }
}

///|
pub fn load(path : String) -> (@tea.Command[Msg], Model) {
  (
    @tea.batch([
      @http.get(
        @config.URL_BASE + "/docs/" + path + "/moon.mod.json",
        expect=Json(Msg::GotMetaInfo, parse_metadata),
      ),
      @http.get(
        @config.URL_BASE + "/docs/" + path + "/module_index.json",
        expect=Json(Msg::GotModuleIndex, parse_module_index),
      ),
    ]),
    Model::empty(),
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotMetaInfo(result) =>
      (
        @tea.none(),
        match result {
          Ok(meta_info) => { ..model, meta_info: Success(meta_info) }
          Err(_) => { ..model, meta_info: Failed }
        },
      )
    GotModuleIndex(result) =>
      (
        @tea.none(),
        match result {
          Ok(module_index) =>
            {
              ..model,
              sidebar: Success(generate_sidebar_from_module_index(module_index)),
            }
          Err(_) => { ..model, sidebar: Failed }
        },
      )
    GotPackageInfo(result) =>
      (
        @tea.none(),
        match result {
          Ok(package_info) => // FIXME: clean up detail_cards
            { ..model, detail_cards: [..model.detail_cards, ..package_info] }
          Err(_) => // FIXME: handle error correctly
            { ..model, detail_cards: [..model.detail_cards] }
        },
      )
    ToggleCardDetail(detail_card) => {
      detail_card.toggle_folded() // FIXME: fix this bug
      (@tea.none(), model)
    }
    FoldAllCards => {
      for card in model.detail_cards {
        card.toggle_folded()
      }
      (@tea.none(), model)
    }
    ExpandAllCards => {
      for card in model.detail_cards {
        card.toggle_folded()
      }
      (@tea.none(), model)
    }
    PackageClick(pkg_model) => {
      pkg_model.folded = not(pkg_model.folded)
      (@tea.none(), model)
    }
    ItemClick(path, target) =>
      if path == model.now_path {
        (@browser.scroll_to(target), model)
      } else {
        (
          @http.get(
            @config.URL_BASE + "/docs/" + path + "/package_data.json",
            expect=Json(Msg::GotPackageInfo, process_package_info),
          ),
          { ..model, now_path: path, detail_cards: [] },
        )
      }
    FilterChange(value) => {
      guard let Success(sidebar) = model.sidebar
      sidebar.filter = value
      (@tea.none(), model)
    }
  }
}

///|
pub fn view(model : Model) -> @html.Html[Msg] {
  div(
    class="flex flex-col overflow-scroll scrollbar-thin h-screen scrollbar-thumb-purple-300 scrollbar-track-transparent",
    [
      div([@view.navbar()]),
      div([floating_view(model.sidebar)]),
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
      @view.footer(),
    ],
  )
}
