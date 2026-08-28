///|
fn footer_content(lang : @i18n.Lang) -> Html {
  let class = "hover:text-mooncake2 transition-colors"
  div(
    class="px-6 min-h-28 lg:mx-10 mt-5 py-10 border-t text-gray-600 dark:text-slate-400 flex flex-col items-center gap-4",
  ) <| [
    div(class="flex flex-col md:flex-row justify-center gap-4 md:gap-8") <| [
      p(lang.select(en="Powered by MoonBit", zh="由 MoonBit 提供支持")),
      a(
        href="https://github.com/moonbitlang/mooncakes.io",
        class~,
        lang.select(en="Site source", zh="网站源码"),
      ),
      a(
        href="https://github.com/moonbitlang/mooncakes.io/issues/new",
        class~,
        lang.select(en="Report issue", zh="反馈问题"),
      ),
      a(
        href=packages_href(),
        class~,
        lang.select(en="Packages", zh="软件包"),
      ),
      a(
        href=build_queue_href(),
        class~,
        lang.select(en="Build queue", zh="构建队列"),
      ),
      a(href=skills_href(), class~, lang.select(en="Skills", zh="技能")),
      a(
        href=@config.api_url("/api/v0/modules/statistics?raw=true"),
        class~,
        escape=true,
        lang.select(en="Statistics", zh="统计"),
      ),
      p("© 2026 mooncakes.io"),
    ],
    match lang {
      En => nothing
      Zh =>
        div(
          class="text-xs text-gray-500 dark:text-slate-500 flex flex-col sm:flex-row items-center justify-center gap-2 sm:gap-4",
        ) <| [
          a(href=icp_filing_href(), class~, "粤ICP备2020119212号"),
          a(
            href=public_security_filing_href(),
            class~,
            "粤公网安备44030002004653",
          ),
        ]
    },
  ]
}

///|
pub fn footer(lang : @i18n.Lang) -> Html {
  footer_content(lang)
}

///|
fn packages_href() -> String {
  "https://mooncakes.io/"
}

///|
fn build_queue_href() -> String {
  "https://mooncakes.io/build-queue"
}

///|
fn skills_href() -> String {
  "https://skills.mooncakes.io/"
}

///|
fn icp_filing_href() -> String {
  "https://beian.miit.gov.cn/"
}

///|
fn public_security_filing_href() -> String {
  "https://beian.mps.gov.cn/#/query/webSearch?code=44030002004653"
}
