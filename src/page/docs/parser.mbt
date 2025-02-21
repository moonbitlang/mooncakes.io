///|
fn parse_metadata(modules_json : Json) -> Result[MetaInfoModel, String] {
  fn parse_package(json : Json) -> Result[MetaInfoModel, String] {
    guard let {
      "name"? : name,
      "repository"? : repository,
      "version"? : version,
      "license"? : license,
      "description"? : description,
      "keywords"? : keywords,
      "readme"? : readme,
      ..
    } = json else {
      _ => Err("Error when parsing metadata.")
    }
    guard let [name, version] = [name, version].map(fn(x) {
      match x {
        Some(String(str)) => str
        _ => abort("Error when parsing name and version.")
      }
    }) else {
      _ => Err("Error when parsing name and version.")
    }
    guard let [repository, license, description, readme] = [
      repository, license, description, readme,
    ].map(fn {
      Some(x) => x.as_string()
      None => None
    }) else {
      _ => Err("Error when parsing repository, license, description, readme.")
    }
    let keywords = match keywords {
      Some(Array(keywords)) => keywords.map(fn(x) { x.as_string().unwrap() })
      None => []
      _ => abort("Error when parsing keywords.")
    }
    let iter = name.iter()
    let author = String::from_array(
      iter.take_while(fn(x) { x != '/' }).collect(),
    )
    let package_name = String::from_array(
      iter.drop_while(fn(x) { x != '/' }).drop(1).collect(),
    )
    Ok({
      author,
      readme,
      name: package_name,
      module_path: name,
      description,
      version,
      license,
      repository,
      keywords,
    })
  }

  parse_package(modules_json)
}

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
  readme : Bool
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
  guard let { "methods": Array(methods), .. } = json
  { methods: methods.map(as_string) }
}

///|
fn parse_traits(json : Json) -> Array[Traits] {
  let result : Array[Traits] = []
  guard let Array(traits_list) = json
  for trait_ in traits_list {
    guard let { "name": String(name), "impls": Array(impls), .. } = trait_
    result.push({ name, impls: impls.map(parse_impl) })
  }
  result
}

///|
fn parse_type(json : Json) -> Type {
  guard let {
    "name": String(name),
    "impls": Array(impls),
    "methods": Array(method_),
    ..
  } = json
  { name, impls: impls.map(parse_impl), methods: method_.map(as_string) }
}

///|
fn parse_package(json : Json, childs : Array[ModuleIndex]) -> Package {
  guard let {
    "path": String(path),
    "traits": traits,
    "readme": True
    | False as readme,
    "types": Array(types),
    "typealias": Array(typealais_),
    "values": Array(values),
    "misc": Array(miscs),
    ..
  } = json
  {
    body: Some({
      path,
      readme: readme == True,
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
      if package.readme {
        p.childrens.push({ name: "README", target: package.path, kind: Readme })
      }
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
    items: generate_package_model_from_package(index.package).childrens,
  }
}
