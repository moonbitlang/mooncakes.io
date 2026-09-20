///|
const PrimaryColors : String = "--rui-primary:var(--color-yellow-400);--rui-primary-foreground:var(--color-zinc-950)"

///|
const LinkClass : String = "underline underline-offset-4"

///|
fn user_avatar(user : Json, large? : Bool = false) -> Html {
  let username = value_string(user, "username")
  let avatar = value_string(user, "gh_avatar")
  let initial = if username.offset_of_nth_char(1) is Some(end) {
    username.view(end_offset=end).to_owned().to_upper()
  } else {
    "M"
  }
  @rui.avatar(size=if large { Lg } else { Default }) <| [
    @rui.avatar_fallback(initial),
    if avatar.has_prefix("https://") {
      @rui.avatar_image(src=avatar, alt="")
    } else {
      nothing
    },
  ]
}

///|
priv struct AccountActions {
  user : Json
  busy : Bool
  error : String
} derive(Eq)

///|
pub fn navbar(initial_user : Json, dark~ : Val[Bool]) -> Val[Html] {
  let (actions, emit) = @rabbita.create_state(
    AccountActions::{ user: initial_user, busy: false, error: "", },
    update=(current, msg : Msg, emit) => {
      match msg {
        Logout if !current.busy =>
          (
            { ..current, busy: true, error: "", },
            action_request("web/auth/logout", {}, "logout", emit),
          )
        Response("logout", status, raw) =>
          if (status >= 200 && status < 300) || status == 401 {
            ({ ..current, user: null, }, @nav.load("/login"))
          } else {
            (
              {
                ..current,
                busy: false,
                error: error_message(status, response_json(raw)),
              },
              none,
            )
          }
        Response("profile", 200, raw) =>
          if response_json(raw) is { "data": user, .. } {
            ({ ..current, user, }, none)
          } else {
            (current, none)
          }
        _ => (current, none)
      }
    },
    subscriptions=(_actions, emit) => {
      on_mount(
        if initial_user is Null {
          request("profile", "GET", null, pair => {
            emit(Response("profile", pair.0, pair.1))
          })
        } else {
          none
        },
        none,
      )
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
            class="theme-toggle inline-flex items-center justify-center rounded-full px-3 py-1.5 text-sm font-medium transition-colors",
            "Sign in",
          ),
        )
      }
      let (count, emit) = @rabbita.create_state(1, update=(_, _, _) => ...)
      count.map(n => @rui.dialog())
      let menu = @rui.dropdown_menu(id="account-menu", scope => {
        @html.fragment([
          @rui.dropdown_menu_trigger(
            scope,
            variant=Ghost,
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
            @rui.dropdown_menu_item(scope, on_select=@nav.push_url("/profile")) <| [
              @html.img(
                src=@config.user,
                alt="",
                class="ui-icon h-4 w-4 shrink-0",
              ),
              text("Profile"),
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
          style=["background:transparent"],
          [
            menu,
            if actions.error != "" {
              @rui.form_message(actions.error)
            } else {
              nothing
            },
          ],
        )
      })
    },
  )
}

///|
fn feedback(model : Model) -> Html {
  if model.error != "" {
    @rui.form_message(id="account-feedback", model.error)
  } else if model.notice != "" {
    @rui.form_description(
      id="account-feedback",
      attrs=Attrs::build().role("status"),
      model.notice,
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
  emit : Emit[Msg],
  input_type? : @html.InputType = Text,
  autocomplete? : String = "off",
  hint? : String = "",
  placeholder? : String = "",
  disabled? : Bool = false,
) -> Html {
  let id = "account-\{name}"
  let attrs = Attrs::build().data_set("account-autocomplete", autocomplete)
  if autocomplete == "new-password" {
    ignore(attrs.minlength(8))
  }
  if hint != "" {
    ignore(attrs.aria_describedby("\{id}-hint"))
  }
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
      attrs~,
      on_input=value => emit(FieldChanged(name, value)),
      on_change=value => emit(FieldChanged(name, value)),
    ),
    if hint != "" {
      @rui.form_description(id="\{id}-hint", hint)
    } else {
      nothing
    },
  ]
}

///|
fn auth_form(kind : String, model : Model, emit : Emit[Msg]) -> Html {
  if model.redirect_seconds is Some(seconds) {
    return @rui.card(class="mx-auto w-full max-w-md") <| [
      @rui.card_header() <| [
        @rui.card_title(h1("Password updated.")),
        @rui.card_description("You can now sign in with your new password."),
      ],
      @rui.card_content(class="flex flex-col gap-6") <| [
        @rui.form_description(
          attrs=Attrs::build().role("status"),
          if seconds > 0 {
            "Redirecting to sign in in \{seconds}s."
          } else {
            "Redirecting…"
          },
        ),
        @rui.button(
          type_="button",
          class="w-full",
          size=Lg,
          on_click=@nav.load("/login"),
          "Sign in",
        ),
      ],
    ]
  }
  let login = kind == "login"
  let reset = kind == "forgot-password"
  let verified = reset && model.reset_verified
  let heading = if login {
    "Welcome back"
  } else if reset {
    "Reset your password"
  } else {
    "Create your account"
  }
  let subtitle = if login {
    "Sign in to manage your MoonBit packages and API tokens."
  } else if verified {
    "Email verified. Choose a new password."
  } else if reset {
    "Verify your account email to choose a new password."
  } else {
    "Publish packages and share what you build with MoonBit."
  }
  let button_label = if login {
    "Sign in"
  } else if reset && !verified {
    "Verify code"
  } else if reset {
    "Reset password"
  } else {
    "Create account"
  }
  let action = if reset {
    if verified {
      "reset-password"
    } else {
      "verify-email-code"
    }
  } else {
    kind
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
          disabled=model.busy != "",
          on_click=emit(GitHub("login")),
        ) <| [
          @html.img(
            src=@config.asset_url("/github.svg"),
            alt="",
            class="ui-icon h-4 w-4 shrink-0",
          ),
          text(
            if model.busy == "github" {
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
        @rui.field_separator("or use your account")
      } else {
        nothing
      },
      @rui.form(
        action=@config.api_url("/api/v0/web/auth/\{action}"),
        attrs=Attrs::build()
          .method_("post")
          .aria_busy(if model.busy != "" { "true" } else { "false" }),
        on_submit=emit(Submit),
      ) <| [
        if verified {
          @rui.form_description(
            "Resetting password for \{model.username} (\{model.email}).",
          )
        } else {
          field(
            "username",
            "Username",
            model.username,
            emit,
            autocomplete="username",
            placeholder="Your username",
            disabled=reset && model.busy != "",
          )
        },
        if !login && !verified {
          field(
            "email",
            "Email address",
            model.email,
            emit,
            input_type=Email,
            autocomplete="email",
            placeholder="you@example.com",
            disabled=reset && model.busy != "",
          )
        } else {
          nothing
        },
        if !login && !verified {
          div(class="space-y-3") <| [
            field(
              "code",
              "Verification code",
              model.code,
              emit,
              autocomplete="one-time-code",
              placeholder="Code from your email",
              disabled=reset && model.busy != "",
            ),
            @rui.button(
              type_="button",
              variant=Outline,
              class="w-full",
              disabled=model.busy != "" || model.resend_seconds > 0,
              on_click=emit(SendCode),
              if model.busy == "code" {
                "Sending email…"
              } else if model.resend_seconds > 0 {
                "Resend in \{model.resend_seconds}s"
              } else {
                "Send verification code"
              },
            ),
          ]
        } else {
          nothing
        },
        if !reset || verified {
          field(
            "password",
            if reset {
              "New password"
            } else {
              "Password"
            },
            model.password,
            emit,
            input_type=Password,
            autocomplete=if login { "current-password" } else { "new-password" },
            hint=if login { "" } else { "Use at least 8 characters." },
            disabled=reset && model.busy != "",
          )
        } else {
          nothing
        },
        if verified {
          field(
            "confirm-password",
            "Confirm new password",
            model.confirm_password,
            emit,
            input_type=Password,
            autocomplete="new-password",
            disabled=model.busy != "",
          )
        } else {
          nothing
        },
        if verified {
          @rui.button(
            type_="button",
            variant=Ghost,
            class="self-start",
            disabled=model.busy != "",
            on_click=emit(ChangeResetAccount),
            "Change account or email",
          )
        } else {
          nothing
        },
        if login {
          div(
            class="flex justify-end text-sm",
            a(href="/forgot-password", class=LinkClass, "Forgot password?"),
          )
        } else {
          nothing
        },
        div(class="flex flex-col gap-3") <| [
          feedback(model),
          @rui.button(
            type_="submit",
            class="w-full",
            size=Lg,
            disabled=model.busy != "",
            if model.busy == "submit" {
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
}

///|
fn profile_detail(title : String, value : String) -> Html {
  div(class="py-3") <| [
    @html.dt(
      class="text-xs font-medium text-gray-500 dark:text-zinc-400",
      title,
    ),
    @html.dd(
      class="mt-1 break-words text-sm text-gray-900 dark:text-slate-100",
      if value == "" {
        "Not set"
      } else {
        value
      },
    ),
  ]
}

///|
fn token_row(token : ApiToken, model : Model, emit : Emit[Msg]) -> Html {
  let revealed = model.revealed == token.name
  div(class="space-y-3") <| [
    div(class="flex flex-wrap items-baseline justify-between gap-2") <| [
      @rui.label(token.name),
      if token.revoked {
        @rui.badge(variant=Destructive, "Revoked")
      } else if token.created_at != "" {
        @rui.form_description("Created \{token.created_at}")
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
fn token_section(model : Model, emit : Emit[Msg]) -> Html {
  @rui.card() <| [
    @rui.card_header() <| [
      @rui.card_title(h2("API tokens")),
      @rui.card_description(
        "Use an API token with the MoonBit build system to publish your packages. Keep tokens private.",
      ),
    ],
    @rui.card_content(class="flex flex-col gap-6") <| [
      @rui.form(
        action=@config.api_url("/api/v0/api_token/create"),
        attrs=Attrs::build().method_("post"),
        on_submit=emit(CreateToken),
      ) <| [
        div(class="flex flex-col gap-3 sm:flex-row sm:items-end") <| [
          div(
            class="min-w-0 flex-1",
            field(
              "token-name",
              "Token name",
              model.token_name,
              emit,
              placeholder="e.g. My laptop or release workflow",
            ),
          ),
          @rui.button(
            type_="submit",
            class="shrink-0",
            disabled=model.busy != "" || model.tokens_loading,
            if model.busy == "token" {
              "Creating…"
            } else {
              "Create token"
            },
          ),
        ],
      ],
      @rui.separator(),
      div(attrs=Attrs::build().aria_live("polite")) <| [
        if model.tokens_error != "" {
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
          ]
        } else if model.tokens_loading {
          @rui.form_description("Loading your API tokens…")
        } else if model.tokens.is_empty() {
          @rui.form_description(
            "No API tokens yet. Name your first token above to get started.",
          )
        } else {
          div(
            class="flex flex-col gap-5",
            model.tokens.map(token => token_row(token, model, emit)),
          )
        },
      ],
    ],
  ]
}

///|
fn profile_page(model : Model, emit : Emit[Msg]) -> Html {
  let username = value_string(model.user, "username")
  if username == "" {
    return div(class="mx-auto max-w-md py-12 text-center") <| [
      h1(
        class="font-title text-3xl font-semibold text-gray-900 dark:text-slate-100",
        "Your account",
      ),
      p(
        class="my-5 text-sm leading-6 text-gray-600 dark:text-zinc-400",
        "Sign in to view your profile and manage API tokens.",
      ),
      feedback(model),
      a(href="/login", class=LinkClass, "Sign in"),
    ]
  }
  let github = value_string(model.user, "gh_login")
  let github_linked = github != "" ||
    model.user is { "gh_id": Number(_, ..) | String(_), .. }
  div(class="mx-auto max-w-5xl space-y-6") <| [
    div(class="flex flex-wrap items-end justify-between gap-4") <| [
      div <| [
        h1(
          class="font-title text-3xl font-semibold tracking-tight text-gray-900 dark:text-slate-100",
          "Your account",
        ),
        p(
          class="mt-2 text-sm text-gray-600 dark:text-zinc-400",
          "Your profile and the tokens you use to publish.",
        ),
      ],
      @rui.button(
        type_="button",
        variant=Outline,
        disabled=model.busy != "",
        on_click=emit(Logout),
        if model.busy == "logout" {
          "Signing out…"
        } else {
          "Sign out"
        },
      ),
    ],
    feedback(model),
    div(class="grid items-start gap-6 lg:grid-cols-[280px_minmax(0,1fr)]") <| [
      @rui.card() <| [
        @rui.card_header() <| [
          @rui.card_title(
            div(class="flex items-center gap-3") <| [
              user_avatar(model.user, large=true),
              h2(username),
            ],
          ),
          @rui.card_description(
            a(href="/user/\{username}", class=LinkClass, "View public profile"),
          ),
        ],
        @rui.card_content() <| [
          @html.dl() <| [
            profile_detail("Email", value_string(model.user, "email")),
            profile_detail(
              "GitHub",
              if github == "" && github_linked {
                "Connected"
              } else {
                github
              },
            ),
          ],
        ],
        if !github_linked {
          @rui.card_footer(
            @rui.button(
              type_="button",
              variant=Outline,
              class="w-full",
              disabled=model.busy != "",
              on_click=emit(GitHub("link")),
              if model.busy == "github" {
                "Opening GitHub…"
              } else {
                "Connect GitHub"
              },
            ),
          )
        } else {
          nothing
        },
      ],
      token_section(model, emit),
    ],
  ]
}

///|
pub fn page(
  kind : String,
  initial_user : Json,
  app_actions : Val[Html],
  dark~ : Val[Bool],
) -> Val[Html] {
  let kind = kind.trim_start(chars="/").to_owned()
  let (model, emit) = @rabbita.create_state(
    Model::{
      username: "",
      email: "",
      password: "",
      confirm_password: "",
      reset_verified: false,
      code: "",
      resend_seconds: 0,
      redirect_seconds: None,
      token_name: "",
      user: initial_user,
      busy: "",
      error: "",
      notice: "",
      tokens: [],
      tokens_loading: kind == "profile",
      tokens_error: "",
      revealed: "",
      copied: "",
    },
    update=(model, msg, emit) => update(model, msg, emit, kind),
    subscriptions=(model, emit) => {
      @sub.batch([
        on_mount(emit(Started), emit(PageHidden)),
        if (model.resend_seconds > 0 || model.redirect_seconds.unwrap_or(0) > 0) &&
          model.busy != "hidden" {
          @sub.every(1000, emit(CountdownTick))
        } else {
          @sub.none
        },
      ])
    },
  )
  model.view3(app_actions, dark, (model, app_actions, dark) => {
    @view.page(
      header=@view.navbar(right=app_actions),
      main=@rui.theme(
        mode=if dark { Dark } else { Light },
        class="w-full",
        style=[PrimaryColors, "background:transparent"],
        div(class="container px-5 py-12 sm:px-6 sm:py-16") <| [
          if kind == "profile" {
            profile_page(model, emit)
          } else {
            auth_form(kind, model, emit)
          },
        ],
      ),
      footer=@view.footer(),
    )
  })
}
