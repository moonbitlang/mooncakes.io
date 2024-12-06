///|
enum Message {
  ToggleSidebar
  ToggleCardDetail(DetailCardModel)
  FoldAllCards
  ExpandAllCards
  ItemClick(PackageModel)
  FilterChange(String)
} derive(Show)

///|
struct Model {
  count : Int
  sidebar : SidebarModel
  navbar : NavbarModel
  detail_cards : Array[DetailCardModel]
  meta_info : MetaInfoModel
}

///|
fn update(msg : Message, model : Model) -> (@tea.Command[Message], Model) {
  match msg {
    ToggleSidebar =>
      (
        @tea.none(),
        { ..model, sidebar: { ..model.sidebar, hide: not(model.sidebar.hide) } },
      )
    ToggleCardDetail(card) => {
      card.toggle_folded()
      (@tea.none(), model)
    }
    FoldAllCards => {
      for card in model.detail_cards {
        card.toggle_folded()
      }
      (
        @tea.none(),
        { ..model, sidebar: { ..model.sidebar, cards_expanded: false } },
      )
    }
    ExpandAllCards => {
      for card in model.detail_cards {
        card.toggle_folded()
      }
      (
        @tea.none(),
        { ..model, sidebar: { ..model.sidebar, cards_expanded: false } },
      )
    }
    ItemClick(pkg_model) => {
      pkg_model.folded = not(pkg_model.folded)
      (@tea.none(), model)
    }
    FilterChange(value) => {
      model.sidebar.filter = value
      (@tea.none(), model)
    }
    msg => {
      println("Got message \{msg}")
      (@tea.none(), model)
    }
  }
}

///|
fn floating_view(cards_expanded : Bool) -> @html.Html[Message] {
  let button = if cards_expanded {
    icon_button_view("expansion.svg", text="Fold cards", click=FoldAllCards)
  } else {
    icon_button_view("reduction.svg", text="Expand cards", click=ExpandAllCards)
  }
  div(class="absolute bottom-4 left-4", [button])
}

///|
fn view(model : Model) -> @html.Html[Message] {
  div(class="flex flex-col", [
    div([navbar_view(model.navbar)]),
    div(class="flex w-screen", [
      div(class="w-1/4 p-3 min-w-[300px] max-w-[400px] border-r", [
        meta_info_view(model.meta_info),
        div(class="sticky top-[-1px] h-screen", [sidebar_view(model.sidebar)]),
      ]),
      div(class="flex-grow overflow-hidden bg-[#fcfcfd]", [
        detail_cards_view(model.detail_cards),
      ]),
    ]),
    div(class=" ", [footer_view()]),
  ])
}

///| NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  let (_, detail_cards) = process_pacakge_info(package_info)
  let readme_card = ReadmeCard(
    #| # Immutable Map
    #| 
    #| An immutable tree map based on size balanced tree.
    #| 
    #| # Usage
    #| 
    #| ## Create
    #| 
    #| You can create an empty map using `new()` or construct it with a single key-value pair using `singleton()`.
    #| 
    #| ```moonbit
    #| let map1 : @immut/sorted_map.T[String, Int] = @immut/sorted_map.new()
    #| let map2 = @immut/sorted_map.singleton("a", 1)
    #| ```
    #| 
    #| Also, you can construct it from an array using `of()` or `from_array()`.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| ```
    #| 
    #| ## Insert & Lookup
    #| 
    #| You can use `insert()` to add a key-value pair to the map and create a new map. Or use `lookup()` to get the value associated with a key.
    #| 
    #| ```moonbit
    #| let map : @immut/sorted_map.T[String,Int] = @immut/sorted_map.new()
    #| let map = map.insert("a", 1)
    #| println(map.lookup("a")) // Some(1)
    #| ```
    #| 
    #| ## Remove
    #| 
    #| You can use `remove()` to remove a key-value pair from the map.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| let map = map.remove("a")
    #| ```
    #| 
    #| ## Contains
    #| 
    #| You can use `contains()` to check whether a key exists.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| println(map.contains("a")) // true
    #| println(map.contains("d")) // false
    #| ```
    #| 
    #| > let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| > println(map.contains("a")) // true
    #| > println(map.contains("d")) // false
    #|
    #| ## Size
    #| 
    #| You can use `size()` to get the number of key-value pairs in the map.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| println(map.size()) // 3
    #| ```
    #| 
    #| Similarly, you can use `is_empty()` to check whether the map is empty.
    #| 
    #| ```moonbit
    #| let map : @immut/sorted_map.T[String, Int] = @immut/sorted_map.new()
    #| println(map.is_empty()) // true
    #| ```
    #| 
    #| ## Traversal
    #| 
    #| Use `each()` or `eachi()` to iterate through all key-value pairs.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| map.each(fn(k, v) { println("key:\{k}, value:\{v}") })
    #| map.eachi(fn(i, k, v) { println("index:\{i}, key:\{k}, value:\{v}") })
    #| ```
    #| 
    #| Use `map()` or `map_with_key()` to map a function over all values.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| let map = map.map(fn(v) { v + 1 })
    #| let map = map.map_with_key(fn(_k, v) { v + 1 })
    #| ```
    #| 
    #| Use `fold()` or `foldl_with_key()` to fold the values in the map. The default order of fold is Pre-order.
    #| Similarly, you can use `foldr_with_key()` to do a Post-order fold.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| map.fold(fn (acc, v) { acc + v }, ~init=0) // 6
    #| map.foldl_with_key(fn (acc, k, v) { acc + k + v.to_string() }, ~init="") // "a1b2c3"
    #| map.foldr_with_key(fn (acc, k, v) { acc + k + v.to_string() }, ~init="") // "c3b2a1"
    #| ```
    #| 
    #| Use `filter()` or `filter_with_key()` to filter all keys/values that satisfy the predicate.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| let map = map.filter(fn (v) { v > 1 })
    #| let map = map.filter_with_key(fn (k, v) { k > "a" && v > 1 })
    #| ```
    #| 
    #| ## Conversion
    #| 
    #| Use `elems()` to get all values in ascending order of their keys.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| let elems = map.elems() // [1, 2, 3]
    #| ```
    #| 
    #| Use `keys()` to get all keys of the map in ascending order.
    #| 
    #| ```moonbit
    #| let map = @immut/sorted_map.of([("a", 1), ("b", 2), ("c", 3)])
    #| let keys = map.keys() // ["a", "b", "c"]
    #| ```
    #| 
    #| 
    ,
    folded=false,
  )
  let detail_cards = [readme_card, ..detail_cards]
  let model = {
    count: 0,
    navbar: { title: "mooncakes.io" },
    detail_cards,
    meta_info: {
      name: "sorted_map",
      author: "yorkin",
      version: "0.1.1",
      repository: "github.com/yoorkin/prettyprinter",
      description: "a pretty printer for moonbit",
      keywords: ["util", "prettyprint", "doc"],
      license: "Apache",
      module_path: "yoorkin/prettyprinter",
    },
    sidebar: {
      cards_expanded: true,
      filter: "",
      module_path: "yorkin/prettyprint",
      hide: false,
      items: [
        {
          name: "lib",
          target: "lib",
          kind: Package({
            fullpath: "user/lib",
            folded: false,
            childrens: [
              {
                name: "main",
                target: "lib/hello",
                kind: Package({
                  fullpath: "user/lib/hello",
                  childrens: [
                    {
                      name: "function1",
                      target: "lib/main/function1",
                      kind: Function,
                    },
                    {
                      name: "trait1",
                      target: "lib/main/function1",
                      kind: Trait,
                    },
                    { name: "type1", target: "lib/main/function1", kind: Type },
                    {
                      name: "function2",
                      target: "lib/main/function2",
                      kind: Function,
                    },
                    { name: "type1", target: "lib/main/type1", kind: Type },
                  ],
                  folded: true,
                }),
              },
              {
                name: "function1",
                target: "lib/main/function1",
                kind: Function,
              },
              {
                name: "function2",
                target: "lib/main/function2",
                kind: Function,
              },
              { name: "type1", target: "lib/main/type1", kind: Type },
            ],
          }),
        },
        {
          name: "hello",
          target: "lib/hello",
          kind: Package({
            fullpath: "user/lib/hello",
            childrens: [
              {
                name: "function1",
                target: "lib/main/function1",
                kind: Function,
              },
              {
                name: "function2",
                target: "lib/main/function2",
                kind: Function,
              },
              { name: "type1", target: "lib/main/type1", kind: Type },
            ],
            folded: true,
          }),
        },
      ],
      dependencies: [],
    },
  }
  @tea.startup(model~, update~, view~)
}
