## MoonBit-Chalk

MoonBit-Chalk provides some APIs for terminal color rendering, including rendering APIs for formatting, background color, and font color.

### Usage

Use `chalk()` to construct a Chalk object and attach properties to it through chain calls.

Chalk provides three types of enum internally for setting properties: text color(Color enum), background color(BackGroundColors enum), and format(Modifier enum).

Chalk is an immutable variable, which allows you to easily reuse and combine it, and finally use Render to render any value that conforms to the Show Trait.

```moonbit
let str = chalk().background(BgRed).modifier(Bold).color(Red).render("hello")
```
