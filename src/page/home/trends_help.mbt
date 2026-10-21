///|
fn trends_help() -> Val[Html] {
  @rui.tooltip(
    id="home-trends-help",
    trigger_size=IconSm,
    trigger_attrs=@html.Attrs::build().aria_label("About Trends"),
    trigger_style=["width:1.5rem;height:1.5rem;color:inherit"],
    side=Bottom,
    align=End,
    close_on_click=false,
    on_trigger_click=@rui.tooltip_open("home-trends-help"),
    @svg.svg(width=16, height=16, view_box="0 0 24 24") <| [
      @svg.path(
        d="M22 12a10 10 0 1 1-20 0 10 10 0 0 1 20 0Z M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3 M12 17h.01",
        fill="none",
        stroke="currentColor",
        stroke_width=2,
        attrs=@svg.Attrs::build()
          .stroke_linecap("round")
          .stroke_linejoin("round"),
      ),
    ],
    "Downloads in the last 7 days, highest first.",
  )
}
