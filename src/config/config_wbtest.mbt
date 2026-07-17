///|
test "api url keeps same origin api path with default endpoint" {
  inspect(
    api_url_with_endpoint("/api", "/api/v0/modules"),
    content="/api/v0/modules",
  )
}

///|
test "api endpoint replaces api prefix" {
  inspect(
    api_url_with_endpoint("https://api.example.com/new-api", "/api/v0/modules"),
    content="https://api.example.com/new-api/v0/modules",
  )
}

///|
test "api endpoint can be bare origin" {
  inspect(
    api_url_with_endpoint("https://api.example.com", "/api/v0/modules"),
    content="https://api.example.com/v0/modules",
  )
}

///|
test "api url supports non-api paths" {
  inspect(
    api_url_with_endpoint("https://api.example.com/base", "/v0/modules"),
    content="https://api.example.com/base/v0/modules",
  )
}

///|
test "asset url joins paths at the public asset origin" {
  inspect(
    asset_url("assets/alice/hello@0.1.0/module_index.json"),
    content="https://assets.mooncakes.io/assets/alice/hello@0.1.0/module_index.json",
  )
  inspect(
    asset_url("/assets/alice/hello@0.1.0/module_index.json"),
    content="https://assets.mooncakes.io/assets/alice/hello@0.1.0/module_index.json",
  )
}
