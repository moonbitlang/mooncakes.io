///|
enum DetailCardModel {
  ValueCard(
    mut folded~ : Bool,
    name~ : String,
    signature~ : String,
    description~ : String
  )
  ImplCard(
    mut folded~ : Bool,
    name~ : String,
    signature~ : String,
    description~ : String
  )
  TypeCard(
    mut folded~ : Bool,
    name~ : String,
    signature~ : String,
    description~ : String,
    methods~ : Array[DetailCardModel],
    impls~ : Array[DetailCardModel]
  )
  TraitCard(
    mut folded~ : Bool,
    name~ : String,
    signature~ : String,
    description~ : String,
    impls~ : Array[DetailCardModel]
  )
  ReadmeCard(mut folded~ : Bool, String)
  FailureCard(String)
} derive(Show)

///|
fn card_section_view(card : DetailCardModel) -> @html.Html[Msg] {
  let fold_button = div(
    click=ToggleCardDetail(card),
    class="w-full h-full flex",
    [
      @html.img(
        src=if card.is_folded() {
          @constants.SECTION_CLOSE
        } else {
          @constants.SECTION_OPEN
        },
        class="group-hover:opacity-100 opacity-0 transition-opacity duration-100 ",
        [],
      ),
    ],
  )

  // background color
  let bg = match card {
    ReadmeCard(_, ..) => ""
    _ => "bg-white"
  }

  // visibility of the detail section
  let detail_visibility = if card.is_folded() {
    "h-0 overflow-hidden opacity-0"
  } else {
    "visible"
  }

  // signature 
  fn signature_view(code, name) {
    let code_view = @html.pre([
      @html.code(id=name, class="font-mono text-[0.9em] text-blue-800", [
        hightlight(code),
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
    ValueCard(signature~, name~, ..)
    | ImplCard(signature~, name~, ..)
    | TypeCard(signature~, name~, ..)
    | TraitCard(signature~, name~, ..) => signature_view(signature, name)
  }

  // tool buttons
  let tool_buttons = match card {
    ReadmeCard(_, ..) => []
    _ => [button_view("source"), icon_button_view(@constants.SHARE)]
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
            div(class="mr-4 mb-6 pt-1", [markdown_view(description)]),
          ]),
          div(class="col-start-1 row-start-1 max-h-10", [fold_button]),
        )
      }
    ReadmeCard(description, ..) =>
      (
        div(class="col-start-2 col-span-2 row-start-3 \{detail_visibility}", [
          div(class="mr-4 mb-6", [markdown_view(description)]),
        ]),
        div(class="col-start-1 row-start-1 max-h-10", [fold_button]),
      )
    FailureCard(info) =>
      (
        div(class="col-start-2 col-span-2 row-start-3 \{detail_visibility}", [
          @html.text("Failed to load this card: \{info}"),
        ]),
        div(class="col-start-1 row-start-1 max-h-10", [fold_button]),
      )
  }

  // methods or impls
  let subsections = match card {
    TypeCard(methods~, impls~, ..) => {
      let methods = methods.map(card_section_view)
      let impls = impls.map(card_section_view)
      [..methods, ..impls]
    }
    TraitCard(impls~, ..) => impls.map(card_section_view)
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
fn card_view(card : DetailCardModel) -> @html.Html[Msg] {
  match card {
    ReadmeCard(_, ..) => div([card_section_view(card)])
    _ =>
      div(class="border rounded overflow-clip bg-white", [
        card_section_view(card),
      ])
  }
}

///|
fn is_folded(self : DetailCardModel) -> Bool {
  match self {
    ValueCard(folded~, ..)
    | ImplCard(folded~, ..)
    | TypeCard(folded~, ..)
    | TraitCard(folded~, ..)
    | ReadmeCard(folded~, _) => folded
  }
}

///|
fn toggle_folded(self : DetailCardModel) -> Unit {
  match self {
    ValueCard(..) as card => card.folded = not(card.folded)
    ImplCard(..) as card => card.folded = not(card.folded)
    TypeCard(impls~, methods~, ..) as card => {
      card.folded = not(card.folded)
      for x in impls {
        x.toggle_folded()
      }
      for x in methods {
        x.toggle_folded()
      }
    }
    TraitCard(impls~, ..) as card => {
      card.folded = not(card.folded)
      for x in impls {
        x.toggle_folded()
      }
    }
    ReadmeCard(_, ..) as card => card.folded = not(card.folded)
  }
}

///|
fn detail_cards_view(cards : Array[DetailCardModel]) -> @html.Html[Msg] {
  div(class="", [
    div(
      class="contents-center flex flex-col pl-6 p-4 pr-16 w-full gap-2",
      cards.map(card_view),
    ),
    div(class="h-60", []),
  ])
}
