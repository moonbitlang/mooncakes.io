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
using @immut/sorted_set {type SortedSet}

///|
using @html {type Html, div, text, ul, nothing}

///|
using @rabbita {type Cmd}

///|
pub(all) enum Tree[Id] {
  Item(id~ : Id, String)
  Node(id~ : Id, String, Array[Tree[Id]])
  FixedNode(id~ : Id, String, Array[Tree[Id]])
}

///|
pub fn[Id] Tree::get_name(self : Tree[Id]) -> String {
  match self {
    Tree::Item(name, ..) => name
    Tree::Node(name, _, ..) => name
    Tree::FixedNode(name, _, ..) => name
  }
}

///|
pub fn[Id : Compare] view(
  toggle~ : (Id) -> Cmd,
  click~ : (Id) -> Cmd,
  state~ : SortedSet[Id],
  indicator~ : Id,
  icon~ : (Id, Bool) -> Html,
  items : Array[Tree[Id]],
) -> Html {
  fn aux(x) {
    match x {
      Tree::Item(id~, str) => {
        let active = indicator == id
        let font = if active {
          " font-semibold text-gray-900"
        } else {
          " text-gray-700"
        }
        @html.li(
          class="flex items-center gap-2 px-2 py-0.5 rounded-md cursor-pointer hover:bg-gray-200/60 active:bg-gray-200 text-[13px] transition-colors\{font}",
          on_click=click(id),
          [icon(id, false), @html.span([text(str)])],
        )
      }
      Tree::Node(id~, str, children) => {
        let expanded = state.contains(id)
        let active = indicator == id
        let font = if active {
          " font-semibold text-gray-900"
        } else {
          " text-gray-700"
        }
        @html.li([
          div(
            class="group/node flex items-center gap-2 px-2 py-0.5 rounded-md hover:bg-gray-200/60 active:bg-gray-200 text-[13px] transition-colors\{font}",
            [
              div(
                class="shrink-0 flex-1 flex items-center gap-2 cursor-pointer",
                on_click=toggle(id),
                [icon(id, expanded), @html.span(class="truncate", [text(str)])],
              ),
              div(
                class="shrink-0 size-5 flex items-center justify-center rounded opacity-0 group-hover/node:opacity-100 hover:bg-gray-300/60 transition-opacity text-gray-400 hover:text-gray-600 text-xs cursor-pointer",
                on_click=click(id),
                [text("\u{2192}")],
              ),
            ],
          ),
          if expanded {
            ul(
              class="pl-2 ml-[7px] border-l border-gray-200",
              children.map(aux),
            )
          } else {
            nothing
          },
        ])
      }
      Tree::FixedNode(id~, str, children) => {
        let active = indicator == id
        let font = if active {
          " font-semibold text-gray-900"
        } else {
          " text-gray-700"
        }
        fn method_item(child : Tree[Id]) -> Html {
          let (child_id, child_name) = match child {
            Tree::Item(id~, name) => (id, name)
            Tree::Node(id~, name, _) | Tree::FixedNode(id~, name, _) =>
              (id, name)
          }
          let child_active = indicator == child_id
          let child_font = if child_active {
            " font-semibold text-gray-900"
          } else {
            " text-gray-700"
          }
          @html.li(
            class="group/method flex items-center gap-2 px-2 py-0.5 rounded-md cursor-pointer hover:bg-gray-200/60 active:bg-gray-200 text-[13px] transition-colors\{child_font}",
            on_click=click(child_id),
            [
              @html.span(
                class="size-4 shrink-0 flex items-center justify-center text-[10px] text-gray-500 leading-none",
                [text("::")],
              ),
              @html.span(class="group-hover/method:hidden", [text(child_name)]),
              @html.span(class="hidden group-hover/method:inline truncate", [
                text(str + "::" + child_name),
              ]),
            ],
          )
        }

        @html.li([
          div(
            class="flex items-center gap-2 px-2 py-0.5 rounded-md cursor-pointer hover:bg-gray-200/60 active:bg-gray-200 text-[13px] transition-colors\{font}",
            on_click=click(id),
            [icon(id, true), @html.span([text(str)])],
          ),
          ul(class="pl-0", children.map(method_item)),
        ])
      }
    }
  }

  ul(class="select-none space-y-[1px]", items.map(aux))
}
