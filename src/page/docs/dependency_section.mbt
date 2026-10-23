///|
priv struct Dependent {
  name : String
  versions : Array[String]
} derive(Eq, @json.FromJson)

///|
fn dependent_module_row(item : Dependent) -> Html {
  li(class="min-w-0 space-y-1") <| [
    div(class="flex items-center gap-1.5 min-w-0") <| [
      a(
        class="min-w-0 truncate font-mono text-[13px] text-gray-900 hover:text-black hover:underline dark:text-slate-100 dark:hover:text-white",
        href="/docs/\{item.name}",
        title=item.name,
        item.name,
      ),
    ],
    ul(
      class="flex flex-wrap gap-1.5",
      item.versions.map(version => {
        li <| [
          @rui.badge_link(
            variant=Secondary,
            class="group",
            style=["border:0"],
            href="/docs/\{item.name}@\{version}",
            span(class="font-mono text-xs group-hover:underline", version),
          ),
        ]
      }),
    ),
  ]
}

///|
fn dependency_links(
  versions : Array[(String, String)],
  empty_text~ : String,
) -> Html {
  if versions.is_empty() {
    p(class="text-[13px] text-gray-400 dark:text-slate-500", empty_text)
  } else {
    ul(
      class="space-y-1.5",
      versions.map(pair => {
        let (name, version) = pair
        li(class="font-mono text-[13px] min-w-0") <| [
          a(
            class="flex justify-between gap-2 min-w-0 hover:underline text-gray-900 dark:text-slate-100",
            href="/docs/\{name}@\{version}",
            title="\{name}@\{version}",
          ) <| [
            span(class="truncate", name),
            @rui.badge(
              variant=Secondary,
              style=["border:0"],
              span(class="font-mono text-xs", version),
            ),
          ],
        ]
      }),
    )
  }
}

///|
fn dependency_accordion(
  dependencies : Array[(String, String)],
  dependents : Array[Dependent],
  id~ : String,
  class~ : String,
) -> Val[Html] {
  @rui.accordion(
    type_=Single,
    collapsible=true,
    default_value="dependencies",
    id~,
    class="docs-dependency-accordion \{class}",
    trigger_style=["font-weight:600"],
    items=[
      @rui.accordion_entry(
        value="dependencies",
        label="Dependencies (\{dependencies.length()})",
        content=dependency_links(dependencies, empty_text="No dependencies"),
      ),
      @rui.accordion_entry(
        value="dependents",
        label="Dependents (\{dependents.length()})",
        content=if dependents.is_empty() {
          p(
            class="text-[13px] text-gray-400 dark:text-slate-500",
            "No dependents",
          )
        } else {
          div <| [
            @rui.item_description(
              style=["font-size:0.75rem;line-height:1rem;margin:0 0 0.75rem"],
              "Published modules that use this version",
            ),
            ul(class="space-y-4", dependents.map(dependent_module_row)),
          ]
        },
      ),
    ],
  )
}
