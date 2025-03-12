///|
pub fn loading[M]() -> @html.T[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    h1(class="text-2xl font-bold m-10", [text("Loading...")]),
  ])
}

///|
pub fn load_failed[M](resource : String) -> @html.T[M] {
  div(class="flex flex-col items-center justify-center h-full w-full", [
    pre([code([text(@config.dead_rabbit)])]),
    h1(class="text-2xl font-bold text-gray-700 m-10", [
      text("Failed to load \{resource}"),
    ]),
  ])
}
