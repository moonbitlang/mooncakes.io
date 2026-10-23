///|
priv struct Dependent {
  name : String
  version : String
} derive(Eq, @json.FromJson)

///|
fn dependency_links(
  versions : Array[(String, String)],
  empty_text~ : String,
) -> Html {
  if versions.is_empty() {
    p(class="text-[13px] text-gray-400 dark:text-slate-500", empty_text)
  } else {
    ul(
      class="space-y-0.5",
      versions.map(pair => {
        let (name, version) = pair
        li(class="font-mono text-[13px] min-w-0") <| [
          a(
            class="flex justify-between gap-2 min-w-0 hover:underline text-gray-700 dark:text-slate-300",
            href="/docs/\{name}@\{version}",
            title="\{name}@\{version}",
          ) <| [
            span(class="truncate", name),
            span(class="text-gray-400 dark:text-slate-500 shrink-0", version),
          ],
        ]
      }),
    )
  }
}

///|
fn dependency_accordion(
  dependencies : Array[(String, String)],
  dependents : Array[(String, String)],
  id~ : String,
  class~ : String,
) -> Val[Html] {
  @rui.accordion(
    type_=Single,
    collapsible=true,
    default_value="dependencies",
    id~,
    class~,
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
        content=dependency_links(dependents, empty_text="No dependents"),
      ),
    ],
  )
}
