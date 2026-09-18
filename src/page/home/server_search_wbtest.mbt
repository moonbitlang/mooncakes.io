///|
fn example_search_result() -> SearchResult raise {
  let value : Json = {
    "name": "alice/tools",
    "version": "2.0.0",
    "yanked": true,
    "yanked_reason": "Use alice/replacement instead",
    "license": "Apache-2.0",
    "repository": "",
    "keywords": ["IO"],
    "description": "Tools",
    "is_new": false,
    "created_at": "2026-09-09T00:00:00",
    "downloads": 100,
    "matched_package_count": 7,
    "matched_packages": [
      {
        "package": "fs",
        "name": "alice/tools/fs",
        "summary": "Read files",
        "summary_version": "1.0.0",
        "is_summary_current": false,
        "summary_fragments": [
          { "text": "Read ", "matched": false },
          { "text": "<script>alert(1)</script>", "matched": true },
        ],
      },
    ],
  }
  @json.from_json(value)
}

///|
test "server search keeps legacy module decoding and adds package details" {
  let hit = example_search_result()
  assert_eq(hit.module_info.path, "alice/tools")
  assert_eq(hit.module_info.yanked, Some("Use alice/replacement instead"))
  assert_eq(hit.downloads, Some(100L))
  assert_eq(hit.matched_package_count, 7)
  assert_eq(
    hit.matched_packages[0].summary_fragments[1].text,
    "<script>alert(1)</script>",
  )
  assert_eq(
    package_match_href(hit, hit.matched_packages[0]),
    "/docs/alice/tools@1.0.0/fs",
  )
  let root = {
    ..hit.matched_packages[0],
    package_: "",
    summary_version: "2.0.0",
  }
  assert_eq(package_match_href(hit, root), "/docs/alice/tools@2.0.0")
  let legacy : SearchResult = @json.from_json({
    "name": "alice/tools",
    "version": "1.0.0",
    "keywords": [],
    "description": "",
    "is_new": false,
    "created_at": "2026-09-09T00:00:00",
  })
  assert_eq(legacy.downloads, None)
  assert_eq(legacy.module_info.yanked, None)
  assert_eq(legacy.matched_packages, [])
}

///|
test "debounced search rejects stale requests responses and ABA query races" {
  let (a, action) = update_search(initial_search(), Changed("文件"))
  assert_eq(action, Schedule(1))
  let (b, _) = update_search(a, Changed("文件 IO"))
  assert_eq(update_search(b, Debounced(1)), (b, Nothing))
  let (c, _) = update_search(b, Changed("文件"))
  let (loading, action) = update_search(c, Debounced(c.request_id))
  assert_eq(action, Fetch(3, "文件"))
  assert_eq(
    update_search(loading, Completed(1, Ok([example_search_result()]))),
    (loading, Nothing),
  )
  let (ready, _) = update_search(
    loading,
    Completed(3, Ok([example_search_result()])),
  )
  assert_eq(ready.phase, Ready)
  assert_eq(ready.results.length(), 1)
  let (cleared, _) = update_search(ready, Changed("  "))
  assert_eq(cleared.phase, Inactive)
  assert_eq(cleared.results, [])
  assert_eq(
    update_search(cleared, Completed(3, Ok([example_search_result()]))),
    (cleared, Nothing),
  )
}

///|
test "search timeout retry empty results and whitespace normalization" {
  let (waiting, _) = update_search(initial_search(), Changed("  json  "))
  let (loading, action) = update_search(waiting, Debounced(1))
  assert_eq(action, Fetch(1, "json"))
  let (failed, _) = update_search(loading, TimedOut(1))
  assert_eq(failed.phase, Failed)
  assert_eq(update_search(failed, Completed(1, Ok([]))), (failed, Nothing))
  let (retried, action) = update_search(failed, Retry)
  assert_eq(action, Fetch(2, "json"))
  let (empty, _) = update_search(retried, Completed(2, Ok([])))
  assert_eq(empty.phase, Ready)
  assert_eq(empty.results, [])
  let (normalized, action) = update_search(empty, Changed("json"))
  assert_eq(normalized.request_id, empty.request_id)
  assert_eq(action, Nothing)
}
