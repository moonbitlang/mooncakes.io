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
enum Message {
  GotHomeMsg(@home.Msg)
  GotDocsMsg(@docs.Msg)
  LinkClicked(@browser.UrlRequest)
  UrlChanged(@url.Url)
}

///|
enum Model {
  Home(@home.Model)
  Docs(@docs.Model)
  NotFound
  Redirect
}

///|
fn update_with[SubModel, SubMsg](
  pair : (Command[SubMsg], SubModel),
  to_model : (SubModel) -> Model,
  to_msg : (SubMsg) -> Message
) -> (Command[Message], Model) {
  let (cmd, model) = pair
  (cmd.map(to_msg), to_model(model))
}

///|
fn update(msg : Message, model : Model) -> (Command[Message], Model) {
  match (msg, model) {
    (GotHomeMsg(msg), Home(model)) =>
      @home.update(msg, model) |> update_with(Model::Home, Message::GotHomeMsg)
    (GotDocsMsg(msg), Docs(model)) =>
      @docs.update(msg, model) |> update_with(Model::Docs, Message::GotDocsMsg)
    (LinkClicked(request), _) => {
      println(request)
      match request {
        Internal(url) => (@browser.push_url(url.to_string()), model)
        External(url) => (@browser.load(url), model)
      }
    }
    (UrlChanged(url), _) => route(url)
    _ => (none(), model)
  }
}

///|
fn route(url : @url.Url) -> (Command[Message], Model) {
  println(url)
  let paths = url.path.split("/").collect()
  println(paths)
  match paths {
    ["/"] | [] => @home.load() |> update_with(Model::Home, Message::GotHomeMsg)
    ["assets", ..] => (@browser.load(url.to_string()), Redirect)
    ["docs", .. module_path] =>
      module_path.iter().join("/")
      |> @docs.load(url.fragment)
      |> update_with(Model::Docs, Message::GotDocsMsg)
    _ => (none(), NotFound)
  }
}

///|
fn view(model : Model) -> Html[Message] {
  match model {
    Home(model) => @home.view(model).map(Message::GotHomeMsg)
    Docs(model) => @docs.view(model).map(Message::GotDocsMsg)
    NotFound => @view.not_found()
    Redirect => @view.loading()
  }
}

///|
fn main {
  @tea.application(
    initialize=route,
    update~,
    view~,
    url_changed=Message::UrlChanged,
    url_request=Message::LinkClicked,
  )
}
