///|
fn view_menu() -> @html.Html[Message] {
  div(class="flex min-h-screen flex-col", [
    view_navbar(NAVBAR),
    div(class="flex flex-grow flex-col items-center justify-center", [
      div(
        class="flex py-10 w-full flex-col-reverse justify-center lg:max-w-6xl lg:flex-row lg:justify-between",
        [
          div(
            class="flex flex-1 flex-col justify-center gap-4 px-4 lg:max-w-[50%] lg:gap-8",
            [
              section(
                class="flex flex-col items-center gap-2 px-4 lg:items-start lg:gap-4",
                [
                  p(class="text-xl font-semibold text-gray-600 lg:text-3xl", [
                    text("Hi This is"),
                  ]),
                  h1(class="text-2xl font-semibold lg:text-7xl", [
                    text("mooncakes."),
                  ]),
                  p(
                    class="text-center text-gray-600 lg:text-start lg:text-3xl lg:leading-tight",
                    [
                      text(
                        "The centralized MoonBit package management platform.",
                      ),
                    ],
                  ),
                ],
              ),
              div(
                class="flex flex-grow-0 items-center justify-center gap-4 lg:justify-start lg:gap-8",
                [
                  @html.a(
                    href="https://www.moonbitlang.com/download/",
                    class="rounded-full border-[#cf4f89] border-2 bg-[#cf4f89] text-white transition-all lg:px-10 px-4 py-2 text-center font-semibold lg:py-2 lg:text-lg",
                    [text("Install Moon")],
                  ),
                  @html.a(
                    href="https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html",
                    class="rounded-full border-[#cf4f89] border-2 hover:bg-[#cf4f89] hover:text-white transition-all lg:px-10 px-4 py-2 text-center font-semibold text-[#cf4f89] lg:py-2 lg:text-lg",
                    [text("Getting Started")],
                  ),
                ],
              ),
            ],
          ),
          div(class="flex justify-center px-4", [
            @html.img(
              src="mooncake-pic.png",
              alt="logo",
              class="h-80 lg:h-96",
              [],
            ),
          ]),
        ],
      ),
    ]),
  ])
}
