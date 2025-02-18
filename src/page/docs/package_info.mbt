///|
fn process_package_info(
  package : Json
) -> Result[Array[DetailCardModel], String] {
  fn process_value {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      ..
    } : Json) => ValueCard(folded=false, name~, signature~, description~)
    _ => FailureCard(folded=false, info="Value Card parsing failed")
  }

  fn process_impl {
    ({ "docstring": String(description), "signature": String(signature), .. } : Json) =>
      ImplCard(folded=false, name=signature, signature~, description~)
    _ => FailureCard(folded=false, info="Impl Card parsing failed")
  }

  fn process_type {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      "methods": Array(methods),
      "impls": Array(impls),
      ..
    } : Json) => {
      let methods = methods.map(process_value)
      let impls = impls.map(process_impl)
      TypeCard(folded=false, name~, description~, signature~, methods~, impls~)
    }
    _ => FailureCard(folded=false, info="Type Card parsing failed")
  }

  fn process_typealias {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      ..
    } : Json) =>
      TypeCard(folded=false, name~, description~, signature~, methods=[], impls=[])
    _ => FailureCard(folded=false, info="Typealias Card parsing failed")
  }

  fn process_miscs {
    ({
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } : Json) => {
      let methods = methods.map(process_value)
      let impls = impls.map(process_impl)
      TypeCard(
        folded=false,
        name~,
        description="",
        signature=name,
        methods~,
        impls~,
      )
    }
    _ => FailureCard(folded=false, info="Misc Card parsing failed")
  }

  fn process_traits {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      "impls": Array(impls),
      ..
    } : Json) => {
      let impls = impls.map(process_impl)
      TraitCard(folded=false, name~, description~, signature~, impls~)
    }
    _ => FailureCard(folded=false, info="Traits Card parsing failed")
  }

  fn process_package {
    ({
      "types": Array(types),
      "typealias": Array(alias_),
      "values": Array(values),
      "traits": Array(traits),
      "readme": String(readme),
      "misc": Array(misc),
      ..
    } : Json) =>
      Ok(
        (if readme != "" { [ReadmeCard(folded=false, readme)] } else { [] }) +
        [
          ..types.map(process_type),
          ..alias_.map(process_typealias),
          ..traits.map(process_traits),
          ..values.map(process_value),
          ..misc.map(process_miscs),
        ],
      )
    _ => Err("PackageInfo parsing failed, Please check the MoonBit toolchain")
  }

  process_package(package)
}
