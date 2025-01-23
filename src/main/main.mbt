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
    (GotDocsMsg(msg), Docs(model)) =>
      @docs.update(msg, model) |> update_with(Model::Docs, Message::GotDocsMsg)
    (LinkClicked(request), _) =>
      match request {
        Internal(url) => (@browser.push_url(url.to_string()), model)
        External(url) => (@browser.load(url), model)
      }
    (UrlChanged(url), _) => route(url)
    _ => (@tea.none(), model)
  }
}

///|
fn route(url : @url.Url) -> (@tea.Command[Message], Model) {
  let paths = url.path.split("/").collect()
  match paths {
    ["/"] | [] => @home.load() |> update_with(Model::Home, Message::GotHomeMsg)
    _ => @docs.load(url.path) |> update_with(Model::Docs, Message::GotDocsMsg)
    // _ => (@tea.none(), NotFound)// We need to wait the test files move to other folder
  }
}

///|
fn view(model : Model) -> @html.Html[Message] {
  match model {
    Home(model) => @home.view(model).map(Message::GotHomeMsg)
    Docs(model) => @docs.view(model).map(Message::GotDocsMsg)
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
