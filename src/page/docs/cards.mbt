///|
struct FoldedState {
  set : @immut/sorted_set.T[String]
  card_mode : CardMode
}

///|
fn FoldedState::new() -> FoldedState {
  { set: @immut/sorted_set.new(), card_mode: Expanded }
}

///|
fn add(self : FoldedState, id : String) -> FoldedState {
  { ..self, set: self.set.add(id) }
}

///|
fn remove(self : FoldedState, id : String) -> FoldedState {
  { ..self, set: self.set.remove(id) }
}

///|
fn contains(self : FoldedState, id : String) -> Bool {
  self.set.contains(id)
}

///|
fn set_mode(self : FoldedState, mode : CardMode) -> FoldedState {
  { ..self, card_mode: mode }
}

///|
fn signature_view(code : String) -> @html.T[Msg] {
  div(
    class="py-1 border-t border-gray-300 flex-grow bg-gray-100 px-3 overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
    [
      @html.pre([
        @html.code(class="font-mono text-[0.9em] text-blue-800", [
          @view.code_block(code),
        ]),
      ]),
    ],
  )
}

///|
fn doc_item(
  conetent : Array[@html.T[Msg]],
  signature? : String,
  id? : String,
  folded? : FoldedState
) -> @html.T[Msg] {
  let folded = match (id, folded) {
    (Some(id), Some(folded)) =>
      match folded.card_mode {
        Expanded => folded.contains(id)
        Collapsed => true
      }
    _ => false
  }
  let fold_button = match id {
    None => @html.nothing()
    Some(id) =>
      div(
        class="hover:bg-gray-200 h-6 active:bg-gray-300 transition-transform p-1 rounded text-sm select-none text-gray-800",
        click=ToggleCardDetail(id),
        [
          div([
            @html.img(
              class="w-4",
              src=if folded {
                @config.SECTION_CLOSE
              } else {
                @config.SECTION_OPEN
              },
              [],
            ),
          ]),
        ],
      )
  }
  let signature = match signature {
    None => @html.nothing()
    Some(code) =>
      div(
        class="py-1 border-t flex border-gray-300 flex-grow bg-gray-100 pr-3 overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
        [
          fold_button,
          @html.pre([
            @html.code(class="font-mono text-[0.9em] text-blue-800", [
              @view.code_block(code),
            ]),
          ]),
        ],
      )
  }
  let content = if folded {
    @html.nothing()
  } else {
    div(class="border-l pl-4 my-2 ", conetent)
  }
  div(id?, [signature, content])
}

///|
fn impl_doc(doc : ImplDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { self_type, trait_type, methods } = doc
  div(
    [
      text(self_type.to_string()),
      text(trait_type.to_string()),
      ..methods.map(fn(x) { value_doc(x, folded~) }),
    ],
  )
}

///|
fn type_doc(doc : TypeDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { docstring, signature, methods, impls, name, loc: _ } = doc
  doc_item(
    id=name,
    signature~,
    folded~,
    [
      @view.markdown(docstring),
      ..methods.map(fn(x) { value_doc(x, folded~) }),
      ..impls.map(fn(x) { impl_doc(x, folded~) }),
    ],
  )
}

///|
fn trait_doc(doc : TraitDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { docstring, signature, impls, default_impls, name, loc: _ } = doc
  doc_item(
    id=name,
    signature~,
    folded~,
    [
      @view.markdown(docstring),
      sub_section_title("Default Implementation", default_impls.length()),
      ..default_impls.map(fn(x) { value_doc(x, folded~) }),
      sub_section_title("Implementation", impls.length()),
      ..impls.map(fn(x) { impl_doc(x, folded~) }),
    ],
  )
}

///|
fn type_alias_doc(doc : TypeAliasDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { name, docstring, signature, loc: _ } = doc
  doc_item(id=name, signature~, folded~, [@view.markdown(docstring)])
}

///|
fn value_doc(doc : ValueDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { name, docstring, signature, loc: _ } = doc
  doc_item(id=name, signature~, folded~, [@view.markdown(docstring)])
}

///|
fn misc_doc(doc : MiscDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { name, methods, impls } = doc
  doc_item(
    id=name,
    folded~,
    [
      sub_section_title("Method", methods.length()),
      ..methods.map(fn(x) { value_doc(x, folded~) }),
      sub_section_title("Implementation", impls.length()),
      ..impls.map(fn(x) { impl_doc(x, folded~) }),
    ],
  )
}

///|
fn sub_section_title(title : String, item_count : Int) -> @html.T[Msg] {
  if item_count == 0 {
    @html.nothing()
  } else {
    h1(class="text-lg font-semibold py-2 text-blue-900", [text(title)])
  }
}

///|
fn document(
  readme_content? : String,
  package_data? : @util.Status[PackageData],
  folded~ : FoldedState
) -> @html.Html[Msg] {
  let readme = match readme_content {
    None => @html.nothing()
    Some(content) =>
      div(class="col-start-2 col-span-2 row-start-3", [
        div(class="mr-4 mb-6", [@view.markdown(content)]),
      ])
  }
  let doc_list = match package_data {
    Some(Success({ traits, types, typealiases, values, misc, name: _ })) => {
      fn section_title(title, item_count) {
        if item_count == 0 {
          @html.nothing()
        } else {
          h1(class="text-xl font-bold py-4 border-b text-gray-800", [
            text(title),
          ])
        }
      }

      [
        section_title("Trait", traits.length()),
        ..traits.map(fn(x) { trait_doc(x, folded~) }),
        section_title("Type", types.length()),
        ..types.map(fn(x) { type_doc(x, folded~) }),
        ..typealiases.map(fn(x) { type_alias_doc(x, folded~) }),
        section_title("Value and Function", values.length() + misc.length()),
        ..values.map(fn(x) { value_doc(x, folded~) }),
        ..misc.map(fn(x) { misc_doc(x, folded~) }),
      ]
    }
    _ => []
  }
  div([
    div(
      class="contents-center flex flex-col pl-6 p-4 pr-16 w-full",
      [readme, ..doc_list],
    ),
    div(class="h-60", []),
  ])
}
