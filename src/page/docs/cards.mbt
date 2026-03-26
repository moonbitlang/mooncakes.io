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
fn signature_view(
  content : String,
  module_name~ : String,
  module_version~ : String,
) -> Html {
  pre(class="text-wrap flex items-center", [
    code(class="font-mono text-xs md:text-sm text-blue-800", [
      @view.code_block(content, kind=Signature, transform_link=fn(href) {
        versioned_docs_path(href, module_name, module_version)
      }),
    ]),
  ])
}

///|
fn stype(ty : Stype, module_name~ : String, module_version~ : String) -> Html {
  match ty {
    Param(name~) => span([text(name)])
    Arrow(parameters~, return_type~, error_type~, is_async~) => {
      let async_indicator = if is_async { text("async ") } else { nothing }
      let error_type_indicator = match error_type {
        None => nothing
        Some(ty) =>
          span(class="flex", [
            text("!"),
            stype(ty, module_name~, module_version~),
          ])
      }
      span(
        [
          async_indicator,
          text("("),
          ..parameters
          .map(fn(p) { stype(p, module_name~, module_version~) })
          .iter()
          .intersperse(text(", ")),
          text(")"),
          text(" -> "),
          stype(return_type, module_name~, module_version~),
          error_type_indicator,
        ],
      )
    }
    Constr(constr~, arguments=[]) =>
      type_path(constr, module_name~, module_version~)
    Constr(constr~, arguments~) =>
      span(
        [
          type_path(constr, module_name~, module_version~),
          text("["),
          ..arguments
          .map(fn(a) { stype(a, module_name~, module_version~) })
          .iter()
          .intersperse(text(", ")),
          text("]"),
        ],
      )
    TypePath(path) => type_path(path, module_name~, module_version~)
  }
}

///|
fn type_path(
  ty : TypePath,
  module_name~ : String,
  module_version~ : String,
) -> Html {
  let path = versioned_docs_path(ty.path, module_name, module_version)
  a(
    href="/docs/\{path}#\{ty.name}",
    class="hover:text-gray-700 transition-colors underline underline-offset-4 text-gray-300",
    [span(class="text-gray-700", [text(ty.name)])],
  )
}

///|
fn impl_doc(
  doc : ImplDoc,
  folded~ : FoldedState,
  module_name~ : String,
  module_version~ : String,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let { self_type, trait_type, methods } = doc
  let id = doc.get_id()
  let signature : Html = pre(class="bg-gray-100 text-wrap pr-4", [
    code(class="font-mono text-xs md:text-sm text-[#0033b3]", [
      text("impl "),
      type_path(trait_type, module_name~, module_version~),
      text(" for "),
      span(class="text-gray-700", [
        stype(self_type, module_name~, module_version~),
      ]),
    ]),
  ])
  let content = div(
    class="pl-4 mb-2",
    methods.map(m => {
      value_doc(m, folded~, module_name~, module_version~, dispatch)
    }),
  )
  document_item(signature, content, collapsed=folded, id~, tight=true, dispatch)
}

///|
fn type_doc(
  doc : TypeDoc,
  folded~ : FoldedState,
  module_name~ : String,
  module_version~ : String,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let { docstring, signature, methods, impls, name: _, loc } = doc
  let id = doc.get_id()
  let signature = signature_view(signature, module_name~, module_version~)
  let content = div(
    [
      div(class="pl-4 mb-2", [@view.markdown(docstring, small_heading=true)]),
      ..impls.map(imp => {
        impl_doc(imp, folded~, module_name~, module_version~, dispatch)
      }),
      ..methods.map(m => {
        value_doc(
          m,
          folded~,
          module_name~,
          module_version~,
          type_id=id,
          dispatch,
        )
      }),
    ],
  )
  document_item(
    title=id,
    signature,
    content,
    collapsed=folded,
    id~,
    loc~,
    module_name~,
    module_version~,
    dispatch,
  )
}

///|
fn trait_doc(
  doc : TraitDoc,
  folded~ : FoldedState,
  module_name~ : String,
  module_version~ : String,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let { docstring, signature, impls, name: _, loc } = doc
  let id = doc.get_id()
  let signature = signature_view(signature, module_name~, module_version~)
  let content = div(
    [
      div(class="pl-4 mb-2", [@view.markdown(docstring, small_heading=true)]),
      ..impls.map(imp => {
        impl_doc(imp, folded~, module_name~, module_version~, dispatch)
      }),
    ],
  )
  document_item(
    title=id,
    signature,
    content,
    collapsed=folded,
    id~,
    loc~,
    module_name~,
    module_version~,
    dispatch,
  )
}

///|
fn type_alias_doc(
  doc : TypeAliasDoc,
  folded~ : FoldedState,
  module_name~ : String,
  module_version~ : String,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let { name: _, docstring, signature, loc } = doc
  let signature = signature_view(signature, module_name~, module_version~)
  let content = div(class="pl-4 mb-2", [
    @view.markdown(docstring, small_heading=true),
  ])
  let id = doc.get_id()
  document_item(
    title=id,
    signature,
    content,
    collapsed=folded,
    id~,
    loc~,
    module_name~,
    module_version~,
    dispatch,
  )
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
  module_name? : String = "",
  module_version? : String = "",
  dispatch : (Msg) -> Cmd,
) -> Html {
  let (content_style, icon) = if collapsed.contains(id) {
    ("hidden", @config.SECTION_CLOSE)
  } else {
    ("", @config.SECTION_OPEN)
  }
  let header_style = if tight { "py-1" } else { "py-2" }
  let source_btn = match loc {
    None => nothing
    Some(loc) => {
      let path = if module_name.is_empty() {
        loc.path
      } else {
        versioned_asset_path(loc.path, module_name, module_version)
      }
      a(
        href="/assets/\{path}/\{loc.file}.html#\{loc.line}",
        class="text-xs font-semibold text-yellow-700 hover:text-yellow-900 transition-colors",
        escape=true,
        [text("source")],
      )
    }
  }
  let collapse_btn : Html = div(
    class="w-8 h-8 hover:bg-gray-200 rounded-lg flex items-center justify-center",
    on_click=dispatch(ToggleDocDetail(id)),
    [img(src=icon, class="size-4 ui-icon", nothing)],
  )
  let buttons_row : Html = div(class="select-none flex gap-1 items-center", [
    source_btn, collapse_btn,
  ])
  let top_rule = match title {
    None =>
      if tight {
        "border-t pt-2 border-gray-200 mt-3"
      } else {
        "border-t pt-4 border-gray-200 mt-8"
      }
    Some(_) => "mt-10"
  }
  let sig_buttons_abs : Html = div(
    class="absolute right-1 top-1/2 transform -translate-y-1/2 select-none flex gap-1 items-center",
    [source_btn, collapse_btn],
  )
  let (title_view, sig_buttons, has_title) = match title {
    None => (nothing, sig_buttons_abs, false)
    Some(title) => {
      let anchor = div(
        class="text-gray-300 hover:text-gray-500 cursor-pointer transition-colors opacity-0 group-hover/title:opacity-100 absolute -left-6 top-1/2 -translate-y-1/2",
        on_click=dispatch(ClickAnchor(id)),
        [text("#")],
      )
      let title_with_buttons = div(
        class="flex items-center justify-between border-b mb-4 scroll-mt-header group/title",
        id~,
        [
          @html.h2(
            class="text-gray-800 text-lg md:text-xl font-semibold py-2 relative",
            [anchor, text(title)],
          ),
          buttons_row,
        ],
      )
      (title_with_buttons, nothing, true)
    }
  }
  let sig_class = "px-4 py-2.5 bg-gray-100 rounded-lg relative w-full \{header_style}" +
    (if has_title { "" } else { " scroll-mt-header" })
  div(class="mb-3 group \{top_rule}", [
    title_view,
    if has_title {
      div(class=sig_class, [signature, sig_buttons])
    } else {
      div(class=sig_class, id~, [signature, sig_buttons])
    },
    div(class="\{content_style} mt-3", [content]),
  ])
}

///|
fn value_doc(
  doc : ValueDoc,
  folded~ : FoldedState,
  module_name~ : String,
  module_version~ : String,
  type_id? : String,
  enable_title? : Bool = false,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let { name: _, docstring, signature, loc } = doc
  let id = type_id
    .map(fn(x) { "\{x}::\{doc.get_id()}" })
    .unwrap_or(doc.get_id())
  let signature = signature_view(signature, module_name~, module_version~)
  let content = div(class="pl-4 mb-2", [
    @view.markdown(docstring, small_heading=true),
  ])
  let title = if enable_title || type_id is Some(_) { Some(id) } else { None }
  document_item(
    title?,
    signature,
    content,
    collapsed=folded,
    id~,
    loc~,
    module_name~,
    module_version~,
    dispatch,
  )
}

///|
fn misc_doc(
  doc : MiscDoc,
  folded~ : FoldedState,
  module_name~ : String,
  module_version~ : String,
  dispatch : (Msg) -> Cmd,
) -> Html {
  let { name, methods, impls } = doc
  let id = doc.get_id()
  let signature = div(id=name, class="py-1 w-full", [
    h3(class="text-base md:text-lg text-gray-800", [text(name)]),
  ])
  let package_link_class = "font-mono text-sm px-1 py-[1px] bg-yellow-600/20 hover:bg-yellow-600/20 rounded"
  let tips = match @config.builtins_package_path.get(name) {
    None => nothing
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
      ..methods.map(m => {
        value_doc(
          m,
          folded~,
          module_name~,
          module_version~,
          type_id=id,
          dispatch,
        )
      }),
      ..impls.map(imp => {
        impl_doc(imp, folded~, module_name~, module_version~, dispatch)
      }),
    ],
  )
  document_item(signature, content, collapsed=folded, id~, dispatch)
}

///|
fn readme(
  content : String?,
  folded~ : FoldedState,
  dispatch : (Msg) -> Cmd,
) -> Html {
  match content {
    None | Some("") => nothing
    Some(content) => {
      let content = @view.markdown(content)
      let is_collapsed = folded.contains("readme")
      let (body, icon) = if is_collapsed {
        (nothing, @config.SECTION_CLOSE)
      } else {
        (div(class="mt-4 mb-6", [content]), @config.SECTION_OPEN)
      }
      div(class="mt-4 mb-8 mx-4 md:mx-0 scroll-mt-header", id="readme", [
        div(
          class="flex items-center gap-1.5 py-1.5 px-2.5 rounded-md hover:bg-gray-100 cursor-pointer select-none w-fit",
          on_click=dispatch(ToggleDocDetail("readme")),
          [
            img(src=icon, class="size-3.5 ui-icon", nothing),
            span(class="font-medium text-gray-500 text-xs tracking-wide", [
              text("README"),
            ]),
          ],
        ),
        body,
        div(class="border-b border-gray-200 mt-4", nothing),
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
  module_name? : String = "",
  module_version? : String = "",
  dispatch : (Msg) -> Cmd,
) -> Html {
  let readme = readme(readme_content, folded~, dispatch)
  let doc_list = match package_data {
    Some(Success({ traits, types, errors, typealiases, values, misc, name: _ })) => {
      let count = traits.length() +
        types.length() +
        errors.length() +
        typealiases.length() +
        values.length() +
        misc.length()
      if hide_large_package && count > 1000 {
        [hidden_large_package(count, dispatch)]
      } else {
        [
          ..traits.map(tr => {
            trait_doc(tr, folded~, module_name~, module_version~, dispatch)
          }),
          ..types.map(ty => {
            type_doc(ty, folded~, module_name~, module_version~, dispatch)
          }),
          ..errors.map(err => {
            type_doc(err, folded~, module_name~, module_version~, dispatch)
          }),
          ..typealiases.map(ta => {
            type_alias_doc(ta, folded~, module_name~, module_version~, dispatch)
          }),
          ..values.map(value => {
            value_doc(
              value,
              folded~,
              module_name~,
              module_version~,
              enable_title=true,
              dispatch,
            )
          }),
          ..misc.map(item => {
            misc_doc(item, folded~, module_name~, module_version~, dispatch)
          }),
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
fn hidden_large_package(count : Int, dispatch : (Msg) -> Cmd) -> Html {
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
          on_click=dispatch(ShowLargePackage),
          [text("Show All Items")],
        ),
      ],
    ),
  ])
}
