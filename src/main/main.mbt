///|
enum Message {
  GotHomeMsg(@home.Msg)
  GotDocsMsg(@docs.Msg)
  LinkClicked(@browser.UrlRequest)
  UrlChanged(@url.Url)
}

///|
enum Page {
  Home(@home.Model)
  Docs(@docs.Model)
  NotFound
}

///|
/// notice that the url is not useful for Docs page
/// because doc will cache current module path in its inner model
/// But when we navigate to a module(when we have inline code navigation), the url will be useful
struct Model {
  page : Page
  url : @url.Url
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
    (GotHomeMsg(msg), { page: Home(model), url }) =>
      @home.update(msg, model)
      |> update_with(fn(m) { { page: Home(m), url } }, Message::GotHomeMsg)
    (GotDocsMsg(msg), { page: Docs(model), url }) =>
      @docs.update(msg, model)
      |> update_with(fn(m) { { page: Docs(m), url } }, Message::GotDocsMsg)
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
    [] =>
      @home.load()
      |> update_with(fn(m) { { page: Home(m), url } }, Message::GotHomeMsg)
    ["docs", author, name] => {
      let path : @util.Path = { author, name, module_path: "", target: None }
      @docs.load(path)
      |> update_with(fn(m) { { page: Docs(m), url } }, Message::GotDocsMsg)
    }
    ["docs", author, name, .. module_path] => {
      let path : @util.Path = {
        author,
        name,
        module_path: module_path.iter().join("/"),
        target: url.fragment,
      }
      (match model {
        { page: Docs(model), .. } => @docs.update_sub_page(path, model)
        _ => @docs.load(path)
      })
      |> update_with(fn(m) { { page: Docs(m), url } }, Message::GotDocsMsg)
    }
    _ => (@tea.none(), { page: NotFound, url })
  }
}

///|
fn view(model : Model) -> @html.Html[Message] {
  match model {
    { page: Home(model), .. } => @home.view(model).map(Message::GotHomeMsg)
    { page: Docs(model), .. } => @docs.view(model).map(Message::GotDocsMsg)
    { page: NotFound, .. } => @view.not_found()
  }
}

///|
fn main {
  @tea.application(
    initialize=fn(url) { route(url, { page: NotFound, url }) },
    update~,
    view~,
    url_changed=Message::UrlChanged,
    url_request=Message::LinkClicked,
  )
}
