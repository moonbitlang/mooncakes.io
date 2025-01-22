///|
struct ItemModel {
  name : String
  target : String
  kind : ItemKind
} derive(Show)

///|
enum ItemKind {
  Package(PackageModel)
  Value
  Type
  Trait
  Readme
  ModuleReadme
  TypeAlias
} derive(Show)

///|
struct PackageModel {
  fullpath : String
  childrens : Array[ItemModel]
  mut folded : Bool
} derive(Show)

///|
struct ModuleModel {
  fullpath : String
}

///|
struct SidebarModel {
  module_path : String
  hide : Bool
  items : Array[ItemModel]
  dependencies : Array[ModuleModel]
  mut filter : String
  mut readme:Bool
  cards_expanded : Bool
}

fn SidebarModel::empty() -> SidebarModel {
  {
    module_path: "",
    hide: false,
    items: [],
    dependencies: [],
    filter: "",
    readme: false,
    cards_expanded: false,
  }
}

///|
fn item_button[M](
  childrens : @html.Html[M],
  icon? : String,
  click? : M
) -> @html.Html[M] {
  let icon = match icon {
    None => div([])
    Some(src) =>
      div(class="size-[12px] self-center mr-1", [@html.img(src~, [])])
  }
  div(class="hover:bg-gray-100 px-2 py-1 rounded text-sm flex", click?, [
    icon, childrens,
  ])
}

///|
fn item_view(model : ItemModel, filter~ : String) -> @html.Html[Msg] {
  let { name, target, kind } = model
  match kind {
    ModuleReadme =>
      item_button(text(name), icon=@constants.README_ICON, click=ReturnToModuleReadme)
    Readme =>
      item_button(text(name), icon=@constants.README_ICON, click=ItemClick(target, name))
    Type =>
      item_button(text(name), icon=@constants.TYPE_ICON, click=ItemClick(target, name))
    TypeAlias =>
      item_button(
        text(name),
        icon=@constants.TYPE_ALIAS_ICON,
        click=ItemClick(target, name),
      )
    Value =>
      item_button(text(name), icon=@constants.VALUE_ICON, click=ItemClick(target, name))
    Trait =>
      item_button(text(name), icon=@constants.TRAIT_ICON, click=ItemClick(target, name))
    Package({ childrens, folded, .. } as pkg) => {
      let childrens = if filter == "" {
        childrens
      } else {
        childrens.filter(fn(x) { x.name.contains(filter) })
      }
      let list = if folded {
        div([])
      } else {
        div(class="pl-4", childrens.map(fn(x) { item_view(x, filter~) }))
      }
      let icon = if folded { @constants.FOLDER_CLOSE } else { @constants.FOLDER_OPEN }
      @html.ul([
        div(class="inline-block w-full", [
          item_button(text(name), icon~, click=PackageClick(pkg)),
        ]),
        list,
      ])
    }
  }
}

///|
fn item_list_view(
  items : Array[ItemModel],
  filter~ : String
) -> @html.Html[Msg] {
  @html.ul(items.map(fn(x) { item_view(x, filter~) }))
}

///|
fn filter_input_view(value : String) -> @html.Html[Msg] {
  let icon = if value == "" {
    @html.img(class="size-[16px] self-center mr-2", src=@constants.FILTER, [])
  } else {
    div([])
  }
  div(class="p-1 px-2 my-2 rounded border flex", [
    icon,
    @html.input(
      class="w-full outline-none ",
      input_type=Text,
      placeholder="Filter",
      change=Msg::FilterChange,
      value~,
    ),
  ])
}

///|
fn sidebar_view(model : @load.QueuedLoading[SidebarModel, Array[ItemModel]]) -> @html.Html[Msg] {
  match model {
    Failed => @html.nothing()
    Loading(_) => @html.text("Loading...")
    Success(model) => {
      let hide = if model.hide { "hidden" } else { "" }
      let items = item_list_view(model.items, filter=model.filter)
      div(
        [
          div(class="pt-1 border-t \{hide}", [
            filter_input_view(model.filter),
            div(class="text-gray-700", [items]),
          ]),
        ],
      )
    }
  }
}
