///|
#cfg(not(target="js"))
#warnings("-alert_experimental")
async test "README code blocks render namespaced attributes and extend" {
  let readme =
    #|```moonbit
    #|#moonspec.given("a calculator")
    #|fn given_calculator(world : CalcWorld) -> Unit {
    #|  world.result = 0
    #|}
    #|
    #|pub extend CalcWorld with Default::{default}
    #|```
  let html = @rabbita.new(() => {
    @rabbita.Val::constant(
      @html.html([@html.head(@html.nothing), @html.body(markdown(readme))]),
    )
  }).render(url="https://mooncakes.io/docs/moonrockz/moonspec@0.11.0")
  assert_true(html.contains(">#moonspec.given</span>"))
  assert_true(html.contains(">extend</span>"))
}
