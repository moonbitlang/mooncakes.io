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
}
