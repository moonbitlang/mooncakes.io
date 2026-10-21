///|
test "weekly downloads decode independently of lifetime downloads" {
  let highlights : ModuleHighlights = @json.from_json({
    "recent": [],
    "new": [],
    "popular": [
      {
        "name": "alice/tools",
        "version": "1.0.0",
        "keywords": [],
        "description": "",
        "is_new": false,
        "created_at": "2026-10-20T00:00:00",
        "downloads": 999999,
        "trends": 56377,
      },
    ],
  })
  assert_true(highlights.popular is [{ badge: Trends(56377L), .. }])
}
