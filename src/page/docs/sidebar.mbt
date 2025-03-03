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
  TypeAlias
} derive(Show)

///|
struct PackageModel {
  fullpath : String
  childrens : Array[ItemModel]
  mut folded : Bool
} derive(Show)

///|
struct SidebarModel {
  // module_path : String // FIXME
  hide : Bool
  items : Array[ItemModel]
  // dependencies : Array[ModuleModel] // FIXME
  cards_expanded : Bool
}

///|
fn SidebarModel::empty() -> SidebarModel {
  { hide: false, items: [], cards_expanded: false }
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
fn item_view(model : ItemModel) -> @html.Html[Msg] {
  let { name, target, kind } = model
  match kind {
    Type =>
      item_button(
        text(name),
        icon=@config.TYPE_ICON,
        click=ItemClick(target, name),
      )
    TypeAlias =>
      item_button(
        text(name),
        icon=@config.TYPE_ALIAS_ICON,
        click=ItemClick(target, name),
      )
    Value =>
      item_button(
        text(name),
        icon=@config.VALUE_ICON,
        click=ItemClick(target, name),
      )
    Trait =>
      item_button(
        text(name),
        icon=@config.TRAIT_ICON,
        click=ItemClick(target, name),
      )
    Package({ childrens, folded, .. } as pkg) => {
      let list = if folded {
        div([])
      } else {
        div(class="pl-4", childrens.map(fn(x) { item_view(x) }))
      }
      let icon = if folded { @config.FOLDER_CLOSE } else { @config.FOLDER_OPEN }
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
fn item_list_view(items : Array[ItemModel]) -> @html.Html[Msg] {
  @html.ul(class="select-none", items.map(fn(x) { item_view(x) }))
}

///|
fn sidebar_view(model : @util.Status[SidebarModel]) -> @html.Html[Msg] {
  match model {
    Failed => @html.nothing()
    Loading => @html.text("Loading...")
    Success(model) => {
      let hide = if model.hide { "hidden" } else { "" }
      let items = item_list_view(model.items)
      div([div(class="\{hide}", [div(class="text-gray-700", [items])])])
    }
  }
}
