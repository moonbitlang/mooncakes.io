///|
priv struct ApiToken {
  name : String
  token : String
  created_at : String
  revoked : Bool
} derive(Eq)

///|
priv struct Model {
  username : String
  email : String
  password : String
  confirm_password : String
  reset_verified : Bool
  code : String
  resend_seconds : Int
  redirect_seconds : Int?
  token_name : String
  user : Json
  busy : String
  error : String
  notice : String
  tokens : Array[ApiToken]
  tokens_loading : Bool
  tokens_error : String
  revealed : String
  copied : String
} derive(Eq)

///|
priv enum Msg {
  Started
  FieldChanged(String, String)
  Submit
  ChangeResetAccount
  SendCode
  CountdownTick
  GitHub(String)
  Logout
  LoadProfile
  LoadTokens
  CreateToken
  Reveal(String)
  Copy(ApiToken)
  Copied(String, Bool)
  Response(String, Int, String)
  PageHidden
}

///|
fn value_string(value : Json, key : String) -> String {
  if value is Object(fields) && fields.get(key) is Some(String(value)) {
    value
  } else {
    ""
  }
}

///|
fn response_json(body : String) -> Json {
  @json.parse(body) catch {
    _ => null
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
  guard body is { "tokens": Array(items), .. } else { return None }
  let tokens : Array[ApiToken] = []
  for item in items {
    guard item is { "name": String(name), "token": String(token), .. } else {
      return None
    }
    tokens.push({
      name,
      token,
      created_at: value_string(item, "created_at"),
      revoked: item is { "revoked": True, .. },
    })
  }
  Some(tokens)
}

///|
fn action_request(
  path : String,
  payload : Json,
  action : String,
  emit : Emit[Msg],
) -> Cmd {
  request(path, "POST", payload, pair => emit(Response(action, pair.0, pair.1)))
}

///|
fn Model::clear_verification(self : Model) -> Model {
  { ..self, reset_verified: false, password: "", confirm_password: "", }
}

///|
fn update(
  model : Model,
  msg : Msg,
  emit : Emit[Msg],
  kind : String,
) -> (Model, Cmd) {
  match msg {
    Started => {
      let command = if kind == "profile" {
        if model.user is Null {
          emit(LoadProfile)
        } else {
          emit(LoadTokens)
        }
      } else {
        none
      }
      let model = if github_error() {
        {
          ..model,
          error: "GitHub sign-in did not complete. Try again, or use your username and password.",
        }
      } else {
        model
      }
      (model, command)
    }
    FieldChanged(field, value) => {
      if kind == "forgot-password" && model.busy != "" {
        return (model, none)
      }
      let model = { ..model, error: "", notice: "", copied: "", }
      let model = if kind == "forgot-password" &&
        (field == "username" || field == "email" || field == "code") {
        model.clear_verification()
      } else {
        model
      }
      let model = match field {
        "username" => { ..model, username: value, }
        "email" => { ..model, email: value, }
        "password" => { ..model, password: value, }
        "confirm-password" => { ..model, confirm_password: value, }
        "code" => { ..model, code: value, }
        "token-name" => { ..model, token_name: value, }
        _ => model
      }
      (model, none)
    }
    Submit => {
      if model.busy != "" {
        return (model, none)
      }
      if kind == "forgot-password" && !model.reset_verified {
        return (
          { ..model, busy: "submit", error: "", notice: "", },
          action_request(
            "web/auth/verify-email-code",
            {
              "email": model.email.trim().to_owned(),
              "code": model.code.trim().to_owned(),
            },
            "verify-email-code",
            emit,
          ),
        )
      }
      if kind == "forgot-password" && model.password != model.confirm_password {
        return ({ ..model, error: "The passwords do not match.", }, none)
      }
      let action = if kind == "forgot-password" {
        "reset-password"
      } else {
        kind
      }
      let payload : Json = if kind == "login" {
        {
          "username": model.username.trim().to_owned(),
          "password": model.password,
        }
      } else {
        {
          "username": model.username.trim().to_owned(),
          "email": model.email.trim().to_owned(),
          "password": model.password,
          "code": model.code.trim().to_owned(),
        }
      }
      (
        { ..model, busy: "submit", error: "", notice: "", },
        action_request("web/auth/\{action}", payload, action, emit),
      )
    }
    ChangeResetAccount =>
      if model.busy == "" {
        (
          { ..model.clear_verification(), error: "", notice: "", },
          @nav.scroll_to_top(),
        )
      } else {
        (model, none)
      }
    SendCode => {
      if model.busy != "" || model.resend_seconds > 0 {
        return (model, none)
      }
      if model.email.trim() == "" {
        return ({ ..model, error: "Enter your email address first.", }, none)
      }
      let model = if kind == "forgot-password" {
        model.clear_verification()
      } else {
        model
      }
      (
        { ..model, busy: "code", error: "", notice: "", },
        action_request(
          "web/auth/email-code",
          { "email": model.email.trim().to_owned() },
          "code",
          emit,
        ),
      )
    }
    CountdownTick =>
      if model.redirect_seconds is Some(seconds) {
        (
          { ..model, redirect_seconds: Some((seconds - 1).max(0)), },
          if seconds == 1 {
            @nav.load("/login")
          } else {
            none
          },
        )
      } else {
        ({ ..model, resend_seconds: (model.resend_seconds - 1).max(0), }, none)
      }
    GitHub(mode) => {
      if model.busy != "" {
        return (model, none)
      }
      (
        { ..model, busy: "github", error: "", notice: "", },
        action_request(
          "web/auth/github/start",
          { "mode": mode },
          "github",
          emit,
        ),
      )
    }
    Logout => {
      if model.busy != "" {
        return (model, none)
      }
      (
        {
          ..model,
          busy: "logout",
          tokens: [],
          revealed: "",
          copied: "",
          error: "",
        },
        action_request("web/auth/logout", {}, "logout", emit),
      )
    }
    LoadProfile =>
      (
        model,
        request("profile", "GET", null, pair => {
          emit(Response("profile", pair.0, pair.1))
        }),
      )
    LoadTokens =>
      (
        { ..model, tokens_loading: true, tokens_error: "", },
        action_request("api_token/list", {}, "tokens", emit),
      )
    CreateToken => {
      if model.busy != "" || model.tokens_loading {
        return (model, none)
      }
      let name = model.token_name.trim().to_owned()
      if name == "" {
        return ({ ..model, error: "Give this token a name.", }, none)
      }
      (
        { ..model, busy: "token", error: "", notice: "", copied: "", },
        action_request("api_token/create", { "name": name }, "token", emit),
      )
    }
    Reveal(name) =>
      (
        { ..model, revealed: if model.revealed == name { "" } else { name }, },
        none,
      )
    Copy(token) =>
      (
        model,
        @clipboard.copy(
          Text(token.token),
          copied=emit(Copied(token.name, true)),
          failed=_ => emit(Copied(token.name, false)),
        ),
      )
    Copied(name, ok) =>
      (
        if ok {
          { ..model, copied: name, error: "", }
        } else {
          {
            ..model,
            error: "Copy was blocked by your browser. Show the token and copy it manually.",
          }
        },
        none,
      )
    PageHidden =>
      (
        {
          ..model.clear_verification(),
          busy: "hidden",
          tokens: [],
          revealed: "",
          copied: "",
          code: "",
        },
        none,
      )
    Response(action, status, raw) => {
      if model.busy == "hidden" ||
        (model.busy == "logout" && action != "logout") {
        return (model, none)
      }
      let body = response_json(raw)
      if status < 200 || status >= 300 {
        let had_user = !(model.user is Null)
        let model = if status == 401 {
          { ..model, user: null, tokens: [], revealed: "", copied: "", }
        } else {
          model
        }
        if status == 401 && had_user {
          return (
            {
              ..model.clear_verification(),
              busy: "hidden",
              tokens_loading: false,
              code: "",
            },
            @nav.load("/login"),
          )
        }
        let message = error_message(status, body)
        if action == "tokens" {
          return (
            { ..model, tokens_loading: false, tokens_error: message, },
            none,
          )
        }
        return ({ ..model, busy: "", error: message, }, none)
      }
      let model = if action == "tokens" || action == "profile" {
        model
      } else {
        { ..model, busy: "", error: "", }
      }
      match action {
        "login" | "register" =>
          ({ ..model.clear_verification(), code: "", }, @nav.load("/profile"))
        "logout" =>
          (
            { ..model.clear_verification(), user: null, tokens: [], code: "", },
            @nav.load("/login"),
          )
        "reset-password" =>
          (
            {
              ..model.clear_verification(),
              code: "",
              resend_seconds: 0,
              redirect_seconds: Some(10),
            },
            @nav.scroll_to_top(),
          )
        "verify-email-code" =>
          (
            {
              ..model,
              reset_verified: true,
              notice: "",
              password: "",
              confirm_password: "",
            },
            @nav.scroll_to_top(),
          )
        "code" =>
          (
            {
              ..model,
              resend_seconds: 60,
              notice: "Verification email sent. Check your inbox and spam folder.",
            },
            none,
          )
        "github" => {
          let url = value_string(body, "url")
          if url.has_prefix("https://github.com/login/oauth/authorize?") {
            (model, @nav.load(url))
          } else {
            (
              {
                ..model,
                error: "GitHub sign-in could not be started. Try again.",
              },
              none,
            )
          }
        }
        "profile" =>
          if body is { "data": user, .. } &&
            value_string(user, "username") != "" {
            ({ ..model, user, }, emit(LoadTokens))
          } else {
            (
              {
                ..model,
                error: "Unable to load your account. Reload this page.",
              },
              none,
            )
          }
        "tokens" =>
          if decode_tokens(body) is Some(tokens) {
            (
              { ..model, tokens, tokens_loading: false, tokens_error: "", },
              none,
            )
          } else {
            (
              {
                ..model,
                tokens_loading: false,
                tokens_error: "Unable to read your API tokens. Try again.",
              },
              none,
            )
          }
        "token" =>
          (
            {
              ..model,
              token_name: "",
              notice: "API token created. Copy it into your build system when you are ready.",
            },
            emit(LoadTokens),
          )
        _ => (model, none)
      }
    }
  }
}
