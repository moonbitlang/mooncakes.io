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
fn documentation_list(items : Array[ItemModel]) -> @html.Html[Msg] {
  @html.ul(class="select-none", items.map(fn(x) { item_view(x) }))
}

///|
fn source_list(
  files : Array[String],
  package_path~ : String
) -> @html.Html[Msg] {
  if files.is_empty() {
    return text("No source files.")
  }
  div(class="", [
    @html.ul(
      files.map(fn(x) {
        item_button(
          @html.a(
            class="w-full",
            href="\{@config.URL_BASE}/docs/\{package_path}/\{x}.html",
            [text(x)],
          ),
        )
      }),
    ),
  ])
}

///|
fn sidebar(
  document_index : Array[ItemModel],
  source_files : Array[String],
  showing : String,
  package_path~ : String
) -> @html.Html[Msg] {
  @view.accordion(
    class="text-gray-700 flex flex-col",
    click=Msg::SidebarCategoryClicked,
    showing,
    [
      ("Documentation", documentation_list(document_index)),
      ("Source files", source_list(source_files, package_path~)),
    ],
  )
}
