///|
fn process_package_info(
  package : Json
) -> Result[Array[DetailCardModel], String] {
  let fold_id_allocator : Id = Id::new()
  fn process_value {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      ..
    } : Json) =>
      ValueCard(name~, signature~, description~, id=fold_id_allocator.next())
    _ =>
      FailureCard(info="Value Card parsing failed", id=fold_id_allocator.next())
  }

  fn process_impl {
    ({ "docstring": String(description), "signature": String(signature), .. } : Json) =>
      ImplCard(
        name=signature,
        signature~,
        description~,
        id=fold_id_allocator.next(),
      )
    _ =>
      FailureCard(info="Impl Card parsing failed", id=fold_id_allocator.next())
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
      TypeCard(
        name~,
        description~,
        signature~,
        methods~,
        impls~,
        id=fold_id_allocator.next(),
      )
    }
    _ =>
      FailureCard(info="Type Card parsing failed", id=fold_id_allocator.next())
  }

  fn process_typealias {
    ({
      "name": String(name),
      "docstring": String(description),
      "signature": String(signature),
      ..
    } : Json) =>
      TypeCard(
        name~,
        description~,
        signature~,
        methods=[],
        impls=[],
        id=fold_id_allocator.next(),
      )
    _ =>
      FailureCard(
        info="Typealias Card parsing failed",
        id=fold_id_allocator.next(),
      )
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
        name~,
        description="",
        signature=name,
        methods~,
        impls~,
        id=fold_id_allocator.next(),
      )
    }
    _ =>
      FailureCard(info="Misc Card parsing failed", id=fold_id_allocator.next())
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
      TraitCard(
        name~,
        description~,
        signature~,
        impls~,
        id=fold_id_allocator.next(),
      )
    }
    _ =>
      FailureCard(
        info="Traits Card parsing failed",
        id=fold_id_allocator.next(),
      )
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
        (if readme != "" {
          [ReadmeCard(readme, id=fold_id_allocator.next())]
        } else {
          []
        }) +
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

///|
struct Id {
  mut id : Int
}

///|
fn Id::new() -> Id {
  { id: 0 }
}

///|
fn Id::next(self : Id) -> Int {
  self.id += 1
  self.id
}
