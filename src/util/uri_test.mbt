///|
test "URI components preserve encodeURIComponent's unescaped characters" {
  let unescaped = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.!~*'()"
  assert_eq(@util.encode_uri_component(unescaped), unescaped)
  assert_eq(@util.encode_uri_component(""), "")
}

///|
test "URI components escape delimiters control characters and UTF-8 text" {
  assert_eq(
    @util.encode_uri_component(" \"#$%&+,/:;<=>?@[\\]^`{|}"),
    "%20%22%23%24%25%26%2B%2C%2F%3A%3B%3C%3D%3E%3F%40%5B%5C%5D%5E%60%7B%7C%7D",
  )
  assert_eq(
    @util.encode_uri_component("a&b + 文件🙂\u0000\u001F\u007F"),
    "a%26b%20%2B%20%E6%96%87%E4%BB%B6%F0%9F%99%82%00%1F%7F",
  )
}
