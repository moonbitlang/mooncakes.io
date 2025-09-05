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
typealias @html.Html

///|
typealias @immut/sorted_set.SortedSet as Set

///|
fnalias @html.(div, text, ul)

///|
pub(all) enum Tree[Id] {
  Item(id~ : Id, String)
  Node(id~ : Id, String, Array[Tree[Id]])
}

///|
pub fn[Id] get_name(self : Tree[Id]) -> String {
  match self {
    Tree::Item(name, ..) => name
    Tree::Node(name, _, ..) => name
  }
}

///|
pub fn[M, Id : Compare] view(
  toggle~ : (Id) -> M,
  click~ : (Id) -> M,
  state~ : Set[Id],
  indicator~ : Id,
  items : Array[Tree[Id]],
) -> Html[M] {
  fn aux(x) {
    match x {
      Tree::Item(id~, str) => {
        let indicator = if indicator == id {
          div(class="bg-yellow-500 w-[0.2em] h-5 rounded mr-2", [])
        } else {
          div(class="w-1 h-5 mr-2", [])
        }
        div(
          class="hover:bg-gray-100 px-2 py-1 rounded text-sm flex",
          click=click(id),
          [indicator, text(str)],
        )
      }
      Tree::Node(id~, str, children) => {
        let collapsed = "border-t-[4px] border-t-transparent border-l-[6px] border-l-gray-400 border-b-[4px] border-b-transparent"
        let expanded = collapsed + " rotate-90 "
        let (body_style, icon) = if state.contains(id) {
          ("max-h-[9999px]", expanded)
        } else {
          ("max-h-0", collapsed)
        }
        div([
          div(
            class="relative transition hover:bg-gray-100 px-2 py-1 rounded text-sm flex",
            click=toggle(id),
            [
              div(
                class="absolute w-0 h-0 self-center mr-1 transition-transform \{icon}",
                [],
              ),
              div(class="pl-3", [text(str)]),
            ],
          ),
          div(
            class="pl-2 overflow-hidden duration-400 transition-[max-height] \{body_style}",
            [ul(children.map(aux))],
          ),
        ])
      }
    }
  }

  ul(class="select-none", items.map(aux))
}
