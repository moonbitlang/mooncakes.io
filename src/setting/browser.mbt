///|
fn value_string(value : Json, key : String) -> String {
  if value is Object(fields) && fields.get(key) is Some(String(value)) {
    value
  } else {
    ""
  }
}

///|
fn error_message(status : Int, body : Json) -> String {
  let detail = value_string(body, "detail")
  if detail != "" {
    detail
  } else if body is { "detail": Array(details), .. } {
    let messages = details.map(item => value_string(item, "msg"))
    messages.filter(message => message != "").join(". ")
  } else if status == 401 {
    "Your session has expired. Sign in to continue."
  } else if status == 429 {
    "Too many attempts. Wait a moment and try again."
  } else {
    "This request could not be completed. Please try again."
  }
}

///|
fn decode_tokens(body : Json) -> Array[ApiToken]? {
  guard body is { "tokens": items, .. } else { return None }
  Some(@json.from_json(items)) catch {
    _ => None
  }
}

///|
// FIXME: @http.expect_json drops the HTTP status and non-2xx JSON body.
// Replace this experimental command extension when the HTTP API can preserve
// both, so account requests can handle 401 and display backend validation errors.
extenum @cmd.Extension += {
  SettingRequest(String, Json, @async_http.RequestMethod, (Int, Json) -> Cmd)
}

///|
// Preserve status and validation JSON, which @http.expect_json discards on errors.
// Private responses are never recorded in the SSR transcript.
let setting_request : @cmd.Op = @cmd.Op()
  ..on_settle((_, _) => Async(() => raise @cmd.HydrateExn::Fallback))
  ..on_invoke((extension, context) => {
    guard extension is SettingRequest(path, body, http_method, on_response) else {
      raise @cmd.Unhandled::Unhandled
    }
    let origin = context.get_origin()
    Async(() => {
      let endpoint = @config.api_url("/api/v0/\{path}")
      let url = if endpoint.has_prefix("/") && !endpoint.has_prefix("//") {
        origin + endpoint
      } else if endpoint.has_prefix(origin + "/") {
        endpoint
      } else {
        return on_response(0, {
          "detail": "Account requests require a same-origin API endpoint.",
        })
      }
      @async.with_timeout(20000, () => {
        let headers : @async_http.Headers = { "Accept": "application/json" }
        if http_method != Get {
          headers["Content-Type"] = "application/json"
        }
        let data = if http_method == Get { "" } else { body.stringify() }
        let (response, body) = @async_http.request(
          url, http_method, headers, data,
        )
        on_response(response.code, body.json())
      }) catch {
        error if @async.is_being_cancelled() => raise error
        _ =>
          on_response(0, {
            "detail": "Unable to connect. Check your connection and try again.",
          })
      }
    })
  })

///|
fn request(
  path : String,
  body : Json,
  on_response : (Int, Json) -> Cmd,
  http_method? : @async_http.RequestMethod = Post,
) -> Cmd {
  setting_request.request(SettingRequest(path, body, http_method, on_response))
}
