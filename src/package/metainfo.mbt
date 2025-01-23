///|
fn meta_info_item_view(
  title~ : String,
  elem : @html.Html[Msg]
) -> @html.Html[Msg] {
  div(class="flex flex-col py-1 gap-1 text-gray-600", [
    p(class="font-bold text-[0.7em]", [text(title)]),
    div(
      class="overflow-auto scrollbar-thin scrollbar-thumb-purple-300 scrollbar-track-transparent",
      [elem],
    ),
  ])
}

///|
fn install_view(path~ : String) -> @html.Html[Msg] {
  div(
    class="bg-zinc-100 mt-1 h-9 border rounded flex flex-row justify-between",
    [
      @html.input(
        class="font-mono text-[0.85em] w-full ml-2 h-8 outline-none bg-transparent text-gray-600",
        value="moon add \{path}",
        input_type=Text,
        read_only=true,
      ),
    ],
  )
}

///|
fn tag_view(value : String) -> @html.Html[Msg] {
  div(
    class="self-center border rounded bg-zinc-50 px-2 text-[12px] text-gray-600",
    [text(value)],
  )
}

///|
fn meta_info_view(
  model : @load.Loading[@meta.MetaInfoModel]
) -> @html.Html[Msg] {
  match model {
    Failed => @html.nothing()
    Loading => @html.text("Loading...")
    Success(model) => {
      let model_license = match model.license {
        Some(l) =>
          meta_info_item_view(
            title="License",
            p(class="text-gray-600", [text(l)]),
          )
        None => @html.nothing()
      }
      let model_repo = match model.repository {
        Some(repo) =>
          meta_info_item_view(
            title="Repository",
            p([@html.a(class="text-[#c7156b]", href=repo, [text(repo)])]),
          )
        None => @html.nothing()
      }
      let model_description = match model.description {
        Some(d) => p(class="text-gray-600 mb-2 text-sm", [text(d)])
        None => @html.nothing()
      }
      div(class="pl-2 mb-6", [
        div(class="flex flex-row gap-4 items-center mb-2", [
          h1(class="text-gray-800 text-2xl", [text(model.name)]),
          @html.h2(
            class=" border rounded px-2 text-gray-600 text-sm self-center",
            [text(model.version)],
          ),
        ]),
        model_description,
        div(class="flex gap-2 mb-4", model.keywords.map(tag_view)),
        div(class="flex flex-col gap-2", [
          meta_info_item_view(
            title="Install",
            div([install_view(path=model.module_path)]),
          ),
          meta_info_item_view(
            title="Author",
            p(class="text-gray-600", [text(model.author)]),
          ),
          model_license,
          model_repo,
        ]),
      ])
    }
  }
}
