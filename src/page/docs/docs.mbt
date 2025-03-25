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
  focus_to : String
  path : String
  resource : @util.Status[Resource]
  module_index : @util.Status[ModuleIndex]
  package_data : @util.Status[PackageData]
  document_index : Array[@tree.Tree[ItemTarget]]
  showing_category : String
  folded_items : FoldedState
  folded_sidebar_items : @immut/sorted_set.T[ItemTarget]
}

///|
pub fn load(path : String, fragment : String?) -> (@tea.Command[Msg], Model) {
  println(fragment)
  (
    @http.get(
      @config.URL_BASE + "/api/" + path.trim("/") + "/resource.json",
      expect=Json(Msg::GotResource, decode_resource),
    ),
    {
      module_index: Loading,
      focus_to: fragment.or(""),
      path,
      document_index: [],
      showing_category: "Documentation",
      package_data: Loading,
      folded_items: FoldedState::new(),
      folded_sidebar_items: @immut/sorted_set.new(),
      resource: Loading,
    },
  )
}

///|
pub fn update(msg : Msg, model : Model) -> (@tea.Command[Msg], Model) {
  match msg {
    GotResource(result) =>
      match result {
        Ok({ kind, .. } as resource) => {
          let cmd = match kind {
            Module({ module_index_path, .. }) =>
              @http.get(
                @config.URL_BASE + "/api/" + module_index_path,
                expect=Json(Msg::GotModuleIndex, decode_module_index),
              )
            Package({ package_data_path, module_path, .. }) =>
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
              ])
            RootPackage({ module_index_path, package_data_path, .. }) =>
              batch([
                @http.get(
                  @config.URL_BASE + "/api/" + module_index_path,
                  expect=Json(Msg::GotModuleIndex, decode_module_index),
                ),
                @http.get(
                  @config.URL_BASE + "/api/" + package_data_path,
                  expect=Json(Msg::GotPackageData, decode_package_data),
                ),
              ])
          }
          (cmd, { ..model, resource: Success(resource) })
        }
        Err(msg) => {
          println(msg)
          (none(), { ..model, resource: Failed })
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
    GotPackageData(result) => {
      let model = match result {
        Ok(package_data) => { ..model, package_data: Success(package_data) }
        Err(_) => { ..model, package_data: Failed }
      }
      (@browser.scroll_to(model.focus_to), model)
    }
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
        Symbol(id) => {
          println("scrolling to \{id}")
          (@browser.scroll_to(id), model)
        }
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
  version : String?,
  module_index : ModuleIndex,
  card_mode : CardMode
) -> @html.T[Msg] {
  div(
    class="bg-white w-full h-full border-b select-none flex items-center gap-4 pl-12 top-0 z-10",
    [
      breadcrumbs(path, module_path, module_index),
      // version
      if version is Some(value) {
        tag_view(value)
      } else {
        nothing()
      },
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
  let navbar = match (model.module_index, model.resource) {
    (Success(module_index), Success(resource)) => {
      let (module_path, version) = match resource.kind {
        Module({ meta_info, .. }) =>
          (Some(meta_info.name), Some(meta_info.version))
        Package({ module_path, .. }) => (Some(module_path), None)
        _ => (None, None)
      }
      navbar(
        model.path,
        module_path.or(""),
        version,
        module_index,
        model.folded_items.card_mode,
      )
    }
    _ => @html.nothing()
  }
  let source_files = match model.resource {
    Success(
      {
        kind: Package({ source_files, .. })
        | RootPackage({ source_files, .. }),
        ..,
      }
    ) => source_files
    _ => []
  }
  let sidebar = div(class="w-full h-full flex justify-end", [
    div(class="pl-6 pr-3 py-3 overflow-y-scroll w-full 2xl:w-2/3", [
      sidebar(
        model.document_index,
        source_files,
        model.showing_category,
        model.folded_sidebar_items,
        package_path=model.path,
      ),
    ]),
  ])
  let main = match model.resource {
    Success({ readme_content, kind }) => {
      let meta = match kind {
        Module({ meta_info: meta, .. })
        | RootPackage({ meta_info: meta, .. }) => meta_info(meta)
        Package(_) => @html.nothing()
      }
      div(class="flex w-full min-h-full bg-[#fcfcfd] justify-begin", [
        div(class="overflow-y-auto 2xl:w-4/5", [
          meta,
          document(
            readme_content~,
            package_data=model.package_data,
            folded=model.folded_items,
          ),
        ]),
      ])
    }
    Failed => @view.document_not_available(model.path)
    Loading => @view.loading()
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
