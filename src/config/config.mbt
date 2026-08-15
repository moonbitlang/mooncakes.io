///|
pub let readme_icon : String = asset_url("/readme.svg")

///|
pub let type_icon : String = asset_url("/type.svg")

///|
pub let type_alias_icon : String = asset_url("/code-brackets.svg")

///|
pub let value_icon : String = asset_url("/code-brackets.svg")

///|
pub let trait_icon : String = asset_url("/components.svg")

///|
pub let file_icon : String = asset_url("/file.svg")

///|
pub let folder_open : String = asset_url("/folder-open.svg")

///|
pub let folder_close : String = asset_url("/folder-close.svg")

///|
pub let icon_close : String = asset_url("/close.svg")

///|
pub let section_open : String = asset_url("/section-open.svg")

///|
pub let section_close : String = asset_url("/section-close.svg")

///|
pub let expansion : String = asset_url("/expansion.svg")

///|
pub let reduction : String = asset_url("/reduction.svg")

///|
pub let filter : String = asset_url("/filter.svg")

///|
pub let search : String = asset_url("/search.svg")

///|
pub let share : String = asset_url("/share.svg")

///|
pub let ok : String = asset_url("/ok.svg")

///|
pub let clipboard : String = asset_url("/clipboard.svg")

///|
pub let tag : String = asset_url("/tag.svg")

///|
pub let user : String = asset_url("/user.svg")

///|
pub let install : String = asset_url("/install.svg")

///|
pub let license : String = asset_url("/license.svg")

///|
pub let repo : String = asset_url("/repo.svg")

///|
pub let code : String = asset_url("/code.svg")

///|
pub let terminal : String = asset_url("/terminal.svg")

///|
pub let download : String = asset_url("/download.svg")

///|
pub let updated : String = asset_url("/updated.svg")

///|
pub let deps : String = asset_url("/deps.svg")

///|
pub let book_open : String = asset_url("/book-open.svg")

///|
pub let sun_icon : String = asset_url("/sun.svg")

///|
pub let moon_icon : String = asset_url("/moon.svg")

///|
pub let computer_icon : String = asset_url("/computer.svg")

///|
pub let hamburger_button : String = asset_url("/hamburger-button.svg")

///|
pub let logo : String = asset_url("/mooncake-pic.png")

///|
pub let favicon : String = asset_url("/favicon.svg")

///|
pub let mooncake_pic_small : String = asset_url("/mooncake-pic-small.webp")

///|
pub let dead_rabbit =
  #|         --  --
  #|       /  //  / __--------_
  #|      /  //  /_/            \
  #|   ---      -                \ __
  #|  / X        /        ____   /   )
  #|  *_________/__/_____/______/ `--

///|
pub let builtins_package_path : Map[String, String] = {
  "Bool": "core/bool",
  "Byte": "core/byte",
  "Bytes": "core/bytes",
  "Char": "core/char",
  "Double": "core/double",
  "FixedArray": "core/array",
  "Array": "core/array",
  "Float": "core/float",
  "Int": "core/int",
  "Int16": "core/int16",
  "Int64": "core/int64",
  "String": "core/string",
  "UInt": "core/uint",
}

///|
#cfg(target="js")
extern "js" fn api_endpoint() -> String =
  #|() => __MOONCAKES_API_ENDPOINT__

///|
#cfg(not(target="js"))
fn api_endpoint() -> String {
  @env.get_env_var("MOONCAKES_API_ENDPOINT").unwrap_or("/api")
}

///|
pub fn api_url(path : String) -> String {
  api_url_with_endpoint(api_endpoint(), path)
}

///|
#cfg(target="js")
extern "js" fn assets_endpoint() -> String =
  #|() =>
  #|  typeof __MOONCAKES_ASSETS_ENDPOINT__ === "undefined"
  #|    ? "https://assets.mooncakes.io"
  #|    : __MOONCAKES_ASSETS_ENDPOINT__

///|
#cfg(not(target="js"))
fn assets_endpoint() -> String {
  @env.get_env_var("MOONCAKES_ASSETS_ENDPOINT").unwrap_or(
    "https://assets.mooncakes.io",
  )
}

///|
pub fn asset_url(path : String) -> String {
  let base = assets_endpoint()
  match path {
    [.. "/", .. path] => "\{base}/\{path.to_owned()}"
    path => "\{base}/\{path}"
  }
}

///|
fn api_url_with_endpoint(endpoint : String, path : String) -> String {
  match path {
    [.. "/api/", .. path] => "\{endpoint}/\{path.to_owned()}"
    [.. "/api"] => endpoint
    [.. "/", .. path] => "\{endpoint}/\{path.to_owned()}"
    path => "\{endpoint}\{path}"
  }
}
