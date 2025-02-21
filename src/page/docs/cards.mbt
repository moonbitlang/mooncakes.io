///|
/// Todo: remove the mutability of folded
enum DetailCardModel {
  ValueCard(
    name~ : String,
    signature~ : String,
    description~ : String,
    id~ : Int
  )
  ImplCard(
    name~ : String,
    signature~ : String,
    description~ : String,
    id~ : Int
  )
  TypeCard(
    name~ : String,
    signature~ : String,
    description~ : String,
    methods~ : Array[DetailCardModel],
    impls~ : Array[DetailCardModel],
    id~ : Int
  )
  TraitCard(
    name~ : String,
    signature~ : String,
    description~ : String,
    impls~ : Array[DetailCardModel],
    id~ : Int
  )
  FailureCard(info~ : String, id~ : Int)
  ReadmeCard(String, id~ : Int)
} derive(Show)

///|
fn card_section_view(
  card : DetailCardModel,
  fold_set : @immut/hashset.T[Int]
) -> @html.Html[Msg] {
  let fold_button = div(
    click=ToggleCardDetail(card),
    class="w-full h-full flex",
    [
      @html.img(
        src=if card.is_folded(fold_set) {
          @config.SECTION_CLOSE
        } else {
          @config.SECTION_OPEN
        },
        class="group-hover:opacity-100 opacity-0 transition-opacity duration-100 ",
        [],
      ),
    ],
  )

  // visibility of the detail section
  let detail_visibility = if card.is_folded(fold_set) {
    "h-0 overflow-hidden opacity-0"
  } else {
    "visible"
  }

  // signature 
  fn signature_view(code, name) {
    let code_view = @html.pre([
      @html.code(id=name, class="font-mono text-[0.9em] text-blue-800", [
        @view.code_block(code),
      ]),
    ])
    div([
      div(
        class="my-2 flex-grow overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
        [code_view],
      ),
    ])
  }

  let header = match card {
    ReadmeCard(_, ..) =>
      p(id="README", class="text-sm font-bold py-2 text-gray-600 self-center", [
        text("README"),
      ])
    FailureCard(_) =>
      p(class="text-sm font-bold py-2 text-red-500 self-center", [
        text("Package Info Parser Failed"),
      ])
    ValueCard(signature~, name~, ..)
    | ImplCard(signature~, name~, ..)
    | TypeCard(signature~, name~, ..)
    | TraitCard(signature~, name~, ..) => signature_view(signature, name)
  }

  // tool buttons
  let tool_buttons = match card {
    ReadmeCard(_, ..) => []
    _ => [@view.button("source"), @view.icon_button(@config.SHARE)]
  }
  // description
  let (description, foldable) = match card {
    TypeCard(description~, ..)
    | ValueCard(description~, ..)
    | ImplCard(description~, ..)
    | TraitCard(description~, ..) =>
      if description == "" {
        (@html.nothing(), @html.nothing())
      } else {
        (
          div(class="col-start-2 col-span-2 row-start-3 \{detail_visibility}", [
            div(class="mr-4 mb-6 pt-1", [@view.markdown(description)]),
          ]),
          div(class="col-start-1 row-start-1 max-h-10", [fold_button]),
        )
      }
    FailureCard(info~, ..) =>
      (
        div(class="col-start-2 col-span-2 row-start-3 \{detail_visibility}", [
          div(class="mr-4 mb-6 text-red-500", [text(info)]),
        ]),
        div(class="col-start-1 row-start-1 max-h-10", [fold_button]),
      )
    ReadmeCard(description, ..) =>
      (
        div(class="col-start-2 col-span-2 row-start-3 \{detail_visibility}", [
          div(class="mr-4 mb-6", [@view.markdown(description)]),
        ]),
        div(class="col-start-1 row-start-1 max-h-10", [fold_button]),
      )
  }

  // methods or impls
  let subsections = match card {
    TypeCard(methods~, impls~, ..) => {
      let methods = methods.map(fn(x) { card_section_view(x, fold_set) })
      let impls = impls.map(fn(x) { card_section_view(x, fold_set) })
      [..methods, ..impls]
    }
    TraitCard(impls~, ..) => impls.map(fn(x) { card_section_view(x, fold_set) })
    _ => []
  }

  // main view
  div(
    [
      div(
        class="grid grid-cols-[1.5em_auto_6em] grid-rows-[auto_auto] group ",
        [
          foldable,
          div(
            class="col-start-2 row-start-1 overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
            [header],
          ),
          div(
            class="col-start-3 row-start-1 max-h-10 flex items-center group-hover:opacity-100 opacity-0 transition-opacity duration-100 ",
            tool_buttons,
          ),
          description,
        ],
      ),
      ..subsections.map(fn(x) {
        div(class="col-start-1 col-span-3 border-t", [x])
      }),
    ],
  )
}

///|
fn card_view(
  card : DetailCardModel,
  fold_set : @immut/hashset.T[Int]
) -> @html.Html[Msg] {
  match card {
    ReadmeCard(_, ..) => div([card_section_view(card, fold_set)])
    _ =>
      div(class="border rounded overflow-clip bg-white", [
        card_section_view(card, fold_set),
      ])
  }
}

///|
fn get_id(self : DetailCardModel) -> Int {
  match self {
    ValueCard(id~, ..) => id
    ImplCard(id~, ..) => id
    TypeCard(id~, ..) => id
    TraitCard(id~, ..) => id
    FailureCard(id~, ..) => id
    ReadmeCard(id~, _) => id
  }
}

///|
fn is_folded(self : DetailCardModel, fold_set : @immut/hashset.T[Int]) -> Bool {
  fold_set.contains(get_id(self))
}

///|
fn toggle_folded(self : DetailCardModel) -> Array[Int] {
  let result = []
  match self {
    ValueCard(id~, ..) => result.push(id)
    ImplCard(id~, ..) => result.push(id)
    TypeCard(id~, impls~, methods~, ..) => {
      result.push(id)
      for x in impls {
        result.push_iter(x.toggle_folded().iter())
      }
      for x in methods {
        result.push_iter(x.toggle_folded().iter())
      }
    }
    TraitCard(id~, impls~, ..) => {
      result.push(id)
      for x in impls {
        result.push_iter(x.toggle_folded().iter())
      }
    }
    FailureCard(id~, ..) => result.push(id)
    ReadmeCard(id~, _) => result.push(id)
  }
  result
}

///|
fn detail_cards_view(
  cards : Array[DetailCardModel],
  fold_set : @immut/hashset.T[Int]
) -> @html.Html[Msg] {
  div(class="", [
    div(
      class="contents-center flex flex-col pl-6 p-4 pr-16 w-full gap-2",
      cards.map(fn(card) { card_view(card, fold_set) }),
    ),
    div(class="h-60", []),
  ])
}
