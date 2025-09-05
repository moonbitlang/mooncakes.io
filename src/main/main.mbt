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
enum Msg {
  GotHomeMsg(@home.Msg)
  GotDocsMsg(@docs.Msg)
  GotStatisticsMsg(@statistics.Msg)
  LinkClicked(@url.UrlRequest)
  UrlChanged(@url.Url)
}

///|
enum Model {
  Home(@home.Model)
  Docs(@docs.Model)
  Statistics(@statistics.Model)
  NotFound
  Redirect
}

///|
fn[SubModel, SubMsg] update_with(
  pair : (Cmd[SubMsg], SubModel),
  to_model : (SubModel) -> Model,
  to_msg : (SubMsg) -> Msg,
) -> (Cmd[Msg], Model) {
  let (cmd, model) = pair
  (cmd.map(to_msg), to_model(model))
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match (msg, model) {
    (GotHomeMsg(msg), Home(model)) =>
      @home.update(msg, model) |> update_with(Home(_), GotHomeMsg(_))
    (GotDocsMsg(msg), Docs(model)) =>
      @docs.update(msg, model) |> update_with(Docs(_), GotDocsMsg(_))
    (GotStatisticsMsg(msg), Statistics(model)) =>
      @statistics.update(msg, model)
      |> update_with(Statistics(_), GotStatisticsMsg(_))
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@nav.push_url(url.to_string()), model)
        External(url) => (@nav.load(url), model)
      }
    (UrlChanged(url), _) => route(url)
    _ => (none(), model)
  }
}

///|
fn route(url : @url.Url) -> (Cmd[Msg], Model) {
  let paths = url.path.split("/").collect()
  match paths {
    ["/"] | [""] | [] => @home.load() |> update_with(Home(_), GotHomeMsg(_))
    ["statistics", ..] =>
      @statistics.load() |> update_with(Statistics(_), GotStatisticsMsg(_))
    ["assets", ..] => (@nav.load(url.to_string()), Redirect)
    ["docs", .. module_path] =>
      module_path.iter().map(@string.View::to_string).join("/")
      |> @docs.load(url.fragment)
      |> update_with(Docs(_), GotDocsMsg(_))
    _ => (none(), NotFound)
  }
}

///|
fn view(model : Model) -> Html[Msg] {
  match model {
    Home(model) => @home.view(model).map(GotHomeMsg(_))
    Docs(model) => @docs.view(model).map(GotDocsMsg(_))
    Statistics(model) => @statistics.view(model).map(GotStatisticsMsg(_))
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
    url_changed=UrlChanged(_),
    url_request=LinkClicked(_),
  )
}
