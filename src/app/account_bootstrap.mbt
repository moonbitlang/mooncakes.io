///|
/// Keep this allowlist narrow: authentication credentials and API tokens must
/// never become part of the document or the hydration transcript.
fn public_profile(value : Json) -> Json {
  guard value is { "username": String(username), .. } else { return null }
  let result : Map[String, Json] = { "username": username.to_json() }
  for field in ["email", "gh_avatar", "gh_login", "gh_name"] {
    result[field] = match value {
      Object(fields) =>
        if fields.get(field) is Some(String(text)) {
          text.to_json()
        } else {
          null
        }
      _ => null
    }
  }
  // A linked GitHub identity may not have a current login name.
  result["gh_id"] = match value {
    Object(fields) =>
      match fields.get("gh_id") {
        Some(Number(_, ..) as id) => id
        Some(String(_) as id) => id
        _ => null
      }
    _ => null
  }
  result.to_json()
}

///|
fn profile_bootstrap(value : Json) -> String {
  public_profile(value)
  .stringify(escape_slash=true)
  .replace_all(old="<", new="\\u003c")
  .replace_all(old=">", new="\\u003e")
  .replace_all(old="&", new="\\u0026")
}

///|
#cfg(target="js")
fn browser_initial_user() -> Json {
  guard @dom.document().get_element_by_id("mooncakes-account").to_option()
    is Some(element) &&
    element.get_child_count() > 0 else {
    return null
  }
  @json.parse(element.get_first_child().get_node_value()) catch {
    _ => null
  }
}

///|
#cfg(not(target="js"))
fn browser_initial_user() -> Json {
  null
}
