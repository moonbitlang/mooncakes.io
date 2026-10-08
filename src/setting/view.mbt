///|
using @html {type Html, type Attrs, div, span, h1, h2, p, a, nothing, text}

///|
using @rabbita {type Val}

///|
using @cmd {type Cmd, type Emit, none}

///|
const LinkClass : String = "underline underline-offset-4"

///|
const SettingsPanelClass : String = "divide-y divide-gray-200 overflow-hidden rounded-xl border border-gray-200 bg-white dark:divide-zinc-700 dark:border-zinc-700 dark:bg-zinc-950"

///|
priv struct ApiToken {
  name : String
  token : String
  created_at : String
  revoked : Bool
} derive(Eq, @json.FromJson)

///|
fn user_avatar(user : Json) -> Html {
  let username = value_string(user, "username")
  let avatar = value_string(user, "gh_avatar")
  let initial = if username.offset_of_nth_char(1) is Some(end) {
    username.view(end_offset=end).to_owned().to_upper()
  } else {
    "M"
  }
  @rui.avatar(size=Sm) <| [
    @rui.avatar_fallback(initial),
    if avatar.has_prefix("https://") {
      @rui.avatar_image(src=avatar, alt="")
    } else {
      nothing
    },
  ]
}

///|
priv struct SettingActions {
  user : Json
  busy : Bool
  error : String
} derive(Eq)

///|
priv enum NavbarMsg {
  Logout
  LoggedOut(Int, Json)
  ProfileLoaded(Int, Json)
}

///|
pub fn navbar(
  // FIXME: Rui cannot follow the app's data-theme directly. Remove this prop
  // when it can, rather than wrapping the whole app in a Rui theme.
  // Its interaction stylesheet also needs upstream scoping; it is still global.
  dark~ : Val[Bool],
) -> Val[Html] {
  let (actions, emit) = @rabbita.create_state_with_init(
    init=(emit : Emit[NavbarMsg]) => {
      (
        SettingActions::{ user: null, busy: false, error: "", },
        request(
          "profile",
          null,
          (status, body) => emit(ProfileLoaded(status, body)),
          http_method=Get,
        ),
      )
    },
    update=(current, msg : NavbarMsg, emit) => {
      match msg {
        Logout if !current.busy =>
          (
            { ..current, busy: true, error: "", },
            request("logout", {}, (status, body) => {
              emit(LoggedOut(status, body))
            }),
          )
        LoggedOut(status, body) =>
          if (status >= 200 && status < 300) || status == 401 {
            ({ ..current, user: null, }, @nav.load("/login"))
          } else {
            (
              { ..current, busy: false, error: error_message(status, body), },
              none,
            )
          }
        ProfileLoaded(200, body) =>
          if body is { "data": user, .. } {
            ({ ..current, user, }, none)
          } else {
            (current, none)
          }
        _ => (current, none)
      }
    },
  )
  actions.switch_by(
    by=actions => {
      "\{value_string(actions.user, "username")}:\{actions.busy}:\{actions.error}"
    },
    actions => {
      let username = value_string(actions.user, "username")
      if username == "" {
        return Val::constant(
          a(
            href="/login",
            class="theme-toggle inline-flex items-center justify-center rounded-full px-3 py-1.5 text-sm leading-4 font-medium transition-colors",
            "Sign in",
          ),
        )
      }
      let menu = @rui.dropdown_menu(id="setting-menu", scope => {
        @html.fragment([
          @rui.dropdown_menu_trigger(
            scope,
            variant=Ghost,
            style=["height:1.875rem"],
            disabled=actions.busy,
            aria_label="Account: \{username}",
          ) <| [
            user_avatar(actions.user),
            span(
              class="hidden max-w-32 truncate sm:inline",
              if actions.busy {
                "Signing out…"
              } else {
                username
              },
            ),
          ],
          @rui.dropdown_menu_content(scope, align=End, aria_label="Account") <| [
            @rui.dropdown_menu_item(scope, on_select=@nav.push_url("/settings")) <| [
              @html.img(
                src=@config.user,
                alt="",
                class="ui-icon h-4 w-4 shrink-0",
              ),
              text("Settings"),
            ],
            @rui.dropdown_menu_item(scope, on_select=emit(Logout)) <| [
              @html.img(
                src=@config.asset_url("/log-out.svg"),
                alt="",
                class="ui-icon h-4 w-4 shrink-0",
              ),
              text("Sign out"),
            ],
          ],
        ])
      })
      menu.view2(dark, (menu, dark) => {
        @rui.theme(
          mode=if dark { Dark } else { Light },
          style=[
            "background:transparent;color:inherit;font-family:inherit;--rui-primary:var(--color-yellow-400);--rui-primary-foreground:var(--color-zinc-950)",
          ],
        ) <| [
          menu,
          if actions.error != "" {
            @rui.form_message(actions.error)
          } else {
            nothing
          },
        ]
      })
    },
  )
}

///|
fn feedback(error : String, notice : String) -> Html {
  if error != "" {
    @rui.form_message(id="setting-feedback", error)
  } else if notice != "" {
    @rui.form_description(
      id="setting-feedback",
      attrs=Attrs::build().role("status"),
      notice,
    )
  } else {
    nothing
  }
}

///|
fn field(
  name : String,
  title : String,
  value : String,
  on_change : (String) -> Cmd,
  input_type? : @html.InputType = Text,
  placeholder? : String = "",
  disabled? : Bool = false,
) -> Html {
  let id = "setting-\{name}"
  @rui.form_field(name~, required=true) <| [
    @rui.form_label(for_=id, title),
    @rui.input(
      id~,
      name~,
      value~,
      input_type~,
      required=true,
      disabled~,
      placeholder~,
      class="w-full",
      on_input=on_change,
      on_change~,
    ),
  ]
}

///|
priv enum AuthBusy {
  Idle
  Submitting
  SendingCode
  OpeningGitHub
} derive(Eq)

///|
priv enum AuthResponse {
  Submitted
  CodeSent
  GithubStarted
}

///|
priv struct AuthForm {
  username : String
  email : String
  password : String
  confirm_password : String
  code : String
  busy : AuthBusy
  error : String
  notice : String
} derive(Eq)

///|
priv enum AuthFormMsg {
  UsernameChanged(String)
  EmailChanged(String)
  PasswordChanged(String)
  ConfirmPasswordChanged(String)
  CodeChanged(String)
  Submit
  SendCode
  GitHub
  Response(AuthResponse, Int, Json)
}

///|
fn form_endpoint(kind : @util.AuthFormKind) -> String {
  match kind {
    Login => "login"
    Register => "signup_by_email"
    ResetPassword => "reset_password"
  }
}

///|
fn auth_form(kind : @util.AuthFormKind) -> Val[Html] {
  let (form, emit) = @rabbita.create_state(
    AuthForm::{
      username: "",
      email: "",
      password: "",
      confirm_password: "",
      code: "",
      busy: Idle,
      error: "",
      notice: "",
    },
    update=(model, msg : AuthFormMsg, emit) => {
      if kind is ResetPassword &&
        model.busy != Idle &&
        msg
        is (UsernameChanged(_)
        | EmailChanged(_)
        | PasswordChanged(_)
        | ConfirmPasswordChanged(_)
        | CodeChanged(_)) {
        return (model, none)
      }
      match msg {
        UsernameChanged(value) =>
          ({ ..model, username: value, error: "", notice: "", }, none)
        EmailChanged(value) =>
          ({ ..model, email: value, error: "", notice: "", }, none)
        PasswordChanged(value) =>
          ({ ..model, password: value, error: "", notice: "", }, none)
        ConfirmPasswordChanged(value) =>
          ({ ..model, confirm_password: value, error: "", notice: "", }, none)
        CodeChanged(value) =>
          ({ ..model, code: value, error: "", notice: "", }, none)
        Submit => {
          if model.busy != Idle {
            return (model, none)
          }
          if kind is (Register | ResetPassword) &&
            model.password != model.confirm_password {
            return ({ ..model, error: "The passwords do not match.", }, none)
          }
          let action = form_endpoint(kind)
          let payload : Json = if kind is Login {
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
            { ..model, busy: Submitting, error: "", notice: "", },
            request(action, payload, (status, body) => {
              emit(Response(Submitted, status, body))
            }),
          )
        }
        SendCode => {
          if model.busy != Idle {
            return (model, none)
          }
          if model.email.trim() == "" {
            return (
              { ..model, error: "Enter your email address first.", },
              none,
            )
          }
          (
            { ..model, busy: SendingCode, error: "", notice: "", },
            request(
              "generate_email_verify_code",
              { "email": model.email.trim().to_owned() },
              (status, body) => emit(Response(CodeSent, status, body)),
            ),
          )
        }
        GitHub => {
          if model.busy != Idle {
            return (model, none)
          }
          (
            { ..model, busy: OpeningGitHub, error: "", notice: "", },
            request("github/start", { "mode": "login" }, (status, body) => {
              emit(Response(GithubStarted, status, body))
            }),
          )
        }
        Response(action, status, body) => {
          if status < 200 || status >= 300 {
            return (
              { ..model, busy: Idle, error: error_message(status, body), },
              none,
            )
          }
          let model = { ..model, busy: Idle, error: "", }
          match action {
            Submitted =>
              match kind {
                Login | Register =>
                  (
                    { ..model, password: "", confirm_password: "", code: "", },
                    @nav.load("/settings"),
                  )
                ResetPassword =>
                  (
                    {
                      ..model,
                      password: "",
                      confirm_password: "",
                      code: "",
                      notice: "Password updated. Sign in with your new password.",
                    },
                    @nav.scroll_to_top(),
                  )
              }
            CodeSent =>
              (
                {
                  ..model,
                  notice: "Verification email sent. Check your inbox and spam folder.",
                },
                none,
              )
            GithubStarted => {
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
          }
        }
      }
    },
  )
  form.view(model => {
    let login = kind is Login
    let reset = kind is ResetPassword
    let heading = if login {
      "Welcome back"
    } else if reset {
      "Reset your password"
    } else {
      "Create your account"
    }
    let subtitle = if login {
      "Sign in to manage your MoonBit packages and API tokens."
    } else if reset {
      "Enter the code sent to your account email and choose a new password."
    } else {
      "Publish packages and share what you build with MoonBit."
    }
    let button_label = if login {
      "Sign in"
    } else if reset {
      "Reset password"
    } else {
      "Create account"
    }
    @rui.card(class="mx-auto w-full max-w-md") <| [
      @rui.card_header() <| [
        @rui.card_title(h1(heading)),
        @rui.card_description(subtitle),
      ],
      @rui.card_content(class="flex flex-col gap-6") <| [
        if !reset {
          @rui.button(
            type_="button",
            variant=Outline,
            class="w-full",
            disabled=model.busy != Idle,
            on_click=emit(GitHub),
          ) <| [
            @html.img(
              src=@config.asset_url("/github.svg"),
              alt="",
              class="ui-icon h-4 w-4 shrink-0",
            ),
            text(
              if model.busy == OpeningGitHub {
                "Opening GitHub…"
              } else {
                "Continue with GitHub"
              },
            ),
          ]
        } else {
          nothing
        },
        if !reset {
          @rui.field_separator(
            if login {
              "or use your account"
            } else {
              "or sign up with email"
            },
          )
        } else {
          nothing
        },
        @rui.form(
          action=@config.api_url("/api/v0/\{form_endpoint(kind)}"),
          attrs=Attrs::build()
            .method_("post")
            .aria_busy(if model.busy != Idle { "true" } else { "false" }),
          on_submit=emit(Submit),
        ) <| [
          field(
            "username",
            "Username",
            model.username,
            value => emit(UsernameChanged(value)),
            placeholder="Your username",
            disabled=reset && model.busy != Idle,
          ),
          if !login {
            field(
              "email",
              "Email address",
              model.email,
              value => emit(EmailChanged(value)),
              input_type=Email,
              placeholder="you@example.com",
              disabled=reset && model.busy != Idle,
            )
          } else {
            nothing
          },
          if !login {
            div(class="grid grid-cols-[minmax(0,1fr)_auto] items-end gap-2") <| [
              field(
                "code",
                "Verification code",
                model.code,
                value => emit(CodeChanged(value)),
                placeholder="Enter code",
                disabled=reset && model.busy != Idle,
              ),
              @rui.button(
                type_="button",
                variant=Outline,
                disabled=model.busy != Idle,
                on_click=emit(SendCode),
                if model.busy == SendingCode {
                  "Sending…"
                } else {
                  "Send code"
                },
              ),
            ]
          } else {
            nothing
          },
          field(
            "password",
            if reset {
              "New password"
            } else {
              "Password"
            },
            model.password,
            value => emit(PasswordChanged(value)),
            input_type=Password,
            disabled=reset && model.busy != Idle,
          ),
          if !login {
            field(
              "confirm-password",
              if reset {
                "Confirm new password"
              } else {
                "Confirm password"
              },
              model.confirm_password,
              value => emit(ConfirmPasswordChanged(value)),
              input_type=Password,
              disabled=reset && model.busy != Idle,
            )
          } else {
            nothing
          },
          if login {
            div(
              class="flex justify-end text-sm",
              a(href="/reset-password", class=LinkClass, "Forgot password?"),
            )
          } else {
            nothing
          },
          div(class="flex flex-col gap-3") <| [
            feedback(model.error, model.notice),
            @rui.button(
              type_="submit",
              class="w-full",
              size=Lg,
              disabled=model.busy != Idle,
              if model.busy == Submitting {
                "Please wait…"
              } else {
                button_label
              },
            ),
          ],
        ],
      ],
      @rui.card_footer(class="justify-center") <| [
        @rui.card_description(class="text-center") <| [
          if login {
            text("New to mooncakes.io? ")
          } else {
            text("Already have an account? ")
          },
          a(
            href=if login { "/register" } else { "/login" },
            class=LinkClass,
            if login {
              "Create an account"
            } else {
              "Sign in"
            },
          ),
        ],
      ],
    ]
  })
}

///|
fn account_row(
  icon : Html,
  title : String,
  description : String,
  action? : Html = nothing,
) -> Html {
  div(class="flex flex-wrap items-center gap-4 px-5 py-5 sm:px-6") <| [
    span(
      class="shrink-0 text-gray-900 dark:text-slate-100",
      attrs=Attrs::build().aria_hidden("true"),
      icon,
    ),
    div(class="min-w-0 flex-1") <| [
      @html.h3(class="font-semibold text-gray-900 dark:text-slate-100", title),
      p(
        class="mt-1 break-words text-sm text-gray-600 dark:text-zinc-400",
        description,
      ),
    ],
    action,
  ]
}

///|
priv enum SettingsBusy {
  Idle
  CreatingToken
  OpeningGitHub
  SavingPassword
} derive(Eq)

///|
priv enum SettingsResponse {
  ProfileLoaded
  TokensLoaded
  TokenCreated
  GithubStarted
  PasswordChanged
} derive(Eq)

///|
fn token_row(
  token : ApiToken,
  model : Settings,
  emit : Emit[SettingsMsg],
) -> Html {
  let revealed = model.revealed == token.name
  div(class="space-y-3 px-5 py-5 sm:px-6") <| [
    div(class="flex flex-wrap items-baseline justify-between gap-2") <| [
      @rui.label(class="max-w-full break-all leading-snug", token.name),
      if token.revoked {
        @rui.badge(variant=Destructive, "Revoked")
      } else if token.created_at != "" {
        @rui.form_description(
          "Created \{@util.get_relative_time(token.created_at)}",
        )
      } else {
        nothing
      },
    ],
    div(class="flex flex-col gap-2 sm:flex-row") <| [
      @rui.input(
        read_only=true,
        value=if revealed {
          token.token
        } else {
          "••••••••••••••••••••••••••••••••"
        },
        class="flex-1",
        attrs=Attrs::build()
          .aria_label("API token: \{token.name}")
          .data_set("api-token", "true"),
      ),
      div(class="flex gap-2") <| [
        @rui.button(
          type_="button",
          variant=Outline,
          class="flex-1 sm:flex-none",
          on_click=emit(Reveal(token.name)),
          attrs=Attrs::build().aria_label(
            if revealed {
              "Hide API token \{token.name}"
            } else {
              "Show API token \{token.name}"
            },
          ),
          if revealed {
            "Hide"
          } else {
            "Show"
          },
        ),
        @rui.button(
          type_="button",
          variant=Outline,
          class="flex-1 sm:flex-none",
          on_click=emit(Copy(token)),
          disabled=token.revoked,
          attrs=Attrs::build().aria_label("Copy API token \{token.name}"),
          if model.copied == token.name {
            "Copied"
          } else {
            "Copy"
          },
        ),
      ],
    ],
  ]
}

///|
fn token_section(
  model : Settings,
  emit : Emit[SettingsMsg],
  help : Html,
) -> Html {
  div(class="space-y-3") <| [
    div(class="flex flex-wrap items-center justify-between gap-3") <| [
      div(class="flex items-center gap-1") <| [
        h2(
          class="text-xl font-semibold text-gray-900 dark:text-slate-100",
          "API tokens",
        ),
        help,
      ],
      @rui.button(
        type_="button",
        variant=Outline,
        disabled=model.busy != Idle || model.tokens_loading,
        on_click=emit(OpenToken),
        "New token",
      ),
    ],
    div(class=SettingsPanelClass, attrs=Attrs::build().aria_live("polite")) <| [
      if model.tokens_error != "" {
        div(class="px-5 py-5 sm:px-6") <| [
          @rui.alert(variant=Destructive) <| [
            @rui.alert_description() <| [
              p(model.tokens_error),
              @rui.button(
                type_="button",
                variant=Outline,
                on_click=emit(LoadTokens),
                "Try again",
              ),
            ],
          ],
        ]
      } else if model.tokens_loading || model.tokens.is_empty() {
        p(
          class="px-5 py-5 text-sm text-gray-600 sm:px-6 dark:text-zinc-400",
          if model.tokens_loading {
            "Loading your API tokens…"
          } else {
            "No API tokens yet. Create one to publish your packages."
          },
        )
      } else {
        @html.fragment(model.tokens.map(token => token_row(token, model, emit)))
      },
    ],
  ]
}

///|
fn token_dialog(model : Settings, emit : Emit[SettingsMsg]) -> Html {
  let busy = model.busy == CreatingToken
  @rui.dialog(
    id="token-dialog",
    on_close=_ => emit(CloseToken),
    attrs=Attrs::build().aria_labelledby("token-dialog-title"),
  ) <| [
    @rui.dialog_header() <| [
      @rui.dialog_title(id="token-dialog-title", "Create API token"),
    ],
    @rui.form(
      action=@config.api_url("/api/v0/api_token/create"),
      attrs=Attrs::build().method_("post"),
      on_submit=emit(CreateToken),
    ) <| [
      field(
        "token-name",
        "Token name",
        model.token_name,
        value => emit(TokenNameChanged(value)),
        placeholder="e.g. My laptop or release workflow",
        disabled=busy,
      ),
      feedback(model.token_error, ""),
      @rui.dialog_footer() <| [
        @rui.button(
          type_="button",
          variant=Outline,
          on_click=emit(CloseToken),
          "Cancel",
        ),
        @rui.button(
          type_="submit",
          disabled=busy || model.tokens_loading,
          if busy {
            "Creating…"
          } else {
            "Create token"
          },
        ),
      ],
    ],
  ]
}

///|
priv struct Settings {
  user : Json
  token_name : String
  token_error : String
  busy : SettingsBusy
  error : String
  notice : String
  tokens : Array[ApiToken]
  tokens_loading : Bool
  tokens_error : String
  revealed : String
  copied : String
  current_password : String
  password : String
  confirm_password : String
  password_error : String
} derive(Eq)

///|
priv enum SettingsMsg {
  SetPassword
  OpenPassword
  ClosePassword
  CurrentPasswordChanged(String)
  PasswordChanged(String)
  ConfirmPasswordChanged(String)
  SavePassword
  LoadTokens
  OpenToken
  CloseToken
  CreateToken
  Reveal(String)
  Copy(ApiToken)
  Copied(String, Bool)
  Response(SettingsResponse, Int, Json)
  TokenNameChanged(String)
}

///|
fn password_dialog(model : Settings, emit : Emit[SettingsMsg]) -> Html {
  let has_password = model.user is { "has_password": True, .. }
  let busy = model.busy == SavingPassword
  @rui.dialog(
    id="password-dialog",
    on_close=_ => emit(ClosePassword),
    attrs=Attrs::build()
      .aria_labelledby("password-dialog-title")
      .aria_describedby("password-dialog-description"),
  ) <| [
    @rui.dialog_header() <| [
      @rui.dialog_title(
        id="password-dialog-title",
        if has_password {
          "Change password"
        } else {
          "Set password"
        },
      ),
      @rui.dialog_description(
        id="password-dialog-description",
        "You will need to sign in again after saving your password.",
      ),
    ],
    @rui.form(
      action=@config.api_url("/api/v0/change_password"),
      attrs=Attrs::build().method_("post"),
      on_submit=emit(SavePassword),
    ) <| [
      if has_password {
        field(
          "current-password",
          "Current password",
          model.current_password,
          value => emit(CurrentPasswordChanged(value)),
          input_type=Password,
          disabled=busy,
        )
      } else {
        nothing
      },
      field(
        "new-password",
        "New password",
        model.password,
        value => emit(PasswordChanged(value)),
        input_type=Password,
        disabled=busy,
      ),
      field(
        "confirm-new-password",
        "Confirm new password",
        model.confirm_password,
        value => emit(ConfirmPasswordChanged(value)),
        input_type=Password,
        disabled=busy,
      ),
      feedback(model.password_error, ""),
      @rui.dialog_footer() <| [
        @rui.button(
          type_="button",
          variant=Outline,
          on_click=emit(ClosePassword),
          "Cancel",
        ),
        @rui.button(
          type_="submit",
          disabled=busy,
          if busy {
            "Saving…"
          } else {
            "Save password"
          },
        ),
      ],
    ],
  ]
}

///|
fn settings_page() -> Val[Html] {
  let (settings, emit) = @rabbita.create_state_with_init(
    init=(emit : Emit[SettingsMsg]) => {
      (
        Settings::{
          user: null,
          token_name: "",
          token_error: "",
          busy: Idle,
          error: "",
          notice: "",
          tokens: [],
          tokens_loading: true,
          tokens_error: "",
          revealed: "",
          copied: "",
          current_password: "",
          password: "",
          confirm_password: "",
          password_error: "",
        },
        request(
          "profile",
          null,
          (status, body) => emit(Response(ProfileLoaded, status, body)),
          http_method=Get,
        ),
      )
    },
    update=(model, msg : SettingsMsg, emit) => {
      match msg {
        SetPassword => {
          if model.busy != Idle {
            return (model, none)
          }
          (
            { ..model, busy: OpeningGitHub, error: "", notice: "", },
            request("github/start", { "mode": "set_password" }, (status, body) => {
              emit(Response(GithubStarted, status, body))
            }),
          )
        }
        OpenPassword => (model, @dialog.show("password-dialog"))
        ClosePassword =>
          (
            {
              ..model,
              current_password: "",
              password: "",
              confirm_password: "",
              password_error: "",
            },
            @dialog.close("password-dialog"),
          )
        CurrentPasswordChanged(value) =>
          ({ ..model, current_password: value, password_error: "", }, none)
        PasswordChanged(value) =>
          ({ ..model, password: value, password_error: "", }, none)
        ConfirmPasswordChanged(value) =>
          ({ ..model, confirm_password: value, password_error: "", }, none)
        SavePassword => {
          if model.busy != Idle {
            return (model, none)
          }
          if model.password != model.confirm_password {
            return (
              { ..model, password_error: "The passwords do not match.", },
              none,
            )
          }
          (
            { ..model, busy: SavingPassword, password_error: "", },
            request(
              "change_password",
              {
                "current_password": model.current_password,
                "password": model.password,
              },
              (status, body) => emit(Response(PasswordChanged, status, body)),
            ),
          )
        }
        LoadTokens =>
          (
            { ..model, tokens_loading: true, tokens_error: "", },
            request("api_token/list", {}, (status, body) => {
              emit(Response(TokensLoaded, status, body))
            }),
          )
        OpenToken => (model, @dialog.show("token-dialog"))
        CloseToken =>
          (
            { ..model, token_name: "", token_error: "", },
            @dialog.close("token-dialog"),
          )
        CreateToken => {
          if model.busy != Idle || model.tokens_loading {
            return (model, none)
          }
          let name = model.token_name.trim().to_owned()
          if name == "" {
            return ({ ..model, token_error: "Give this token a name.", }, none)
          }
          (
            {
              ..model,
              busy: CreatingToken,
              token_error: "",
              error: "",
              notice: "",
              copied: "",
            },
            request("api_token/create", { "name": name }, (status, body) => {
              emit(Response(TokenCreated, status, body))
            }),
          )
        }
        Reveal(name) =>
          (
            {
              ..model,
              revealed: if model.revealed == name {
                ""
              } else {
                name
              },
            },
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
        TokenNameChanged(value) =>
          ({ ..model, token_name: value, token_error: "", }, none)
        Response(action, status, body) => {
          if status < 200 || status >= 300 {
            let had_user = !(model.user is Null)
            let model = if status == 401 {
              { ..model, user: null, tokens: [], revealed: "", copied: "", }
            } else {
              model
            }
            if status == 401 && had_user {
              return (
                { ..model, busy: Idle, tokens_loading: false, },
                @nav.load("/login"),
              )
            }
            let message = error_message(status, body)
            if action == PasswordChanged {
              return ({ ..model, busy: Idle, password_error: message, }, none)
            }
            if action == TokenCreated {
              return ({ ..model, busy: Idle, token_error: message, }, none)
            }
            if action == TokensLoaded {
              return (
                { ..model, tokens_loading: false, tokens_error: message, },
                none,
              )
            }
            return ({ ..model, busy: Idle, error: message, }, none)
          }
          let model = if action == TokensLoaded || action == ProfileLoaded {
            model
          } else {
            { ..model, busy: Idle, error: "", }
          }
          match action {
            PasswordChanged =>
              (
                {
                  ..model,
                  current_password: "",
                  password: "",
                  confirm_password: "",
                },
                @nav.load("/login"),
              )
            GithubStarted => {
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
            ProfileLoaded =>
              if body is { "data": user, .. } &&
                value_string(user, "username") != "" {
                (
                  { ..model, user, },
                  @cmd.batch([
                    emit(LoadTokens),
                    if user is { "can_set_password": True, .. } {
                      emit(OpenPassword)
                    } else {
                      none
                    },
                  ]),
                )
              } else {
                (
                  {
                    ..model,
                    error: "Unable to load your account. Reload this page.",
                  },
                  none,
                )
              }
            TokensLoaded =>
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
            TokenCreated =>
              (
                {
                  ..model,
                  token_name: "",
                  notice: "API token created. Copy it into your build system when you are ready.",
                },
                @cmd.batch([emit(CloseToken), emit(LoadTokens)]),
              )
          }
        }
      }
    },
  )
  let token_help = @rui.tooltip(
    id="api-token-help",
    trigger_size=IconSm,
    trigger_attrs=Attrs::build().aria_label("About API tokens"),
    @svg.svg(class="ui-icon", width=16, height=16, view_box="0 0 24 24", [
      @svg.path(
        d="M22 12a10 10 0 1 1-20 0 10 10 0 0 1 20 0Z M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3 M12 17h.01",
        fill="none",
        stroke="#1f1f1f",
        stroke_width=2,
        attrs=@svg.Attrs::build()
          .stroke_linecap("round")
          .stroke_linejoin("round"),
      ),
    ]),
    "Use an API token with the MoonBit build system to publish your packages. Keep tokens private.",
  )
  settings.view2(token_help, (model, token_help) => {
    let username = value_string(model.user, "username")
    if username == "" {
      return div(class="mx-auto max-w-md py-12 text-center") <| [
        h1(
          class="font-title text-3xl font-semibold text-gray-900 dark:text-slate-100",
          "Settings",
        ),
        p(
          class="my-5 text-sm leading-6 text-gray-600 dark:text-zinc-400",
          "Sign in to manage your settings and API tokens.",
        ),
        feedback(model.error, model.notice),
        a(href="/login", class=LinkClass, "Sign in"),
      ]
    }
    let email = value_string(model.user, "email")
    let has_password = model.user is { "has_password": True, .. }
    let can_set_password = model.user is { "can_set_password": True, .. }
    let github = value_string(model.user, "gh_login")
    let github_linked = github != "" ||
      model.user is { "gh_id": Number(_, ..) | String(_), .. }
    div(class="mx-auto max-w-3xl space-y-6") <| [
      div <| [
        h1(
          class="font-title text-3xl font-semibold tracking-tight text-gray-900 dark:text-slate-100",
          "Settings",
        ),
        p(
          class="mt-2 text-sm text-gray-600 dark:text-zinc-400",
          "Manage your password and API tokens.",
        ),
      ],
      feedback(model.error, model.notice),
      div(class="space-y-3") <| [
        h2(
          class="text-xl font-semibold text-gray-900 dark:text-slate-100",
          "Account",
        ),
        div(class=SettingsPanelClass) <| [
          account_row(
            @svg.svg(
              class="ui-icon",
              width=16,
              height=16,
              view_box="0 0 24 24",
              [
                @svg.path(
                  d="M4 4h16a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2Z M22 6l-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 6",
                  fill="none",
                  stroke="#1f1f1f",
                  stroke_width=2,
                  attrs=@svg.Attrs::build()
                    .stroke_linecap("round")
                    .stroke_linejoin("round"),
                ),
              ],
            ),
            "Email",
            if email == "" {
              "Not configured"
            } else {
              email
            },
          ),
          account_row(
            @svg.svg(
              class="ui-icon",
              width=16,
              height=16,
              view_box="0 0 24 24",
              [
                @svg.path(
                  d="M5 11h14a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2Z M7 11V7a5 5 0 0 1 10 0v4",
                  fill="none",
                  stroke="#1f1f1f",
                  stroke_width=2,
                  attrs=@svg.Attrs::build()
                    .stroke_linecap("round")
                    .stroke_linejoin("round"),
                ),
              ],
            ),
            "Password",
            if has_password {
              "Configured"
            } else {
              "Not configured"
            },
            action=if has_password || can_set_password || github_linked {
              @rui.button(
                type_="button",
                variant=Outline,
                disabled=model.busy != Idle,
                on_click=emit(
                  if has_password || can_set_password {
                    OpenPassword
                  } else {
                    SetPassword
                  },
                ),
                if model.busy == OpeningGitHub {
                  "Opening GitHub…"
                } else if has_password {
                  "Change password"
                } else {
                  "Set password"
                },
              )
            } else if email != "" {
              a(href="/reset-password", class=LinkClass, "Set password")
            } else {
              nothing
            },
          ),
          account_row(
            @html.img(
              src=@config.asset_url("/github.svg"),
              alt="",
              class="ui-icon h-4 w-4",
            ),
            "GitHub",
            if github != "" {
              github
            } else if github_linked {
              "Connected"
            } else {
              "Not connected"
            },
          ),
        ],
      ],
      password_dialog(model, emit),
      token_section(model, emit, token_help),
      token_dialog(model, emit),
    ]
  })
}

///|
fn github_failed_page() -> Html {
  div(class="mx-auto max-w-md py-12 text-center") <| [
    h1(
      class="font-title text-3xl font-semibold text-gray-900 dark:text-slate-100",
      "GitHub authorization failed",
    ),
    p(
      class="my-5 text-sm leading-6 text-gray-600 dark:text-zinc-400",
      "GitHub sign-in or connection could not be completed. Return to sign in or settings to try again.",
    ),
    div(class="flex flex-wrap items-center justify-center gap-4") <| [
      a(href="/login", class=LinkClass, "Back to sign in"),
      a(href="/settings", class=LinkClass, "Back to settings"),
    ],
  ]
}

///|
pub fn page(
  kind : @util.SettingPage,
  app_actions~ : Val[Html],
  // FIXME: Rui needs an explicit mode instead of inheriting the app's data-theme.
  // Keep this workaround local so its typography and tokens do not affect old pages.
  dark~ : Val[Bool],
) -> Val[Html] {
  let content = match kind {
    Settings => settings_page()
    Auth(kind) => auth_form(kind)
    GithubFailed => Val::constant(github_failed_page())
  }
  content.view3(app_actions, dark, (content, app_actions, dark) => {
    @view.page(
      header=@view.navbar(right=app_actions),
      main=@rui.theme(
        mode=if dark { Dark } else { Light },
        class="container px-5 py-12 sm:px-6 sm:py-16",
        style=[
          "background:transparent;color:inherit;font-family:inherit;--rui-primary:var(--color-yellow-400);--rui-primary-foreground:var(--color-zinc-950)",
        ],
        content,
      ),
      footer=@view.footer(),
    )
  })
}
