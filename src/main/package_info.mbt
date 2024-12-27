///|
fn process_pacakge_info(package : Json) -> (String, Array[DetailCardModel]) {
  fn process_value {
    ({ "docstring": String(description), "signature": String(signature) } : Json) =>
      ValueCard(folded=false, signature~, description~)
  }

  fn process_impl {
    ({ "name": String(name) } : Json) =>
      ImplCard(folded=false, signature="", description="")
  }

  fn process_type {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      "methods": Array(methods),
      "impls": Array(impls),
    } : Json) => {
      let methods = methods.map(process_value)
      let impls = impls.map(process_impl)
      TypeCard(folded=false, description~, signature~, methods~, impls~)
    }
  }

  match package {
    {
      "name": String(name),
      "types": Array(types),
      "typealias": Array(alias_),
      "values": Array(values),
      "readme": String(readme),
    } => {
      let cards = [
          ..types.map(process_type),
          ..alias_.map(process_type),
          ..values.map(process_value),
        ]
      (readme, cards)
    }
  }
}
