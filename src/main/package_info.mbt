///|
fn process_pacakge_info(package : Json) -> Array[DetailCardModel] {
  fn process_value {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
    } : Json) => ValueCard(folded=false, name~, signature~, description~)
  }

  fn process_impl {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
    } : Json) => ImplCard(folded=false, name~, signature~, description~)
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
      TypeCard(folded=false, name~, description~, signature~, methods~, impls~)
    }
  }

  fn process_typealias {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
    } : Json) =>
      TypeCard(folded=false, name~, description~, signature~, methods=[], impls=[])
  }

  fn process_traits {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      "impls": Array(impls),
    } : Json) => {
      let impls = impls.map(process_impl)
      TraitCard(folded=false, name~, description~, signature~, impls~)
    }
  }

  match package {
    {
      "name": String(name),
      "types": Array(types),
      "typealias": Array(alias_),
      "values": Array(values),
      "traits": Array(traits),
      "readme": String(readme),
    } => {
      let cards = []
      if readme == "" {
        cards.push(ReadmeCard(folded=false, readme))
      }
      cards +
      [
        ..types.map(process_type),
        ..alias_.map(process_typealias),
        ..traits.map(process_traits),
        ..values.map(process_value),
      ]
    }
  }
}
