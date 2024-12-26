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
struct Package {
  path : String
  traits : Traits
  types : Array[Type]
  typealias_ : Array[String]
  values : Array[String]
  misc : Array[Type]
}

///|
struct ModuleIndex {
  name : String
  package : Package
  childs : Array[ModuleIndex]
}

///|
fn parse_module_index(json : Json) -> ModuleIndex {
  match json {
    { "name": String(name), "package": package, "childs": Array(childs) } =>
      {
        name,
        package: parse_package(package),
        childs: childs.map(parse_module_index),
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
fn parse_traits(json : Json) -> Traits {
  let { "name": String(name), "impls": Array(impls) } = json
  { name, impls: impls.map(parse_impl) }
}

///|
fn parse_type(json : Json) -> Type {
  let { "name": String(name), "impls": Array(impls), "methods": Array(method_) } = json
  { name, impls: impls.map(parse_impl), methods: method_.map(as_string) }
}

///|
fn parse_package(json : Json) -> Package {
  let {
    "path": String(path),
    "traits": traits,
    "types": Array(types),
    "typealias": Array(typealais_),
    "values": Array(values),
    "misc": Array(miscs),
  } = json
  {
    path,
    traits: parse_traits(traits),
    types: types.map(parse_type),
    typealias_: typealais_.map(as_string),
    values: values.map(as_string),
    misc: miscs.map(parse_type),
  }
}

///|
fn generate_sidebar_from_module_index(index : ModuleIndex) -> SidebarModel {

}
