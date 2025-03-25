///|
priv struct FoldedState {
  set : Set[String]
  card_mode : CardMode
} derive(Show)

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
  match self.card_mode {
    Expanded => self.set.contains(id)
    Collapsed => true
  }
}

///|
fn set_mode(self : FoldedState, mode : CardMode) -> FoldedState {
  { ..self, card_mode: mode }
}

///|
fn signature_view(content : String) -> Html[Msg] {
  div(class="py-1 flex-grow px-3", [
    pre(class="text-wrap", [
      code(class="font-mono text-[0.9em] text-blue-800", [
        @view.code_block(content),
      ]),
    ]),
  ])
}

///|
fn stype(ty : Stype) -> Html[Msg] {
  match ty {
    Param(name~) => span([text(name)])
    Arrow(parameters~, return_type~, error_type~, is_async~) => {
      let async_indicator = if is_async { text("async ") } else { nothing() }
      let error_type_indicator = match error_type {
        None => nothing()
        Some(ty) => div(class="flex", [text("!"), stype(ty)])
      }
      div(
        [
          async_indicator,
          text("("),
          ..parameters.map(stype).iter().intersperse(text(", ")),
          text(")"),
          text(" -> "),
          stype(return_type),
          error_type_indicator,
        ],
      )
    }
    Constr(constr~, arguments=[]) => type_path(constr)
    Constr(constr~, arguments~) =>
      div(
        class="flex",
        [
          type_path(constr),
          text("["),
          ..arguments.map(stype).iter().intersperse(text(", ")),
          text("]"),
        ],
      )
    TypePath(path) => type_path(path)
  }
}

///|
fn type_path(ty : TypePath) -> Html[Msg] {
  // div([text("@" + ty.path), text("."), text(ty.name)])
  div([text(ty.name)])
}

///|
fn impl_doc(doc : ImplDoc, folded~ : FoldedState) -> Html[Msg] {
  let { self_type, trait_type, methods } = doc
  let id = doc.get_id()
  @view.collapse(
    caret_config=LeftCenter,
    header=pre(
      class="pl-6 py-1 bg-gray-100 xl:w-2/5 flex flex-grow pr-3 overflow-auto scrollbar-thin",
      [
        code(class="font-mono text-[0.9em] text-blue-800 flex", [
          span(class="text-gray-700", [text("impl ")]),
          type_path(trait_type),
          span(class="text-gray-700", [text(" for ")]),
          stype(self_type),
        ]),
      ],
    ),
    body=div(
      class="pl-3 ml-1 border-l my-2",
      [
        sub_section_title("Methods", methods.length()),
        ..methods.map(fn(x) { value_doc(x, folded~) }),
      ],
    ),
    collapsed=folded.contains(id),
    toggle=ToggleDocDetail(id),
  )
}

///|
fn type_doc(doc : TypeDoc, folded~ : FoldedState) -> Html[Msg] {
  let { docstring, signature, methods, impls, name: _, loc: _ } = doc
  let id = doc.get_id()
  @view.collapse(
    collapsed=folded.contains(id),
    toggle=ToggleDocDetail(id),
    header=div(id~, class="pl-4 border-gray-300 bg-gray-100 border-t w-full", [
      signature_view(signature),
    ]),
    body=div(
      class="ml-3 my-2",
      [
        @view.markdown(docstring, small_heading=true),
        sub_section_title("Method", methods.length()),
        ..methods.map(fn(x) { value_doc(x, folded~, type_id=id) }),
        sub_section_title("Implementation", impls.length()),
        ..impls.map(fn(x) { impl_doc(x, folded~) }),
      ],
    ),
  )
}

///|
fn trait_doc(doc : TraitDoc, folded~ : FoldedState) -> Html[Msg] {
  let { docstring, signature, impls, default_impls, name, loc: _ } = doc
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleDocDetail(name),
    header=div(
      id=name,
      class="pl-4 border-gray-300 bg-gray-100 border-t w-full",
      [signature_view(signature)],
    ),
    body=div(
      id=doc.name,
      class="ml-3 my-2",
      [
        @view.markdown(docstring, small_heading=true),
        sub_section_title("Default Implementation", default_impls.length()),
        ..default_impls.map(fn(x) { value_doc(x, folded~) }),
        sub_section_title("Implementation", impls.length()),
        ..impls.map(fn(x) { impl_doc(x, folded~) }),
      ],
    ),
  )
}

///|
fn type_alias_doc(doc : TypeAliasDoc, folded~ : FoldedState) -> Html[Msg] {
  let { name, docstring, signature, loc: _ } = doc
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleDocDetail(name),
    header=div(
      id=name,
      class="pl-4 border-gray-300 bg-gray-100 border-t w-full",
      [signature_view(signature)],
    ),
    body=div(class="ml-3 my-2", [@view.markdown(docstring, small_heading=true)]),
  )
}

///|
fn value_doc(
  doc : ValueDoc,
  folded~ : FoldedState,
  type_id? : String
) -> Html[Msg] {
  let { name, docstring, signature, loc: _ } = doc
  let id = type_id.map(fn(x) { "\{x}::\{doc.get_id()}" }).or(doc.get_id())
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleDocDetail(name),
    header=div(id~, class="pl-4 border-gray-300 bg-gray-100 border-t w-full", [
      signature_view(signature),
    ]),
    body=div(class="ml-3 my-2", [@view.markdown(docstring, small_heading=true)]),
  )
}

///|
fn misc_doc(doc : MiscDoc, folded~ : FoldedState) -> Html[Msg] {
  let { name, methods, impls } = doc
  let id = doc.get_id()
  @view.collapse(
    caret_config=LeftCenter,
    collapsed=folded.contains(name),
    toggle=ToggleDocDetail(name),
    header=div(id=name, class="pl-6 py-1 w-full", [
      h3(class="text-lg text-gray-800", [text(name)]),
    ]),
    body=div(
      class="ml-3 my-2",
      [
        // p([text("This is a builtin type.")]),
        sub_section_title("Method", methods.length()),
        ..methods.map(fn(x) { value_doc(x, folded~, type_id=id) }),
        sub_section_title("Implementation", impls.length()),
        ..impls.map(fn(x) { impl_doc(x, folded~) }),
      ],
    ),
  )
}

///|
fn sub_section_title(title : String, item_count : Int) -> Html[Msg] {
  if item_count == 0 {
    nothing()
  } else {
    h1(class="text-xs font-bold py-2 text-blue-900", [text(title)])
  }
}

///|
fn document(
  readme_content? : String,
  package_data? : Status[PackageData],
  folded~ : FoldedState
) -> Html[Msg] {
  let readme = match readme_content {
    None | Some("") => nothing()
    Some(content) => {
      let content = @view.markdown(content)
      @view.collapse(
        caret_config=LeftCenter,
        collapsed=folded.contains("readme"),
        toggle=ToggleDocDetail("readme"),
        header=div(class="py-2 pl-6 text-sm font-bold text-gray-700", [
          p([text("README")]),
        ]),
        body=div(class="pl-6", [div(class="mr-4 mb-6", [content])]),
      )
    }
  }
  let doc_list = match package_data {
    Some(Success({ traits, types, typealiases, values, misc, name: _ })) => {
      fn section_title(id, title, item_count) {
        if item_count == 0 {
          nothing()
        } else {
          h1(id~, class="text-xl font-bold py-4 border-b text-gray-800", [
            text(title),
          ])
        }
      }

      [
        section_title("trait-section", "Trait", traits.length()),
        ..traits.map(fn(x) { trait_doc(x, folded~) }),
        section_title("type-section", "Type", types.length()),
        ..types.map(fn(x) { type_doc(x, folded~) }),
        ..typealiases.map(fn(x) { type_alias_doc(x, folded~) }),
        section_title(
          "value-section",
          "Value and Function",
          values.length() + misc.length(),
        ),
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
