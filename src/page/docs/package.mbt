///|
enum Msg {
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ItemClick(String, String)
  PackageClick(PackageModel)
  GotResource(Result[Resource, String])
  GotModuleIndex(Result[ModuleIndex, String])
  GotPackageInfo(Result[Array[DetailCardModel], String])
  SidebarCategoryClicked(String)
}

///|
struct Model {
  module_path : String
  path : String
  sidebar : SidebarModel
  source_files : Array[String]
  detail_cards : Array[DetailCardModel]
  meta_info : @util.Status[MetaInfo]
  readme_content : @util.Status[String]
  module_index : @util.Status[ModuleIndex]
  showing_category : String
}

///|
pub fn load(path : String) -> (@tea.Command[Msg], Model) {
  (
    @http.get(
      @config.URL_BASE + "/docs/" + path + "/resource.json",
      expect=Json(Msg::GotResource, decode_resource),
    ),
    {
      module_path: path,
      path,
      sidebar: SidebarModel::empty(),
      detail_cards: [],
      meta_info: Loading,
      readme_content: Loading,
      source_files: [],
      showing_category: "Documentation",
      module_index: Loading,
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
                { ..model, source_files, },
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
                { ..model, source_files, meta_info: Success(meta_info) },
              )
          }
        }
        Err(_) =>
          (
            @tea.none(),
            {
              ..model,
              meta_info: Failed,
              source_files: [],
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
              sidebar: generate_sidebar_from_module_index(module_index),
              module_index: Success(module_index),
            }
          Err(_) =>
            { ..model, sidebar: SidebarModel::empty(), module_index: Failed }
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
    SidebarCategoryClicked(showing_category) =>
      (@tea.none(), { ..model, showing_category, })
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
  let version = match model.meta_info {
    Failed | Loading => ""
    Success(meta_info) => meta_info.version
  }
  // FIXME: improve style of source file lists, add hyperlink to source file
  // let source_files = match model.source_files {
  //   Failed | Loading => @html.nothing()
  //   Success(files) =>
  //     div(class="p-3 flex gap-3", files.map(fn(x) { div([text(x)]) }))
  // }
  // logo
  let logo = div(
    class="border-b h-full container flex items-center top-0 z-20 bg-white",
    [
      @html.a(class="border-gray-300 lg:border-r w-full", href="/", [
        h1(class="font-title text-gray-700 font-semibold mx-12", [
          text("🥮 mooncakes.io"),
        ]),
      ]),
    ],
  )
  let navbar = div(
    class="bg-white w-full h-full border-b select-none flex items-center gap-4 pl-12 top-0 z-10",
    [
      breadcrumbs(model.path, model.module_path),
      // version
      tag_view(version),
      div(class="flex-grow", []),
      @html.button(
        class="border rounded mx-2 py-1 px-2 lg:w-1/5 lg:shadow-sm text-gray-500 flex items-center gap-2",
        [
          @html.img(class="w-5 h-5", src=@config.SEARCH, []),
          div(class="hidden lg:block text-nowrap", [text("Quick search...")]),
        ],
      ),
    ],
  )
  let sidebar = div(class="pl-6 pr-3 py-3 w-full h-full", [
    div(class="overflow-y-scroll ", [
      sidebar(
        model.sidebar,
        model.source_files,
        model.showing_category,
        package_path=model.path,
      ),
    ]),
  ])
  let main = div(class="flex w-full min-h-full", [
    div(class="flex-grow overflow-y-auto w-screen bg-[#fcfcfd]", [
      if model.module_path == model.path {
        div(class="w-full", [meta_info(model.meta_info)])
      } else {
        @html.nothing()
      },
      readme,
      detail_cards_view(model.detail_cards),
    ]),
  ])
  // TODO: fix floating view
  let _floating_view = div([floating_view(model.sidebar)])
  div(
    class="grid grid-rows-[3em_3em_auto] grid-cols-1 lg:grid-rows-[3em_auto] lg:grid-cols-4 h-screen",
    [
      div(
        class="col-start-1 row-start-1 hidden lg:block lg:col-start-1 col-span-1 lg:row-start-1 row-span-1",
        [logo],
      ),
      div(
        class="col-start-1 row-start-1 lg:col-start-2 col-span-3 lg:row-start-1 row-span-1",
        [navbar],
      ),
      div(
        class="col-start-1 row-start-2 lg:col-start-1 col-span-1 lg:row-start-2 lg:row-span-2 border-r overflow-y-scroll scrollbar-thin scrollbar-thumb-gray-400 scrollbar-track-transparent",
        [sidebar],
      ),
      div(
        class="col-start-1 row-start-3 lg:col-start-2 lg:col-span-3 lg:row-start-2 lg:row-span-2 overflow-y-scroll scrollbar-thin scrollbar-thumb-gray-400 scrollbar-track-transparent",
        [main],
      ),
    ],
  )
}
