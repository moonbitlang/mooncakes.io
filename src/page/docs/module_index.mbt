///|
priv struct IndexNode {
  name : String
  package : PackageIndex?
  childs : Map[String, IndexNode]
} derive(Show)

///|
priv struct PackageIndex {
  path : String
  traits : Array[TraitIndex]
  types : Array[TypeIndex]
  typealias_ : Array[TypeAliasIndex]
  values : Array[ValueIndex]
  misc : Array[MiscIndex]
} derive(Show)

///|
priv type ModuleIndex IndexNode derive(Show)

///|
priv struct TypeAliasIndex {
  name : String
} derive(Show)

///|
priv struct ValueIndex {
  name : String
} derive(Show)

///|
priv struct TraitIndex {
  name : String
  impls : Array[ImplIndex]
} derive(Show)

///|
priv enum Stype {
  Constr(constr~ : TypePath, arguments~ : Array[Stype])
  Arrow(
    parameters~ : Array[Stype],
    return_type~ : Stype,
    error_type~ : Stype?,
    is_async~ : Bool
  )
  Param(name~ : String)
  TypePath(TypePath)
} derive(Show)

///|
priv struct TypePath {
  path : String
  name : String
} derive(Show)

///|
priv struct ImplIndex {
  self : Stype
  trait_ : TypePath
  methods : Array[String]
} derive(Show)

///|
priv struct TypeIndex {
  name : String
  impls : Array[ImplIndex]
  methods : Array[String]
} derive(Show)

///|
priv struct MiscIndex {
  name : String
  impls : Array[ImplIndex]
  methods : Array[String]
} derive(Show)

///|
fn IndexNode::find_node(self : IndexNode, path : String) -> IndexNode? {
  let paths = path.trim("/").split("/").to_array()[:]
  guard paths is [root_path, .. paths] && root_path == self.name else {
    return None
  }
  loop Some(self), paths {
    Some(node), [path, .. rest] => continue node.childs[path], rest
    node, _ => node
  }
}

///|
fn decode_type_path(json : Json) -> TypePath!Error {
  match json {
    { "path": String(path), "name": String(name), .. } => { path, name }
    _ => fail!("invalid json in type path")
  }
}

///|
fn decode_stype(json : Json) -> Stype!Error {
  match json {
    {
      "kind": "constr",
      "constructor": type_path,
      "arguments": Array(stypes),
      ..
    } =>
      Constr(
        constr=decode_type_path!(type_path),
        arguments=map_with_error!(stypes, decode_stype),
      )
    {
      "kind": "arrow",
      "parameters": Array(parameters),
      "return_type": return_type,
      "error_type"? : error_type,
      "is_async": is_async,
      ..
    } => {
      let error_type = match error_type {
        Some(x) => Some(decode_stype!(x))
        None => None
      }
      let is_async : Bool = @json.from_json!(is_async)
      Arrow(
        parameters=map_with_error!(parameters, decode_stype),
        return_type=decode_stype!(return_type),
        error_type~,
        is_async~,
      )
    }
    { "kind": "param", "name": String(name), .. } => Param(name~)
    { "name": _, "path": _, .. } => TypePath(decode_type_path!(json))
    _ => fail!("invalid json in stype: \{json}")
  }
}

///|
fn decode_trait_index(json : Json) -> TraitIndex!Error {
  match json {
    { "name": String(name), "impls": Array(impls), .. } => {
      let impls = map_with_error!(impls, decode_impl_index)
      { name, impls }
    }
    _ => fail!("invalid json in trait index")
  }
}

///|
fn decode_type_index(json : Json) -> TypeIndex!Error {
  match json {
    {
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } => {
      let impls = map_with_error!(impls, decode_impl_index)
      let methods = map_with_error!(methods, fn {
        String(x) => x
        _ => fail!("invalid json in type index")
      })
      { name, impls, methods }
    }
    _ => fail!("invalid json in type index")
  }
}

///|
fn decode_typealias_index(json : Json) -> TypeAliasIndex!Error {
  match json {
    String(x) => { name: x }
    _ => fail!("invalid json in typealias index")
  }
}

///|
fn decode_value_index(json : Json) -> ValueIndex!Error {
  match json {
    String(x) => { name: x }
    _ => fail!("invalid json in value index")
  }
}

///|
fn decode_misc_index(json : Json) -> MiscIndex!Error {
  match json {
    {
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } => {
      let impls = map_with_error!(impls, decode_impl_index)
      let methods = map_with_error!(methods, fn {
        String(x) => x
        _ => fail!("invalid json in misc index")
      })
      { name, impls, methods }
    }
    _ => fail!("invalid json in misc index")
  }
}

///|
fn decode_impl_index(json : Json) -> ImplIndex!Error {
  match json {
    { "self": self_type, "trait": trait_type, "methods": Array(methods), .. } => {
      let self_type = decode_stype!(self_type)
      let trait_type = decode_type_path!(trait_type)
      let methods = map_with_error!(methods, fn {
        String(x) => x
        _ => fail!("invalid methods in impl index")
      })
      { self: self_type, trait_: trait_type, methods }
    }
    _ => fail!("invalid json in impl index")
  }
}

///| map with error. We need error polymorphism!
fn map_with_error[A, B, E : Error](
  arr : Array[A],
  f : (A) -> B!E
) -> Array[B]!E {
  let xs = []
  for x in arr {
    xs.push(f!(x))
  }
  xs
}

///|
fn decode_package_index(json : Json) -> PackageIndex!Error {
  match json {
    {
      "traits": Array(traits),
      "types": Array(types),
      "typealias": Array(typealias_),
      "values": Array(values),
      "misc": Array(miscs),
      "path": String(path),
      ..
    } => {
      let traits = map_with_error!(traits, decode_trait_index)
      let types = map_with_error!(types, decode_type_index)
      let typealias_ = map_with_error!(typealias_, decode_typealias_index)
      let values = map_with_error!(values, decode_value_index)
      let misc = map_with_error!(miscs, decode_misc_index)
      { traits, types, typealias_, values, misc, path }
    }
    _ => fail!("invalid json in package index")
  }
}

///|
fn decode_index_node(json : Json) -> IndexNode!Error {
  match json {
    { "name": String(name), "package": package, "childs": Array(childs), .. } => {
      let childs = map_with_error!(childs, decode_index_node).map(fn(x) {
          (x.name, x)
        })
        |> @immut/sorted_map.from_array
      let package = match package {
        Null => None
        obj => Some(decode_package_index!(obj))
      }
      { name, package, childs }
    }
    _ => fail!("invalid json in index node")
  }
}

///|
fn decode_module_index(json : Json) -> Result[ModuleIndex, String] {
  try {
    decode_index_node!(json)
  } catch {
    err => Err(err.to_string())
  } else {
    res => Ok(res)
  }
}
