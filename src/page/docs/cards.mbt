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
  set : SortedSet[String]
  card_mode : CardMode
}

///|
fn FoldedState::new() -> FoldedState {
  { set: @immut/sorted_set.new(), card_mode: Expanded }
}

///|
fn FoldedState::add(self : FoldedState, id : String) -> FoldedState {
  { ..self, set: self.set.add(id) }
}

///|
fn FoldedState::remove(self : FoldedState, id : String) -> FoldedState {
  { ..self, set: self.set.remove(id) }
}

///|
fn FoldedState::contains(self : FoldedState, id : String) -> Bool {
  match self.card_mode {
    Expanded => self.set.contains(id)
    Collapsed => true
  }
}

///|
fn FoldedState::set_mode(self : FoldedState, mode : CardMode) -> FoldedState {
  { ..self, card_mode: mode }
}

///|
fn signature_view(content : String) -> Html {
  pre(class="text-wrap flex items-center", [
    code(class="font-mono text-sm text-blue-800", [
      @view.code_block(content, kind=Signature),
    ]),
  ])
}

///|
fn stype(ty : Stype) -> Html {
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
fn type_path(ty : TypePath) -> Html {
  a(
    href="/docs/\{ty.path}#\{ty.name}",
    class="hover:text-gray-700 transition-colors underline underline-offset-4 text-gray-300",
    [span(class="text-gray-700", [text(ty.name)])],
  )
}

///|
fn impl_doc(
  doc : ImplDoc,
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let { self_type, trait_type, methods } = doc
  let id = doc.get_id()
  let signature : Html = pre(class="bg-gray-100 text-wrap pr-4", [
    code(class="font-mono text-[0.9em] text-[#0033b3]", [
      text("impl "),
      type_path(trait_type),
      text(" for "),
      span(class="text-gray-700", [stype(self_type)]),
    ]),
  ])
  let content = div(
    class="pl-4 my-3",
    methods.map(value_doc(_, folded~, to_cmd)),
  )
  document_item(signature, content, collapsed=folded, id~, tight=true, to_cmd)
}

///|
fn type_doc(
  doc : TypeDoc,
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let { docstring, signature, methods, impls, name: _, loc } = doc
  let id = doc.get_id()
  let signature = signature_view(signature)
  let content = div(
    [
      div(class="pl-4 my-3", [@view.markdown(docstring, small_heading=true)]),
      ..impls.map(impl_doc(_, folded~, to_cmd)),
      ..methods.map(value_doc(_, folded~, type_id=id, to_cmd)),
    ],
  )
  document_item(
    title=id,
    signature,
    content,
    collapsed=folded,
    id~,
    loc~,
    to_cmd,
  )
}

///|
fn trait_doc(
  doc : TraitDoc,
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let { docstring, signature, impls, name: _, loc } = doc
  let id = doc.get_id()
  let signature = signature_view(signature)
  let content = div(
    [
      div(class="pl-4 my-3", [@view.markdown(docstring, small_heading=true)]),
      ..impls.map(impl_doc(_, folded~, to_cmd)),
    ],
  )
  document_item(
    title=id,
    signature,
    content,
    collapsed=folded,
    id~,
    loc~,
    to_cmd,
  )
}

///|
fn type_alias_doc(
  doc : TypeAliasDoc,
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let { name: _, docstring, signature, loc } = doc
  let signature = signature_view(signature)
  let content = @view.markdown(docstring, small_heading=true)
  let id = doc.get_id()
  document_item(signature, content, collapsed=folded, id~, loc~, to_cmd)
}

///|
fn document_item(
  title? : String,
  signature : Html,
  content : Html,
  collapsed~ : FoldedState,
  id~ : String,
  tight? : Bool = false,
  loc? : Loc,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let (content_style, icon) = if collapsed.contains(id) {
    ("hidden", @config.SECTION_CLOSE)
  } else {
    ("", @config.SECTION_OPEN)
  }
  let header_style = if tight { "py-1" } else { "py-2" }
  let buttons : Html = {
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
    let collapse_btn : Html = div(
      class="w-8 h-8 hover:bg-gray-200 rounded-lg flex items-center justify-center",
      click=to_cmd(ToggleDocDetail(id)),
      [img(src=icon, class="size-4 ui-icon", nothing())],
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
      class="px-4 py-2 bg-gray-100 rounded-lg relative w-full scroll-mt-header \{header_style}",
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
  type_id? : String,
  enable_title? : Bool = false,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let { name: _, docstring, signature, loc } = doc
  let id = type_id
    .map(fn(x) { "\{x}::\{doc.get_id()}" })
    .unwrap_or(doc.get_id())
  let signature = signature_view(signature)
  let content = div(class="pl-4 my-3", [
    @view.markdown(docstring, small_heading=true),
  ])
  let title = if enable_title { Some(id) } else { None }
  document_item(title?, signature, content, collapsed=folded, id~, loc~, to_cmd)
}

///|
fn misc_doc(
  doc : MiscDoc,
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
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
      ..methods.map(value_doc(_, folded~, type_id=id, to_cmd)),
      ..impls.map(impl_doc(_, folded~, to_cmd)),
    ],
  )
  document_item(signature, content, collapsed=folded, id~, to_cmd)
}

///|
fn readme(
  content : String?,
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  match content {
    None | Some("") => nothing()
    Some(content) => {
      let content = @view.markdown(content)
      div(class="border md:rounded mb-4", [
        @view.collapse(
          caret_config=LeftCenter,
          collapsed=folded.contains("readme"),
          toggle=to_cmd(ToggleDocDetail("readme")),
          header=div(
            class="py-2 pl-7 border-b w-full font-bold text-gray-700 text-base flex items-center gap-1",
            [
              img(src=@config.book_open, class="w-4 h-4 ui-icon", nothing()),
              p([text("README")]),
            ],
          ),
          body=div(class="m-8", [div(class="mr-4 mb-6", [content])]),
        ),
      ])
    }
  }
}

///|
fn document(
  hide_large_package~ : Bool,
  readme_content? : String,
  package_data? : Status[PackageData],
  folded~ : FoldedState,
  to_cmd : (Msg) -> Cmd,
) -> Html {
  let readme = readme(readme_content, folded~, to_cmd)
  let doc_list = match package_data {
    Some(Success({ traits, types, typealiases, values, misc, name: _ })) => {
      let count = traits.length() +
        types.length() +
        typealiases.length() +
        values.length() +
        misc.length()
      if hide_large_package && count > 1000 {
        [hidden_large_package(count, to_cmd)]
      } else {
        [
          ..traits.map(trait_doc(_, folded~, to_cmd)),
          ..types.map(type_doc(_, folded~, to_cmd)),
          ..typealiases.map(type_alias_doc(_, folded~, to_cmd)),
          ..values.map(value_doc(_, folded~, enable_title=true, to_cmd)),
          ..misc.map(misc_doc(_, folded~, to_cmd)),
        ]
      }
    }
    _ => []
  }
  div(class="contents-center flex flex-col w-full", [
    readme,
    // Ensure left and right spacing on mobile devices
    div(class="mx-4 md:mx-0", doc_list),
  ])
}

///|
fn hidden_large_package(count : Int, to_cmd : (Msg) -> Cmd) -> Html {
  div(class="flex flex-col items-center justify-center py-12 w-full", [
    div(
      class="bg-mooncake border border-mooncake2 rounded-lg p-8 w-full text-center",
      [
        h3(class="text-xl font-semibold text-yellow-800 mb-4", [
          text("⚠️ Package is too large to be displayed"),
        ]),
        p(class="text-yellow-700 mb-6", [
          text("This package contains over \{count} items."),
        ]),
        button(
          class="px-6 py-2.5 bg-yellow-600 hover:bg-yellow-700 text-white font-medium rounded-lg transition-colors shadow-sm",
          click=to_cmd(ShowLargePackage),
          [text("Show All Items")],
        ),
      ],
    ),
  ])
}
