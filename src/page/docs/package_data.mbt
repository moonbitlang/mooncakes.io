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
priv struct PackageData {
  name : String
  types : Array[TypeDoc]
  traits : Array[TraitDoc]
  typealiases : Array[TypeAliasDoc]
  values : Array[ValueDoc]
  misc : Array[MiscDoc]
}

///|
priv struct Loc {
  path : String
  file : String
  line : Int
  column : Int
} derive(Show)

///|
test "suppress unused warnings for Loc" {
  let dummy = { path: "", file: "", line: 0, column: 0 }
  println(dummy)
}

///|
priv struct TypeDoc {
  name : String
  docstring : String
  signature : String
  loc : Loc
  methods : Array[ValueDoc]
  impls : Array[ImplDoc]
}

///|
priv struct TraitDoc {
  name : String
  docstring : String
  signature : String
  loc : Loc
  impls : Array[ImplDoc]
}

///|
priv struct TypeAliasDoc {
  name : String
  docstring : String
  signature : String
  loc : Loc
}

///|
priv struct ValueDoc {
  name : String
  docstring : String
  signature : String
  loc : Loc
}

///|
priv struct ImplDoc {
  self_type : Stype
  trait_type : TypePath
  methods : Array[ValueDoc]
}

///|
priv struct MiscDoc {
  name : String
  impls : Array[ImplDoc]
  methods : Array[ValueDoc]
}

///|
fn decode_loc(json : Json) -> Loc raise Error {
  match json {
    {
      "path": String(path),
      "file": String(file),
      "line": Number(line),
      "column": Number(column),
      ..
    } => { path, file, line: line.to_int(), column: column.to_int() }
    _ => fail("fail to decode loc: \{json}")
  }
}

///|
fn decode_impl_doc(json : Json) -> ImplDoc raise Error {
  match json {
    { "self": self_type, "trait": trait_type, "methods": Array(methods), .. } => {
      let self_type = decode_stype(self_type)
      let trait_type = decode_type_path(trait_type)
      let methods = map_with_error(methods, decode_value_doc)
      { self_type, trait_type, methods }
    }
    _ => fail("fail to decode impl doc: \{json}")
  }
}

///|
fn decode_type_doc(json : Json) -> TypeDoc raise Error {
  match json {
    ({
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "methods": Array(methods),
      "impls": Array(impls),
      "loc": loc,
      ..
    } : Json) => {
      let methods = map_with_error(methods, decode_value_doc)
      let impls = map_with_error(impls, decode_impl_doc)
      let loc = decode_loc(loc)
      { name, docstring, signature, methods, impls, loc }
    }
    _ => fail("fail to decode type doc: \{json}")
  }
}

///|
fn decode_trait_doc(json : Json) -> TraitDoc raise Error {
  match json {
    {
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "impls": Array(impls),
      "loc": loc,
      ..
    } => {
      let impls = map_with_error(impls, decode_impl_doc)
      let loc = decode_loc(loc)
      { name, docstring, signature, impls, loc }
    }
    _ => fail("fail to decode trait doc: \{json}")
  }
}

///|
fn decode_typealias_doc(json : Json) -> TypeAliasDoc raise Error {
  match json {
    {
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "loc": loc,
      ..
    } => {
      let loc = decode_loc(loc)
      { name, docstring, signature, loc }
    }
    _ => fail("fail to decode type alias doc: \{json}")
  }
}

///|
fn decode_value_doc(json : Json) -> ValueDoc raise Error {
  match json {
    {
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "loc": loc,
      ..
    } => { name, docstring, signature, loc: decode_loc(loc) }
    _ => fail("fail to decode value doc: \{json}")
  }
}

///|
fn decode_misc_doc(json : Json) -> MiscDoc raise Error {
  match json {
    ({
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } : Json) => {
      let methods = map_with_error(methods, decode_value_doc)
      let impls = map_with_error(impls, decode_impl_doc)
      { name, impls, methods }
    }
    _ => fail("fail to decode misc doc: \{json}")
  }
}

///|
fn decode_package_data(json : Json) -> Result[PackageData, String] {
  fn aux! {
    ({
      "name": String(name),
      "types": Array(types),
      "traits": Array(traits),
      "typealias": Array(aliases),
      "values": Array(values),
      "misc": Array(misc),
      ..
    } : Json) => {
      let types = map_with_error(types, decode_type_doc)
      let traits = map_with_error(traits, decode_trait_doc)
      let aliases = map_with_error(aliases, decode_typealias_doc)
      let values = map_with_error(values, decode_value_doc)
      let misc = map_with_error(misc, decode_misc_doc)
      misc.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      values.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      aliases.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      traits.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      types.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      { name, types, traits, typealiases: aliases, values, misc }
    }
    _ => fail("fail to decode package data: \{json}")
  }

  aux?(json).map_err(Show::to_string)
}

///|
fn TypeDoc::get_id(self : TypeDoc) -> String {
  self.name
}

///|
fn TraitDoc::get_id(self : TraitDoc) -> String {
  self.name
}

///|
fn TypeAliasDoc::get_id(self : TypeAliasDoc) -> String {
  self.name
}

///|
fn ValueDoc::get_id(self : ValueDoc) -> String {
  self.name
}

///|
fn ImplDoc::get_id(self : ImplDoc) -> String {
  self.self_type.to_string() + "-for-" + self.trait_type.to_string()
}

///|
fn MiscDoc::get_id(self : MiscDoc) -> String {
  self.name
}
