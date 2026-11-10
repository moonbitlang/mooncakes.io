///|
pub fn takedown_policy_page(
  app_actions~ : @rabbita.Val[@html.Html],
) -> @rabbita.Val[@html.Html] {
  let policy : @rabbita.Resource[String] = @rabbita.create_resource(inject => {
    @http.get(@config.asset_url("/policies/takedown.md")).expect_text(inject)
  })
  policy.view2(app_actions, (status, actions) => {
    let title = @html.h1("Module takedown policy")
    let content = match status {
      Pending =>
        @html.div() <| [
          title,
          @html.p(
            attrs=@html.Attrs::build().role("status"),
            "Loading module takedown policy…",
          ),
        ]
      Loaded(markdown) => @view.markdown(markdown)
      Failed(_) =>
        @html.div() <| [
          title,
          @html.p(
            attrs=@html.Attrs::build().role("alert"),
            "The module takedown policy could not be loaded.",
          ),
          @html.div(class="mt-3 flex flex-wrap gap-x-4 gap-y-2") <| [
            @html.a(href="/policies/takedown", escape=true, "Reload policy"),
            @html.a(
              href="mailto:support@moonbitlang.com",
              escape=true,
              "support@moonbitlang.com",
            ),
          ],
        ]
    }
    @view.page(
      header=@view.navbar(right=actions),
      main=@html.main_(class="container px-4 py-10 lg:w-4/5 sm:py-14") <| [
        @html.article(class="mx-auto max-w-3xl", content),
      ],
    )
  })
}
