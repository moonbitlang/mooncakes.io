///|
enum Msg {
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ItemClick(String, String)
  PackageClick(PackageModel)
  FilterChange(String)
  GotResource(Result[Resource, String])
  GotModuleIndex(Result[ModuleIndex, String])
  GotPackageInfo(Result[Array[DetailCardModel], String])
}

///|
struct Model {
  module_path : String
  path : String
  sidebar : @util.Status[SidebarModel]
  detail_cards : Array[DetailCardModel]
  meta_info : @util.Status[MetaInfo]
  readme_content : @util.Status[String]
  source_files : @util.Status[Array[String]]
}

///|
pub fn load(path : String) -> (@tea.Command[Msg], Model) {
  (
    @http.get(
      @config.URL_BASE + "/docs/" + path + "/resource.json",
      expect=Json(Msg::GotResource, decode_resource),
    ),
    {
      module_path: "",
      path,
      sidebar: Loading,
      detail_cards: [],
      meta_info: Loading,
      readme_content: Loading,
      source_files: Loading,
    },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotResource(result) =>
      match result {
        Ok({ readme_content, kind }) => {
          let model = { ..model, readme_content: Success(readme_content) }
          match kind {
            Module({ module_index_path, meta_info }) =>
              (
                @http.get(
                  @config.URL_BASE + "/docs/" + module_index_path,
                  expect=Json(Msg::GotModuleIndex, parse_module_index),
                ),
                { ..model, meta_info: Success(meta_info) },
              )
            Package({ package_data_path, source_files }) =>
              (
                @http.get(
                  @config.URL_BASE + "/docs/" + package_data_path,
                  expect=Json(Msg::GotPackageInfo, process_package_info),
                ),
                { ..model, source_files: Success(source_files) },
              )
            ModuleAndPackage(
              { module_index_path, meta_info },
              { package_data_path, source_files }
            ) =>
              (
                @tea.batch([
                  @http.get(
                    @config.URL_BASE + "/docs/" + module_index_path,
                    expect=Json(Msg::GotModuleIndex, parse_module_index),
                  ),
                  @http.get(
                    @config.URL_BASE + "/docs/" + package_data_path,
                    expect=Json(Msg::GotPackageInfo, process_package_info),
                  ),
                ]),
                {
                  ..model,
                  source_files: Success(source_files),
                  meta_info: Success(meta_info),
                },
              )
          }
        }
        Err(_) =>
          (
            @tea.none(),
            {
              ..model,
              meta_info: Failed,
              source_files: Failed,
              readme_content: Failed,
            },
          )
      }
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
          Err(info) =>
            { ..model, detail_cards: [FailureCard(folded=false, info~)] }
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
      if path == model.path {
        (@browser.scroll_to(target), model)
      } else {
        (
          @http.get(
            @config.URL_BASE + "/docs/" + path + "/resource.json",
            expect=Json(Msg::GotResource, decode_resource),
          ),
          { ..model, path, detail_cards: [] },
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
fn breadcrumbs(path : String, module_path : String) -> @html.Html[Msg] {
  let paths = path.trim_start("/").split("/").collect()
  let mut acc_path = ""
  let elems = []
  for path in paths {
    acc_path += "/" + path
    let elem = if acc_path.starts_with(module_path) {
      @html.a(class="hover:underline", href="/docs" + acc_path, [text(path)])
    } else {
      div(class="text-gray-700 font-normal", [text(path)])
    }
    elems.push(elem)
  }
  let separator = div(class="text-gray-300 text-base", [text(" / ")])
  div(
    class="text-base text-gray-800 font-semibold flex gap-2",
    elems.iter().intersperse(separator).collect(),
  )
}

///|
pub fn view(model : Model) -> @html.Html[Msg] {
  // FIXME: improve style of readme file
  let readme = match model.readme_content {
    Failed => text("Failed to load README")
    Loading => text("Loading README...")
    Success(content) =>
      if content == "" {
        @html.nothing()
      } else {
        div(class="contents-center flex flex-col pl-6 p-4 pr-16 w-full gap-2", [
          card_view(ReadmeCard(content, folded=false)),
        ])
      }
  }
  // FIXME: improve style of source file lists, add hyperlink to source file
  let source_files = match model.source_files {
    Failed | Loading => @html.nothing()
    Success(files) =>
      div(class="p-3 flex gap-3", files.map(fn(x) { div([text(x)]) }))
  }
  div(
    class="flex flex-col overflow-scroll scrollbar-thin h-screen scrollbar-thumb-purple-300 scrollbar-track-transparent",
    [
      div(
        class="bg-white w-full py-3 border-b select-none flex gap-4 sticky top-0 z-10",
        [
          // logo
          @html.a(class="border-r w-[400px] border-gray-300", href="/", [
            h1(class="font-title text-gray-700 font-semibold ", [
              text("🥮 mooncakes.io"),
            ]),
          ]),
          breadcrumbs(model.path, model.module_path),
          // version
          tag_view("0.1.0"),
          // div(class="text-gray-600 border px-2 text-base rounded bg-slate-100", [text("0.1.0")]),
        ],
      ),
      div([floating_view(model.sidebar)]),
      div(class="flex w-full", [
        div(class="px-3 w-[400px] border-r", [
          div(
            class="sticky top-14 overflow-y-scroll max-h-screen scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
            [sidebar_view(model.sidebar)],
          ),
        ]),
        div(class="flex-grow overflow-y-auto w-screen bg-[#fcfcfd]", [
          div(class="w-full", [meta_info(model.meta_info)]),
          readme,
          detail_cards_view(model.detail_cards),
          source_files,
        ]),
      ]),
      @view.footer(),
    ],
  )
}
