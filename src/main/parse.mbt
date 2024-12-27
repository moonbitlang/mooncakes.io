// Todo: Passing parsing error

///|
fn parse_metadata(json : Json) -> MetaInfoModel {
  let {
    "name"? : name,
    "repository"? : repository,
    "version"? : version,
    "license"? : license,
    "description"? : description,
    "keywords"? : keywords,
  } = json
  let [name, repository, version, license, description] = [
    name, repository, version, license, description,
  ].map(fn(x) {
    match x {
      Some(String(str)) => str
      None => ""
    }
  })
  let keywords = match keywords {
    Some(Array(keywords)) => keywords.map(fn(x) { x.as_string().unwrap() })
    None => []
  }
  let iter = name.iter()
  let author = String::from_array(iter.take_while(fn(x) { x == '/' }).collect())
  let package_name = String::from_array(
    iter.drop_while(fn(x) { x == '/' }).collect(),
  )
  {
    author,
    name: package_name,
    module_path: name,
    description,
    version,
    license,
    repository,
    keywords,
  }
}

///|
trait ToItemModel {
  to_item_model(Self, String) -> ItemModel
}

///|
struct Trait {
  name : String
  path : String
}

///|
struct Traits {
  name : String
  impls : Array[Impl]
}

///|
struct Impl {
  self_ : Trait?
  trait_ : Trait
  method_ : String
}

///|
struct Type {
  name : String
  impls : Array[Impl]
  methods : Array[String]
}

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
  { name: self.name, target: base + "/" + self.name, kind: Trait }
}

///|
impl ToItemModel for Type with to_item_model(self, base) {
  { name: self.name, target: base + "/" + self.name, kind: Type }
}

///|
struct ModuleIndex {
  name : String
  package : Package
}

///|
fn parse_module_index(json : Json) -> ModuleIndex {
  match json {
    { "name": String(name), "package": package, "childs": Array(childs) } => {
      let childs = childs.map(parse_module_index)
      {
        name,
        package: match package {
          Null => { body: None, childs }
          p => parse_package(p, childs)
        },
      }
    }
  }
}

///|
fn as_string(json : Json) -> String {
  json.as_string().unwrap()
}

///|
fn parse_trait(json : Json) -> Trait {
  let { "name": String(name), "path": String(path) } = json
  { name, path }
}

///|
fn parse_impl(json : Json) -> Impl {
  let { "self"? : self_, "trait": trait_, "method": String(method_) } = json
  {
    self_: match self_ {
      Some(x) => Some(parse_trait(x))
      None => None
    },
    trait_: parse_trait(trait_),
    method_,
  }
}

///|
fn parse_traits(json : Json) -> Array[Traits] {
  let result : Array[Traits] = []
  let Array(traits_list) = json
  for trait_ in traits_list {
    let { "name": String(name), "impls": Array(impls) } = trait_
    result.push({ name, impls: impls.map(parse_impl) })
  }
  result
}

///|
fn parse_type(json : Json) -> Type {
  let { "name": String(name), "impls": Array(impls), "methods": Array(method_) } = json
  { name, impls: impls.map(parse_impl), methods: method_.map(as_string) }
}

///|
fn parse_package(json : Json, childs : Array[ModuleIndex]) -> Package {
  let {
    "path": String(path),
    "traits": traits,
    "types": Array(types),
    "typealias": Array(typealais_),
    "values": Array(values),
    "misc": Array(miscs),
  } = json
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
fn generate_package_model_from_package(package : Package) -> PackageModel {
  let childs = package.childs
  let package = package.body.unwrap()
  let mut p : PackageModel = {
    fullpath: package.path,
    folded: false,
    childrens: [],
  }
  for trait_ in package.traits {
    p.childrens.push(trait_.to_item_model(package.path))
  }
  for type_ in package.types {
    p.childrens.push(type_.to_item_model(package.path))
  }
  for value in package.values {
    p.childrens.push({
      name: value,
      target: package.path + "/" + value,
      kind: Value,
    })
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
  let mut sidebar : SidebarModel = {
    hide: false,
    filter: "",
    cards_expanded: true,
    module_path: index.name,
    items: [],
    dependencies: [],
  }
  sidebar
}
