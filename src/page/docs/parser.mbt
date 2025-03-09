///|
trait ToItemModel {
  to_item_model(Self, String) -> ItemModel
}

///|
struct Traits {
  name : String
  impls : Array[Impl]
} derive(Show)

///|
struct Impl {
  methods : Array[String]
} derive(Show)

///|
struct Type {
  name : String
  impls : Array[Impl]
  methods : Array[String]
} derive(Show)

///|
struct PackageBody {
  path : String
  traits : Array[Traits]
  types : Array[Type]
  typealias_ : Array[String]
  values : Array[String]
  misc : Array[Type]
}

///|
struct Package {
  body : PackageBody?
  childs : Array[ModuleIndex]
}

///|
impl ToItemModel for Traits with to_item_model(self, base) {
  { name: self.name, target: base, kind: Trait }
}

///|
impl ToItemModel for Type with to_item_model(self, base) {
  { name: self.name, target: base, kind: Type }
}

///|
struct ModuleIndex {
  name : String
  package : Package
}

///|
fn parse_module_index_inner(json : Json) -> ModuleIndex {
  match json {
    { "name": String(name), "package": package, "childs": Array(childs), .. } => {
      let childs = childs.map(parse_module_index_inner)
      {
        name,
        package: match package {
          Null => { body: None, childs }
          p => parse_package(p, childs)
        },
      }
    }
    _ => panic() // FIXME: handle error
  }
}

///|
/// Todo: more smarter error handling
fn parse_module_index(json : Json) -> Result[ModuleIndex, String] {
  Ok(parse_module_index_inner(json))
}

///|
fn as_string(json : Json) -> String {
  json.as_string().unwrap()
}

///|
fn parse_impl(json : Json) -> Impl {
  guard json is { "methods": Array(methods), .. }
  { methods: methods.map(as_string) }
}

///|
fn parse_traits(json : Json) -> Array[Traits] {
  let result : Array[Traits] = []
  guard json is Array(traits_list)
  for trait_ in traits_list {
    guard trait_ is { "name": String(name), "impls": Array(impls), .. }
    result.push({ name, impls: impls.map(parse_impl) })
  }
  result
}

///|
fn parse_type(json : Json) -> Type {
  guard json
    is {
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(method_),
      ..
    }
  { name, impls: impls.map(parse_impl), methods: method_.map(as_string) }
}

///|
fn parse_package(json : Json, childs : Array[ModuleIndex]) -> Package {
  guard json
    is {
      "path": String(path),
      "traits": traits,
      "types": Array(types),
      "typealias": Array(typealais_),
      "values": Array(values),
      "misc": Array(miscs),
      ..
    }
  {
    body: Some({
      path,
      traits: parse_traits(traits),
      types: types.map(parse_type),
      typealias_: typealais_.map(as_string),
      values: values.map(as_string),
      misc: miscs.map(parse_type),
    }),
    childs,
  }
}

///|
fn generate_package_model_from_package(package_ : Package) -> PackageModel {
  let childs = package_.childs
  let mut p : PackageModel = { fullpath: "", folded: false, childrens: [] }
  match package_.body {
    Some(package) => {
      p = { ..p, fullpath: package.path }
      for type_ in package.types {
        p.childrens.push(type_.to_item_model(package.path))
      }
      for trait_ in package.traits {
        p.childrens.push(trait_.to_item_model(package.path))
      }
      for value in package.values {
        p.childrens.push({ name: value, target: package.path, kind: Value })
      }
      for alias_ in package.typealias_ {
        p.childrens.push({ name: alias_, target: package.path, kind: TypeAlias })
      }
      for misc in package.misc {
        p.childrens.push(misc.to_item_model(package.path))
      }
    }
    None => p = { fullpath: "Empty", folded: false, childrens: [] }
  }
  for child in childs {
    let p_ = generate_package_model_from_package(child.package)
    p.childrens.push({
      name: child.name,
      target: p_.fullpath,
      kind: Package(p_),
    })
  }
  p
}

///|
fn generate_sidebar_from_module_index(index : ModuleIndex) -> SidebarModel {
  {
    hide: false,
    filter: "",
    cards_expanded: true,
    items: generate_package_model_from_package(index.package).childrens,
  }
}
