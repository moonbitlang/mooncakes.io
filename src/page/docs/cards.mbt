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
  pre(class="text-wrap flex items-center", [
    code(class="font-mono text-[0.95em] text-blue-800", [
      @view.code_block(content, collapse_namespace=true),
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
  let signature = pre(
    class="bg-gray-100 xl:w-2/5 flex flex-grow items-center pr-3 overflow-auto scrollbar-thin",
    [
      code(class="font-mono text-[0.9em] text-blue-800 flex", [
        span(class="text-gray-700", [text("impl ")]),
        type_path(trait_type),
        span(class="text-gray-700", [text(" for ")]),
        stype(self_type),
      ]),
    ],
  )
  let content = div(class="pl-4", methods.map(fn(x) { value_doc(x, folded~) }))
  document_item(signature, content, collapsed=folded, id~, tight=true)
}

///|
fn type_doc(doc : TypeDoc, folded~ : FoldedState) -> Html[Msg] {
  let { docstring, signature, methods, impls, name: _, loc: _ } = doc
  let id = doc.get_id()
  let signature = signature_view(signature)
  let content = div(
    [
      @view.markdown(docstring, small_heading=true),
      ..methods.map(fn(x) { value_doc(x, folded~, type_id=id) }),
      ..impls.map(fn(x) { impl_doc(x, folded~) }),
    ],
  )
  document_item(signature, content, collapsed=folded, id~)
}

///|
fn trait_doc(doc : TraitDoc, folded~ : FoldedState) -> Html[Msg] {
  let { docstring, signature, impls, default_impls, name: _, loc: _ } = doc
  let id = doc.get_id()
  let signature = signature_view(signature)
  let content = div(
    [
      @view.markdown(docstring, small_heading=true),
      sub_section_title("Default Implementation", default_impls.length()),
      ..default_impls.map(fn(x) { value_doc(x, folded~) }),
      sub_section_title("Implementation", impls.length()),
      ..impls.map(fn(x) { impl_doc(x, folded~) }),
    ],
  )
  document_item(signature, content, collapsed=folded, id~)
}

///|
fn type_alias_doc(doc : TypeAliasDoc, folded~ : FoldedState) -> Html[Msg] {
  let { name: _, docstring, signature, loc: _ } = doc
  let signature = signature_view(signature)
  let content = @view.markdown(docstring, small_heading=true)
  let id = doc.get_id()
  document_item(signature, content, collapsed=folded, id~)
}

///|
fn document_item(
  signature : Html[Msg],
  content : Html[Msg],
  collapsed~ : FoldedState,
  id~ : String,
  tight~ : Bool = false
) -> Html[Msg] {
  let (content_style, icon) = if collapsed.contains(id) {
    ("hidden", @config.SECTION_CLOSE)
  } else {
    ("", @config.SECTION_OPEN)
  }
  let header_style = if tight { "py-1" } else { "py-2" }
  let button = div(
    class="w-8 h-8 hover:bg-gray-200 rounded-lg absolute right-1 top-1/2 transform -translate-y-1/2 select-none flex items-center justify-center group-hover:visible invisible",
    click=ToggleDocDetail(id),
    [img(src=icon, class="size-4", [])],
  )
  div(class="border-t border-gray-300 py-2 group", [
    div(
      class="pl-4 py-2 pr-2 bg-gray-100 rounded-lg relative w-full \{header_style}",
      id~,
      [signature, button],
    ),
    div(class="pl-4 pt-2 \{content_style}", [content]),
  ])
}

///|
fn value_doc(
  doc : ValueDoc,
  folded~ : FoldedState,
  type_id? : String
) -> Html[Msg] {
  let { name: _, docstring, signature, loc: _ } = doc
  let id = type_id.map(fn(x) { "\{x}::\{doc.get_id()}" }).or(doc.get_id())
  let signature = signature_view(signature)
  let content = @view.markdown(docstring, small_heading=true)
  document_item(signature, content, collapsed=folded, id~)
}

///|
fn misc_doc(doc : MiscDoc, folded~ : FoldedState) -> Html[Msg] {
  let { name, methods, impls } = doc
  let id = doc.get_id()
  let signature = div(id=name, class="py-1 w-full", [
    h3(class="text-lg text-gray-800", [text(name)]),
  ])
  let package_link_class = "font-roboto text-sm px-1 py-[1px] bg-yellow-600 bg-opacity-20 hover:bg-opacity-30 rounded"
  let tips = match @config.builtins_package_path[name] {
    None => nothing()
    Some(pkg_path) =>
      div(
        class="bg-mooncake border-mooncake2 border-opacity-50 text-yellow-800 border rounded px-6 py-4 my-2",
        [
          h3(class="text-base font-semibold", [text("Note")]),
          p(class="mt-2", [
            text(
              "\{name} is a built-in type. The documentation may not be complete here. You can find all methods and implementations in the ",
            ),
            a(
              href="/docs/moonbitlang/core/builtin#\{name}",
              class=package_link_class,
              [text("core/builtin")],
            ),
            text(" and "),
            a(
              href="/docs/moonbitlang/\{pkg_path}#\{name}",
              class=package_link_class,
              [text("core/\{name.to_lower()}")],
            ),
            text(" package."),
          ]),
        ],
      )
  }
  let content = div(
    class="ml-3 my-2",
    [
      tips,
      ..methods.map(fn(x) { value_doc(x, folded~, type_id=id) }),
      ..impls.map(fn(x) { impl_doc(x, folded~) }),
    ],
  )
  document_item(signature, content, collapsed=folded, id~)
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
          h1(id~, class="text-sm font-semibold pb-2 pt-4 text-gray-800", [
            text(title),
          ])
        }
      }

      [
        section_title("trait-section", "Traits", traits.length()),
        ..traits.map(fn(x) { trait_doc(x, folded~) }),
        section_title("type-section", "Types", types.length()),
        ..types.map(fn(x) { type_doc(x, folded~) }),
        ..typealiases.map(fn(x) { type_alias_doc(x, folded~) }),
        section_title(
          "value-section",
          "Values & Functions",
          values.length() + misc.length(),
        ),
        ..values.map(fn(x) { value_doc(x, folded~) }),
        ..misc.map(fn(x) { misc_doc(x, folded~) }),
      ]
    }
    _ => []
  }
  div(class="contents-center flex flex-col pl-6 p-4 pr-16 pb-20 w-full", [
    readme,
    div(class="pl-6", doc_list),
  ])
}
