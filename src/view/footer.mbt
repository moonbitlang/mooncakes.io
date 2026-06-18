///|
pub fn footer() -> Html {
  let class = "hover:text-mooncake2 transition-colors"
  let host = current_host()
  div(
    class="px-6 min-h-28 lg:mx-10 mt-5 py-10 border-t text-gray-600 flex flex-col md:flex-row justify-center gap-4 md:gap-8",
  ) <| [
    p("Powered by MoonBit"),
    a(href="https://github.com/moonbitlang/mooncakes.io", class~, "Site source"),
    a(
      href="https://github.com/moonbitlang/mooncakes.io/issues/new",
      class~,
      "Report issue",
    ),
    a(href=packages_href(host), class~, "Packages"),
    a(href=build_queue_href(host), class~, "Build queue"),
    a(href=skills_href(host), class~, "Skills"),
    a(
      href=@config.api_url("/api/v0/modules/statistics?raw=true"),
      class~,
      escape=true,
      "Statistics",
    ),
    p("© 2026 mooncakes.io"),
  ]
}

///|
fn packages_href(host : String) -> String {
  if host == "skills.mooncakes.io" {
    "https://mooncakes.io/"
  } else {
    "/"
  }
}

///|
fn build_queue_href(host : String) -> String {
  if host == "skills.mooncakes.io" {
    "https://mooncakes.io/build-queue"
  } else {
    "/build-queue"
  }
}

///|
fn skills_href(host : String) -> String {
  if host == "skills.mooncakes.io" {
    "/"
  } else if host == "mooncakes.io" {
    "https://skills.mooncakes.io/"
  } else {
    "/skills"
  }
}

///|
extern "js" fn current_host() -> String =
  #|() => window.location.host
