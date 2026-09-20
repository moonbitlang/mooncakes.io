///|
#cfg(target="js")
fn github_error() -> Bool {
  let url = @url.parse(@dom.window().current_url()) catch { _ => return false }
  url.query.unwrap_or("").split("&").any(part => part == "error=github")
}

///|
// These commands only run in the browser. API-token responses never enter the
// HTTP SSR replay transcript.
#cfg(target="js")
async fn request_value(
  path : String,
  http_method : String,
  body : Json,
) -> (Int, String) {
  let origin = @dom.window().origin()
  let endpoint = @config.api_url("/api/v0/\{path}")
  let url = if endpoint.has_prefix("/") && !endpoint.has_prefix("//") {
    origin + endpoint
  } else if endpoint.has_prefix(origin + "/") {
    endpoint
  } else {
    return (
      0, "{\"detail\":\"Account requests require a same-origin API endpoint.\"}",
    )
  }
  let headers : @async_http.Headers = { "Accept": "application/json" }
  if http_method == "GET" {
    let (response, data) = @async_http.get(url, headers~)
    return (response.code, data.text())
  }
  let csrf_endpoint = @config.api_url("/api/v0/web/auth/csrf")
  let csrf_url = if csrf_endpoint.has_prefix("/") {
    origin + csrf_endpoint
  } else {
    csrf_endpoint
  }
  let (csrf_response, csrf_data) = @async_http.get(csrf_url, headers~)
  let csrf_body = csrf_data.text()
  if csrf_response.code < 200 || csrf_response.code >= 300 {
    return (csrf_response.code, csrf_body)
  }
  let csrf = value_string(response_json(csrf_body), "csrf_token")
  if csrf == "" {
    return (
      0, "{\"detail\":\"Unable to verify this request. Reload the page and try again.\"}",
    )
  }
  headers["X-CSRF-Token"] = csrf
  headers["Content-Type"] = "application/json"
  let (response, data) = @async_http.post(url, body.stringify(), headers~)
  (response.code, data.text())
}

///|
#cfg(target="js")
fn request(
  path : String,
  http_method : String,
  body : Json,
  done : Emit[(Int, String)],
) -> Cmd {
  @rabbita.attempt(
    result => {
      done(
        match result {
          Ok(response) => response
          Err(_) =>
            (
              0, "{\"detail\":\"Unable to connect. Check your connection and try again.\"}",
            )
        },
      )
    },
    () => {
      // Both adapters wrap a native JavaScript Promise. from_async supplies the
      // coroutine context async/http needs; rabbita's wait integrates the result.
      let promise : @js.Promise = @js.Value::cast_from(
        @js_async.Promise::from_async(() => {
          @async.with_timeout(20000, () => {
            request_value(path, http_method, body)
          })
        }),
      ).cast()
      promise.wait().cast()
    },
  )
}

///|
#cfg(target="js")
priv suberror AccountMount {
  Mounted(Cmd, Cmd)
}

///|
#cfg(target="js")
fn mount_loader(
  payload : Error,
  scheduler : &@cmd.Scheduler,
) -> @sub.RunningSub? {
  guard payload is Mounted(command, hidden) else { return None }
  let window = @dom.window()
  let target = window.to_event_target()
  let timer = window.set_timeout(
    () => {
      for
        element in @dom.document()
        .query_selector_all("[data-account-autocomplete]")
        .iter() {
        if element.get_attribute("data-account-autocomplete") is Some(value) {
          element.set_attribute("autocomplete", value)
        }
      }
      scheduler.add(command)
    },
    0,
  )
  // pageshow following pagehide means the browser restored this document.
  let mut was_hidden = false
  let hide : @dom.Listener = _ => {
    was_hidden = true
    for
      element in @dom.document()
      .query_selector_all(
        "[data-api-token], input[type=password], #account-code",
      )
      .iter() {
      if element.to_html_input_element() is Some(input) {
        input.set_value("")
      }
    }
    scheduler.add(hidden)
  }
  let show : @dom.Listener = _ => if was_hidden { scheduler.add(@nav.reload()) }
  target.add_event_listener("pagehide", hide)
  target.add_event_listener("pageshow", show)
  Some({
    unload: _ => {
      window.clear_timeout(timer)
      target.remove_event_listener("pagehide", hide)
      target.remove_event_listener("pageshow", show)
    },
    update_tagger: _ => (),
  })
}

///|
#cfg(target="js")
fn on_mount(command : Cmd, hidden : Cmd) -> @sub.Sub {
  @sub.custom_sub(
    "account:mount",
    Local,
    Mounted(command, hidden),
    SubLoader(mount_loader),
  )
}
