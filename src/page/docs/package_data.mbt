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
  typealiases : Array[TypeAliasDoc]
  traits : Array[TraitDoc]
  errors : Array[TypeDoc]
  types : Array[TypeDoc]
  misc : Array[MiscDoc]
  values : Array[ValueDoc]
}

///|
priv struct Loc {
  path : String
  file : String
  line : Int
  column : Int
} derive(Debug)

///|
test "suppress unused warnings for Loc" {
  let dummy = { path: "", file: "", line: 0, column: 0 }
  ignore(to_repr(dummy))
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
fn decode_loc(
  json : Json,
  path : @json.JsonPath,
) -> Loc raise @json.JsonDecodeError {
  match json {
    {
      "path": String(path),
      "file": String(file),
      "line": Number(line, ..),
      "column": Number(column, ..),
      ..
    } => { path, file, line: line.to_int(), column: column.to_int() }
    _ => raise JsonDecodeError((path, "fail to decode loc: \{to_repr(json)}"))
  }
}

///|
fn decode_impl_doc(
  json : Json,
  path : @json.JsonPath,
) -> ImplDoc raise @json.JsonDecodeError {
  match json {
    { "self": self_type, "trait": trait_type, "methods": Array(methods), .. } => {
      let self_type = decode_stype(self_type, path)
      let trait_type = decode_type_path(trait_type, path)
      let methods = methods.map(x => decode_value_doc(x, path))
      { self_type, trait_type, methods }
    }
    _ =>
      raise JsonDecodeError((path, "fail to decode impl doc: \{to_repr(json)}"))
  }
}

///|
fn decode_type_doc(
  json : Json,
  path : @json.JsonPath,
) -> TypeDoc raise @json.JsonDecodeError {
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
      let methods = methods.map(x => decode_value_doc(x, path))
      let impls = impls.map(x => decode_impl_doc(x, path))
      let loc = decode_loc(loc, path)
      { name, docstring, signature, methods, impls, loc }
    }
    _ =>
      raise JsonDecodeError((path, "fail to decode type doc: \{to_repr(json)}"))
  }
}

///|
fn decode_trait_doc(
  json : Json,
  path : @json.JsonPath,
) -> TraitDoc raise @json.JsonDecodeError {
  match json {
    {
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "impls": Array(impls),
      "loc": loc,
      ..
    } => {
      let impls = impls.map(x => decode_impl_doc(x, path))
      let loc = decode_loc(loc, path)
      { name, docstring, signature, impls, loc }
    }
    _ =>
      raise JsonDecodeError(
        (path, "fail to decode trait doc: \{to_repr(json)}"),
      )
  }
}

///|
fn decode_typealias_doc(
  json : Json,
  path : @json.JsonPath,
) -> TypeAliasDoc raise @json.JsonDecodeError {
  match json {
    {
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "loc": loc,
      ..
    } => {
      let loc = decode_loc(loc, path)
      { name, docstring, signature, loc }
    }
    _ =>
      raise JsonDecodeError(
        (path, "fail to decode type alias doc: \{to_repr(json)}"),
      )
  }
}

///|
fn decode_value_doc(
  json : Json,
  path : @json.JsonPath,
) -> ValueDoc raise @json.JsonDecodeError {
  match json {
    {
      "name": String(name),
      "docstring": String(docstring),
      "signature": String(signature),
      "loc": loc,
      ..
    } => { name, docstring, signature, loc: decode_loc(loc, path) }
    _ =>
      raise JsonDecodeError(
        (path, "fail to decode value doc: \{to_repr(json)}"),
      )
  }
}

///|
fn decode_misc_doc(
  json : Json,
  path : @json.JsonPath,
) -> MiscDoc raise @json.JsonDecodeError {
  match json {
    ({
      "name": String(name),
      "impls": Array(impls),
      "methods": Array(methods),
      ..
    } : Json) => {
      let methods = methods.map(x => decode_value_doc(x, path))
      let impls = impls.map(x => decode_impl_doc(x, path))
      { name, impls, methods }
    }
    _ =>
      raise JsonDecodeError((path, "fail to decode misc doc: \{to_repr(json)}"))
  }
}

///|
impl @json.FromJson for PackageData with fn from_json(json : Json, path) {
  match json {
    ({
      "name": String(name),
      "types": Array(types),
      "traits": Array(traits),
      "errors"? : errors,
      "typealias": Array(aliases),
      "values": Array(values),
      "misc": Array(misc),
      ..
    } : Json) => {
      let types = types.map(x => decode_type_doc(x, path))
      let traits = traits.map(x => decode_trait_doc(x, path))
      let errors = match errors {
        Some(Array(errors)) => errors.map(x => decode_type_doc(x, path))
        _ => []
      }
      let aliases = aliases.map(x => decode_typealias_doc(x, path))
      let values = values.map(x => decode_value_doc(x, path))
      let misc = misc.map(x => decode_misc_doc(x, path))
      misc.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      values.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      aliases.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      traits.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      types.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      errors.sort_by(fn(x, y) { compare_strings(x.name, y.name) })
      { name, types, traits, errors, typealiases: aliases, values, misc }
    }
    _ =>
      raise JsonDecodeError(
        (path, "fail to decode package data: \{to_repr(json)}"),
      )
  }
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
fn TypePath::to_string(self : TypePath) -> String {
  if self.path.is_empty() {
    self.name
  } else {
    "\{self.path}.\{self.name}"
  }
}

///|
fn Stype::to_string(self : Stype) -> String {
  match self {
    Constr(constr~, arguments~) =>
      if arguments.is_empty() {
        constr.to_string()
      } else {
        let arguments = arguments.map(Stype::to_string).join(",")
        "\{constr.to_string()}[\{arguments}]"
      }
    Arrow(parameters~, return_type~, error_type~, is_async~) => {
      let prefix = if is_async { "async " } else { "" }
      let parameters = parameters.map(Stype::to_string).join(",")
      let error_suffix = match error_type {
        Some(error_type) => " raise \{error_type.to_string()}"
        None => ""
      }
      "\{prefix}(\{parameters}) -> \{return_type.to_string()}\{error_suffix}"
    }
    Param(name~) => name
    TypePath(path) => path.to_string()
  }
}

///|
fn ImplDoc::get_id(self : ImplDoc) -> String {
  "\{self.self_type.to_string()}-for-\{self.trait_type.to_string()}"
}

///|
fn MiscDoc::get_id(self : MiscDoc) -> String {
  self.name
}
