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
  Docs(@docs.Model, path~ : @util.Path)
  NotFound
}

///|
fn update_with[SubModel, SubMsg](
  pair : (@tea.Command[SubMsg], SubModel),
  to_model : (SubModel) -> Model,
  to_msg : (SubMsg) -> Message
) -> (@tea.Command[Message], Model) {
  let (cmd, model) = pair
  (cmd.map(to_msg), to_model(model))
}

///|
fn update(msg : Message, model : Model) -> (@tea.Command[Message], Model) {
  match (msg, model) {
    (GotHomeMsg(msg), Home(model)) =>
      @home.update(msg, model) |> update_with(Model::Home, Message::GotHomeMsg)
    (GotDocsMsg(msg), Docs(model, path~)) =>
      @docs.update(msg, model)
      |> update_with(fn(m) { Docs(m, path~) }, Message::GotDocsMsg)
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@browser.push_url(url.to_string()), model)
        External(url) => (@browser.load(url), model)
      }
    (UrlChanged(url), _) => route(url, model)
    _ => (@tea.none(), model)
  }
}

///|
fn route(url : @url.Url, model : Model) -> (@tea.Command[Message], Model) {
  let paths = url.path.split("/").collect()
  match paths {
    [] => @home.load() |> update_with(Model::Home, Message::GotHomeMsg)
    ["docs", author, name] => {
      let path : @util.Path = { author, name, module_path: "", target: None }
      @docs.init_(path)
      |> update_with(fn(m) { Docs(m, path~) }, Message::GotDocsMsg)
    }
    ["docs", author, name, .. module_path] => {
      let path : @util.Path = {
        author,
        name,
        module_path: module_path.fold(fn(x, y) { x + "/" + y }, init=""),
        target: url.fragment,
      }
      match model {
        Docs(model, path=path_current) =>
          if path_current.module_path == "" {
            @docs.init_(path)
            |> update_with(fn(m) { Docs(m, path~) }, Message::GotDocsMsg)
          } else {
            @docs.go(path, model)
            |> update_with(fn(m) { Docs(m, path~) }, Message::GotDocsMsg)
          }
        _ =>
          @docs.init_(path)
          |> update_with(fn(m) { Docs(m, path~) }, Message::GotDocsMsg)
      }
    }
    _ => (@tea.none(), NotFound)
  }
}

///|
fn view(model : Model) -> @html.Html[Message] {
  match model {
    Home(model) => @home.view(model).map(Message::GotHomeMsg)
    Docs(model, ..) => @docs.view(model).map(Message::GotDocsMsg)
    NotFound => @view.not_found()
  }
}

///|
fn main {
  @tea.application(
    initialize=fn(url) { route(url, NotFound) },
    update~,
    view~,
    url_changed=Message::UrlChanged,
    url_request=Message::LinkClicked,
  )
}
