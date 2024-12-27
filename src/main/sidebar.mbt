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
  cards_expanded : Bool
}

///|
fn sidebar_update(
  msg : Message,
  model : SidebarModel
) -> (@tea.Command[Message], SidebarModel) {
  match msg {

  }
  (@tea.none(), model)
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
fn item_view(model : ItemModel, filter~ : String) -> @html.Html[Message] {
  let { name, target, kind } = model
  match kind {
    Type => item_button(text(name), icon="type.svg")
    TypeAlias => item_button(text(name), icon="code-brackets.svg")
    Value => item_button(text(name), icon="code-brackets.svg")
    Trait => item_button(text(name), icon="components.svg")
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
      let icon = if folded { "folder-close.svg" } else { "folder-open.svg" }
      @html.ul([
        div(class="inline-block w-full", [
          item_button(text(name), icon~, click=ItemClick(pkg)),
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
) -> @html.Html[Message] {
  @html.ul(items.map(fn(x) { item_view(x, filter~) }))
}

///|
fn filter_input_view(value : String) -> @html.Html[Message] {
  let icon = if value == "" {
    @html.img(class="size-[16px] self-center mr-2", src="filter.svg", [])
  } else {
    div([])
  }
  div(class="p-1 px-2 my-2 rounded border flex", [
    icon,
    @html.input(
      class="w-full outline-none ",
      input_type=Text,
      placeholder="Filter",
      change=Message::FilterChange,
      value~,
    ),
  ])
}

///|
fn sidebar_view(model : SidebarModel) -> @html.Html[Message] {
  let hide = if model.hide { "hidden" } else { "" }
  let items = item_list_view(model.items, filter=model.filter)
  div(
    // class="sticky top-0 h-screen",
    [
      div(class="pt-1 border-t \{hide}", [
        filter_input_view(model.filter),
        div(class="text-gray-700", [items]),
      ]),
      floating_view(model.cards_expanded),
    ],
  )
  // div(
  //   class="p-3 top-0",
  //   [
  //     meta_info_view(model.meta_info),
  //   ],
  // )
}
