///|
enum Message {
  GotHomeMsg(@home.Msg)
  GotPackageMsg(@package.Msg)
  LinkClicked(@browser.UrlRequest)
  UrlChanged(@url.Url)
}

///|
enum Model {
  Home(@home.Model)
  Package(@package.Model)
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
    (GotPackageMsg(msg), Package(model)) =>
      @package.update(msg, model)
      |> update_with(Model::Package, Message::GotPackageMsg)
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
    _ =>
      @package.load(url.path)
      |> update_with(Model::Package, Message::GotPackageMsg)
    // _ => (@tea.none(), NotFound)// We need to wait the test files move to other folder
  }
}

///|
fn view(model : Model) -> @html.Html[Message] {
  match model {
    Home(model) => @home.view(model).map(Message::GotHomeMsg)
    Package(model) => @package.view(model).map(Message::GotPackageMsg)
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
