///|
pub fn footer() -> Html {
  let class = "inline-block rounded-sm py-1 hover:text-gray-900 dark:hover:text-slate-100 hover:underline underline-offset-4 focus-visible:outline-2 focus-visible:outline-offset-4"
  let heading_class = "mb-3 font-semibold text-gray-800 dark:text-slate-200"
  @html.footer(class="mt-8 text-sm text-gray-600 dark:text-slate-400") <| [
    div(class="border-t", nothing),
    div(class="container lg:px-4") <| [
      div(class="container px-4 lg:w-4/5") <| [
        div(class="pt-8 pb-6") <| [
          div(
            class="grid gap-x-8 gap-y-6 sm:grid-cols-2 lg:grid-cols-[1fr_1fr_1fr_auto]",
          ) <| [
            @html.section() <| [
              h2(class=heading_class, "MoonBit"),
              ul(class="space-y-2") <| [
                @html.li(
                  a(
                    href="https://www.moonbitlang.com/",
                    class~,
                    "moonbitlang.com",
                  ),
                ),
                @html.li(
                  a(href="https://github.com/moonbitlang", class~, "GitHub"),
                ),
                @html.li(a(href="https://x.com/moonbitlang", class~, "X")),
              ],
            ],
            @html.section() <| [
              h2(class=heading_class, "Resources"),
              ul(class="space-y-2") <| [
                @html.li(
                  a(href="https://docs.moonbitlang.com/", class~, "Docs"),
                ),
                @html.li(
                  a(href="https://www.moonbitlang.com/blog", class~, "Blog"),
                ),
                @html.li(
                  a(
                    href="https://github.com/moonbitlang/mooncakes.io",
                    class~,
                    "Site source",
                  ),
                ),
              ],
            ],
            @html.section() <| [
              h2(class=heading_class, "Policy"),
              ul(class="space-y-2") <| [
                @html.li(
                  a(href="/policies/takedown", class~, "Module takedown"),
                ),
              ],
            ],
            @html.section() <| [
              h2(class=heading_class, "Contact us"),
              ul(class="space-y-2") <| [
                @html.li(
                  a(
                    href="mailto:support@moonbitlang.com",
                    class="\{class} break-words",
                    escape=true,
                    "support@moonbitlang.com",
                  ),
                ),
                @html.li(
                  a(
                    href="https://github.com/moonbitlang/mooncakes.io/issues/new",
                    class~,
                    "Report issue",
                  ),
                ),
              ],
            ],
          ],
          div(
            class="mt-8 flex flex-wrap justify-between gap-x-6 gap-y-2 text-xs text-gray-500 dark:text-slate-400",
          ) <| [
            p("Powered by MoonBit"),
            p("© 2026 mooncakes.io"),
          ],
        ],
      ],
    ],
  ]
}
