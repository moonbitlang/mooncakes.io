// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
    code(class="font-mono text-sm text-blue-800", [
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
        Some(ty) => span(class="flex", [text("!"), stype(ty)])
      }
      span(
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
      span(
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
  a(
    href="/docs/\{ty.path}#\{ty.name}",
    class="hover:text-gray-700 transition-colors underline underline-offset-4 text-gray-300",
    [span(class="text-gray-700", [text(ty.name)])],
  )
}

///|
fn impl_doc(doc : ImplDoc, folded~ : FoldedState) -> Html[Msg] {
  let { self_type, trait_type, methods } = doc
  let id = doc.get_id()
  let signature = pre(class="bg-gray-100 text-wrap pr-4", [
    code(class="font-mono text-[0.9em] text-[#0033b3]", [
      text("impl "),
      type_path(trait_type),
      text(" for "),
      span(class="text-gray-700", [stype(self_type)]),
    ]),
  ])
  let content = div(class="pl-4", methods.map(value_doc(_, folded~)))
  document_item(signature, content, collapsed=folded, id~, tight=true)
}

///|
fn type_doc(doc : TypeDoc, folded~ : FoldedState) -> Html[Msg] {
  let { docstring, signature, methods, impls, name: _, loc } = doc
  let id = doc.get_id()
  let signature = signature_view(signature)
  let content = div(
    [
      div(class="pl-5", [@view.markdown(docstring, small_heading=true)]),
      ..impls.map(impl_doc(_, folded~)),
      ..methods.map(value_doc(_, folded~, type_id=id)),
    ],
  )
  document_item(title=id, signature, content, collapsed=folded, id~, loc~)
}

///|
fn trait_doc(doc : TraitDoc, folded~ : FoldedState) -> Html[Msg] {
  let { docstring, signature, impls, name: _, loc } = doc
  let id = doc.get_id()
  let signature = signature_view(signature)
  let content = div(
    [
      div(class="pl-5", [@view.markdown(docstring, small_heading=true)]),
      ..impls.map(impl_doc(_, folded~)),
    ],
  )
  document_item(title=id, signature, content, collapsed=folded, id~, loc~)
}

///|
fn type_alias_doc(doc : TypeAliasDoc, folded~ : FoldedState) -> Html[Msg] {
  let { name: _, docstring, signature, loc } = doc
  let signature = signature_view(signature)
  let content = @view.markdown(docstring, small_heading=true)
  let id = doc.get_id()
  document_item(signature, content, collapsed=folded, id~, loc~)
}

///|
fn document_item(
  title? : String,
  signature : Html[Msg],
  content : Html[Msg],
  collapsed~ : FoldedState,
  id~ : String,
  tight~ : Bool = false,
  loc? : Loc
) -> Html[Msg] {
  let (content_style, icon) = if collapsed.contains(id) {
    ("hidden", @config.SECTION_CLOSE)
  } else {
    ("", @config.SECTION_OPEN)
  }
  let header_style = if tight { "py-1" } else { "py-2" }
  let buttons = {
    let source_btn = match loc {
      None => nothing()
      Some(loc) =>
        a(
          href="/assets/\{loc.path}/\{loc.file}.html#\{loc.line}",
          class="text-xs text-gray-500 hover:text-gray-700 transition-colors",
          escape=true,
          [text("source")],
        )
    }
    let collapse_btn = div(
      class="w-8 h-8 hover:bg-gray-200 rounded-lg flex items-center justify-center",
      click=ToggleDocDetail(id),
      [img(src=icon, class="size-4", [])],
    )
    div(
      class="absolute right-1 top-1/2 transform -translate-y-1/2 select-none flex gap-1 items-center justify-center group-hover:visible invisible",
      [source_btn, collapse_btn],
    )
  }
  let top_rule = match title {
    None => "border-t pt-2 border-gray-200"
    Some(_) => ""
  }
  let title = match title {
    None => nothing()
    Some(title) =>
      @html.h2(
        class="text-gray-800 text-2xl font-semibold py-2 mb-4 border-b",
        id~,
        [text(title)],
      )
  }
  div(class="my-2 group \{top_rule}", [
    title,
    div(
      class="px-4 py-2 bg-gray-100 rounded-lg relative w-full \{header_style}",
      id~,
      [signature, buttons],
    ),
    div(class=content_style, [content]),
  ])
}

///|
fn value_doc(
  doc : ValueDoc,
  folded~ : FoldedState,
  type_id? : String
) -> Html[Msg] {
  let { name: _, docstring, signature, loc } = doc
  let id = type_id.map(fn(x) { "\{x}::\{doc.get_id()}" }).or(doc.get_id())
  let signature = signature_view(signature)
  let content = div(class="pl-5", [
    @view.markdown(docstring, small_heading=true),
  ])
  document_item(signature, content, collapsed=folded, id~, loc~)
}

///|
fn misc_doc(doc : MiscDoc, folded~ : FoldedState) -> Html[Msg] {
  let { name, methods, impls } = doc
  let id = doc.get_id()
  let signature = div(id=name, class="py-1 w-full", [
    h3(class="text-lg text-gray-800", [text(name)]),
  ])
  let package_link_class = "font-mono text-sm px-1 py-[1px] bg-yellow-600/20 hover:bg-yellow-600/20 rounded"
  let tips = match @config.builtins_package_path.get(name) {
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
      ..methods.map(value_doc(_, folded~, type_id=id)),
      ..impls.map(impl_doc(_, folded~)),
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
        body=div(class="", [div(class="mr-4 mb-6", [content])]),
      )
    }
  }
  let doc_list = match package_data {
    Some(Success({ traits, types, typealiases, values, misc, name: _ })) =>
      [
        ..traits.map(trait_doc(_, folded~)),
        ..types.map(type_doc(_, folded~)),
        ..typealiases.map(type_alias_doc(_, folded~)),
        ..values.map(value_doc(_, folded~)),
        ..misc.map(misc_doc(_, folded~)),
      ]
    _ => []
  }
  div(class="contents-center flex flex-col p-2 w-full", [readme, div(doc_list)])
}
