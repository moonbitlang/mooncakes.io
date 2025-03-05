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
fn signature_view(code : String) -> @html.T[Msg] {
  div(
    class="py-1 flex-grow px-3 overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
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
fn signature(code : String) -> @html.T[Msg] {
  div(
    class="py-1 border-t flex border-gray-300 flex-grow bg-gray-100 pr-3 overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
    [
      @html.pre([
        @html.code(class="font-mono text-[0.9em] text-blue-800", [
          @view.code_block(code),
        ]),
      ]),
    ],
  )
}

// ///|
// fn doc_item(
//   conetent : Array[@html.T[Msg]],
//   signature? : String,
//   id? : String,
//   folded? : FoldedState
// ) -> @html.T[Msg] {
//   let folded = match (id, folded) {
//     (Some(id), Some(folded)) =>
//       match folded.card_mode {
//         Expanded => folded.contains(id)
//         Collapsed => true
//       }
//     _ => false
//   }
//   let fold_button = match id {
//     None => @html.nothing()
//     Some(id) =>
//       div(
//         class="hover:bg-gray-200 h-6 active:bg-gray-300 transition-transform p-1 rounded text-sm select-none text-gray-800",
//         click=ToggleCardDetail(id),
//         [
//           div([
//             @html.img(
//               class="w-4",
//               src=if folded {
//                 @config.SECTION_CLOSE
//               } else {
//                 @config.SECTION_OPEN
//               },
//               [],
//             ),
//           ]),
//         ],
//       )
//   }
//   let signature = match signature {
//     None => @html.nothing()
//     Some(code) =>
//       div(
//         class="py-1 border-t flex border-gray-300 flex-grow bg-gray-100 pr-3 overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
//         [
//           fold_button,
//           @html.pre([
//             @html.code(class="font-mono text-[0.9em] text-blue-800", [
//               @view.code_block(code),
//             ]),
//           ]),
//         ],
//       )
//   }
//   let content = if folded {
//     @html.nothing()
//   } else {
//     div(class="border-l pl-4 my-2 ", conetent)
//   }
//   div(id?, [signature, content])
// }

///|
fn stype(ty : Stype) -> @html.T[Msg] {
  match ty {
    Param(name~) => @html.span([text(name)])
    Arrow(parameters~, return_type~, error_type~, is_async~) => {
      let async_indicator = if is_async {
        text("async ")
      } else {
        @html.nothing()
      }
      let error_type_indicator = match error_type {
        None => @html.nothing()
        Some(ty) => div(class="flex", [text("!"), stype(ty)])
      }
      @html.div(
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
fn type_path(ty : TypePath) -> @html.T[Msg] {
  // div([text("@" + ty.path), text("."), text(ty.name)])
  div([text(ty.name)])
}

///|
fn impl_doc(doc : ImplDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { self_type, trait_type, methods } = doc
  let id = self_type.to_string() + trait_type.to_string()
  @view.collapse(
    caret_config=LeftCenter,
    header=@html.pre(
      class="pl-6 py-1 bg-gray-100 xl:w-2/5 flex flex-grow pr-3 overflow-auto scrollbar-thin",
      [
        @html.code(class="font-mono text-[0.9em] text-blue-800 flex", [
          @html.span(class="text-gray-700", [text("impl ")]),
          type_path(trait_type),
          @html.span(class="text-gray-700", [text(" for ")]),
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
    toggle=ToggleCardDetail(id),
  )
}

///|
fn type_doc(doc : TypeDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { docstring, signature, methods, impls, name, loc: _ } = doc
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleCardDetail(name),
    header=div(
      id=name,
      class="pl-4 border-gray-300 bg-gray-100 border-t w-full",
      [signature_view(signature)],
    ),
    body=div(
      class="ml-3 my-2",
      [
        @view.markdown(docstring),
        sub_section_title("Method", methods.length()),
        ..methods.map(fn(x) { value_doc(x, folded~) }),
        sub_section_title("Implementation", impls.length()),
        ..impls.map(fn(x) { impl_doc(x, folded~) }),
      ],
    ),
  )
}

///|
fn trait_doc(doc : TraitDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { docstring, signature, impls, default_impls, name, loc: _ } = doc
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleCardDetail(name),
    header=div(
      id=name,
      class="pl-4 border-gray-300 bg-gray-100 border-t w-full",
      [signature_view(signature)],
    ),
    body=div(
      class="ml-3 my-2",
      [
        @view.markdown(docstring),
        sub_section_title("Default Implementation", default_impls.length()),
        ..default_impls.map(fn(x) { value_doc(x, folded~) }),
        sub_section_title("Implementation", impls.length()),
        ..impls.map(fn(x) { impl_doc(x, folded~) }),
      ],
    ),
  )
}

///|
fn type_alias_doc(doc : TypeAliasDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { name, docstring, signature, loc: _ } = doc
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleCardDetail(name),
    header=div(
      id=name,
      class="pl-4 border-gray-300 bg-gray-100 border-t w-full",
      [signature_view(signature)],
    ),
    body=div(class="ml-3 my-2", [@view.markdown(docstring)]),
  )
}

///|
fn value_doc(doc : ValueDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { name, docstring, signature, loc: _ } = doc
  @view.collapse(
    collapsed=folded.contains(name),
    toggle=ToggleCardDetail(name),
    header=div(
      id=name,
      class="pl-4 border-gray-300 bg-gray-100 border-t w-full",
      [signature_view(signature)],
    ),
    body=div(class="ml-3 my-2", [@view.markdown(docstring)]),
  )
}

///|
fn misc_doc(doc : MiscDoc, folded~ : FoldedState) -> @html.T[Msg] {
  let { name, methods, impls } = doc
  @view.collapse(
    caret_config=LeftCenter,
    collapsed=folded.contains(name),
    toggle=ToggleCardDetail(name),
    header=div(id=name, class="pl-6 py-1 w-full", [
      @html.h3(class="text-lg text-gray-800", [text(name)]),
    ]),
    body=div(
      class="ml-3 my-2",
      [
        // p([text("This is a builtin type.")]),
        sub_section_title("Method", methods.length()),
        ..methods.map(fn(x) { value_doc(x, folded~) }),
        sub_section_title("Implementation", impls.length()),
        ..impls.map(fn(x) { impl_doc(x, folded~) }),
      ],
    ),
  )
}

///|
fn sub_section_title(title : String, item_count : Int) -> @html.T[Msg] {
  if item_count == 0 {
    @html.nothing()
  } else {
    h1(class="text-xs font-bold py-2 text-blue-900", [text(title)])
  }
}

///|
fn document(
  readme_content? : String,
  package_data? : @util.Status[PackageData],
  folded~ : FoldedState
) -> @html.Html[Msg] {
  let readme = match readme_content {
    None | Some("") => @html.nothing()
    Some(content) => {
      let content = @view.markdown(content)
      @view.collapse(
        caret_config=LeftCenter,
        collapsed=folded.contains("readme"),
        toggle=ToggleCardDetail("readme"),
        header=div(class="py-2 pl-6 text-sm font-bold text-gray-700", [
          p([text("README")]),
        ]),
        body=div(class="pl-6", [div(class="mr-4 mb-6", [content])]),
      )
    }
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
