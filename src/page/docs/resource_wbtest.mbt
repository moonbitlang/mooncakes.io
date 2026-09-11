///|
test "decode module update timestamp" {
  let source =
    #|{
    #|  "name": "Milky2018/wasmoon",
    #|  "module": "Milky2018/wasmoon",
    #|  "version": "0.4.2",
    #|  "has_package": true,
    #|  "metadata": {
    #|    "name": "Milky2018/wasmoon",
    #|    "version": "0.4.2",
    #|    "created_at": "2026-07-24T09:45:13.482778+00:00"
    #|  }
    #|}
    #|
  let json = @json.parse(source)
  let manifest : Manifest = @json.from_json(json)
  assert_eq(
    manifest.module_meta.updated_at,
    Some("2026-07-24T09:45:13.482778+00:00"),
  )
}

///|
test "decode module without update timestamp" {
  let source =
    #|{
    #|  "name": "Milky2018/wasmoon",
    #|  "module": "Milky2018/wasmoon",
    #|  "version": "0.4.2",
    #|  "has_package": true,
    #|  "metadata": {
    #|    "name": "Milky2018/wasmoon",
    #|    "version": "0.4.2"
    #|  }
    #|}
    #|
  let json = @json.parse(source)
  let manifest : Manifest = @json.from_json(json)
  assert_eq(manifest.module_meta.updated_at, None)
  assert_eq(manifest.module_meta.yanked, None)
}

///|
test "selected version and deprecation come from outer manifest" {
  for
    (yanked, reason, expected) in [
      (true, Some("Use example/new-tool"), Some("Use example/new-tool")),
      (true, None, Some("")),
      (false, None, None),
      (false, Some("Stale reason"), None),
    ] {
    let manifest : Manifest = @json.from_json({
      "name": "example/tool",
      "module": "example/tool",
      "version": "1.0.0",
      "latest_version": "2.0.0",
      "has_package": true,
      "yanked": yanked,
      "yanked_reason": reason.map(Json::string).unwrap_or(Json::null()),
      "metadata": {
        "name": "example/tool",
        "version": "2.0.0",
        "yanked": !yanked,
        "yanked_reason": "Stale uploaded reason",
      },
      "versions": [
        {
          "version": "2.0.0",
          "yanked": !yanked,
          "yanked_reason": "Latest reason",
        },
        { "version": "1.0.0", "yanked": !yanked, "yanked_reason": "Old reason" },
      ],
    })
    assert_eq(manifest.module_meta.version, "1.0.0")
    assert_eq(manifest.module_meta.yanked, expected)
  }
}
