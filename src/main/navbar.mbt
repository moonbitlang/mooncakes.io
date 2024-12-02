struct NavbarModel {
  title: String
}


fn navbar_view[M](model : NavbarModel) -> @html.Html[M] {
  div(class="h-14 w-full px-8 p-4 border-b select-none",[
    h1(class="text-gray-700 font-semibold",[text("🥮 mooncakes.io")])
  ])
}

