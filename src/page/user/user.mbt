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
fn decode_user_profile(json : Json) -> Result[Array[(String, String)], String] {
  match json {
    { "modules": Array(modules), .. } =>
      Ok(
        modules.map(fn(x) {
          match x {
            { "name": String(name), "version": String(version), .. } =>
              (name, version)
            _ => fail("failed to decode \{x}")
          }
        }),
      ) catch {
        e => Err(e.to_string())
      }
    _ => Err("failed to decode json \{json}")
  }
}

///|
enum Msg {
  GotUserProfile(Result[Array[(String, String)], String])
}

///|
struct Model {
  username : String
  modules : Status[Array[(String, String)]]
}

///|
pub fn load(username : String) -> (Cmd[Msg], Model) {
  (
    @http.get(
      "/api/v0/user/\{username}",
      expect=Json(GotUserProfile(_), decode_user_profile),
    ),
    { username, modules: Loading },
  )
}

///|
fnalias @html.(div, h1, h2, p, text, ul, li, nothing, a, span)

///|
fnalias @cmd.none

///|
typealias @cmd.Cmd

///|
typealias @util.Status

///|
pub fn view(model : Model) -> Html[Msg] {
  div(class="min-h-screen w-full flex-col", [
    div(class="flex-1", [
      div(class="container h-full w-full", [
        h1(class="text-4xl py-4 my-4 font-semibold", [text(model.username)]),
        h2(class="text-2xl my-2", [text("Published Modules")]),
        match model.modules {
          Loading => @view.loading()
          Failed => @view.load_failed("modules")
          Success(modules) =>
            ul(
              modules.map(x => li(class="font-mono my-1 flex gap-4", [
                a(href="/docs/\{x.0}", class="text-blue-500", [text(x.0)]),
                span(class="text-gray-600", [text(x.1)]),
              ])),
            )
        },
        div(class="h-50", []),
      ]),
    ]),
  ])
}

///|
pub fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    GotUserProfile(Ok(modules)) =>
      (none(), { ..model, modules: Success(modules) })
    GotUserProfile(Err(msg)) => {
      println(msg)
      (none(), { ..model, modules: Failed })
    }
  }
}
