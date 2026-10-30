///|
pub(all) enum NavbarStyle {
  Sticky
  Static
  Fusion
}

///|
pub(all) enum NavbarSection {
  Modules
  Skills
  BuildQueue
}

///|
fn navigation_link(section : NavbarSection, active : NavbarSection?) -> Html {
  let (label, href) = match section {
    Modules => ("Modules", "/")
    Skills => ("Skills", "/skills")
    BuildQueue => ("Build queue", "/build-queue")
  }
  let selected = match (section, active) {
    (Modules, Some(Modules))
    | (Skills, Some(Skills))
    | (BuildQueue, Some(BuildQueue)) => true
    _ => false
  }
  @rui.navigation_menu_link(
    href~,
    active=selected,
    class="site-nav-link",
    style=[
      "font-family:inherit;height:2rem;padding:0.3125rem 0.75rem;font-size:0.8125rem;font-weight:600;white-space:nowrap",
    ],
    label,
  )
}

///|
pub fn navbar(
  left~ : Html = logo(),
  left_extra? : Html,
  middle? : Html,
  right? : Html,
  style~ : NavbarStyle = Sticky,
  active? : NavbarSection,
) -> Html {
  let class = match style {
    Sticky => "site-navbar site-navbar-glass site-navbar-sticky"
    Static => "site-navbar site-navbar-glass"
    Fusion => "site-navbar"
  }
  @html.header(class~) <| [
    div(class="container site-navbar-inner") <| [
      div(class="site-navbar-brand", left),
      @html.nav(
        class="site-navigation",
        attrs=@html.Attrs::build().aria_label("Main navigation"),
      ) <| [
        navigation_link(Modules, active),
        navigation_link(Skills, active),
        navigation_link(BuildQueue, active),
      ],
      div(class="site-navbar-tools") <| [
        if left_extra is Some(extra) {
          div(class="site-navbar-context", extra)
        } else {
          nothing
        },
        if middle is Some(search) {
          div(class="site-navbar-search", search)
        } else {
          nothing
        },
      ],
      div(class="site-navbar-actions") <| [
        div(class="site-mobile-navigation") <| [
          span(attrs=@html.Attrs::build().aria_hidden("true")) <| [
            @svg.svg(width=18, height=18, view_box="0 0 24 24") <| [
              @svg.path(
                d="M4 6h16M4 12h16M4 18h16",
                fill="none",
                stroke="currentColor",
                stroke_width=2,
                attrs=@svg.Attrs::build().stroke_linecap("round"),
              ),
            ],
          ],
          @html.select(
            class="site-mobile-select",
            title="Switch page",
            attrs=@html.Attrs::build().aria_label("Switch page"),
            on_change=path => @nav.push_url(path),
          ) <| [
            @html.option(
              value="",
              disabled=true,
              selected=active is None,
              "Switch page",
            ),
            @html.option(value="/", selected=active is Some(Modules), "Modules"),
            @html.option(
              value="/skills",
              selected=active is Some(Skills),
              "Skills",
            ),
            @html.option(
              value="/build-queue",
              selected=active is Some(BuildQueue),
              "Build queue",
            ),
          ],
        ],
        search_entry(),
        right.unwrap_or(nothing),
      ],
    ],
  ]
}

///|
pub fn logo() -> Html {
  a(
    class="border-gray-300 dark:border-zinc-700 font-title mx-2 font-semibold flex items-center text-nowrap",
    href="/",
    "🥮 mooncakes.io",
  )
}
