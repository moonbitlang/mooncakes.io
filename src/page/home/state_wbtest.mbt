///|
test "search response decodes matching package highlights" {
  let json = @json.parse(
    (
      #|{
      #|  "name": "moonbitlang/async",
      #|  "version": "0.2.0",
      #|  "keywords": ["async"],
      #|  "description": "Async utilities",
      #|  "is_new": false,
      #|  "created_at": "2026-09-02T00:00:00Z",
      #|  "downloads": 42,
      #|  "matched_package_count": 1,
      #|  "matched_packages": [{
      #|    "package": "fs",
      #|    "name": "moonbitlang/async/fs",
      #|    "summary": "异步文件系统工具",
      #|    "summary_version": "0.1.0",
      #|    "is_summary_current": false,
      #|    "summary_fragments": [
      #|      {"text": "异步", "matched": false},
      #|      {"text": "文件系统", "matched": true},
      #|      {"text": "工具", "matched": false}
      #|    ]
      #|  }]
      #|}
    ),
  )
  let module_index : ModuleIndex = @json.from_json(json)
  assert_eq(module_index.path, "moonbitlang/async")
  assert_eq(module_index.downloads, Some(42))
  assert_eq(module_index.matched_package_count, Some(1))
  guard module_index.matched_packages is Some([matched]) else {
    fail("expected one matched package")
  }
  assert_eq(matched.package_path, "fs")
  assert_eq(matched.summary_version, "0.1.0")
  assert_false(matched.is_summary_current)
  assert_true(matched.summary_fragments[1].matched)
}

///|
test "empty module names are grouped without crashing" {
  let modules : Array[ModuleIndex] = [
    {
      author: "legacy",
      name: "",
      path: "legacy/empty",
      version: "0.0.0",
      keywords: None,
      description: None,
      created_at: None,
      is_new: false,
      downloads: None,
      matched_package_count: None,
      matched_packages: None,
    },
  ]
  let grouped = sort_modules_by_name(modules)
  guard grouped.get('#') is Some([entry]) else {
    fail("expected empty name in catch-all bucket")
  }
  assert_eq(entry.path, "legacy/empty")
}
