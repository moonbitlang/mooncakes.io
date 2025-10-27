// // Copyright 2025 International Digital Economy Academy
// // 
// // Licensed under the Apache License, Version 2.0 (the "License");
// // you may not use this file except in compliance with the License.
// // You may obtain a copy of the License at
// // 
// // http://www.apache.org/licenses/LICENSE-2.0
// // 
// // Unless required by applicable law or agreed to in writing, software
// // distributed under the License is distributed on an "AS IS" BASIS,
// // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// // See the License for the specific language governing permissions and
// // limitations under the License.

// ///|
// test "parse_signature1" {
//   let signature = "fn parse_signature(signature : String) -> Array[CodeSpan]"
//   let spans = @highlight.parse(signature)
//   inspect(
//     spans,
//     content=(
//       #|@list.of([Keyword("fn"), Space(1), LIdent("parse_signature"), Symbol("("), LIdent("signature"), Space(1), Symbol(":"), Space(1), UIdent("String"), Symbol(")"), Space(1), Symbol("->"), Space(1), UIdent("Array"), Symbol("["), UIdent("CodeSpan"), Symbol("]")])
//     ),
//   )
// }

// ///|
// test "parse_signature with link" {
//   let signature = "fn <a href=\"list#T\">T</a>::concat[A](self : <a href=\"list#T\">Tasdfasdf</a>[A], other : <a href=\"list#T\">T</a>[A]) -> <a href=\"list#T\">T</a>[A]"
//   let spans = @highlight.parse(signature)
//   inspect(
//     spans,
//     content=(
//       #|@list.of([Keyword("fn"), Space(1), Link(href="list#T", [UIdent("T")]), Symbol("::"), LIdent("concat"), Symbol("["), UIdent("A"), Symbol("]("), LIdent("self"), Space(1), Symbol(":"), Space(1), Link(href="list#T", [UIdent("Tasdfasdf")]), Symbol("["), UIdent("A"), Symbol("],"), Space(1), LIdent("other"), Space(1), Symbol(":"), Space(1), Link(href="list#T", [UIdent("T")]), Symbol("["), UIdent("A"), Symbol("])"), Space(1), Symbol("->"), Space(1), Link(href="list#T", [UIdent("T")]), Symbol("["), UIdent("A"), Symbol("]")])
//     ),
//   )
// }

// ///|
// fn run_test(source : String) -> String {
//   // let spans = @highlight.parse(source)
//   // spans.map(Show::to_string) |> @prettyprinter.render
// }

// ///|
// test "complex source" {
//   let spans = (
//       #|let cache : LruCache[String, Int] = LruCache::new(2)
//       #|cache.put("key1", 100)
//       #|cache.put("key2", 200)
//       #|
//       #|// Accessing "key1" makes it the most recently used
//       #|let _ = cache.get("key1")
//       #|
//       #|// Adding a new item will now evict "key2" instead of "key1"
//       #|cache.put("key3", 300)
//       #|let str = #| asdfadfadsf
//       #|          $| dafasdf \{as} asdfadfdf
//       #|
//       #|let val1 = cache.get("key1") // Returns Some(100)
//       #|let val2 = cache.get("key2") // Returns None, as "key2" was evicted
//       #|let val3 = cache.get("key3") // Returns Some(300)  
//     )
//     |> run_test
//   inspect(
//     spans,
//     content=(
//       #|[
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("cache")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "UIdent("LruCache")",
//       #|  "Symbol("[")",
//       #|  "UIdent("String")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("Int")",
//       #|  "Symbol("]")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "UIdent("LruCache")",
//       #|  "Symbol("::")",
//       #|  "LIdent("new")",
//       #|  "Symbol("(")",
//       #|  "Number("2")",
//       #|  "Symbol(")")",
//       #|  "Newline",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("put")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key1\"")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "Number("100")",
//       #|  "Symbol(")")",
//       #|  "Newline",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("put")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key2\"")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "Number("200")",
//       #|  "Symbol(")")",
//       #|  "Newline",
//       #|  "Newline",
//       #|  "Comment("// Accessing \"key1\" makes it the most recently used")",
//       #|  "Newline",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "UIdent("_")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("get")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key1\"")",
//       #|  "Symbol(")")",
//       #|  "Newline",
//       #|  "Newline",
//       #|  "Comment("// Adding a new item will now evict \"key2\" instead of \"key1\"")",
//       #|  "Newline",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("put")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key3\"")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "Number("300")",
//       #|  "Symbol(")")",
//       #|  "Newline",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("str")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "StringLit("#| asdfadfadsf")",
//       #|  "Newline",
//       #|  "Space(10)",
//       #|  "StringLit("$| dafasdf \\{as} asdfadfdf")",
//       #|  "Newline",
//       #|  "Newline",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("val1")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("get")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key1\"")",
//       #|  "Symbol(")")",
//       #|  "Space(1)",
//       #|  "Comment("// Returns Some(100)")",
//       #|  "Newline",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("val2")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("get")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key2\"")",
//       #|  "Symbol(")")",
//       #|  "Space(1)",
//       #|  "Comment("// Returns None, as \"key2\" was evicted")",
//       #|  "Newline",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("val3")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "LIdent("cache")",
//       #|  "Symbol(".")",
//       #|  "LIdent("get")",
//       #|  "Symbol("(")",
//       #|  "StringLit("\"key3\"")",
//       #|  "Symbol(")")",
//       #|  "Space(1)",
//       #|  "Comment("// Returns Some(300)  ")",
//       #|  "Newline"
//       #|]
//     ),
//   )
// }

// ///|
// test "lru_cache" {
//   let code1 =
//     #| fn <a href="ShellWen/lru_cache#LruCache">LruCache</a>::new[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](capacity : UInt) -> <a href="ShellWen/lru_cache#LruCache">LruCache</a>[K, V]
//   inspect(
//     run_test(code1),
//     content=(
//       #|[
//       #|  "Space(1)",
//       #|  "Keyword("fn")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("::")",
//       #|  "LIdent("new")",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Eq", [UIdent("Eq")])",
//       #|  "Space(1)",
//       #|  "Symbol("+")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Hash", [UIdent("Hash")])",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("](")",
//       #|  "LIdent("capacity")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "UIdent("UInt")",
//       #|  "Symbol(")")",
//       #|  "Space(1)",
//       #|  "Symbol("->")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("]")"
//       #|]
//     ),
//   )
//   let code2 =
//     #| fn <a href="ShellWen/lru_cache#LruCache">LruCache</a>::put[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](self : <a href="ShellWen/lru_cache#LruCache">LruCache</a>[K, V], key : K, value : V) -> Unit
//   inspect(
//     run_test(code2),
//     content=(
//       #|[
//       #|  "Space(1)",
//       #|  "Keyword("fn")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("::")",
//       #|  "LIdent("put")",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Eq", [UIdent("Eq")])",
//       #|  "Space(1)",
//       #|  "Symbol("+")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Hash", [UIdent("Hash")])",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("](")",
//       #|  "LIdent("self")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("],")",
//       #|  "Space(1)",
//       #|  "LIdent("key")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "UIdent("K")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "LIdent("value")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol(")")",
//       #|  "Space(1)",
//       #|  "Symbol("->")",
//       #|  "Space(1)",
//       #|  "UIdent("Unit")"
//       #|]
//     ),
//   )
//   let code3 =
//     #| fn new_lru_cache[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](capacity : UInt) -> <a href="ShellWen/lru_cache#LruCache">LruCache</a>[K, V]
//   inspect(
//     run_test(code3),
//     content=(
//       #|[
//       #|  "Space(1)",
//       #|  "Keyword("fn")",
//       #|  "Space(1)",
//       #|  "LIdent("new_lru_cache")",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Eq", [UIdent("Eq")])",
//       #|  "Space(1)",
//       #|  "Symbol("+")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Hash", [UIdent("Hash")])",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("](")",
//       #|  "LIdent("capacity")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "UIdent("UInt")",
//       #|  "Symbol(")")",
//       #|  "Space(1)",
//       #|  "Symbol("->")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("]")"
//       #|]
//     ),
//   )
//   let code4 =
//     #| fn <a href="ShellWen/lru_cache#LruCache">LruCache</a>::capacity[K : <a href="moonbitlang/core/builtin#Eq">Eq</a> + <a href="moonbitlang/core/builtin#Hash">Hash</a>, V](self : <a href="ShellWen/lru_cache#LruCache">LruCache</a>[K, V]) -> UInt
//   inspect(
//     run_test(code4),
//     content=(
//       #|[
//       #|  "Space(1)",
//       #|  "Keyword("fn")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("::")",
//       #|  "LIdent("capacity")",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Eq", [UIdent("Eq")])",
//       #|  "Space(1)",
//       #|  "Symbol("+")",
//       #|  "Space(1)",
//       #|  "Link(href="moonbitlang/core/builtin#Hash", [UIdent("Hash")])",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("](")",
//       #|  "LIdent("self")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "Link(href="ShellWen/lru_cache#LruCache", [UIdent("LruCache")])",
//       #|  "Symbol("[")",
//       #|  "UIdent("K")",
//       #|  "Symbol(",")",
//       #|  "Space(1)",
//       #|  "UIdent("V")",
//       #|  "Symbol("])")",
//       #|  "Space(1)",
//       #|  "Symbol("->")",
//       #|  "Space(1)",
//       #|  "UIdent("UInt")"
//       #|]
//     ),
//   )
// }

// ///|
// test "qualified" {
//   let code =
//     #| let a = @path/to/package.value
//     #| let a : @path/to/package.Type = 1
//     #| let c = '\uFFFF'
//   inspect(
//     run_test(code),
//     content=(
//       #|[
//       #|  "Space(1)",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("a")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "QualIdent(["path", "to", "package"], "value")",
//       #|  "Newline",
//       #|  "Space(1)",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("a")",
//       #|  "Space(1)",
//       #|  "Symbol(":")",
//       #|  "Space(1)",
//       #|  "QualIdent(["path", "to", "package"], "Type")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "Number("1")",
//       #|  "Newline",
//       #|  "Space(1)",
//       #|  "Keyword("let")",
//       #|  "Space(1)",
//       #|  "LIdent("c")",
//       #|  "Space(1)",
//       #|  "Symbol("=")",
//       #|  "Space(1)",
//       #|  "CharLit("'\\uFFFF'")"
//       #|]
//     ),
//   )
// }

///|
test "parse_inline_link" {
  let source =
    #| f(<a href="moonbitlang/core/rational#T">Type</a>::method)
  inspect(
    parse_signature(source),
    content=(
      #|@list.of([Space(1), LIdent("f"), Symbol("("), Link(href="moonbitlang/core/rational#T", [UIdent("Type")]), Symbol("::"), LIdent("method"), Symbol(")")])
    ),
  )
  let source =
    #| f(<a href="moonbitlang/core/rational#T">@path/to/pkg.Type</a>::method)
  inspect(
    parse_signature(source),
    content=(
      #|@list.of([Space(1), LIdent("f"), Symbol("("), Link(href="moonbitlang/core/rational#T", [QualIdent("path/to/pkg", "Type")]), Symbol("::"), LIdent("method"), Symbol(")")])
    ),
  )
}

///|
test "parse_package_name_with_dot_ulident" {
  let source =
    #| f(@path/to/pkg.Ctor)
    #| g(@path/to/pkg.value)
  inspect(
    parse_signature(source),
    content=(
      #|@list.of([Space(1), LIdent("f"), Symbol("("), QualIdent("path/to/pkg", "Ctor"), Symbol(")"), Newline, Space(1), LIdent("g"), Symbol("("), QualIdent("path/to/pkg", "value"), Symbol(")")])
    ),
  )
}

///|
test "invalid_package_name" {
  let source =
    #| fn startup[Model, Message](model~ : Model, update~ : (Message, Model) -> (<a href="Yoorkin/rabbit-tea/cmd#Cmd">@Yoorkin/rabbit-tea/cmd.Cmd</a>[Message], Model), view~ : (Model) -> <a href="Yoorkin/rabbit-tea/html#T">@Yoorkin/rabbit-tea/html.T</a>[Message], mount~ : String = ..) -> Unit
  inspect(
    parse_signature(source),
    content=(
      #|@list.of([Space(1), Keyword("fn"), Space(1), LIdent("startup"), Symbol("["), UIdent("Model"), Symbol(","), Space(1), UIdent("Message"), Symbol("]("), LIdent("model"), Symbol("~"), Space(1), Symbol(":"), Space(1), UIdent("Model"), Symbol(","), Space(1), LIdent("update"), Symbol("~"), Space(1), Symbol(":"), Space(1), Symbol("("), UIdent("Message"), Symbol(","), Space(1), UIdent("Model"), Symbol(")"), Space(1), Symbol("->"), Space(1), Symbol("("), Link(href="Yoorkin/rabbit-tea/cmd#Cmd", [QualIdent("Yoorkin/rabbit-tea/cmd", "Cmd")]), Symbol("["), UIdent("Message"), Symbol("],"), Space(1), UIdent("Model"), Symbol("),"), Space(1), LIdent("view"), Symbol("~"), Space(1), Symbol(":"), Space(1), Symbol("("), UIdent("Model"), Symbol(")"), Space(1), Symbol("->"), Space(1), Link(href="Yoorkin/rabbit-tea/html#T", [QualIdent("Yoorkin/rabbit-tea/html", "T")]), Symbol("["), UIdent("Message"), Symbol("],"), Space(1), LIdent("mount"), Symbol("~"), Space(1), Symbol(":"), Space(1), UIdent("String"), Space(1), Symbol("="), Space(1), Symbol("..)"), Space(1), Symbol("->"), Space(1), UIdent("Unit")])
    ),
  )
}

///|
test "valid_source_code" {
  let source =
    #| fn main { println("hello, \{object}!") }
  inspect(
    parse_code(source),
    content=(
      #|@list.of([Space(1), Keyword("fn"), Space(1), LIdent("main"), Space(1), Symbol("{"), Space(1), LIdent("println"), Symbol("("), StringLit("\""), StringLit("hello, "), Symbol("\\{"), LIdent("object"), Space(0), Symbol("}"), StringLit("!"), StringLit("\""), Symbol(")"), Space(1), Symbol("}"), Space(0)])
    ),
  )
}
