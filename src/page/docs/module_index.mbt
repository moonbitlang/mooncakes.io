// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
priv struct IndexNode {
  name : String
  pkg : PkgIndex?
  childs : SortedMap[String, IndexNode]
} derive(Debug)

///|
priv struct PkgIndex {
  path : String
  typealias_ : Array[TypeAliasIndex]
  traits : Array[TraitIndex]
  errors : Array[TypeIndex]
  types : Array[TypeIndex]
  misc : Array[MiscIndex]
  values : Array[ValueIndex]
} derive(Debug)

///|
priv struct Manifest {
  name : String
  module_ : String
  version : String
  has_package : Bool
  module_meta : MetaInfo
}

///|
priv struct ModuleIndex(IndexNode) derive(Debug)

///|
test "dummy test to suppress unused trait implementation warning" {
  let moduleIndex : ModuleIndex = {
    name: "root",
    pkg: Some({
      path: "root",
      traits: [],
      errors: [],
      types: [],
      typealias_: [],
      values: [],
      misc: [],
    }),
    childs: @immut/sorted_map.new(),
  }
  ignore(to_repr(moduleIndex))
}

///|
fn IndexNode::iter(self : IndexNode) -> Iter[IndexNode] {
  // Construct an iterator by recursively traversing the tree
  fn traverse(node : IndexNode) -> Iter[IndexNode] {
    let pkg_iter = match node.pkg {
      Some(_) => Iter::singleton(node)
      None => Iter::empty()
    }
    let childs_iter = node.childs
      .iter()
      .flat_map(fn(pair) {
        let (_, child) = pair
        traverse(child)
      })
    pkg_iter.concat(childs_iter)
  }

  traverse(self)
}

///|
fn ModuleIndex::iter(self : ModuleIndex) -> Iter[IndexNode] {
  self.0.iter()
}

///|
priv struct TypeAliasIndex {
  name : String
} derive(Debug)

///|
priv struct ValueIndex {
  name : String
} derive(Debug)

///|
priv struct TraitIndex {
  name : String
  impls : Array[ImplIndex]
} derive(Debug)

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
} derive(Debug)

///|
priv struct TypePath {
  path : String
  name : String
} derive(Debug)

///|
priv struct ImplIndex {
  self : Stype
  trait_ : TypePath
  methods : Array[String]
} derive(Debug)

///|
priv struct TypeIndex {
  name : String
  impls : Array[ImplIndex]
  methods : Array[String]
} derive(Debug)

///|
priv struct MiscIndex {
  name : String
  impls : Array[ImplIndex]
  methods : Array[String]
} derive(Debug)

///|
fn IndexNode::find_node(self : IndexNode, path : String) -> IndexNode? {
  let paths = path.trim(char_set="/").split("/").to_array()[:]
  guard paths is [root_path, .. paths] && root_path == self.name else {
    return None
  }
  for node = Some(self), paths = paths {
    match (node, paths) {
      (Some(node), [path, .. rest]) =>
        continue node.childs.get(path.to_owned()), rest
      (node, _) => break node
    }
  }
}

///|
fn split_docs_path(path : String) -> Array[String] {
  path
  .trim(char_set="/")
  .split("/")
  .filter_map(fn(part) {
    if part.is_empty() {
      None
    } else {
      Some(part.to_owned())
    }
  })
  .collect()
}

///|
fn strip_module_version(segment : String) -> String {
  segment.split("@").head().unwrap().to_owned()
}

///|
fn docs_lookup_path(path : String) -> String {
  split_docs_path(path).map(strip_module_version).join("/")
}

///|
fn versioned_docs_path(
  path : String,
  module_name : String,
  version : String,
) -> String {
  if module_name == "moonbitlang/core" {
    path
  } else {
    versioned_asset_path(path, module_name, version)
  }
}

///|
fn versioned_asset_path(
  path : String,
  module_name : String,
  version : String,
) -> String {
  let lookup = docs_lookup_path(path)
  let module_segments = split_docs_path(module_name)
  let path_segments = split_docs_path(lookup)
  if path_segments.length() < module_segments.length() {
    return "\{module_name}@\{version}"
  }
  for i in 0..<module_segments.length() {
    if path_segments[i] != module_segments[i] {
      return lookup
    }
  }
  let versioned = "\{module_name}@\{version}"
  if path_segments.length() == module_segments.length() {
    return versioned
  }
  let suffix = []
  for i in module_segments.length()..<path_segments.length() {
    suffix.push(path_segments[i])
  }
  let suffix = suffix.join("/")
  "\{versioned}/\{suffix}"
}

///|
fn make_versioned_asset_path(mp : @util.MooncakePath) -> String {
  let module_path = mp.module_path()
  let package_path = mp.package_path()
  let version = mp.version()
  let versioned_module = "\{module_path}@\{version}"
  let pkg_segs = split_docs_path(package_path)
  let mod_segs = split_docs_path(module_path)
  if pkg_segs.length() <= mod_segs.length() {
    versioned_module
  } else {
    let suffix : Array[String] = []
    for i in mod_segs.length()..<pkg_segs.length() {
      suffix.push(pkg_segs[i])
    }
    let suffix = suffix.join("/")
    "\{versioned_module}/\{suffix}"
  }
}

///|
impl @json.FromJson for Manifest with fn from_json(json : Json, path) {
  let raw_json = json
  match raw_json {
    {
      "name": String(name),
      "module": String(module_),
      "version": String(version),
      "has_package": has_package,
      ..
    } => {
      let module_meta = decode_module_meta(raw_json, version, path)
      {
        name,
        module_,
        version,
        has_package: @json.from_json(has_package, path~),
        module_meta,
      }
    }
    json =>
      raise JsonDecodeError(
        (path, "invalid json for Manifest: \{to_repr(json)}"),
      )
  }
}

///|
fn decode_type_path(
  json : Json,
  path : @json.JsonPath,
) -> TypePath raise @json.JsonDecodeError {
  match json {
    { "path": String(type_path), "name": String(name), .. } =>
      { path: type_path, name }
    _ => raise JsonDecodeError((path, "invalid json in type path"))
  }
}

///|
fn decode_stype(
  json : Json,
  path : @json.JsonPath,
) -> Stype raise @json.JsonDecodeError {
  match json {
    {
      "kind": "constr",
      "constructor": type_path,
      "arguments": Array(stypes),
      ..
    } =>
      Constr(
        constr=decode_type_path(type_path, path),
        arguments=stypes.map(x => decode_stype(x, path)),
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
        Some(x) => Some(decode_stype(x, path))
        None => None
      }
      let is_async : Bool = @json.from_json(is_async, path~)
      Arrow(
        parameters=parameters.map(x => decode_stype(x, path)),
        return_type=decode_stype(return_type, path),
        error_type~,
        is_async~,
      )
    }
    { "kind": "param", "name": String(name), .. } => Param(name~)
    { "name": _, "path": _, .. } => TypePath(decode_type_path(json, path))
    _ =>
      raise JsonDecodeError((path, "invalid json in stype: \{to_repr(json)}"))
  }
}

///|
fn decode_trait_index(
  json : Json,
  path : @json.JsonPath,
) -> TraitIndex raise @json.JsonDecodeError {
  match json {
    { "name": String(name), "impls": Array(impls), .. } => {
      let impls = impls.map(x => decode_impl_index(x, path))
      { name, impls }
    }
    _ => raise JsonDecodeError((path, "invalid json in trait index"))
  }
}

///|
fn decode_type_index(
  json : Json,
  path : @json.JsonPath,
) -> TypeIndex raise @json.JsonDecodeError {
  match json {
    {
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } => {
      let impls = impls.map(x => decode_impl_index(x, path))
      let decoded_methods = []
      for x in methods {
        match x {
          String(x) => decoded_methods.push(x)
          _ => raise JsonDecodeError((path, "invalid json in type index"))
        }
      }
      { name, impls, methods: decoded_methods }
    }
    _ => raise JsonDecodeError((path, "invalid json in type index"))
  }
}

///|
fn decode_typealias_index(
  json : Json,
  path : @json.JsonPath,
) -> TypeAliasIndex raise @json.JsonDecodeError {
  match json {
    String(x) => { name: x }
    _ => raise JsonDecodeError((path, "invalid json in typealias index"))
  }
}

///|
fn decode_value_index(
  json : Json,
  path : @json.JsonPath,
) -> ValueIndex raise @json.JsonDecodeError {
  match json {
    String(x) => { name: x }
    _ => raise JsonDecodeError((path, "invalid json in value index"))
  }
}

///|
fn decode_misc_index(
  json : Json,
  path : @json.JsonPath,
) -> MiscIndex raise @json.JsonDecodeError {
  match json {
    {
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } => {
      let impls = impls.map(x => decode_impl_index(x, path))
      let decoded_methods = []
      for x in methods {
        match x {
          String(x) => decoded_methods.push(x)
          _ => raise JsonDecodeError((path, "invalid json in misc index"))
        }
      }
      { name, impls, methods: decoded_methods }
    }
    _ => raise JsonDecodeError((path, "invalid json in misc index"))
  }
}

///|
fn decode_impl_index(
  json : Json,
  path : @json.JsonPath,
) -> ImplIndex raise @json.JsonDecodeError {
  match json {
    { "self": self_type, "trait": trait_type, "methods": Array(methods), .. } => {
      let self_type = decode_stype(self_type, path)
      let trait_type = decode_type_path(trait_type, path)
      let decoded_methods = []
      for x in methods {
        match x {
          String(x) => decoded_methods.push(x)
          _ => raise JsonDecodeError((path, "invalid methods in impl index"))
        }
      }
      { self: self_type, trait_: trait_type, methods: decoded_methods }
    }
    _ => raise JsonDecodeError((path, "invalid json in impl index"))
  }
}

///|
fn decode_package_index(
  json : Json,
  json_path : @json.JsonPath,
) -> PkgIndex raise @json.JsonDecodeError {
  match json {
    {
      "traits": Array(traits),
      "errors"? : errors_json,
      "types": Array(types),
      "typealias": Array(typealias_),
      "values": Array(values),
      "misc": Array(miscs),
      "path": String(pkg_path),
      ..
    } => {
      let traits = traits.map(x => decode_trait_index(x, json_path))
      let errors = match errors_json {
        Some(Array(errors)) => errors.map(x => decode_type_index(x, json_path))
        _ => []
      }
      let types = types.map(x => decode_type_index(x, json_path))
      let typealias_ = typealias_.map(x => decode_typealias_index(x, json_path))
      let values = values.map(x => decode_value_index(x, json_path))
      let misc = miscs.map(x => decode_misc_index(x, json_path))
      { traits, errors, types, typealias_, values, misc, path: pkg_path }
    }
    _ => raise JsonDecodeError((json_path, "invalid json in package index"))
  }
}

///|
fn decode_index_node(
  json : Json,
  path : @json.JsonPath,
) -> IndexNode raise @json.JsonDecodeError {
  match json {
    { "name": String(name), "package": pkg, "childs": Array(childs), .. } => {
      let childs = childs
        .map(x => decode_index_node(x, path))
        .map(fn(x) { (x.name, x) })
        |> @immut/sorted_map.from_array
      let pkg = match pkg {
        Null => None
        obj => Some(decode_package_index(obj, path))
      }
      { name, pkg, childs }
    }
    _ => raise JsonDecodeError((path, "invalid json in index node"))
  }
}

///|
impl @json.FromJson for ModuleIndex with fn from_json(json : Json, path) {
  decode_index_node(json, path)
}
