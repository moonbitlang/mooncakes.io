///|
pub fn loading[M]() -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    h1(class="text-2xl font-bold m-10", [text("Loading...")]),
  ])
}

///|
pub fn load_failed[M](resource : String) -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    h1(class="text-2xl font-bold text-gray-700 m-10", [
      text("Failed to load \{resource}"),
    ]),
  ])
}

///|
pub fn document_not_available[M](path : String) -> Html[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    div(class="text-gray-900 m-10", [
      h1(class="text-base text-lg mb-2 font-semibold text-center", [
        text("Document for \{path} is not available"),
      ]),
      ul(class="list-disc text-gray-600", [
        li([
          text(
            "The package may be outdated and we cannot build document for it.",
          ),
        ]),
        li([
          text(
            "It also could be an error in mooncakes.io, please report it to us.",
          ),
        ]),
      ]),
    ]),
  ])
}
