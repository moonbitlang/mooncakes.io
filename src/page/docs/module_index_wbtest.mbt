///|
test "decode constructor stype from package data" {
  let source =
    #|{
    #|  "name": "moonbitlang/async",
    #|  "types": [],
    #|  "traits": [],
    #|  "errors": [
    #|    {
    #|      "name": "TimeoutError",
    #|      "docstring": "",
    #|      "signature": "suberror TimeoutError",
    #|      "methods": [],
    #|      "impls": [
    #|        {
    #|          "self": {
    #|            "kind": "constr",
    #|            "constructor": {
    #|              "name": "TimeoutError",
    #|              "path": "moonbitlang/async"
    #|            },
    #|            "arguments": []
    #|          },
    #|          "trait": {
    #|            "name": "Error",
    #|            "path": ""
    #|          },
    #|          "methods": []
    #|        }
    #|      ],
    #|      "loc": {
    #|        "path": "moonbitlang/async",
    #|        "file": "async.mbt",
    #|        "line": 1,
    #|        "column": 1
    #|      }
    #|    }
    #|  ],
    #|  "typealias": [],
    #|  "values": [],
    #|  "misc": []
    #|}
    #|
  let json = @json.parse(source)
  let package_data : PackageData = @json.from_json(json)
  assert_eq(package_data.errors.length(), 1)
  assert_eq(
    package_data.errors[0].impls[0].self_type.to_string(),
    "moonbitlang/async.TimeoutError",
  )
}
