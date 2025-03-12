///|
enum Msg {
  ToggleCardDetail(String)
  CardModeChanged(CardMode)
  GotResource(Result[Resource, String])
  GotModuleIndex(Result[ModuleIndex, String])
  GotPackageData(Result[PackageData, String])
  SidebarCategoryClicked(String)
  ToggleSidebarItem(ItemTarget)
  ClickSidebarItem(ItemTarget)
}

///|
struct Model {
  module_path : @util.Status[String]
  path : String
  module_index : @util.Status[ModuleIndex]
  document_index : Array[@tree.Tree[ItemTarget]]
  source_files : Array[String]
  package_data : @util.Status[PackageData]
  meta_info : @util.Status[MetaInfo]
  readme_content : String?
  showing_category : String
  folded_items : FoldedState
  folded_sidebar_items : @immut/sorted_set.T[ItemTarget]
}

///|
pub fn load(path : String) -> (@tea.Command[Msg], Model) {
  (
    @http.get(
      @config.URL_BASE + "/api/" + path.trim("/") + "/resource.json",
      expect=Json(Msg::GotResource, decode_resource),
    ),
    {
      module_path: Loading,
      module_index: Loading,
      path,
      document_index: [],
      meta_info: Loading,
      readme_content: None,
      source_files: [],
      showing_category: "Documentation",
      package_data: Loading,
      folded_items: FoldedState::new(),
      folded_sidebar_items: @immut/sorted_set.new(),
    },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotResource(result) =>
      match result {
        Ok({ readme_content, kind }) => {
          let model = { ..model, readme_content: Some(readme_content) }
          match kind {
            Module({ module_index_path, meta_info }) =>
              (
                @http.get(
                  @config.URL_BASE + "/api/" + module_index_path,
                  expect=Json(Msg::GotModuleIndex, decode_module_index),
                ),
                {
                  ..model,
                  meta_info: Success(meta_info),
                  module_path: Success(model.path),
                },
              )
            Package({ package_data_path, source_files, module_path }) =>
              (
                batch([
                  @http.get(
                    @config.URL_BASE + "/api/" + package_data_path,
                    expect=Json(Msg::GotPackageData, decode_package_data),
                  ),
                  @http.get(
                    @config.URL_BASE +
                    "/api/" +
                    module_path +
                    "/module_index.json",
                    expect=Json(Msg::GotModuleIndex, decode_module_index),
                  ),
                ]),
                { ..model, source_files, module_path: Success(module_path) },
              )
            RootPackage(
              { module_index_path, meta_info, package_data_path, source_files }
            ) =>
              (
                @tea.batch([
                  @http.get(
                    @config.URL_BASE + "/api/" + module_index_path,
                    expect=Json(Msg::GotModuleIndex, decode_module_index),
                  ),
                  @http.get(
                    @config.URL_BASE + "/api/" + package_data_path,
                    expect=Json(Msg::GotPackageData, decode_package_data),
                  ),
                ]),
                {
                  ..model,
                  source_files,
                  meta_info: Success(meta_info),
                  module_path: Success(model.path),
                },
              )
          }
        }
        Err(msg) => {
          println(msg)
          (
            none(),
            {
              ..model,
              meta_info: Failed,
              source_files: [],
              readme_content: None,
            },
          )
        }
      }
    GotModuleIndex(result) =>
      (
        none(),
        match result {
          Ok(module_index) => {
            let document_index = module_index._
              .find_node(model.path)
              .unwrap()
              .to_document_items()
            { ..model, document_index, module_index: Success(module_index) }
          }
          Err(msg) => {
            println(msg)
            { ..model, module_index: Failed }
          }
        },
      )
    GotPackageData(result) =>
      (
        none(),
        match result {
          Ok(package_data) => { ..model, package_data: Success(package_data) }
          Err(_) => { ..model, package_data: Failed }
        },
      )
    ToggleCardDetail(id) => {
      let folded_items = if model.folded_items.contains(id) {
        model.folded_items.remove(id)
      } else {
        model.folded_items.add(id)
      }
      (none(), { ..model, folded_items, })
    }
    CardModeChanged(card_mode) =>
      (
        none(),
        { ..model, folded_items: model.folded_items.set_mode(card_mode) },
      )
    SidebarCategoryClicked(showing_category) =>
      (none(), { ..model, showing_category, })
    ToggleSidebarItem(id) => {
      let folded_sidebar_items = if model.folded_sidebar_items.contains(id) {
        model.folded_sidebar_items.remove(id)
      } else {
        model.folded_sidebar_items.add(id)
      }
      (none(), { ..model, folded_sidebar_items, })
    }
    ClickSidebarItem(id) =>
      match id {
        Package(path) =>
          (@browser.push_url("/docs/" + path), { ..model, path, })
        Symbol(id) => (@browser.scroll_to(id), model)
        Section(id) => (@browser.scroll_to(id), model)
      }
  }
}

///|
fn breadcrumbs(
  path : String,
  module_path : String,
  module_index : ModuleIndex
) -> @html.Html[Msg] {
  let module_path = module_path.trim("/")
  let path = path.trim("/")
  let paths = path.trim_start("/").split("/").collect()
  println("\{module_path}, \{path}")
  let mut acc_path = ""
  let elems = []
  for path in paths {
    acc_path += if acc_path == "" { path } else { "/" + path }
    let elem = if acc_path.starts_with(module_path) &&
      module_index._.find_node(acc_path) is Some(node) &&
      (acc_path == module_path || not(node.package.is_empty())) {
      a(class="hover:underline", href="/docs/" + acc_path, [text(path)])
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
fn logo() -> @html.T[Msg] {
  div(class="w-full h-full flex justify-end border-b bg-white top-0 z-20", [
    div(class="h-full flex items-center w-full 2xl:w-2/3", [
      a(class="border-gray-300 lg:border-r w-full", href="/", [
        h1(class="font-title text-gray-700 font-semibold mx-12", [
          text("🥮 mooncakes.io"),
        ]),
      ]),
    ]),
  ])
}

///|
fn navbar(
  path : String,
  module_path : String,
  version : String,
  module_index : ModuleIndex,
  card_mode : CardMode
) -> @html.T[Msg] {
  div(
    class="bg-white w-full h-full border-b select-none flex items-center gap-4 pl-12 top-0 z-10",
    [
      breadcrumbs(path, module_path, module_index),
      // version
      tag_view(version),
      div(class="flex-grow", []),
      card_mode_toggle(mode=card_mode, click=Msg::CardModeChanged),
      button(
        class="border rounded mx-2 py-1 px-2 lg:w-1/5 lg:shadow-sm text-gray-500 flex items-center gap-2",
        [
          img(class="w-5 h-5", src=@config.SEARCH, []),
          div(class="hidden lg:block text-nowrap", [text("Quick search...")]),
        ],
      ),
    ],
  )
}

///|
pub fn view(model : Model) -> @html.Html[Msg] {
  let (navbar, sidebar, main) = match
    (model.module_path, model.module_index, model.meta_info) {
    (Success(module_path), Success(module_index), Success(meta)) => {
      let navbar = navbar(
        model.path,
        module_path,
        meta.version,
        module_index,
        model.folded_items.card_mode,
      )
      let sidebar = div(class="w-full h-full flex justify-end", [
        div(class="pl-6 pr-3 py-3 overflow-y-scroll w-full 2xl:w-2/3", [
          sidebar(
            model.document_index,
            model.source_files,
            model.showing_category,
            model.folded_sidebar_items,
            package_path=model.path,
          ),
        ]),
      ])
      let metainfo = div(class="w-full", [meta_info(meta)])
      let main = div(
        class="flex w-full min-h-full bg-[#fcfcfd] justify-begin",
        [
          div(class="overflow-y-auto 2xl:w-4/5", [
            metainfo,
            document(
              readme_content?=model.readme_content,
              package_data=model.package_data,
              folded=model.folded_items,
            ),
          ]),
        ],
      )
      (navbar, sidebar, main)
    }
    (Failed, _, _) | (_, Failed, _) | (_, _, Failed) => {
      let path = model.path.trim("/")
      let load_failed = div(
        class="flex flex-col items-center justify-center h-full w-full",
        [
          pre([code([text(@config.dead_rabbit)])]),
          div(class="text-gray-900 m-10", [
            h1(class="text-base text-lg mb-2 font-semibold text-center", [
              text("Document for \{path} not available"),
            ]),
            ul(class="list-disc text-gray-600", [
              @html.li([
                text(
                  "The package may be outdated and we cannot build document for it.",
                ),
              ]),
              @html.li([
                text(
                  "It also could be an error in mooncakes.io, please report it to us.",
                ),
              ]),
            ]),
          ]),
        ],
      )
      (div(class="border-b h-full w-full", []), nothing(), load_failed)
    }
    _ => (div(class="border-b h-full w-full", []), nothing(), @view.loading())
  }
  div(
    class="grid grid-rows-[3em_3em_auto] grid-cols-1 lg:grid-rows-[3em_auto] lg:grid-cols-4 h-screen",
    [
      div(
        class="col-start-1 row-start-1 hidden lg:block lg:col-start-1 col-span-1 lg:row-start-1 row-span-1",
        [logo()],
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
