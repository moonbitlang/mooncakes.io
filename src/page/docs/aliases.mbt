///|
fnalias @html.(
  div,
  text,
  h1,
  p,
  pre,
  code,
  span,
  nothing,
  a,
  h3,
  ul,
  img,
  button
)

///|
fnalias @tea.(batch, none)

///|
typealias @html.Html[Msg]

///|
typealias @tea.Command[Msg]

///|
typealias @util.Status[A]

///|
typealias Set[A] = @immut/sorted_set.T[A]

///|
typealias Map[K, V] = @immut/sorted_map.T[K, V]
